// week08_3_2048_part3_void_keyPressed_genTwo
// 修改自week08_2_2048_part2_color_color_array_N_B
// (1)把陣列補齊 (2)按方向鍵，要在空白的地方變出一個 2

color []c = {#CEC2B9, #EFE5DA, #EDE1CA, #EFB37E, #EC8D54, #EF7F63, #F76543};  // 色彩 2^1, 2^2, 2^3, 2^4, 2^5
color []c2 = {#776E66, #776E66, #776E66, #FDF8F5, #FDF8F5, #FDF8F5, #FDF8F5};  // 字的顏色
int []N = {0, 2, 4, 8, 16, 32, 64};  // 對應的數字
int [][]B = {{0, 0, 0, 0}, {1, 2, 3, 4}, {5, 0, 0, 0}, {0, 0, 0, 0}};  // 板子
void keyPressed(){
  getTwo();
}
void getTwo(){  // 找出陣列 0 的地方，挑一個變成空白
  int zero = 0;  // 找找有幾個 0
  for(int i=0; i<4; i++){
    for(int j=0; j<4; j++){
      if(B[i][j]==0) zero++;  // 找到 0 的板子
    }
  }
  int ans = int(random(zero));  // 用亂數決定「第幾個 0 要放 2」
  for(int i=0; i<4; i++){
    for(int j=0; j<4; j++){
      if(ans==0){
        B[i][j] = 1;  // 2 的 1 次方是 2
        return;  // 結束
      }
      else ans--;  // 倒數用掉一個，慢慢找到是哪一格
    }
  }
}
void setup(){
  size(410, 410);
}
void draw(){
  background(188, 174, 162);
  for(int i=0; i<4; i++){  // 對應 y 座標
    for(int j=0; j<4; j++){  // 對應 x 座標
      int id = B[i][j];  // 對應的代碼
      fill(c[id]);
      noStroke();  // 不要有黑線外框
      rect(j*100+10, i*100+10, 90, 90, 5);  // 弧角是 5
      fill(c2[id]);
      textAlign(CENTER, CENTER);
      textSize(50);
      text(N[id], j*100+55, i*100+55);
    }
  }
}
