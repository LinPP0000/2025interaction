// week08_Arduino_G5_C5

void setup() {
  pinMode(8, OUTPUT);  // 設定8腳為輸出
  tone(8, 784, 100);   // 發出音符 So
  delay(100);  
  tone(8, 523, 100);   // 發出音符 Do
  delay(100);  
}

void serialEvent() {
  while (Serial.available()) {
    char now = Serial.read();  // 讀取從串口發來的資料

    if (now == 'R') {  // 如果收到 'R'
      tone(8, 784, 100);  // 發出音符 So
      delay(100);
      tone(8, 523, 100);  // 發出音符 Do
      delay(100);
    } else {
      tone(8, 523, 100);  // 發出音符 Do
      delay(100);
      tone(8, 784, 100);  // 發出音符 So
      delay(100);
    }
  }
}

void loop() {
  // 此處是主程式循環，不需要修改
}
