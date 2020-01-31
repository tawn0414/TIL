- connection pool
  - 동시간대 평균 접속자 수를 계산해서 그 수 만큼 미리 커넥션을 만들어 놓는다. (list나 map으로 만듬.) 이후에 사용자의 요청이 들어오면 커넥션을 꺼내서 준다. 사용자가 연결을 끊으면 커넥션을 없애는게 아니라 다시 pool로 반납된다.
  - WAS에서 DBMS에 접근해서 매번 만들어서 가져오는게 귀찮고 시간도 많이 걸리니까 미리 만들어 놓는거임.
  - [쓰는 방법]
    - DBCP사용 (책에있음)
    - WAS 마다 지원되는 커넥션 풀 이용하기 (수업때는 이거만 함. 우리는 톰캣을 쓰니까 톰캣에서 제공해주는 커넥션 풀을 쓰는거임.)

- WAS로 connection pool쓰기
  - 미리 만들어 놓은 커넥션들이 WAS의 자원이 됨. (map형태로)
  - WAS에서 이 자원들에게 접근할 수 있게 표준 API(인터페이스)를 제공해줌. 이게 datasource임.
    - datasource: 커넥션을 위한 표준 API
  - [순서]
  - 커넥션을 만들어 놓고 WAS에 map형태로 저장 -> 우리는 JAVA API로 또는 JDBC로 이 자원들을 가져다 쓸거임 -> 그러기 위해서 표준API인 datasource를 이용함.

- WAS의 자원을 등록하는 폴더가 META-INF임

![image-20200131093210213](images/image-20200131093210213.png)

- 이거 해놔야 DB연동됨. 

![image-20200131093326280](images/image-20200131093326280.png)

![image-20200131093655198](images/image-20200131093655198.png)

![image-20200131093755561](images/image-20200131093755561.png)

``` ㅇ
<Resource name="jdbc/myoracle" auth="Container"
              type="javax.sql.DataSource" driverClassName="oracle.jdbc.OracleDriver"
              url="jdbc:oracle:thin:@127.0.0.1:1521:mysid"
              username="scott" password="tiger" maxTotal="20" maxIdle="10"
              maxWaitMillis="-1"/>
```

![image-20200131093826754](images/image-20200131093826754.png)

- 동그라미 친 부분 수정
  - 127.0.0.1 부분은 나중에 DB연동할 곳으로 바꿔야됨.
  - maxTotal: 커넥션 몇개 만들어 줄 수 있게 해줄건지
  - maxIdle: 커넥션을 사용자가 사용하고 있어도 10개는 유지하겠다.
  - maxwaitMillis: -1    ---> 접속 할때 걸리는 시간을 무한대로.

![image-20200131094201837](images/image-20200131094201837.png)

- 우리는 frame work에서 쓸꺼지만 아래의 getConnection은 pool에 있는 커넥션을 가져오는 메소드임

![image-20200131094405581](images/image-20200131094405581.png)

- InitialContext: 이름을 주고 객체를 등록할 때 사용.
  - 우리가 쓸건 lookup : 이름을 주면 이름에 해당하는 자원을 찾아온다는 뜻.

![image-20200131094531101](images/image-20200131094531101.png)



![image-20200131095618294](images/image-20200131095618294.png)

- NameNotFoundException: 이름쓸때 오타나왔거나 경로를 잘못한거.
  - 어디서부터 자원을 찾아야하는지 명시를 안해줘서 에러가 난거임.

![image-20200131100008760](images/image-20200131100008760.png)

- 아래사진은 에러 해결한거임

![image-20200131102436932](images/image-20200131102436932.png)

- 아래 동그라미가 자원을 찾아온거임
  - content.xml에 있는 내용들이 자원이었네

![image-20200131102526425](images/image-20200131102526425.png)

InitialContext로 WAS에 있는 자원 찾아올꺼임 -> InitialContext의 lookup 메소드로 이름에 해당하는 자원을 찾아온다. (이게 DataSource타입) -> getConnection으로 해당하는 자원을 찾아옴. -> connection pool에 있는 자원들이 connection들이니까 getConnection 한거임.

