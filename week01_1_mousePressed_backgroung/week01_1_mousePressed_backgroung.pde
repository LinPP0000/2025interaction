//桌面-Processing資料夾,啟動
//File-Preference字型放大
void setup(){//想設定視窗大小
  size(500,500);
}
void draw(){
  //用mouse來互動
  if(mousePressed) background(#FF0000);
  else background(#00FF00);
}
