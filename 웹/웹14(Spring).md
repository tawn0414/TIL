# Spring

- frame work임.
  - web, db연동, 로그, 트랜잭션 등을 개발할 때 어떤 식으로 개발하라는 방향성이 잡혀있음.
- 객체를 생성할 때 new해서 하다보니 유지보수가 힘들다. => 아웃소싱 업체가 바뀌면 객체 생성한 것들을 하나씩 다 수정해야함.
  - 그래서 frame work에는 객체를 관리하는 기능이 포함되어 있다. => lifecycle 관리
  - 이런 기능을 container라고 함.  => IOC컨테이너~!!!

- Spring은 클래스를 만드는 방법이 아니라 클래스를 만들어서 어떻게 운영하라는 개발 방식이 정해져 있다.

## 결함도가 높은거 확인하기.

- Spring에서는 객체를 bean이라고 부름.

![image-20200121101136400](images/image-20200121101136400.png)

![image-20200121101520034](images/image-20200121101520034.png)

- MyBeanStyleA 와 MyBeanStyleB를 사용하는 클래스 작성

  - 같은 MyBeanStyleA을 사용하는 것을 보여주려는 의도.

    ![image-20200121101920282](images/image-20200121101920282.png)

  - 위의 상태에서 MyBeanB를 쓰고 싶으면 각 매개변수 타입도 바꿔야하고 메소드명도 바뀌어야함.

    ![image-20200121102140531](images/image-20200121102140531.png)

- oop특성 적용하기 (상속성)

  ![image-20200121103651131](images/image-20200121103651131.png)

  ![image-20200121103732653](images/image-20200121103732653.png)

  ![image-20200121103749029](images/image-20200121103749029.png)

  ![image-20200121104425413](images/image-20200121104425413.png)



- 이제 컨테이너의 기능을 알아보자.  connectionFactory가 컨테이너의 역할을 함.

  ![image-20200121112802071](images/image-20200121112802071.png)

  ![image-20200121112927769](images/image-20200121112927769.png)

  ![image-20200121112943498](images/image-20200121112943498.png)
  - 갑자기 몽고DB를 추가해야하는 상황이 됐을때

    - 몽고DB클래스 추가

      ![image-20200121113221777](images/image-20200121113221777.png)

      ![image-20200121113322744](images/image-20200121113322744.png)

      ![image-20200121113429913](images/image-20200121113429913.png)

      ![image-20200121113443222](images/image-20200121113443222.png)

    - 위 처럼 관리를 해줘야 스펙이 바뀌거나 요구사항이 바껴도 원래 운영하던 클래스를 바꾸지 않을 수 있다.  => 내가 어떤 문자열을 넘기냐에 따라 다른 객체가 작동함.

    - 객체를 생성해주는 컨테이너가 있어서 편하지만 지금은 if else로 되어있어서 새로운게 추가될 때마다 컨테이너를 수정해줘야하는 번거로움이 있다.

    - 그래서 conf.properties파일에(설정파일) 정의를 해준다. 이러니까 원래 코드를 안 바꿔도됨. (xml파일에도 가능)

      - conf.properties => 'name = value'형태로 정의되어 있는 파일

      - oracle = basic.OracleConnection

        mysql = basic.MYSQLConnection 

        => map구조임. key가 name이 되고 value는 value가 됨.





- app1은 그냥 new 해서 객체생성 한거. app2는 다형성 적용한거 app3은 spring적용한거.

- Spring에서 xml(설정파일) 만들기

  - config 폴더 우클릭 -> new -> other 

  ![image-20200121132330851](images/image-20200121132330851.png)

  ![image-20200121134425251](images/image-20200121134425251.png)



- user library만들기, 우리가 쓸 라이브러리들 등록

window -> preference

![image-20200121133736288](images/image-20200121133736288.png)

![image-20200121133800831](images/image-20200121133800831.png)

![image-20200121133841409](images/image-20200121133841409.png)

![image-20200121133858730](images/image-20200121133858730.png)

- springbasic 우클릭 -> build path -> add libraries
- ![image-20200121133957503](images/image-20200121133957503.png)

![image-20200121134012689](images/image-20200121134012689.png)

이제 ctrl+shift+o 하면 import됨

![image-20200121134033558](images/image-20200121134033558.png)

![image-20200121134227600](images/image-20200121134227600.png)

- 아래는 object를 리턴하니까 캐스팅 해줘야됨.

![image-20200121134536104](images/image-20200121134536104.png)

- 아직은 에러뜸. 의존모듈이라고 내가 안썼지만 프로그램이 알아서 클래스를 쓰기때문에

![image-20200121134957891](images/image-20200121134957891.png)

![image-20200121135039421](images/image-20200121135039421.png)

![image-20200121135116543](images/image-20200121135116543.png)

- MyBeanStyleA말고 MyBeanStyleB를 쓰고싶을 때 아래만 바꾸면 됨.

![image-20200121135507409](images/image-20200121135507409.png)

![image-20200121135533504](images/image-20200121135533504.png)

- DL(Dependency Lookup)