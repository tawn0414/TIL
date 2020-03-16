- 연도, 월, 일 폴더가 만들어지고 여기에 log가 쌓일 것
  - %Y/%n/%d
- fileType을 DataStream으로 해줘야 log가 HDFS로 옮겨졌을때 글이 안깨짐 
- filePrefix, fileSuffix는 생길 파일의 앞뒤 이름
- writeFormat = text
  - text로 해줘야됨





- hadoop02를 WAS로 잡을꺼라서 톰캣 다운로드할꺼임
  - hadoop02에서 발생하는 로그를 namenode(hadoop01)로 네트워크 통신 할꺼임
  - apache tomcat 사이트-> tomcat 9.0 -> 아래 사진 링크 복사

![image-20200314110813634](images/image-20200314110813634.png) 

- 다운로드 해주고 압축 풀기

![image-20200314110850256](images/image-20200314110850256.png)

- 1번 머신의 .bashrc를 2번 머신으로 복사

![image-20200314111540877](images/image-20200314111540877.png)

- 2번 머신의 .bashrc

![image-20200314111656822](images/image-20200314111656822.png)

![image-20200314112444327](images/image-20200314112444327.png)

- .bashrc실행

![image-20200314112518016](C:/Users/student/Desktop/images/image-20200314112518016.png)

- 톰캣의 기본 포트번호는 8080인데 다른 프로그램에서 쓰고있을 수도 있으니까 확인해주자.
  - 포트중에서 8080이 들어가는 것들을 보겠습니다.
  - -anp는 찾아보겠다는 의미
  - | 는 or의 의미
  - grep은 8080을 선택한다는 의미(?)
  - startup.sh => 톰캣을 실행할때 사용하는 명령어
  - shutdown.sh => 톰캣을 종료할 때 사용하는 명령어
  - 아래에서 LISTEN은 8080이 사용중이라는 뜻이라는거고 TIME_WAIT은 8080이 안쓰이고 있다는 뜻.

![image-20200314113136530](images/image-20200314113136530.png)

- 아래처럼 URL치고 들어갔을 때 톰캣화면 나오면 이제 hadoop02는 WAS가 된것이다.

![image-20200314113352347](images/image-20200314113352347.png)

- 아래처럼 친 후 admin, admin접속해보자
  -  admin을 등록해야 외부에서 관리자로 접속할 수 있음.

![image-20200314114100845](images/image-20200314114100845.png)

- 아래 xml파일에서 관리자 등록하기
  - 사용자 정보를 등록할 꺼임

![image-20200314114422216](images/image-20200314114422216.png)

![image-20200314114551368](images/image-20200314114551368.png)

![image-20200314114619943](images/image-20200314114619943.png)

- 리눅스 서버를 WAS로 잡고 배포할 웹사이트가 있으면 아래의 매니저 페이지에서 등록해줘야함.

![image-20200314114635616](images/image-20200314114635616.png)

- hadoop02의 IP주소를 윈도우의 크롬에서 아래처럼 치면 아직 권한을 안줘서 Access Denied가 뜸

![image-20200314132455738](images/image-20200314132455738.png)

- 아래처럼 Valve를 주석처리 해주자
  - 127.0.0.1만 관리자 페이지에 들어갈 수 있게 해준 코드여서 주석처리해준거임.

![image-20200314132735291](images/image-20200314132735291.png)

![image-20200314132809308](images/image-20200314132809308.png)

- admin, admin

![image-20200314132940535](images/image-20200314132940535.png)

![image-20200314133031552](images/image-20200314133031552.png)

- WAS에 bigdatashop을 베포하고 host의 DBMS에서 씀?
  - 127.0.0.1을 아래처럼 내 컴퓨터 IP로 바꿔줘야함.

![image-20200314135550232](images/image-20200314135550232.png)

- export하기
  - bigdataShop우클릭 -> Web -> WAR file -> 아래사진 처럼하고 저장

![image-20200314135819909](images/image-20200314135819909.png)

- 배치할 WAR파일
  - 방금 Export한 파일을 등록하고 배치버튼 누르면 매니저에 등록해주자

![image-20200314135528533](images/image-20200314135528533.png)

- 이제 hadoop02의 IP로 STS에서 Export한 bigdataShop의 웹으로 접근할 수 있다.

![image-20200314140015496](images/image-20200314140015496.png)

- hadoop02에서 log기록을 볼 수 있다.
  - log기록 => 위의 웹 사이트에서 내가 어떤걸 클릭하고 입력하고 한 거
  - 아래 사진 보면 외부에서 접속한 IP가 정확히 기록되지 않아서 IP로 분석을 할 수 없다. 이거는 IP기록할 수 있도록 또 어떤 설정을 해줘야 한다.

![image-20200314141304918](images/image-20200314141304918.png)



## 미션

1. 3번에 WAS를 구축

2. WAS에 bigdataShop을 배포

3. 3번에 flume을 설치

4. tomcat의 access log를 hdfs에 저장

   -> avro통신

   -> hdfs주소

   ​	/flume/tomcatlog/%Y/~~~

5. 메일로 제출 

   -> 3번의 was manager화면에 배포된 목록 캡쳐

   -> hdfs에 저장된 access log 캡쳐

   -> 각 머신의 flume 설정파일 

### 3번에 WAS 구축, WAS에 bigdataShop 배포

- 리눅스 14따라서 하면됨

### 3번에 flume설치

- 리눅스 13따라서 하면됨

## tomcat의 access log를 hdfs에 저장

- mkdir명령어로 /home/hadoop/에 input파일 만들기

![image-20200314170428160](images/image-20200314170428160.png)

- cp명령어 써서 apache-tomcat에 있는 access log를 input파일에 복사

 ![image-20200314170544406](images/image-20200314170544406.png)

- WAS역할을 하는 hadoop03의 properties파일
  - source
    - input폴더에 넣어서 실행시킬 꺼니까 spoolDir 타입
  - Sink
    - avro통신할 때 hostname은 Host(hadoop01)의 ip주소를 해준다.

![image-20200314170740344](images/image-20200314170740344.png)

- WAS의 flume 실행

![image-20200314170836819](images/image-20200314170836819.png)

- Host(hadoop01)의 properties파일

![image-20200314171112962](images/image-20200314171112962.png)

- Host(hadoop01)의 flume 실행하기

![image-20200314173845002](images/image-20200314173845002.png)

- 결과

![image-20200314173954258](images/image-20200314173954258.png)

- hadoop03을 WAS로 설정해서 bigdataShop을 배포하고 윈도우에서 hadoop03의 IP로 실행했다. 그래서 bigdataShop의 웹사이트를 방문했을 때 log기록이 hadoop03의 apache-tomcat안에 access_log에 기록이 되었다.
- hadoop03은 spoolDir타입으로 source를 동작 시키기 때문에 input폴더를 만들었던거임. input폴더에 access_log를 cp로 복사하자.
- hadoop03과 hadoop01을 avro통신 시켜주고 hadoop03의 flume실행, hadoop01의 flume을 실행시켜주면 hdfs에 access_log내용을 옮길 수 있다.
- 이때 hadoop01은 source가 avro, sink가 hdfs이다.