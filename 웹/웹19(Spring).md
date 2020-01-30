- resuorces: 이미지, css, js파일이 있는 곳
  - location: resource폴더에 위치시켜놓고 -> mapping : /resource로 요청하세요~

![image-20200130100444119](images/image-20200130100444119.png)

- 그래서 아래 사진의 body에서 위의 img에 쓴 src처럼 바꿔줘야됨

![image-20200130100837966](images/image-20200130100837966.png)

- 부트스트립, 링크 등은 메인 레이아웃에만 해주면 된다.

![image-20200130112109558](images/image-20200130112109558.png)

- 아래처럼 top에 없어도 잘 나옴.

![image-20200130112502881](images/image-20200130112502881.png)

![image-20200130112520011](images/image-20200130112520011.png)





- 이제부턴 아래밑줄처럼 하나만 하지 않고 board, emp, menu 등의 폴더 안에 tiles를 계속 만들어 줄꺼다.

![image-20200130112707029](images/image-20200130112707029.png)

- 그래서 아래처럼 바꿔주자.
  - WEB-INF아래있는 모든 폴더중 -tiles.xml이 포함된거를 모두 타일즈 설정파일로 쓰겠다는 말.

![image-20200130112739524](images/image-20200130112739524.png)



- 이제 파일들이 많아져서 start속도가 많이 느려질 것. 그래서 아래처럼 timeouts의 start time을 더 길게 해줘야 timeout 에러가 뜨지 않는다.

![image-20200130113633917](images/image-20200130113633917.png)

![image-20200130113652956](images/image-20200130113652956.png)



- 지금가지는 아래처럼 한 controller에 메소드를 모아서 작업했다.

![image-20200130132206019](images/image-20200130132206019.png)

- 이제부터는 Controller를 분리해서 작업해주자.

![image-20200130132041120](images/image-20200130132041120.png)

![image-20200130132257690](images/image-20200130132257690.png)

![image-20200130132311149](images/image-20200130132311149.png)

![image-20200130132333225](images/image-20200130132333225.png)

- 웹에서 요청할 수 없는 WEB-INF로 css랑 js가 있는 common과 images를 옮기자

![image-20200130132511287](images/image-20200130132511287.png)

![image-20200130132609625](images/image-20200130132609625.png)

- 이미지를 요청할 땐 /images/ 라고 요청할 꺼고 css나 js를 요청할 땐 /common/으로 요청하겠다.

![image-20200130132758710](images/image-20200130132758710.png)

- 이제 아래 밑줄을 지워주고 작업하는 식으로 해주면 된다.

![image-20200130132941109](images/image-20200130132941109.png)



- 이제 각각의 폴더에 -tiles.xml을 만들어주고 잘 작동하는지 볼 거다. (tiles파일 분리하기)
- 우선 아래처럼 등록해주자

![image-20200130134503431](images/image-20200130134503431.png)

- board폴더에 board-tiles.xml을 만들어주자

![image-20200130134300851](images/image-20200130134300851.png)

![image-20200130134642620](images/image-20200130134642620.png)



## DB연동 시작

- erp 만들고 그 안에 erp 만들기

![image-20200130140946034](images/image-20200130140946034.png)

- conn erp/erp; 로 접속하고 선생님이 준 테이블 복붙
  - 이때 step1.sql의(edit plus) 5번째 줄에 deptname을 의 varchar2 길이를 20으로 변경시켜라

![image-20200130141258288](images/image-20200130141258288.png)

- erp에 아래사진처럼 step1.sql을 추가
  - 우클릭 ->  open with -> text editor로 파일 열어주자

![image-20200130141946096](images/image-20200130141946096.png)



- 선생님이 주신 db명세 열면 테이블 마다 컬럼들 볼 수 있다.

![image-20200130142459350](images/image-20200130142459350.png)



- mybatis 보기전에 spring db를 먼저 보자
  - 우선 db연동을 위한 라이브러리를 추가하자
    - ojdbc, spring-jdbc, (나중에는 mybatis)

![image-20200130151859348](images/image-20200130151859348.png)

![image-20200130151925510](images/image-20200130151925510.png) 

``` 복사할꺼
<dependency>
    <groupId>com.oracle</groupId>
    <artifactId>ojdbc6</artifactId>
    <version>11.2.0.4.0-atlassian-hosted</version>
</dependency>

이거 복사하고 pom.xml에 넣을땐 
<dependency>
    <groupId>com.oracle</groupId>
    <artifactId>ojdbc6</artifactId>
    <version>11.2.0.3</version>
</dependency>
으로 넣어주기
```

