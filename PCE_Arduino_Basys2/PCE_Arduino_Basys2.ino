#include "BluetoothSerial.h"
BluetoothSerial SerialBT;

int counter3 = 0, counter2 = 0, counter1 = 0, counter0 = 0;

bool prev3 = false, prev2 = false, prev1 = false, prev0 = false;

// Controlo de carga autorizada por cacifo
bool cargaAtiva[4] = {false, false, false, false};

// Controlo de ligação Bluetooth
bool btConectado = false;

void enviarEstadoCompleto() {
  bool s3 = digitalRead(23);
  bool s2 = digitalRead(19);
  bool s1 = digitalRead(21);
  bool s0 = digitalRead(22);

  // Envia estado de cada switch
  SerialBT.println(s3 ? "S3:OCUPADO" : "S3:LIVRE");
  SerialBT.println(s2 ? "S2:OCUPADO" : "S2:LIVRE");
  SerialBT.println(s1 ? "S1:OCUPADO" : "S1:LIVRE");
  SerialBT.println(s0 ? "S0:OCUPADO" : "S0:LIVRE");

  // Envia estado das cargas ativas
  SerialBT.println(cargaAtiva[3] ? "CARGA:ATIVA:3" : "CARGA:INATIVA:3");
  SerialBT.println(cargaAtiva[2] ? "CARGA:ATIVA:2" : "CARGA:INATIVA:2");
  SerialBT.println(cargaAtiva[1] ? "CARGA:ATIVA:1" : "CARGA:INATIVA:1");
  SerialBT.println(cargaAtiva[0] ? "CARGA:ATIVA:0" : "CARGA:INATIVA:0");
}

void setup() {
  Serial.begin(9600);

  pinMode(23, INPUT); // SW3
  pinMode(22, INPUT); // SW2
  pinMode(21, INPUT); // SW1
  pinMode(19, INPUT); // SW0
  pinMode(18, INPUT); // SYNC
  pinMode(5, INPUT);  // RESET

  pinMode(2, OUTPUT);

  SerialBT.begin("EasyCharge");
  Serial.println("EasyCharge pronto!");
}

