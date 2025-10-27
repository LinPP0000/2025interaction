// week08_5_2048_part5_keyCode_RIGHT_merge
// 按方向鍵，板子就往哪個方向走(只先做「往右移動」)
// 檢查是否要合併 merge (與右邊的相同)

color []c = {#CEC2B9, #EFE5DA, #EDE1CA, #EFB37E, #EC8D54, #EF7F63, #F76543};  // 色彩 2^1, 2^2, 2^3, 2^4, 2^5
color []c2 = {#776E66, #776E66, #776E66, #FDF8F5, #FDF8F5, #FDF8F5, #FDF8F5};  // 字的顏色
int []N = {0, 2, 4, 8, 16, 32, 64};  // 對應的數字
int [][]B = {{0, 0, 0, 0}, {1, 2, 3, 4}, {5, 0, 0, 0}, {0, 0, 0, 0}};  // 板子
void keyPressed(){
  if(keyCode==RIGHT){  // 按「右」
    for(int i=0; i<4; i++){
      int now=3;
      for(int j=3; j>=0; j--){  // 從右往左，慢慢找
        if(B[i][j]>0){  // 找到有板子
          B[i][now] = B[i][j];
          // if(now<3 && B[i][now+1]==B[i][now]){  // 做一次
          while(now<3 && B[i][now+1]==B[i][now]){  // 檢查是否要合併 merge (與右邊的相同)
            B[i][now+1]++;  // 編號變大，新的板子出現
            now++;
          }
          now--;  // 下一格在這裡
        }
      }
      for(int j=now; j>=0; j--){
        B[i][j]=0;
      }
    }
  }
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
