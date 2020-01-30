![image-20200129093559348](images/image-20200129093559348.png)



- SimpleUrlHandlerMapping
  - 지금까지 handlermapping을 default로 썼음.
  - 근데 우리는 annotation으로 갈꺼기 때문에 실제로 이걸 쓰지 않음.

![image-20200129101427825](images/image-20200129101427825.png)

![image-20200129101641328](images/image-20200129101641328.png)



- prop에 등록한 이름대로 id를 등록해줘야 에러가 뜨지 않는다.

![image-20200129102416270](images/image-20200129102416270.png)

![image-20200129102611763](images/image-20200129102611763.png)

## 최종 spring(20P)

- 이제 실제 프로젝트 시작.
- 전체적으로 UTF-8로 설정하기.

![image-20200129103745004](images/image-20200129103745004.png)

- 아래사진까지 하면 이제 워크스페이스 전부가 UTF-8로 설정이 됨

![image-20200129103854613](images/image-20200129103854613.png)

- 아래선택된곳 전부 UTF-8로 변경

![image-20200129104028968](images/image-20200129104028968.png)

![image-20200129104139383](images/image-20200129104139383.png)

- 위의 과정을 다 하면 이제 프로젝트들이 모두 UTF-8로 동작함.
- 이제 maven기반으로 프로젝트를 관리할 것임.
  - 지금까지는 WEB-INF의 lib에 라이브러리를 직접 추가해줬는데 이제는 maven의 중앙저장소에서 라이브러리를 가져올것임. 특정 방법으로 폴더를 만들고 저장만하면 maven사이트에 있는 모든 라이브러리를 내 local로 다운받아올 수 있음.
  - 단점: 네트워크가 불안정하면 다운받다가 에러뜸.

- spring legacy project생성
  - new -> other-> 아래사진경로

![image-20200129104631868](images/image-20200129104631868.png)

![image-20200129104745094](images/image-20200129104745094.png)

![image-20200129104758021](images/image-20200129104758021.png)

- 기본적으로 현업에서는 패키지의 depth가 최소 3개 이상이어야 해서 맞춰서 이름을 정해준다.
  - 여기서 내가 정해준 이름의 마지막 패키지가 context path로 등록이 된다. -> 일반적으로 프로젝트명이랑 동일하게 해준다.

![image-20200129105058201](images/image-20200129105058201.png)

- src/main/java가 원래 src랑 같음 -> 앞으로 여기에 패키지 만들자

![image-20200129113119928](images/image-20200129113119928.png)

- webapp가 dynamic web project의 WebContent와 같음.

![image-20200129113152265](images/image-20200129113152265.png)

- 아래 동그라미 애들이 라이브러리임. 여기에 계속 쌓일거임. 얘네는 Maven Dependencies에서 확인가능

![image-20200129113344453](images/image-20200129113344453.png)

- 아래 동그라미 파일크기가 적당하면 다운로드 잘 된것.

![image-20200129113608274](images/image-20200129113608274.png)

- 아래 애들이 다운로드 되어있는 라이브러리들(Maven Dependencies)

![image-20200129113643359](images/image-20200129113643359.png)

- 아래 동그라미는 이제부터 쓸 이름과 VALUE
  - 3.1.1.Release가 우리가 쓰는 버전이 아니라면 저거만 수정해주면 된다.

![image-20200129114029540](images/image-20200129114029540.png)

- 이제 라이브러리를 직접 추가하지 않고 pom.xml에 등록하고 사용하는 것이 핵심.



- https://mvnrepository.com/
  - 여기가 maven의 중앙저장소임.
  - 라이브러리 추가방법~

![image-20200129130705629](images/image-20200129130705629.png)

![image-20200129131350153](images/image-20200129131350153.png)

![image-20200129131414729](images/image-20200129131414729.png)

- <dependency></dependency>만 복사하기. 아래사진 틀린거

![image-20200129131442390](images/image-20200129131442390.png)

![image-20200129131603738](images/image-20200129131603738.png)

![image-20200129131630745](images/image-20200129131630745.png)

- 라이브러리 추가 끝.

