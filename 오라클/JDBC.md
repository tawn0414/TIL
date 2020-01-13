# JDBC

- 김샘 자바 블로그에 더 정확한 자료들이 있음.
- 자바에서 오라클, my SQL, DB2등 DBMS에 접근할 때 접근방법이 동일하다. 이 말은 동일한 API를 사용한다는 의미이다. 동일한 접근방법을 위해 자바에는 Spec만 작성되어 있다. 다르게 말하면 빈 메소드들로 작성되어있다는 말이고 이것들은 interface로 작성되어 있다. 이 spec들을 보고 DBMS가 오버라이딩을 할 것이다. 이렇게 각각 다르게 오버라이딩 된 파일을 JAVA가 호출하면 상속의 특성 덕분에 오버라이딩 된 파일이 호출된다. 이 파일을 갖고있는 애를 드라이버라고 부른다.
- forname은 new와 같이 메모리에 올리는 목적인데 같은 의미는 아니다. 클래스로더가 static에 핵심 클래스를 올리는 것과 같은 의미이다. 
- 이제 자바와 오라클을 연동한다고 생각해보자. JVM에서 오라클에 ip, port, 계정, 비밀번호를 전달한다. 그리고 커넥션 설정을 할때 java sql클래스의 Drivermanager에서 getConnection메소드를 활용해서 오라클과 JVM을 연결 시킨다.
- URL: 연결정보를 포함하는 문자열이라서 DBMS마다 다 다르다.
  - 오라클의 URL
    - Jdbc:oracle:thin:오라클의 프로토콜 명
      - 프로토콜: 오라클 내부에서 통신하는 것.

- Statement: SQL을 실행시키는 객체, JVM이 갖고있는 연결정보를 이용하기 때문에 연결정보를 연결시킨 후 저장하고 있어야 한다. interface이고 하위클래스의 spec을 눈으로 확인할 수 없어서 new를 쓸 수 없다.

## JDBC 작성순서

- DAO -> DTO-> DBUTIL -> UI -> DAOIMPL ... 순서가 정해진건 아님. 

  ① Interface인 DAO를 만든다. 내가 오버라이딩할 메소드를 작성한다. 이때 Insert메소드는

  ​     int insert(테이블명DTO 매개변수); 로 작성해줘서 많은 column을 다룰때를 대비한다.

  ② data transfer object인 DTO클래스를 만든다. 테이블에 들어갈 컬럼명과 data type에 맞춰서 멤버변수를 선언한다. 이후 기본생성자, DAO에 썼던 메소드용 생성자, toString메소드, get/set 메소드를 선언한다.

  ③ DBUtil에 forname, connection, close메소드를 만든다.

  ④ UI클래스에 DAO객체를 new 하여 생성하고 DAO에 있는 메소드를 만든다. 이 메소드는 사용자에게 보여지는 화면을 만드는 것이다.

  ⑤ DAOIMPL을 DAO를 implements시키고 오버라이딩 한다.



## transaction처리

- 모듈화라고 생각하면 된다.
  - 주문해서 내 카드에서 돈이 빠져나가고 구입이 되면 상품물량이 하나 줄어드는게 하나의 모듈이다. 만약 이 두가지 행위를 따로 분리하면 내 돈만 빠져나가고 시스템이 멈췄을 때 데이터 상의 물량은 안 줄어들게 된다. 이러한 상황일때 transaction을 해준다.

## 배열, vector, ArrayList

- 배열
  - 생성: int[] arr = new int[5]
  - 요소저장: arr[0] = 100
  - 요소의 갯수: arr.length
  - 요소의 값을 가져오기: S.O.P(arr[0])
- vector(API라서 메소드로 접근해야 한다.)
  - 생성: Vector<Integer> v = new Vector<Integer>();
  - 요소저장: v.add(100)
  - 요소의 갯수: V.size()
  - 요소의 값을 가져오기: S.O.P(v.get(0))
- ArrayList
  - 생성: ArrayList<Integer> v = new ArrayList<Integer>();
  - 요소저장: v.add(100)
  - 요소의 갯수: V.size()
  - 요소의 값을 가져오기: S.O.P(v.get(0))

vector는 무거워서 어플리케이션에서만 활용이 됨. 그래서 대부분은 ArrayList가 활용이 된다.