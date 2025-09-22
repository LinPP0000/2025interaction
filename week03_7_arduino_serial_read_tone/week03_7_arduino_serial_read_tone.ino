// week03_7_arduino_serial_read_tone

void setup() {
  Serial.begin(9600);     // 設定 USB 傳輸速度
  pinMode(8, OUTPUT);     // 腳位 8 接蜂鳴器
}

void serialEvent() {      // 等待 USB 的事件
  while (Serial.available()) {   // 若有資料
    Serial.read();               // 讀進來
    tone(8, 800, 200);           // 蜂鳴器發聲 200 毫秒
  }
}

void loop() {
  // put your main code here, to run repeatedly:
}