- 아직은 에러뜸
  - 중앙저장소에 없기때문에 라이브러리를 따로 등록해줘야한다.

![image-20200130152110181](images/image-20200130152110181.png)

``` 이거하면 에러 안뜸
<repositories>
		<repository>
			<id>mesir-repo</id>
			<url>https://code.lds.org/nexus/content/groups/main-repo</url>
		</repository>
		
	</repositories>[출처] 필요파일|작성자 heaves1
```

![image-20200130152153787](images/image-20200130152153787.png)

- 다운로드 성공

![image-20200130152227545](images/image-20200130152227545.png)

![image-20200130152414398](images/image-20200130152414398.png)

![image-20200130152453808](images/image-20200130152453808.png)

``` ㅇㄴㅁ

<dependency>
    <groupId>org.springframework</groupId>
    <artifactId>spring-jdbc</artifactId>
    <version>4.2.4.RELEASE</version>
</dependency>
이게 spring jdbc꺼 pom.xml에 복붙
```

![image-20200130152343098](images/image-20200130152343098.png)



### 209p

- spring- jdbc에서 두가지 일을 한다.
  - connection관리 -> datasource로 활용(=connection pool)
  - sql처리 -> JDBCTemplate활용

- 우선 springmvc프로젝트에서 연습하자
  - 아래처럼 복사 후 이름을 erp.xml로 수정

![image-20200130154810717](images/image-20200130154810717.png)

![image-20200130154907494](images/image-20200130154907494.png)

- 위의 밑줄은 우리가 요청할 때마다 객체를 하나씩 계속 생성해서 느리기 때문에 실제로는 안씀. 그래서 datasource를 쓴다는 것. (우린 여태까지 drivermanager를 썼던거임.)

- 위에서 아래 코드를 보면 JdbcTemplate이 ds인 커넥션을 관리하는 객체를 참조하고 있음. 
  - datasource를 통해서 정보를 전달 받는다는 의미. preparedstatement가 필요한데 이걸 만들려면  커넥션이 필요하니까 참조한 것.
  - 우리는 DAO만 만들면 됨.

![image-20200130155429337](images/image-20200130155429337.png)

- DAO를 아래처럼 만듬 -> JdbcTemplate로 sql문 작성
  - ① SELECT문 작성. dept의 모든 숫자를 세겠다.
  - ② Integer로 리턴될 것이다. 라는 뜻.

![image-20200130161918261](images/image-20200130161918261.png)

- main인 Test에서 바로 호출할 수 없으니까 DeptServiceImpl을 만들어 준것.

![image-20200130162441088](images/image-20200130162441088.png)

- 아래처럼 main인 Test만들어준다.
  - 밑줄 친거처럼 호출할꺼라서 위의 DeptServiceImpl을만들어 줬던 것.
  - 아직 인터페이스 안만들었으니까 9번째 줄에 DeptServiceImpl 타입을 써준 것.
  - 전체 부서의 갯수 세는 sql문 실행 성공. (DB연동 성공한 것임)

![image-20200130162638535](images/image-20200130162638535.png)



- 순서

  - 1. erp.xml에 커넥션관리랑 JdbcTemplete 정의해주기
    2. DAOImpl작성 -> 여기서 JdbcTemplete 을 사용해서 sql문 작성함
    3. service를 통해서 daoImpl의 메소드를 호출
    4. Test(main)에서 factory(컨테이너) 객체 생성해주고 service를 getBean해줘서 dao실행. 

    

- insert도 해보자
- 아래의 밑줄은 물음표에 들어갈애들을 순서대로 써주면됨.

![image-20200130163911635](images/image-20200130163911635.png)

- 원래는 아래의 매개변수에 DTO가 들어가야됨.

![image-20200130164029105](images/image-20200130164029105.png)

![image-20200130164043076](images/image-20200130164043076.png)

- insert성공

![image-20200130164133426](images/image-20200130164133426.png)



- update나 insert나 하는 방법은 똑같은 형식임.



- select문
  - rowMapper가 중요함.
  - DTO생성한 후 RowMapper클래스 만들어주자 -> DAOImpl에서 query문 리턴.
  - 

![image-20200130172011869](images/image-20200130172011869.png)

![image-20200130172214948](images/image-20200130172214948.png)

![image-20200130172442108](images/image-20200130172442108.png)

![image-20200130172744928](images/image-20200130172744928.png)

- 근데 현재는 동적 sql못함. 이거보다 훨 더 편한게 mybatis.
  - 다 똑같은데 rowmapper랑 sql이 xml로 나오는게 mybatis