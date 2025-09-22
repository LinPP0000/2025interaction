// week03_2_for_5_times

void setup() {
  // put your setup code here, to run once:
  pinMode(8, OUTPUT);  // 負責發聲
  for (int i = 1; i <= 5; i++) {
    tone(8, 800, 200);  // 腳位8, 頻率800Hz, 發聲200毫秒
    delay(1000);        // 等待1秒
  }
}

void loop() {
  // put your main code here, to run repeatedly:
}
