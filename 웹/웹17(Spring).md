## Spring web(241P)

- front controller pattern
  - 모든 요청을 한 곳에서 받아서 처리함.
    - 내가 웹 사이트를 만들었을 때 이 웹사이트에 들어올 수 있는 경로가 너무 다양하다. 이것들을 모두 관리할 수 없으니까 중간에 사용자들의 요청을 받고 판단해서 처리할 수 있도록 해주자. 이렇게 판단해서 처리할 수 있도록 기능들이 모듈화 되어있다.

## FrontController

- 우선 dynamic web project를 만들어주자.
  - web.xml은 나중에는 필요하지만 지금은 필요없다.

![image-20200128094303559](images/image-20200128094303559.png)

![image-20200128094334448](images/image-20200128094334448.png)![image-20200128094406898](images/image-20200128094406898.png)![image-20200128094423292](images/image-20200128094423292.png)

- 에러 해결해주기 (server runtime 라이브러리 추가), FrontServlet이 모든 요청을 다 받게 할거임.

![image-20200128094749785](images/image-20200128094749785.png)

![image-20200128094940737](images/image-20200128094940737.png)![image-20200128094950537](images/image-20200128094950537.png)

![image-20200128095043512](images/image-20200128095043512.png)

![image-20200128095115821](images/image-20200128095115821.png)

- build path -> add library

![image-20200128095151899](images/image-20200128095151899.png)

![image-20200128095219167](images/image-20200128095219167.png)

![image-20200128101601984](images/image-20200128101601984.png)![image-20200128101650441](images/image-20200128101650441.png)![image-20200128101822969](images/image-20200128101822969.png)

- url pattern을 *.do, *.html, *.jsp로 했기 때문에 사용자들이 어떤 확장자로 요청을해도 전부 다 받을 수 있다.
  - 모든 요청에 대한 관리를 해줄 수 있다. 아래는 다른 확장자들도 다 요청이 되는 것을 볼 수 있다.

![image-20200128102021230](images/image-20200128102021230.png)

![image-20200128102042066](images/image-20200128102042066.png)

- 아래처럼 코드짜고 run하면 콘솔창 처럼 받을 수 있다.

![image-20200128102308511](images/image-20200128102308511.png)

- 아래처럼 코드를 짜주면 내가 원하는 path만(요청된 path) 추출할 수 있다.

![image-20200128102640626](images/image-20200128102640626.png)

- 커맨드 패턴: 추출한 요청 path마다 클래스를 하나씩 만들어 준다.

- 파일 생성, name,value를 갖고있는 애

![image-20200128103002050](images/image-20200128103002050.png)

- 좌변의 요청이 들어오면 우변의 클래스를 실행하라는 말. -> 내가 내 맘대로 만들어줄 수 있음
  - ex) basic에 있는 IndexController클래스를 실행하라

![image-20200128103144849](images/image-20200128103144849.png)

- RequestMapping에 마우스 대고 create class를 선택해서 클래스를 만들어주자.

![image-20200128103503721](images/image-20200128103503721.png)

- mapping에 마우스 올려서 create method를 클릭해주자.

![image-20200128103934032](images/image-20200128103934032.png)

- 아래의 메소드(동그라미)가 생김

![image-20200128104009178](images/image-20200128104009178.png)

- 모든 요청을 FrontServlet이 받는다. 여기서 요청받은 path를 추출하고 RequestMapping이라는 클래스를 만들어줘서 의뢰한다. RequestMapping은 우리가 작성한 mycommand.properties를 보고 우리에게 어떤 객체를 만들어야 한다고 알려준다. 근데 만들어야할 객체가 너무 많고 타입이 다양하기 때문에 타입을 통일시켜줘야 한다. 그래서 인터페이스인 Action을 상속하도록 해주면 RequestMapping은 Action타입을 넘겨주기만 하면 된다.
- src에 pakage(member,product)만들어주고 일반 클래스(MemberInsert, ProductList)를 만들어준다.
  - 내가 mycommand.properties의 우변에 정의한 경로대로 만들어주는 듯?

![image-20200128105017704](images/image-20200128105017704.png)

![image-20200128105400755](images/image-20200128105400755.png)

- 이제 뭔가 추가될때마다 설정파일(mycommand.properties)에만 추가해주면 된다.
  - 아래는 /login.do로 요청이 들어올 일이 생겼다 치자. 그러면 /login.do로 요청이 들어오면 member의 LoginAction을 실행하겠다는 의미로 설정파일에 내가 만들어준다. 그리고 LoginAction이 Action을 상속하도록 클래스만 만들어주기만 하면된다. 현재는 RequestMapping에 if else로 해놨기 때문에 코드를 추가해줘야 하지만 나중에는 이 부분을 건드리지 않아도 된다.

![image-20200128113706626](images/image-20200128113706626.png)

![image-20200128113908399](images/image-20200128113908399.png)

![image-20200128114118398](images/image-20200128114118398.png)

- 아래처럼 요청을하면 콘솔창에서 확인가능

![image-20200128114240481](images/image-20200128114240481.png)

![image-20200128114303009](images/image-20200128114303009.png)



## springMVC(313P)

![image-20200128130914376](images/image-20200128130914376.png)

- 이제부터 web.xml추가

![image-20200128131051959](images/image-20200128131051959.png)

- 계속 spring으로 할꺼니까 no클릭

![image-20200128131117984](images/image-20200128131117984.png)

![image-20200128132117393](images/image-20200128132117393.png)

- spring 1 day에서 commons-logging추가, oraclexe에서 ojdbc6추가

