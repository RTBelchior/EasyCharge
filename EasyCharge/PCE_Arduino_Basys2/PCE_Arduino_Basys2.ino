int counter3, counter2, counter1, counter0 = 0;

void setup() {
  Serial.begin(9600);
  pinMode(8, INPUT);  // SW3
  pinMode(7, INPUT);  // SW2
  pinMode(6, INPUT);  // SW1
  pinMode(5, INPUT);  // SW0
  pinMode(4, INPUT);  // SYNC
  pinMode(3, INPUT);  // buttonReset
  pinMode(2, OUTPUT); // appReset
}

void loop() {
  // Reset dos contadores
  /*
  if (appReset){
    counter3, counter2, counter1, counter0 = 0;
    digitalWrite(2, HIGH);
  }
  if (digitalRead(3)){
    counter3, counter2, counter1, counter0 = 0;
  }
  */

  // Informação da ocupação dos espaços
  if (digitalRead(8)) {
    Serial.println("Espaço 3: Ocupado");
    Serial.println("Carga: ", counter3);
  } else {
    Serial.println("Espaço 3: Livre");
  }
  if (digitalRead(7)) {
    Serial.println("Espaço 2: Ocupado");
    Serial.println("Carga: ", counter2);
  } else {
    Serial.println("Espaço 2: Livre");
  }
  if (digitalRead(6)) {
    Serial.println("Espaço 1: Ocupado");
    Serial.println("Carga: ", counter1);
  } else {
    Serial.println("Espaço 1: Livre");
  }
  if (digitalRead(5)) {
    Serial.println("Espaço 0: Ocupado");
    Serial.println("Carga: ", counter0);
  } else {
    Serial.println("Espaço 0: Livre");
  }

  // Incremento do contador a cada sinal HIGH de SYNC (a cada 5 segundos)
  if (digitalRead(4)) {
    if (digitalRead(8)) {
      counter3++;
    }
    if (digitalRead(7)) {
      counter2++;
    }
    if (digitalRead(6)) {
      counter1++;
    }
    if (digitalRead(5)) {
      counter0++;
    }
  }

  // Envio do contador para as aplicações
  // ESCREVER CÓDIGO AQUI!!!!!
  //
  //
  //
}
