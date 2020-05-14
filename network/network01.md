# 실행흐름

## 1. 로그인

- ChatLogin.java에서 run하면 1번 화면(Swing??)이 생기고 서버접속을 누르면 ChatLoginListener의 actionPerformed메소드가 실행됨.
  - ID를 입력 안하고 서버접속 버튼을 누르면 2번 처럼 MessageDialog가 생김 

![image-20200508104119319](images/image-20200508104119319.png)

## 2. 서버

- ChatServerView에서 run 하면 서버 창이 뜨고 서버시작 버튼 누르면 ChatServerListener가 실행됨.

![image-20200508104601601](images/image-20200508104601601.png)

- ChatServerView에 있는 메소드
  - serverStart
    - 서버시작 버튼을 누르고 포트번호를 입력하면 실행되는 메소드
  - connection
    - 서버를 킨 다음에 누군가가 로그인했을 때 실행되는 메소드
  - ChatServerView
    - run 누르면 띄워지는 View임. 이건 수업때 건드린거 없는듯.

#### serverStart 메소드

![image-20200508104943561](images/image-20200508104943561.png)

#### connection 메소드

![image-20200508105147203](images/image-20200508105147203.png)

## 3. 클라이언트

- ClientChatView에 있는 메소드
  - connectServer메소드
    - filteringMsg
      - 새로운 사용자가 들어왔을 때 서버가 보내는 메시지를 StringTokenizer로 protocol과 message로 분리
  - 처음 접속했을 때 iowork메소드가 실행됨

## 새로운 클라이언트의 접속을 기존 클라이언트에게 알리기

<img src="images/image-20200508094519172.png" alt="image-20200508094519172" style="zoom:80%;" />

![image-20200508094541665](images/image-20200508094541665.png)

![image-20200508094558591](images/image-20200508094558591.png)

![image-20200508094626678](images/image-20200508094626678.png)

![image-20200508094648512](images/image-20200508094648512.png)

![image-20200508094715668](images/image-20200508094715668.png)

![image-20200508094902612](images/image-20200508094902612.png)

![image-20200508095020096](images/image-20200508095020096.png)

![image-20200508101229407](images/image-20200508101229407.png)

![image-20200508101931132](images/image-20200508101931132.png)

![image-20200508101944528](images/image-20200508101944528.png)



- 새로운 사용자가 들어왔을 때
  - 기존 사용자에게는 메시지를 보냄
  - 새로운 사용자에겐 메시지를 아직 안보냄

![image-20200508103322428](images/image-20200508103322428.png)



## 기존클라이언트의 정보를 새로운 클라이언트에게 알려주기

![image-20200508113512723](images/image-20200508113512723.png)

- 새로운 사용자에게 기존 사용자의 정보를 뿌리자

![image-20200508112554638](images/image-20200508112554638.png)



![image-20200508112944498](images/image-20200508112944498.png)

![image-20200508113454428](images/image-20200508113454428.png)



## 서로 채팅하기

![image-20200508131340128](images/image-20200508131340128.png)

![image-20200508131358566](images/image-20200508131358566.png)



![image-20200508140033740](images/image-20200508140033740.png)

![image-20200508140605761](images/image-20200508140605761.png)

![image-20200508140625133](images/image-20200508140625133.png)

![image-20200508140806939](images/image-20200508140806939.png)



![image-20200508141216506](images/image-20200508141216506.png)



- 결과

![image-20200508141331420](images/image-20200508141331420.png)



### 에러 없애기

- 채팅방 나갔다는거 알려주기

![image-20200508143853933](images/image-20200508143853933.png)

![image-20200508143840140](images/image-20200508143840140.png)

![image-20200508144821539](images/image-20200508144821539.png)

- 유저가 퇴장할 때 메시지를 보여줌.

![image-20200508144836912](images/image-20200508144836912.png)

- 근데 우리의 주 된 플랫폼은 Swing이 아니고 안드로이드임.

## Swing에서 했던거 안드로이드에서 실행

- 서버는 Spring에서... 클라이언트는 안드로이드임.

- 1번은 스프링꺼 복붙한거임.
  - MyNetClient02를 복붙!!

![image-20200508154217033](images/image-20200508154217033.png)

- 결과

![image-20200508154130713](images/image-20200508154130713.png)



- ChatServerView실행해서 서버 실행 시키기

![image-20200508154509161](images/image-20200508154509161.png)



Swing코드 붙이기

하나는 Swing 클라이언트, 하나는 AVD 클라이언트



- clientChatView => doinbackground에 카피
  - connectServer



Asynctast에서 onProgressUpdate에서 view 바꾸는 작업하기

