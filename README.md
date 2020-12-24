# Problem-骰子遊戲

彼得有九個四面體骰子, 每個骰子上有數字 1到4. 

科林有六個立方體骰子, 每個骰子上有數字 1到6.

兩個人各自丟自己的骰子, 並算其總和, 總和高者贏, 若總和相同則為平局.

**試求：彼得贏、輸、平手的機率(數字將四捨五入至小數點後第七位)**



## 想法

1. 隨機取樣做N次，再分別算出彼得贏、輸、平手的機率

   推測：每次取樣結果都不一樣，無法給一個精確值
              
              
2. 分別針對兩個人擲骰子的所有可能性，把每個點數出現次數記錄下來，再比較大小，計算機率

   推測：會是唯一解！
  
所以我們用較精準的想法2來解決問題。



## 做法
* Step 1：

計算出在**n**顆骰子、上面有數字**1到d**點的情況下(可能擲出n到n*d點)，每個點數在所有組合出現的可能性

*ex*:2顆骰子，上面有1到6點 (n=2,d=6)，3點可能是{1,2}或{2,1}組成，所以3點有2種可能性

我寫一個遞迴函式去達到這件事 ( num_dice(n,d) )

* Step 2：

分別建立彼得和科林擲骰子，點數出現可能性數量的矩陣 

(將n,d帶入step 1的函式即可)

* Step 3：

比較兩人點數大小，去計算彼得的點數比科林大的情況總共有幾次(彼得贏)

同樣地，計算點數相同、與彼得點數較小的情況(平手、彼得輸)

*ex*:彼得擲出10點次數為9，科林擲出6,7,8,9點的次數分別是1,6,21,56次

則彼得擲出10點且獲勝總共有9*(1+6+21+56)種可能性，我們需要將所有彼得獲勝可能性相加

* Step 4：

最後除掉所有的組合，就會得到3個事件的機率，印出結果

*note* 需將各個浮點數四捨五入至小數點後第七位



## 結果

彼得贏的機率約是 **0.5731441** 

平手的機率約是   **0.0707662**

彼得輸的機率約是 **0.3560898**
