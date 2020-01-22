



# Spring

- 서블릿 할 때 name,url pattern정하면 -> web.xml이 map의 구조로 nam이랑 url pattern을 넣음 -> 사용자가 url pattern으로 요청 -> WEB-INF밑에 classes가 map에서 사용자의 요청에 맞는 name을 찾음. -> WAS에는 컨테이너가 있기 때문에 자동으로 서블릿객체가 생성되고 실행된다.
- 컨테이너 : 객체를 생성하고 관리하는 역할.
  - servlet container : 서블릿 담당
  - JSP container: JSP담당.

- WAS안에 web server, container가 있음.



## BeanFactory 사용해보기

![image-20200122103828357](images/image-20200122103828357.png)

![image-20200122104626193](images/image-20200122104626193.png)



- Init, destroy 쓰고싶어서 interface를 abstract로 바꿈

  ![image-20200122111715430](images/image-20200122111715430.png)

- 객체가 언제 생성되는지 확인하려고 기본생성자 만든것.

  ![image-20200122112015496](images/image-20200122112015496.png)

  ![image-20200122112215043](images/image-20200122112215043.png)

  ![image-20200122112254995](images/image-20200122112254995.png)

- BeanFactory -> Lazy Loading

![image-20200122112458998](images/image-20200122112458998.png)

- 아래 사진을 보면 getBean을 호출하기 전까지는 객체가 생성이 안되는것을 볼 수 있다.

![image-20200122112547050](images/image-20200122112547050.png)

- ApplicationContext(이걸 주로 쓸것임. 얘가 컨테이너) -> pre-loading

  - getBean호출전에 xml안에 있는 것들을 지금 당장 안쓰는 것도 객체를 다 생성함.

  ![image-20200122113219458](images/image-20200122113219458.png)

  - 똑같은 myBean1을 두번 look up(getBean)했을 때. => 같다. 만드는 시점만 다름. 똑같은 객체는 한번만 만든다.

    - app는 xml에 있는 것들을 미리 다 객체를 생성해 놓음

    ![image-20200122114253654](images/image-20200122114253654.png)

    - beanfact는 하나만 만듬. getBean으로 요청할 때 객체가 생성됨.

    ![image-20200122114325184](images/image-20200122114325184.png)

### scope속성

- 기본 default는 singleton => 객체가 하나만 생성됨.

- prototype: 객체가 요청할 될 때 마다 생성된다.

![image-20200122131758587](images/image-20200122131758587.png)![image-20200122131835310](images/image-20200122131835310.png)



- AbstractApplicationContext (ApplicationContext의 하위)

  ![image-20200122132255946](images/image-20200122132255946.png)

  ![image-20200122132410793](images/image-20200122132410793.png)

  - init과 destroy가 한번만 호출됨.

![image-20200122132654281](images/image-20200122132654281.png)

![image-20200122132755623](images/image-20200122132755623.png)



- xml파일 만들기

  => src 우클릭 => new => spring bean configuration file

  - 아래의 bean.xml의 주석처리만 해주면 samsungTV, lgTV를 쉽게 바꿔줄 수 있다. 

  ![image-20200122135335784](images/image-20200122135335784.png)

  ![image-20200122135351558](images/image-20200122135351558.png)

  

- 질문...

  - 아래에서 ApplicationContext이 실행될 때  동그라미 친 거(MyBeanStyleB만)만 객체를 생성한다. 그 이유는 bean.xml에 prototype scope를 줬기 때문이다.

  - prototype은 무조건 getBean이 호출될 때 객체를 생성하도록 하게 해주는 거임.

    ![image-20200122140806559](images/image-20200122140806559.png)

  ![image-20200122140858516](images/image-20200122140858516.png)

- 여기까지가 DL임.



### DI (책 65p)

![image-20200122144518428](images/image-20200122144518428.png)

- 아래 동그라미처럼 슬래시 있는건 기본생성자로 쓰겠다는 말. (매개변수 없이.)

![image-20200122143020915](images/image-20200122143020915.png)

- constructor-arg 하나가 매개변수 하나임.

  - 아래 사진은 매개변수의 타입이 MemberDAO 라는거임. => DI

    ![image-20200122144432253](images/image-20200122144432253.png)

- alt + shift + t 누르면 인터페이스 만들 수 있음.

![image-20200122161405386](images/image-20200122161405386.png)





#### di.constructor01

1. AbstractPlayer, AbstractDice
   - 나중에 여러 상황에 대비하기 위해 상위 클래스를 만들어준 것.
   - player가 여러명이 되고, dice가 여러개가 되는 것을 대비.

![image-20200122162848687](images/image-20200122162848687.png)

![image-20200122162838134](images/image-20200122162838134.png)

2. Dice

- 여기선 뭐 없음

![image-20200122162754018](images/image-20200122162754018.png)

3. Player

- 멤버변수를 변경....  Dice d => AbstractDice d
  - 상위 클래스의 타입으로 해주자.
  - dice가 여러개가 될 것을 대비한 것.
- 여기에선 DI를 생성자 방식으로 했음.
  - AbstractDice d를 매개변수로 갖고 있는 생성자를 만들어주자.
- Player가 주사위를 던지는거니까 Dice를 참조함. (bean에 ref="dice")

![image-20200122162741456](images/image-20200122162741456.png)

4. Test01

- AbstractApplicationContext
  - bean.xml을 파싱하는 컨테이너.
  - bean.xml에 있는 모든 객체를 생성해줌.
- getBean
  - bean.xml에 정의한 player 클래스의 객체를 만들기
  - player가 여러명일 수도 있으니까 상위 클래스의 타입으로 정해줘야됨.

![image-20200122162727178](images/image-20200122162727178.png)

![image-20200122162905703](images/image-20200122162905703.png)