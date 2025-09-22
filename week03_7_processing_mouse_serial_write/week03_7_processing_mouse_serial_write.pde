// week03_7_processing_mouse_serial_write

import processing.serial.*;   // 使用 Serial 外掛
Serial myPort;

void setup() {
  size(400, 400);
  myPort = new Serial(this, "COM5", 9600);  
  // COM3 / COM4 / COM5 / COM6 要依你的電腦實際情況調整
}

void mousePressed() {
  myPort.write('b');   // 用 USB 傳字母 'b'
}

void draw() {
  if (mousePressed) 
    background(#FF0000);   // 滑鼠按下 → 紅色
  else 
    background(#00FF00);   // 滑鼠放開 → 綠色
}
