# 자바스크립트

script: 혼자서 실행할 수 없다는 의미. html과 함께해야함.

- 이벤트에 반응하는 동작 구현하는게 목적.
- Ajax를 통해서 전체 페이지를 다시 로드하지 않고서도 서버로부터 새로운 페이지 콘텐츠를 받거나 데이터를 제출할 때 사용한다. = 비동기통신
- HTML 요소의 크기나 색상을 동적으로 변경할 수 있다. = DHTML기술



## java script basic

1. 문법
   - 사용방법
   - 변수
   - 제어구문
2. 함수
3. 내장객체(자바 스크립트가 내장하고 있는 객체, 브라우저 마다 늘 갖고 있음.)
   - String, Array, Date, Math
4. 이벤트핸들러
5. 브라우저 객체모델(BOM)



## java script 중급

1. 도큐먼트 객체모델(DOM)
2. JSON
3. Ajax
4. 자바스크립트 프로토타입
   - 사용자 정의 객체
   - 클로저



## java script 고급

자바스크립트의 프레임워크 사용

1. bootstrap - css와 javascript의 프레임워크
2. MEAN stack
   - MongoDB
   - ExpressJs(express.js)
   - AngularJs
   - NodeJs

3. ReactJs - 웹의 UI개발할 때 사용함.(facebook이 공개한 오픈소스임)
4. Vue.js
5. D3





## java script 초급 시작

선생님한테 js파일 보낼때 .zip이나 .js앞에 _ 을 넣어주면됨.

자바랑 똑같이 대소문자 구분함.

- 외부문서의 파일을 호출하기

  - javascript의 외부파일 만들기

  ![image-20200107104240272](images/image-20200107104240272.png)

  - 아래는 외부파일에 test2() 함수를 만든것

    ![image-20200107104625461](images/image-20200107104625461.png)

  - head의 script에 경로 설정하고 호출은 외부파일에 있는 함수명으로 호출함.

    ![image-20200107104802347](images/image-20200107104802347.png)

  - 아래는 body에서 호출

    ![image-20200107105356924](images/image-20200107105356924.png)

- 아래는 호출 결과들

  ![image-20200107105432254](images/image-20200107105432254.png)

  ![image-20200107105454769](images/image-20200107105454769.png)

  ![image-20200107105515824](images/image-20200107105515824.png)

  ![image-20200107105551887](images/image-20200107105551887.png)

  ![image-20200107105658089](images/image-20200107105658089.png)

  ![image-20200107105712386](images/image-20200107105712386.png)

- 한글이 깨지는 것을 인코딩으로 해결하기

  - UTF-8로 되어있는 것을 EUC-KR로 바꾸기 -> 함부로 바꾸면 안됨.

    ![image-20200107111053340](images/image-20200107111053340.png)

    업데이트하면 아래처럼 깨짐

    ![image-20200107111140752](images/image-20200107111140752.png)

  - <a> 링크 쓸때는 javascript: 를 꼭 써넣어 줘야한다.

    ![image-20200107113046429](images/image-20200107113046429.png)

    ![image-20200107113104730](images/image-20200107113104730.png)



### 변수

var로 변수선언, 데이터타입은 명시하지 않음.

## 디버그

- 익스플로러나 크롬에서 개발자도구(F12)로 디버그하기.

![image-20200107133318742](images/image-20200107133318742.png)

![image-20200107133352970](images/image-20200107133352970.png)

- 크롬에서는 아래 상태에서 url을 다시 엔터치면 확실하게 에러가 난 부분을 집어준다.

  ![image-20200107133525560](images/image-20200107133525560.png)

  ![image-20200107133602107](images/image-20200107133602107.png)



### 자바스크립트 자동완성(플러그인) 설치

이클립스 -> help -> 이클립스 마켓 플레이스 또는 install new software

- 이클립스 마켓 플레이스 -> find에서 tern -> 아래처럼 install누른 후 accept하고 finish -> install anyway -> restart now

  ![image-20200108093406374](images/image-20200108093406374.png)

  - 내가 설치한게 보여짐

  ![image-20200108093912870](images/image-20200108093912870.png)

  - clientweb 우클릭 -> configure -> converter to tern project, 밑의 동그라미 한거 선택

    ![image-20200108094059588](images/image-20200108094059588.png)

    ![image-20200108094121516](images/image-20200108094121516.png)

  - 위의 properties for client web을 다시 들어가려면 clientweb 우클릭 -> properties

    ![image-20200108094409958](images/image-20200108094409958.png)