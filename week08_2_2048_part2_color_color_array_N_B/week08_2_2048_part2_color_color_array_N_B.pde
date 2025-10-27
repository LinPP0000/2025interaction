// week08_2_2048_part2_color_color_array_N_B
// 增加不同的顏色 2^1, 2^2, 2^3, 2^4, 16, 32, 64 顏色

color c[] = {#CEC2B9, #EFE5DA, #EDE1CA, #EFB37E, #EF7F63, #EF7F63};  // 2^1, 2^2, 2^3, 2^4, 16, 32, 64 顏色
color c2[] = {#776E66, #776E66, #776E66, #FDF8F5, #FDF8F5, #FDF8F5};  // 更多顏色

int N[] = {0, 2, 4, 8, 16, 32};  // 對應的數字

int B[][] = {{0, 0, 0, 0}, {1, 2, 3, 4}, {5, 0, 0, 0}, {0, 0, 0, 0}};  // 板子

void setup(){
  size(410, 410);  // 讓邊線標示完整
}

void draw(){
  background(188, 174, 162);  // 色彩用淡管，吸範例的圖
  for(int i=0; i<4; i++){  // 左手 (對應y座標)
    for(int j=0; j<4; j++){  // 右手 (對應x座標)
      int id = B[i][j];  // 對應的代碼
      fill(c[id]);  // 設定顏色
      noStroke();  // 不要有黑線外框
      rect(j*100+10, i*100+10, 90, 90, 5);  // 繪製矩形

      fill(c2[id]);  // 設定第二組顏色
      textAlign(CENTER, CENTER);
      textSize(60);
      text(N[id], j*100+55, i*100+55);  // 顯示對應數字
    }
  }
}