- 근데 우린 이방법 안쓸꺼임



## tomcat이 지원하는  connection pool쓰기

- 이제 내부에서 지원하는 connection pool을 쓸거임
- 우선 아래처럼 복붙

![image-20200131103218214](images/image-20200131103218214.png)

​	

- 아래 사진처럼 만들기
  - ojdbc6.jar를 복사.
  - 동그라미처럼 빈공간 만들기.

![image-20200131103706856](images/image-20200131103706856.png)

- spring jdbc 다운받기
  - mavenrepository 들어가기.

![image-20200131104154313](images/image-20200131104154313.png)

![image-20200131104032154](images/image-20200131104032154.png)

![image-20200131104047276](images/image-20200131104047276.png)

![image-20200131104112686](images/image-20200131104112686.png)

![image-20200131104304826](images/image-20200131104304826.png)



## mybatis로 DB연동하기

- 트랜잭션 = 모듈화
  - 모듈화 한거 다 처리되면 자동 commit.
  - 모듈화 한거 처리되다가 에러뜨면 자동 rollback되서 처리됬던거 다 취소됨.
  - commit성공하면 사용자가 하려던 작업이 성공된거
    - ex) 사용자가 책구매 클릭
      - insert, update 등 진행 -> 이게 모듈화되어있는거
      - 성공해서 commit되면 책구매가 완료됨.
      - 

- 이제 mybatis로 DB연동할 껀데 Spring하고 mybatis가 호환이 안되서 연결해주는 라이브러리(=mybatis spring)를 다운받아야함.

### ![beauty_20200131151204](images/beauty_20200131151204.jpg)



### mybatis를 쓰기위한 설정 시작

![image-20200131135258713](images/image-20200131135258713.png)

![image-20200131112131306](images/image-20200131112131306.png)

![image-20200131112212820](images/image-20200131112212820.png)

![image-20200131112226480](images/image-20200131112226480.png)

![image-20200131112352782](images/image-20200131112352782.png)

![image-20200131112442527](images/image-20200131112442527.png)

![image-20200131112652634](images/image-20200131112652634.png)

![image-20200131112715439](images/image-20200131112715439.png)

![image-20200131113207190](images/image-20200131113207190.png)

- mybatis 공식홈
  - https://blog.mybatis.org/

![image-20200131113315959](images/image-20200131113315959.png)

![image-20200131113412643](images/image-20200131113412643.png)

- 위의 docs누르면 mybatis 튜토리얼 있음. 아래가 튜토리얼들임.

![image-20200131113437682](images/image-20200131113437682.png)



- help -> eclips marketplace

![image-20200131123220874](images/image-20200131123220874.png)





- sqlSession가 핵심클래스 -> 스프링의 jdbctemplete과 같음.
  - SqlSession: sql을 실행하는 메소드를 갖고 있는 객체.

![image-20200131131138474](images/image-20200131131138474.png)

![image-20200131131256432](images/image-20200131131256432.png)

``` 복붙
<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE configuration
  PUBLIC "-//mybatis.org//DTD Config 3.0//EN"
  "http://mybatis.org/dtd/mybatis-3-config.dtd">
```

- xml파일만들어서 mybatis-config.xml만들고 위의 코드 붙여넣기

![image-20200131131434164](images/image-20200131131434164.png)



- 아래처럼 해주자.
  - type에는 VO를 넣어주는거임(VO=DTO)

- mapper에는 테이블이름이랑 똑같은이름을 지어준다.
  - mapper는 sql문을 작성하는거.

![image-20200131131931479](images/image-20200131131931479.png)

- mapper설정
  - board.xml설정하기.

![image-20200131132036487](images/image-20200131132036487.png)

- 아래 사진 안에 sql을 정의하는거임.

![image-20200131132058458](images/image-20200131132058458.png)

![image-20200131132448643](images/image-20200131132448643.png)

- 이 mapper에 대한 정보를 mybatis-config가 알아야하니까 아래처럼 ㄱㄱ

