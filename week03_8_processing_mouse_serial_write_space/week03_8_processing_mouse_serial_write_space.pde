// week03_8_processing_mouse_serial_write_space

import processing.serial.*;   // 使用 Serial 外掛
Serial myPort;

void setup() {
  size(400, 400);
  myPort = new Serial(this, "COM5", 9600);  
  // COM3 / COM4 / COM5 / COM6 要查你的電腦
}

void mousePressed() {
  if (mouseButton == LEFT)  myPort.write('b');  // 左鍵 → 傳 'b'
  if (mouseButton == RIGHT) myPort.write(' ');  // 右鍵 → 傳空白
}

void draw() {
  if (mousePressed) 
    background(#FF0000);   // 按下 → 紅色
  else 
    background(#00FF00);   // 放開 → 綠色
}
