// week03_6_auto_for_up_for_down

void setup() {
  for (int i = 3; i <= 13; i++) {
    pinMode(i, OUTPUT);   // 設定 pin3~13 為輸出
  }
}

void loop() {
  // 從 3 到 13，依序亮燈
  for (int i = 3; i <= 13; i++) {
    for (int k = 3; k <= 13; k++) digitalWrite(k, LOW); // 先全部熄滅
    digitalWrite(i, HIGH);  // 點亮第 i 個
    delay(200);
  }

  // 從 13 到 3，反向亮燈
  for (int i = 13; i >= 3; i--) {
    for (int k = 3; k <= 13; k++) digitalWrite(k, LOW); // 先全部熄滅
    digitalWrite(i, HIGH);  // 點亮第 i 個
    delay(200);
  }
}