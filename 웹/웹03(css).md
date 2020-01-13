# CSS

## 목차

- css사용방법(110p)
- 텍스트관련 테이블(기본 사용 방법)
- box모델링
- 포지셔닝
- float (layout을 잡겠다는 의미, 박스모델을 배치하는 것.)
- layout



## css사용방법

- 선택자: css를 어디에 적용할 것이냐는 의미, =>>> p{},h1{} 등등 내가 body에 썼던 태그들.
- 링크 스타일 ( a:~~~), css_hyperA_test.html
  - 콜론 뒤의 상황이 됬을때 실행을 하겠다는 의미.




## float

- 박스모델 정의하고 float명령어 실행.

![image-20200106102552043](images/image-20200106102552043.png)

![image-20200106102610883](images/image-20200106102610883.png)

![image-20200106102636463](images/image-20200106102636463.png)

![image-20200106102650810](images/image-20200106102650810.png)



- transition

  ![image-20200107093604942](images/image-20200107093604942.png)

  아래 네모가 2초에 걸쳐서 동그라미가 됨.

  ![image-20200107093635243](images/image-20200107093635243.png)



## bootstrap

bootstrap(부트스트랩), 고도몰(우리나라꺼, 디자인-> 무료디자인스킨 또는 무료폰트)

- html + css + javascript를 프레임워크화 해놓은것.

- 크로스 브라우저 이슈 해결가능.

- 디자인 템플렛을 가져다 쓸 수 있음. 아래 동그라미 눌러서 다운로드 받기

  ![image-20200106134317449](images/image-20200106134317449.png)

- 디자인이 나와야하는데 안나오는 이유의 대부분은 버전 충돌때문임 -> 버전충돌 조심

- 아래꺼 절대 이클립스에서 열지 말기. 이클리스 다운됨

  ![image-20200106134911259](images/image-20200106134911259.png)

- bootstrap.min.css를 쓰는게 처리속도가 빠름.

- 맨위 bootstrap.css에 클래스, id, 태그 들을 style 한게 다 정의되어 있음. (아래그림) 

  ![image-20200106135431182](images/image-20200106135431182.png)

- bootstrapCDN에서 사용하자.

  ![image-20200106140242307](images/image-20200106140242307.png)

- ![image-20200106135839800](images/image-20200106135839800.png)

![image-20200106135857162](images/image-20200106135857162.png)

![image-20200106135918906](images/image-20200106135918906.png)



- 아래 그림은 위의 코드치면 아래의 디자인이 나온다는 의미임.

![image-20200106135934732](images/image-20200106135934732.png)

- bootstrap에서 아래를 다운로드해서 쓰기.
  - 보통 웹사이트에 들어가면 그 웹사이트에서 쓰여진 파일들이 클라이언트 컴퓨터에 자동으로 다운 받아진다. 내가 직접 커스터마이징 할것이 아니면 아래를 그대로 다운받아서 내 웹사이트에 사용하면 사용자는 이미 한번 다운받아져 있는 상태가 많기 때문에 다운로드에 대한 부담을 줄여줄 수 있으니까 아래를 가져다 쓰세요

![image-20200106141144290](images/image-20200106141144290.png)



- 아래 표시 따라가면 C:\Users\student\AppData\Local\Microsoft\Windows\INetCache라는 임시폴더에 내가 들어갔던 웹사이트에서 사용된 css파일이 자동으로 저장된다.
  - 웹사이트에서 사용되는 css,아이콘, 자바스크립트 파일 등이 클라이언트 컴퓨터에 자동저장된다.

![image-20200106140621583](images/image-20200106140621583.png)

![image-20200106140724267](images/image-20200106140724267.png)





- 아래와 같은 에러가 떴을 때, clientweb에서 -> build path -> config ->  add livray -> server runtime-> apache tomcat
  - servlet jsp가 등록이 안되어있어서 에러가 났던것. tomcat이 servlet jsp을 포함하고 있음.

![image-20200106142017905](images/image-20200106142017905.png)



- 이클립스에서 사용하기

  ![image-20200106142558372](images/image-20200106142558372.png)

  - 아래의 head안에 link, script, script내용이 꼭 복붙되어있어야함. 저 경로를 붙이면 자동으로 파일들이 내 pc에 다운받아지게 되고, 앞으로 쓸때 이미 다운받아져 있는 파일을 쓴다면 바로 실행가능.

  ![image-20200106142618755](images/image-20200106142618755.png)

  ![image-20200106142639372](images/image-20200106142639372.png)



- 아래의 경우에 well, alert alert-success등의 클래스들이 link, script, script안에 속성이 이미 저장되어 있기 때문에 저대로 실행이 가능한 것이다.

  ![image-20200106144832602](images/image-20200106144832602.png)

![image-20200106144245078](images/image-20200106144245078.png)

- 아래를 보면 link, script, script의 파일들이 다운받아져 있다.

![image-20200106144717812](images/image-20200106144717812.png)



### grid basic

- float을 내가 직접하지 않아도 됨. 

- layout을 grid 12개로 분할해서 관리한다. 이 12개만 맞춰주면 된다.

- 아래 그림의 오른쪽은 12개를 분할한 이미지를 보여준것.

  ![image-20200106145207756](images/image-20200106145207756.png)

  ![image-20200106145356019](images/image-20200106145356019.png)

  - row: 한 행으로 인식하겠다.

  ![image-20200106145434718](images/image-20200106145434718.png)

  ![image-20200106145738290](images/image-20200106145738290.png)

  ![image-20200106145925275](images/image-20200106145925275.png)

- ![image-20200106150100499](images/image-20200106150100499.png)

- ![image-20200106150110748](images/image-20200106150110748.png)

![image-20200106151045354](images/image-20200106151045354.png)

![image-20200106151225984](images/image-20200106151225984.png)

- 위의 두개 실행 결과, offset은 3칸을 건너 뛰라는 의미임.

![image-20200106151244490](images/image-20200106151244490.png)



- w3school의 예제들이 익숙해지면 아래 그림 사이트에서 더 많은 예제 찾아쓰기

  ![image-20200106152549050](images/image-20200106152549050.png)