![image-20200128132426096](images/image-20200128132426096.png)

![image-20200128132451764](images/image-20200128132451764.png)

![image-20200128133342928](images/image-20200128133342928.png)

- 아래는 확장자가 .do로 들어온 애들은 모두 DispatcherServlet으로 받겠다는 의미

![image-20200128133813315](images/image-20200128133813315.png)

- 아래사진의 4번처럼 해줘야 DispatcherServlet에서 인식할 수 있다.
  - 무조건 규칙에 맞춰서 만들어주기!!
    - 여태까지는 main에서 getBean해서 가져왔기 때문에 내 맘대로 xml파일명을 설정했지만 이제는 규칙에 맞게 해줘야함. 

![image-20200128134409081](images/image-20200128134409081.png)

- springmvc서버 만들기 위해서 src에 test패키지랑 Test클래스만들어서 run -> always 체크하고 restart

![image-20200128134616216](images/image-20200128134616216.png)

![image-20200128135102420](images/image-20200128135102420.png)

![image-20200128135224328](images/image-20200128135224328.png)

- name => /test.do로 요청을 받겠다. , class = > 경로대로.

![image-20200128142400721](images/image-20200128142400721.png)

- name에 정해준 /test.do로 컨트롤러를 요청해줌.

![image-20200128142253962](images/image-20200128142253962.png)

![image-20200128144251456](images/image-20200128144251456.png)

- 무조건 DispatcherServlet을 통해서 view가 실행되도록 WEB-INF밑에다가 View를(jsp) 만들어서 사용한다. 웹에서 실행되지 않도록.

![image-20200128144534226](images/image-20200128144534226.png)

- 이제 /test.do를 실행하면 아래처럼 결과가 나온다.

![image-20200128144732714](images/image-20200128144732714.png)

### 

- springapp-servlet.xml형태를 계속 만들기 싫으니까 아래처럼 하자.

![image-20200128161133357](images/image-20200128161133357.png)

- springapp-servlet.xml을 config에 이동시키고 rename시킴.

![image-20200128161153857](images/image-20200128161153857.png)

![image-20200128161222399](images/image-20200128161222399.png)

![image-20200128161401429](images/image-20200128161401429.png)

![image-20200128161413704](images/image-20200128161413704.png)

- src -> test -> new -> class,    superclass의 Browse클릭.

![image-20200128161745576](images/image-20200128161745576.png)

![image-20200128161843308](images/image-20200128161843308.png)

![image-20200128163628975](images/image-20200128163628975.png)

- 서블릿 초기화 파라미터 -> init-param
  - 무조건 param-name에 contextConfigLocation이어야함. DispatcherServlet이 이 이름을 찾아가기로 약속이 되어있기 때문이다.
  - 설정파일이 두개일때 아래의 param-value에 쓴거처럼 작성해주면 된다.

![image-20200128163004548](images/image-20200128163004548.png)

![image-20200128163220381](images/image-20200128163220381.png)

![image-20200128163229782](images/image-20200128163229782.png)

- search도 만들기.

![image-20200128164506646](images/image-20200128164506646.png)

![image-20200128164646037](images/image-20200128164646037.png)

- 아래 사진의 SearchController는 그냥 일반 class를 생성하고서 implements함.

![image-20200128164727566](images/image-20200128164727566.png)

- 아래처럼 검색
  - http://localhost:8088/springmvc/index.do로 들어가서 검색어 입력하고 검색 누르니까 http://localhost:8088/springmvc/search.do로 바뀜.

![image-20200128165000795](images/image-20200128165000795.png)

- 콘솔창에 내가 검색한게 뜸.

![image-20200128165023764](images/image-20200128165023764.png)

- 한글입력하니까 깨짐

![image-20200128165147673](images/image-20200128165147673.png)

![image-20200128165158941](images/image-20200128165158941.png)

- 한글 인코딩하기

![image-20200128171507252](images/image-20200128171507252.png)

- 근데 위에 처럼 하면 한글 인코딩 코드를 매번 컨트롤러마다 써줘야하니까 더 편하게 하자.
  - 김샘자바에서 아래 코드 복붙
  - param value에 EUC-KR을 UTF-8등으로 수정가능
  - url pattern에 /*은 모든곳에 적용하겠다는 뜻.

![image-20200128171658360](images/image-20200128171658360.png)

- 이제 인코딩 코드 없이 돌려도 한글 인코딩이 됨.

![image-20200128171927298](images/image-20200128171927298.png)

### ViewResolver

- 여기서 setter injection사용됨.
  - prefix = 접두사 => /WEB-INF/가 중복되니까 써준것.
  - suffix = 접미사 => .jsp가 중복되니까 써준 것.
- 현재 컨트롤러에 viewName들을 모두 적어주고 있다. 그런데 /WEB-INF/ 이랑 .jsp가 계속 중복된다.

![image-20200128173400003](images/image-20200128173400003.png)

- 이제 아래처럼 쓰면 된다.

![image-20200128173428104](images/image-20200128173428104.png)

![image-20200128173503312](images/image-20200128173503312.png)

- 아직 SearchController는 위의 컨트롤러들 처럼 안바꿔줬더니 아래처럼 에러가 뜬다. 한글이 콘솔창에 찍히는 것을 보니까 컨트롤러는 작동한거임. 그리고 에러에 밑줄보면 경로가 중복되어서 찍힌것을 볼 수 있다.

![image-20200128173621112](images/image-20200128173621112.png)

## 로그인기능 구현 (325P)