- 네트워크 불안으로 다운이 안될 때
  1. pom.xml에서 <dependencies><dependencies>안에 있는애들 복사 -> 저장-> 붙이기 -> 저장.
  2. 워크스페이스 우클릭 -> new -> project -> clean





- firstPro 우클릭 -> 맨아래 properties
  - 아래처럼 버전 바꾸기

![image-20200129132348373](images/image-20200129132348373.png)

- pom.xml에도 버전 수정

![image-20200129132430367](images/image-20200129132430367.png)

![image-20200129132644301](images/image-20200129132644301.png)

![image-20200129132701834](images/image-20200129132701834.png)

![image-20200129132726547](images/image-20200129132726547.png)

![image-20200129132749416](images/image-20200129132749416.png)

![image-20200129132823817](images/image-20200129132823817.png)



### DispatcherServlet 등록

- springmvc프로젝트 임포트하기

![image-20200129133042452](images/image-20200129133042452.png)

![image-20200129133116339](images/image-20200129133116339.png)

![image-20200129133203946](images/image-20200129133203946.png)

![image-20200129133246001](images/image-20200129133246001.png)

- 모든 요청을 dispatcherservlet을 통해 들어오도록 하겠다.

![image-20200129133349630](images/image-20200129133349630.png)

- 그리고 아래처럼 수정

![image-20200129142627290](images/image-20200129142627290.png)

![image-20200129133622785](images/image-20200129133622785.png)

- WEB-INF의 config가 설정파일을 모아놓는곳.
  - 아래가 정석

![image-20200129133946611](images/image-20200129133946611.png)

- 근데 귀찮으니까 아래처럼 복붙하고 rename하면된다.

![image-20200129134044073](images/image-20200129134044073.png)

- 원래 아래사진은 밑줄에 views/ 가 있었는데 지웠음.

![image-20200129135107478](images/image-20200129135107478.png)

![image-20200129135208001](images/image-20200129135208001.png)

![image-20200129140510452](images/image-20200129140510452.png)

- 아래 사진은 방금 위에 복붙한 member랑 test 패키지를 어노테이션 하기위해 path 등록한것.

![image-20200129140805772](images/image-20200129140805772.png)

- 어노테이션으로 컨트롤러 클래스 등록하기
  - @Controller
  - 상속하고 있는게 없으니까 메소드도 내맘대로 쓸 수 있다.
    - @Service = 비즈니스 로직
    - @Repository = DAO
    - @Controller = 컨트롤러

``` 어노테이션으로 컨트롤러 작성
어노테이션을 이용해서 컨트롤러를 작성하는 경우 메소드를 정의할 때 개발자가 원하는 형태로 메소드를 정의할 수 있다.
	매개변수나 리턴타입으로 올 수 있는 타입들이 정해져 있긴 하지만 그 안에서 원하는 스펙을 다양하게 적용할 수 있다.
	리턴타입: String, void, ModelAndView...
			String: 뷰에 대한 정보만 리턴할 때 사용함
			ModelAndView: 공유할 데이터와 뷰에 대한 정보를 함께 리턴할 때 사용함.
			
	매개변수: String, HttpServletRequest, HttpServletResponse, HttpSession, Model, DTO...
```



![image-20200129141228136](images/image-20200129141228136.png)

![image-20200129141958420](images/image-20200129141958420.png)

- 아래처럼 한글이 다 깨져있을 때
  - 일단 미리 백업해놓은거 걍 복붙.

![image-20200129143337263](images/image-20200129143337263.png)

![image-20200129144012151](images/image-20200129144012151.png)

![image-20200129143936422](images/image-20200129143936422.png)

![image-20200129144244348](images/image-20200129144244348.png)

- 아래 동그라미처럼 수정하자.

![image-20200129144310877](images/image-20200129144310877.png)

- 주석처리한거 지우고 매개변수 써주기
  - req.getParameter하는법.

![image-20200129144405628](images/image-20200129144405628.png)

![image-20200129144529251](images/image-20200129144529251.png)

![image-20200129144543925](images/image-20200129144543925.png)

- 한글은 깨지긴 하지만 검색어는 잘 받아지는 것을 확인할 수 있음

![image-20200129144611496](images/image-20200129144611496.png)

- index.jsp와 result.jsp만 UTF-8로 바꿔주면 한글도 잘 나옴.