![image-20200131132616296](images/image-20200131132616296.png)



- resultType: 레코드 한개를 뭐라고 정의해놨냐
  - 우리는 alias에 board라고 했으니까 아래사진처럼 ㄱㄱ
  - 이렇게 해주면 자동으로 맵핑됨.

![image-20200131132834563](images/image-20200131132834563.png)

- 아래 동그라미의 jndiName의 value는 context.xml에 내가 정의한 커넥션 pool에 있는 connection자원의 이름을 정의해준다.

![image-20200131133750058](images/image-20200131133750058.png)

![image-20200131133940653](images/image-20200131133940653.png)



![image-20200131140614427](images/image-20200131140614427.png)

- 여기까지가 mybatis를 쓰기위한 설정 끝(3개 만짐).
  - mybatis-config.xml
  - board.xml (mapper)
  - spring-config.xml



### mybatis 사용하기

![image-20200131141055315](images/image-20200131141055315.png)

- 현재 0번,1번은 해놓은거임.
  - 아래의 순서대로 0번과 1번

![image-20200131143806119](images/image-20200131143806119.png)

![image-20200131143831685](images/image-20200131143831685.png)

- 2번시작

![image-20200131141320465](images/image-20200131141320465.png)

![image-20200131142250117](images/image-20200131142250117.png)

- 3번
  - controller가 serviceImpl호출, service가 DAOImpl호출

![image-20200131142224660](images/image-20200131142224660.png)

![image-20200131142620841](images/image-20200131142620841.png)

- 4번 
  - controller생성

![image-20200131143510702](images/image-20200131143510702.png)

- 5번 
  - board-tiles등록
    - boardlist.jsp를 등록

![image-20200131144244241](images/image-20200131144244241.png)

- 6번. 뷰 등록하기

![image-20200131152505140](images/image-20200131152505140.png)

- 완성

![image-20200131153147588](images/image-20200131153147588.png)

- 이제 글쓰기를 눌렀을때 보이는거 만들꺼임.
- 우선 템플릿먼저 만듬

![image-20200131153648003](images/image-20200131153648003.png)

- boardcontroller에 메소드 만들기

![image-20200131153902178](images/image-20200131153902178.png)

![image-20200131154019180](images/image-20200131154019180.png)

- 글쓰기 누르니까 아래 화면 뜸

![image-20200131154047150](images/image-20200131154047150.png)

- 이제 등록 눌렀을 때 DB로 넘어가는거 구현할 꺼
  - boardcontroller에 메소드 구현하기
    - 근데 이름을 같게하고 싶을 때 get방식 post방식 나눠져 있으면 아래처럼 해준다.

![image-20200131161347306](images/image-20200131161347306.png)

- 이제 등록을 눌러주면 DTO에 저장이 된다.
  - 그러니까 테이블의 컬럼명과 DTO의 멤버변수명이 같아야한다.

![image-20200131161443545](images/image-20200131161443545.png)

![image-20200131161507403](images/image-20200131161507403.png)

- 이제 insert문 쓸꺼임. -> 새로운기능 추가하는거 니까 mapper부터 시작
  - 일단 컬럼명 부터 확인 

![image-20200131162034771](images/image-20200131162034771.png)

- board.xml에 insert문 작성
  - #{title} 이런식으로 쓴건 물음표 쓴거랑 똑같은거.
  - #{title} = ?

![image-20200131162335049](images/image-20200131162335049.png)

- daoimpl작성

![image-20200131162533076](images/image-20200131162533076.png)

- serviceimple의 insert메소드에서 daoimple에 쓴거 호출

![image-20200131162649247](images/image-20200131162649247.png)

- 기본은 forward인데 redirect쓰면 send redirect로 바뀜

![image-20200131162840177](images/image-20200131162840177.png)

- 아래처럼 내용쓰고 등록누르자.

![image-20200131163012680](images/image-20200131163012680.png)

- 아래처럼 된게 redirect된거임.

![image-20200131163042127](images/image-20200131163042127.png)