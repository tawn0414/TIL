# spring

- 아래 사진의 동그라미 친 부분만 변경해주면 쉽게 바꿀 수 있다.
  - 이렇게 하나만 바꿔주면 되는 장점이 스프링을 쓰는 이유다.(유지보수 good~!!)

![image-20200123103531492](images/image-20200123103531492.png)

![image-20200123103651235](images/image-20200123103651235.png)

![image-20200123103713226](images/image-20200123103713226.png)

![image-20200123103727969](images/image-20200123103727969.png)



### DI를 setter injection

- <init>() 에러가 뜨면 생성자를 잘 만들었는지 보세여
- 생성자는 초기에 멤버변수들을 초기화하는것.
- setter는 내가 원하는 것을 하나씩 초기화 하는 것.

- 생성자 대신에 setter메소드를 쓰자. => 무조건 기본생성자 만들어 줘야함.

- xml에서 property 사용.

![image-20200123132905556](images/image-20200123132905556.png)

![image-20200123132942048](images/image-20200123132942048.png)

- setter 사용할 때 기억해야할 것.
  - 1. 기본생성자를 만든다.
    2. property의 name속성에는 set의 메소드명에서 set을 뺀 것을 넣는다.
    3. property에는 무조건 ref나 value중 하나가 들어가야 한다.
    4. 멤버변수가 여러개면 그 갯수만큼의 property를 만든다.



### construction + setter

- name과 msg는 construction Injection , mylogic은 setter Injection

![image-20200123141051674](images/image-20200123141051674.png)

![image-20200123141108748](images/image-20200123141108748.png)

![image-20200123141258157](images/image-20200123141258157.png)

![image-20200123141319352](images/image-20200123141319352.png)



## Collection

- list랑 map만 볼거임.
  - 멤버변수가 List나 Map인 경우DI를 어떻게 적용해야 할까?

![image-20200123142354639](images/image-20200123142354639.png)



- list의 하위들은 전부다 list element니까 arraylist는 list로...
- entry하나가 key,value한 쌍.

![image-20200123143247174](images/image-20200123143247174.png)

![image-20200123144300817](images/image-20200123144300817.png)



## DI가 될 때 타입을 어떻게 인식할까?

![image-20200123144644876](images/image-20200123144644876.png)

![image-20200123144721816](images/image-20200123144721816.png)

1. 아래는 String String , index는 0부터.

![image-20200123145005770](images/image-20200123145005770.png)

![image-20200123144817104](images/image-20200123144817104.png)

![image-20200123145017717](images/image-20200123145017717.png)

2. 아래는 type속성

![image-20200123145235007](images/image-20200123145235007.png)

![image-20200123145139961](images/image-20200123145139961.png)

3. 아래는 name 속성

![image-20200123145336678](images/image-20200123145336678.png)

![image-20200123145415723](images/image-20200123145415723.png)





## 계속 xml에 추가하니까 불편쓰...(Annotation)

- annotation은 무조건 기본생성자를 써줘야함.
- 이제 xml에 bean을 직접 등록하지는 않을껀데 어떤 패키지에서 bean을 찾아야되는건지는 알려줘야됨. -> 컴포넌트 스캔
- annotation프로젝트 추가하기.

![image-20200123151623439](images/image-20200123151623439.png)

![image-20200123151825601](images/image-20200123151825601.png)

![image-20200123152325258](images/image-20200123152325258.png)

![image-20200123152644678](images/image-20200123152644678.png)

- 이제 컨텍스트 컴포넌트 스캔 사용가능.
- 이제 컨테이너가 아래 밑줄의 경로에 가서 bean을 자동으로 생성해줌.
  - @component -> bean을 만들께여~ 라는 뜻 (이게 제일 큰 개념) -> 주로 아래처럼 더 구체적으로 씀
    - @Service(일반적으로 작업하는 객체임.)
      - 일반 객체(서비스 객체를 등록)
    - @Repository
    - @Controller

![image-20200123153818395](images/image-20200123153818395.png)

- 라이브러리를 추가해줘야됨.

![image-20200123153543115](images/image-20200123153543115.png)

- 아래는 위의 에러가 요구하는 라이브러리임

![image-20200123153629919](images/image-20200123153629919.png)



![image-20200123153720538](images/image-20200123153720538.png)

- 아래는 기본생성자 넣어주라는 에러

![image-20200123154052813](images/image-20200123154052813.png)

![image-20200123154011879](images/image-20200123154011879.png)

- 이제 스프링 에러는 없어짐. NULLpointexception
  - 아직 player의 d를 연결을 안해줬음.

![image-20200123154625458](images/image-20200123154625458.png)

- 아래처럼해주면 자동으로 DI가 적용된다고 생각하셈.
  - @Autowired는 참조할 클래스에 써준다.
    - Player가 dice를 쓰니까 Player에...

![image-20200123154815526](images/image-20200123154815526.png)

- 성공

![image-20200123154832556](images/image-20200123154832556.png)

- @Service를 쓰면 클래스 이름의 첫글자를 소문자로한 것이 bean의 name에 자동 등록된다.

![image-20200123155030809](images/image-20200123155030809.png)

- 아래처럼 이름을 바꿔줄 수도 있음(클래스 이름이 너무 길때.)

![image-20200123155114945](images/image-20200123155114945.png)

- Autowired만 했기 때문에 dice를 save as 해서 mydice를 만드니까 에러남

![image-20200123160747228](images/image-20200123160747228.png)

![image-20200123160803727](images/image-20200123160803727.png)

- dice랑 mydice에 이름주고 player에 qualifier를 주자.

![image-20200123160941458](images/image-20200123160941458.png)

- 이제 @Qualifier의 이름만 마꿔주면 dice 교체가 가능해진다.
  - 위치도 중요함.

![image-20200123160955029](images/image-20200123160955029.png)

![image-20200123161017970](images/image-20200123161017970.png)



## spring으로 JDBC하기

- 커넥션을 관리하는 객체와 

![image-20200123170831582](images/image-20200123170831582.png)

![image-20200123170743906](images/image-20200123170743906.png)

![image-20200123170918192](images/image-20200123170918192.png)

- springjdbc -> build path

![image-20200123170953453](images/image-20200123170953453.png)

![image-20200123171005946](images/image-20200123171005946.png)

![image-20200123172210870](images/image-20200123172210870.png)

![image-20200123172414128](images/image-20200123172414128.png)

- 아래 밑줄은 sql문 실행하고 리턴받을 타입.

![image-20200123174249937](images/image-20200123174249937.png)

![image-20200123173220285](images/image-20200123173220285.png)

- C:\oraclexe\app\oracle\product\11.2.0\server\jdbc\lib

![image-20200123173333360](images/image-20200123173333360.png)

- 아래 두개 추가하기 그래야 돌아감.

![image-20200123173727972](images/image-20200123173727972.png)