void loop() {

  // =========================
  // DETETAR LIGAÇÃO BLUETOOTH
  // =========================
  bool btAgora = SerialBT.connected();

  if (btAgora && !btConectado) {
    // Acabou de ligar — envia estado completo
    btConectado = true;
    delay(500); // pequena espera para app estar pronta
    enviarEstadoCompleto();
    Serial.println("BT ligado — estado enviado");
  }

  if (!btAgora && btConectado) {
    // Desligou
    btConectado = false;
    Serial.println("BT desligado");
  }

  // =========================
  // LER SWITCHES
  // =========================
  bool s3 = digitalRead(23);
  bool s2 = digitalRead(19);
  bool s1 = digitalRead(21);
  bool s0 = digitalRead(22);

  // =========================
  // DETETAR MUDANÇAS NOS SWITCHES
  // =========================
  if (s3 != prev3) {
    SerialBT.println(s3 ? "S3:OCUPADO" : "S3:LIVRE");
    if (!s3 && cargaAtiva[3]) {
      // Switch desligado com carga ativa — terminar carga
      cargaAtiva[3] = false;
      counter3 = 0;
      SerialBT.println("CARGA:TERMINADA:3");
    }
    prev3 = s3;
  }

  if (s2 != prev2) {
    SerialBT.println(s2 ? "S2:OCUPADO" : "S2:LIVRE");
    if (!s2 && cargaAtiva[2]) {
      cargaAtiva[2] = false;
      counter2 = 0;
      SerialBT.println("CARGA:TERMINADA:2");
    }
    prev2 = s2;
  }

  if (s1 != prev1) {
    SerialBT.println(s1 ? "S1:OCUPADO" : "S1:LIVRE");
    if (!s1 && cargaAtiva[1]) {
      cargaAtiva[1] = false;
      counter1 = 0;
      SerialBT.println("CARGA:TERMINADA:1");
    }
    prev1 = s1;
  }

  if (s0 != prev0) {
    SerialBT.println(s0 ? "S0:OCUPADO" : "S0:LIVRE");
    if (!s0 && cargaAtiva[0]) {
      cargaAtiva[0] = false;
      counter0 = 0;
      SerialBT.println("CARGA:TERMINADA:0");
    }
    prev0 = s0;
  }

  // =========================
  // COMANDOS BLUETOOTH DA APP
  // =========================
  if (SerialBT.available()) {
    String comando = SerialBT.readStringUntil('\n');
    comando.trim();
    Serial.println("BT recebido: " + comando);

    // Iniciar carga
    if (comando.startsWith("CARGA:INICIAR:")) {
      int cacifo = comando.substring(14).toInt();
      if (cacifo >= 0 && cacifo <= 3) {
        cargaAtiva[cacifo] = true;
        SerialBT.println("CARGA:INICIADA:" + String(cacifo));
        Serial.println("Carga iniciada cacifo " + String(cacifo));
      }
    }

    // Parar carga
    else if (comando.startsWith("CARGA:PARAR:")) {
      int cacifo = comando.substring(12).toInt();
      if (cacifo >= 0 && cacifo <= 3) {
        cargaAtiva[cacifo] = false;
        if (cacifo == 3) counter3 = 0;
        if (cacifo == 2) counter2 = 0;
        if (cacifo == 1) counter1 = 0;
        if (cacifo == 0) counter0 = 0;
        SerialBT.println("CARGA:PARADA:" + String(cacifo));
        Serial.println("Carga parada cacifo " + String(cacifo));
      }
    }

    // Abrir porta
    else if (comando.startsWith("PORTA:ABRIR:")) {
      int cacifo = comando.substring(12).toInt();
      SerialBT.println("PORTA:ABERTA:" + String(cacifo));
      Serial.println("Porta aberta cacifo " + String(cacifo));
      // adiciona aqui o código para abrir a porta fisicamente
    }

    // Fechar porta
    else if (comando.startsWith("PORTA:FECHAR:")) {
      int cacifo = comando.substring(13).toInt();
      SerialBT.println("PORTA:FECHADA:" + String(cacifo));
      Serial.println("Porta fechada cacifo " + String(cacifo));
      // adiciona aqui o código para fechar a porta fisicamente
    }

    // Pedir estado completo
    else if (comando == "ESTADO") {
      enviarEstadoCompleto();
    }

    // Reset contadores
    else if (comando == "RESET") {
      counter3 = counter2 = counter1 = counter0 = 0;
      SerialBT.println("RESET OK");
      Serial.println("RESET OK");
    }
  }

  // =========================
  // COMANDOS PC (Serial)
  // =========================
  if (Serial.available()) {
    String comando = Serial.readStringUntil('\n');
    comando.trim();

    if (comando == "ESTADO") {
      String estado = "";
      estado += "S3:" + String(s3) + ":" + String(counter3) + " ";
      estado += "S2:" + String(s2) + ":" + String(counter2) + " ";
      estado += "S1:" + String(s1) + ":" + String(counter1) + " ";
      estado += "S0:" + String(s0) + ":" + String(counter0);
      Serial.println(estado);
    }

    else if (comando == "RESET") {
      counter3 = counter2 = counter1 = counter0 = 0;
      Serial.println("RESET OK");
    }
  }

  // =========================
  // CONTADOR — só conta se carga autorizada
  // =========================
  if (digitalRead(18)) {
    if (s3 && cargaAtiva[3]) counter3++;
    if (s2 && cargaAtiva[2]) counter2++;
    if (s1 && cargaAtiva[1]) counter1++;
    if (s0 && cargaAtiva[0]) counter0++;
  }

  delay(200);
}