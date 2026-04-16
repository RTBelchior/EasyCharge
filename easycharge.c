#include <stdio.h>
#include <windows.h>
#include <string.h>

HANDLE serial;

int ligarSerial() {

    serial = CreateFile("COM3",
        GENERIC_READ | GENERIC_WRITE,
        0,
        0,
        OPEN_EXISTING,
        FILE_ATTRIBUTE_NORMAL,
        0);

    if(serial == INVALID_HANDLE_VALUE) {
        printf("Erro ao abrir porta serial\n");
        return 1;
    }

    // IMPORTANTE: timeout
    COMMTIMEOUTS timeout = {0};

    timeout.ReadIntervalTimeout = 50;
    timeout.ReadTotalTimeoutConstant = 20;
    timeout.ReadTotalTimeoutMultiplier = 10;
    timeout.WriteTotalTimeoutConstant = 50;
    timeout.WriteTotalTimeoutMultiplier = 10;

    SetCommTimeouts(serial, &timeout);

    printf("Ligado ao dispositivo!\n");

    return 0;
}

void enviarComando(char comando[]) {

    DWORD bytes;

    WriteFile(serial, comando, strlen(comando), &bytes, NULL);

    printf("Comando enviado: %s\n", comando);
}

// FUNÇÃO PARA LER
void lerResposta() {

    char buffer[256];
    DWORD bytesLidos;

    while (1) {

        if (!ReadFile(serial, buffer, sizeof(buffer)-1, &bytesLidos, NULL))
            break;

        if (bytesLidos == 0)
            break; // sai logo quando não há mais dados

        buffer[bytesLidos] = '\0';
        printf("%s", buffer);
    }

    printf("\n");
}

int main() {

    if(ligarSerial() == 1)
        return 1;

    int opcao;

    do {

        printf("\n=== EASYCHARGE ===\n");
        printf("1 - Abrir porta\n");
        printf("2 - Fechar porta\n");
        printf("3 - Estado\n");
        printf("4 - Sair\n");

        printf("Opcao: ");
        scanf("%d", &opcao);

        switch(opcao) {

            case 1:
                enviarComando("ABRIR\n");
                break;

            case 2:
                enviarComando("FECHAR\n");
                break;

            case 3:
                enviarComando("ESTADO\n");
                Sleep(200); // esperar resposta
                lerResposta(); //LER RESPOSTA
                break;

        }

    } while(opcao != 4);

    CloseHandle(serial);

    return 0;
}