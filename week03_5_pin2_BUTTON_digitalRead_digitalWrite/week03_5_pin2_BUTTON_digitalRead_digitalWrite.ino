// week03_5_pin2_BUTTON_digitalRead_digitalWrite
// 手動按按鈕, 會慢慢改變 now 之後, 把 now 變亮

void setup() {
  pinMode(2, INPUT_PULLUP);    // 按鈕 Button 是 2 號, 沒接 → HIGH, 按下 → LOW
  for (int i = 3; i <= 13; i++) {
    pinMode(i, OUTPUT);        // pin 3,4,5,...,13 都設成 OUTPUT
  }
}

int now = 3;  // 現在亮的是 pin 3

void loop() {
  if (digitalRead(2) == LOW) {   // 按下去囉!!!
    now = now + 1;
    if (now > 13) now = 3;

    for (int i = 3; i <= 13; i++) {
      digitalWrite(i, LOW);      // 全部先清空 → LOW 不亮
    }

    digitalWrite(now, HIGH);     // now 負責亮
    delay(500);                  // 休息一下 0.5 秒, 避免抖動
  }
}