![image-20200129150609383](images/image-20200129150609383.png)

=> 매개변수만 정해주면 파라미터를 받을 수 있다는 게 핵심내용!





## 화면의 상단만 고정시키기

- include=> 실행결과만 가져오는 것.

![image-20200129153159797](images/image-20200129153159797.png)

![image-20200129153215624](images/image-20200129153215624.png)







- 김샘자바 web.zip 다운 후 WEB-INF랑 resource에 아래처럼 복붙

![image-20200129154007392](images/image-20200129154007392.png)

- 그리고 springmvc의 webContent에 다시 복붙
  - 연습을 위해

![image-20200129154122440](images/image-20200129154122440.png)

- 큰 row가 두개

![image-20200129154756759](images/image-20200129154756759.png)

- 아래처럼 경로 따져줘서 include 작성

![image-20200129154928973](images/image-20200129154928973.png)

![image-20200129155027768](images/image-20200129155027768.png)

- 이제 위에서 myBatis를 눌렀을 때 아래의 두부분의 화면만 myBatis로 바꿔주고 싶다. 

- 아래처럼 생성해주자

![image-20200129160755821](images/image-20200129160755821.png)

- top에서 myBatis를 누르면 상단은 고정해놓고 화면을 바꾸고 싶다.

![image-20200129161540055](images/image-20200129161540055.png)

![image-20200129161504949](images/image-20200129161504949.png)

![image-20200129161614214](images/image-20200129161614214.png) 

![image-20200129161654547](images/image-20200129161654547.png)

![image-20200129161707292](images/image-20200129161707292.png)

- 완성. 근데 이렇게 하니까 계속 template에 새로운 jsp파일을 계속 만들어야해서 불필요한 파일이 계속 만들어지고 복잡해짐.
  - 결국 spring이 최고다.

## tiles

![image-20200129175537367](images/image-20200129175537367.png)

- jsp파일을 계속 만드는게 아니라 타일 바꿔 붙이듯이 원하는 부분만 교체하는 것.

![image-20200129164008880](images/image-20200129164008880.png)

![image-20200129164041975](images/image-20200129164041975.png)



- put-attribute => 영역에 대한 이름.
- template과 value에는 경로설정.
  - 템플릿 이름은 mainTemplate, 경로는 template임. 여기에 3개의 영역이 있음(put-attripute), 각 영역의 이름은 name이고 경로는 value임.

![image-20200129164708544](images/image-20200129164708544.png)

![image-20200129165641947](images/image-20200129165641947.png)

![image-20200129165715846](images/image-20200129165715846.png)



- 화면 레이아웃이 여러 구역으로 분할되는데 각 구역마다 요청 url이 다르다. 그래서 기존의 viewResolver로는 작업할 수 없다.
  - 새로운 viewResolver등록하기.
    - 1. tiles 설정파일 읽는 역할
      2. 1번을 기반으로 view를 만들어내는 역할

![image-20200129172448754](images/image-20200129172448754.png)

- 근데 위에껀 internal view resolver가 우선순위가 높다. 그래서 우선순위를 바꿔주자

![image-20200129173106873](images/image-20200129173106873.png)



![image-20200129174128988](images/image-20200129174128988.png)

- 템플릿은 미리 등록해 놓는것.
  - 아래 사진에 실제 요청될 뷰를 등록할 부분의 애들은 controller랑 짝짓기 할 애들임.
    - controller의 메소드 하나 당 main-tiles의 <definition> 하나씩이라고 생각해주자.

![image-20200129174149553](images/image-20200129174149553.png)



- mainTemplate에 등록한 애들 중 menu를 내가 원하는 부분으로 바꾸겠다.

![image-20200129174414910](images/image-20200129174414910.png)

![image-20200129175317735](images/image-20200129175317735.png)

![image-20200129175230335](images/image-20200129175230335.png)

- 이제 뭔가 추가가 되면 아래사진의 여기에만 내용이 추가되면 된다.
  - 나중에 더 좋은 방법 알려주심

![image-20200129175449647](images/image-20200129175449647.png)

- 이제 아까처럼 계속 새로운 파일을 만들지 않고 화면만 교체해주는 작업이 가능해 졌다. 