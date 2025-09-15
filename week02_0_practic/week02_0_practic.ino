#define NOTE_C5 523
#define NOTE_E5 659
#define NOTE_G5 784
#define NOTE_F5 698
#define NOTE_D5  587 

#define BUTTON 2
#define BUZZER 8

int melody[] = {
  NOTE_G5, NOTE_E5,NOTE_E5,0, NOTE_F5,NOTE_D5, NOTE_D5, 0, NOTE_C5,NOTE_D5,NOTE_E5,NOTE_F5,NOTE_G5,NOTE_G5,NOTE_G5
  //NOTE_E5, NOTE_E5, 0, NOTE_E5, 0, NOTE_C5, NOTE_5, 0, NOTE_G5
};

int noteDurations[] = { 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10 };


int pin;
int ledArrayHigh;
int ledArrayLow;
boolean mode = false;
boolean buttonPressed = false;

void setup()
{
  delay(1000);

  pinMode(BUTTON, INPUT_PULLUP);
  for (pin = 3; pin < 14; pin++) {
    pinMode(pin, OUTPUT);
  }

  // 自動計算音符與時值長度（必須一樣長）
  int notesCount = sizeof(melody) / sizeof(melody[0]);
  int durCount   = sizeof(noteDurations) / sizeof(noteDurations[0]);
  int n = (notesCount < durCount) ? notesCount : durCount;  // 取兩者最小，避免越界

  for (int i = 0; i < n; i++) {
    int noteDuration = 1000 / noteDurations[i];

    if (melody[i] == 0) {
      // 0 當休止符：只延遲不發聲
      noTone(BUZZER);
      delay(noteDuration * 1.3);
    } else {
      tone(BUZZER, melody[i], noteDuration);
      delay(noteDuration * 1.3); // 稍微拉開，避免黏在一起
      noTone(BUZZER);
    }
  }
}


void loop()
{
  for (pin = 0; pin < 5; pin++) {
    if (digitalRead(BUTTON) == LOW &&
        buttonPressed == false) {
      buttonPressed = true;
      mode = !mode;
      pin = 0;
      if (mode == false) {
        tone(BUZZER, NOTE_C5, 100);
        delay(100);
        tone(BUZZER, NOTE_G5, 100);
        delay(100);
        noTone(BUZZER);
      }
      else if (mode == true) {
        tone(BUZZER, NOTE_G5, 100);
        delay(100);
        tone(BUZZER, NOTE_C5, 100);
        delay(100);
        noTone(BUZZER);
      }
    }

    if (mode == false) {
      ledArrayHigh = 13 - pin;
      ledArrayLow = 7 - pin;
    }
    else if (mode == true) {
      ledArrayHigh = 9 + pin;
      ledArrayLow = 3 + pin;
    }
    digitalWrite(ledArrayHigh, HIGH);
    digitalWrite(ledArrayLow, HIGH);
    delay(100);
    digitalWrite(ledArrayHigh, LOW);
    digitalWrite(ledArrayLow, LOW);
    if (pin == 4) delay(100);
  }

  if (buttonPressed == true) {
    buttonPressed = false;
  }
}