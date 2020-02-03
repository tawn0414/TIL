#### submit 누를때만 컨트롤러 요청하는거 말고 form(radio, check, select)를 할때도 컨트롤러를 요청할 수 있다.

- category를 선택했을때 list를 조회하기.

![image-20200203092404926](images/image-20200203092404926.png)



![image-20200203092422921](images/image-20200203092422921.png)

- 우선 mapper에 sql문 작성

![image-20200203092904460](images/image-20200203092904460.png)



- category가 all이냐 아니냐로 컨트롤러를 같이쓸거다?
  - 똑같은 작업인데 컨트롤러를 여러개 만들지 않고 컨트롤러 하나로 두개이상의 기능을 처리할 수 있다.

![image-20200203093211070](images/image-20200203093211070.png)

![image-20200203093312664](images/image-20200203093312664.png)

- 아래 동그라미친 부분이 추가된거

![image-20200203093522418](images/image-20200203093522418.png)

- 아래처럼 수정

![image-20200203093835910](images/image-20200203093835910.png)

- category가 all이면 boardlist, 아니면 category search작동

![image-20200203093743605](images/image-20200203093743605.png)

- boardlist에서 category를 선택하면 submit처럼 controller가 실행되게 Jquery를써서 만들꺼다.
  - help -> eclipse marketplace -> tern

![image-20200203094431731](images/image-20200203094431731.png)

- 이미 검색이 submit이라서 이렇게 해주는거임.

![image-20200203094456436](images/image-20200203094456436.png)

- 아래는 Jquery쓰기위한 설치

![image-20200203094148732](images/image-20200203094148732.png)

![image-20200203094207770](images/image-20200203094207770.png)

- 설치되면 erp우클릭 -> configure -> convert to tern project클릭후 아래사진

![image-20200203094653557](images/image-20200203094653557.png)

- 이제 jquery쓸수있으니까 아래처럼 작성해주기
  - this -> 현재의 value란 all, 경조사, 사내소식, 게시판중에 하나를 의미함.

![image-20200203095354067](images/image-20200203095354067.png)

- 결과 =>  전체게시물일때 바로 아래. 경조사를 선택하면 그 아래 사진으로됨

![image-20200203095657648](images/image-20200203095657648.png)

![image-20200203095734424](images/image-20200203095734424.png)

- 크롬에선 되는데 익스플로러에서는 안됨.

![image-20200203095758204](images/image-20200203095758204.png)

- 근데 크롬에서 글쓰기 누르고 등록 누르면 500에러가 뜬다. (게시판에 저장은됨.)
  - 아래처럼 등록눌렀을때 실행되는 메소드의 redirect에 값을 같이 넘겨주면 해결됨.

![image-20200203102044990](images/image-20200203102044990.png)

- 아래는 redirect를 잘 설정한 후 실행한거.

![image-20200203102240111](images/image-20200203102240111.png)

- 잘넘어옴

![image-20200203102257959](images/image-20200203102257959.png)

- Jquery에서 한글인코딩하기

![image-20200203102354314](images/image-20200203102354314.png)

- 내가 선택한 카테고리를 고정
  - 원래는 경조사 누르면 자동으로 전체목록으로 되돌아갔음.

![image-20200203102519807](images/image-20200203102519807.png)



- 아래의 상태에서

![image-20200203102838223](images/image-20200203102838223.png)

- 전체게시물을 경조사로 바꾸면 컨트롤러에 요청해서 아래의 리스트로 바뀌고 response될때 경조사가 다시 전체게시물로 돌아온다. -> 이거 싫으니까 

![image-20200203102903833](images/image-20200203102903833.png)

![image-20200203103212823](images/image-20200203103212823.png)

- 전체게시물을 경조사로 바꾸면 1번이 실행되고 response되면서 2번이 실행됨. 

![image-20200203103425924](images/image-20200203103425924.png)

- 이제 경조사 선택하면 아래 두 사진처럼됨.

![image-20200203103500567](images/image-20200203103500567.png)

![image-20200203103522971](images/image-20200203103522971.png)

- 이제 아래 사진을 설정해볼꺼다 (boardDAOImpl의 searchList)
  - 아래에 선택된 애는 컬럼명임.

![image-20200203104119837](images/image-20200203104119837.png)

- D

![image-20200203104407000](images/image-20200203104407000.png)

- return에서 map을넘겨주면 tag랑 search를 알아서 처리해줌
  - 왜 map이냐 -> column을 선택하고(tag) 값을 입력할 꺼니까 (search) 

![image-20200203104628767](images/image-20200203104628767.png)

- 아래처럼 sql문 써줘야됨.

![image-20200203112253420](images/image-20200203112253420.png)

- ServiceImpl작성

![image-20200203110731450](images/image-20200203110731450.png)

![image-20200203111449509](images/image-20200203111449509.png)

- 결과
  - 

![image-20200203111534070](images/image-20200203111534070.png)

![image-20200203111548056](images/image-20200203111548056.png)

![image-20200203111638662](images/image-20200203111638662.png)

![image-20200203112809013](images/image-20200203112809013.png)



### 이제 로그인 시작(= read)

request view(login.jsp) -> Controller -> service -> dao -> mapper.xml 

​													|

​													--> response view(board/list)

​													로그인 후 top.jsp의 로그인 한 사용자의 이미지로 바꾸기

​													(선생님이 준 step1.sql에 insert문에 이미지들이 다 있음.)

1. MemberVO에 생성자, setget, toString 만들기
   - 이때 read(login)의 맵핑용으로 쓰일 생성자도 만들어주자 (id랑 pass만 있는 생성자.) -> 아직은 이걸쓰는게 아니고 기본생성자가 쓰임. 선생님이 나중에 쓸라고 만들라고 하셨던거.
2. mybatis-config.xml에 MemberVO랑 mapper 등록하기

![image-20200203133305632](images/image-20200203133305632.png)

![image-20200203133502025](images/image-20200203133502025.png)

3. EmpDAOImpl

![image-20200203134042862](images/image-20200203134042862.png)

4. serviceImpl

![image-20200203134320997](images/image-20200203134320997.png)

6. Controller

![image-20200203135024790](images/image-20200203135024790.png)

- 결과
  - 아래처럼 입력하고 로그인버튼 누르면 그 아래사진

![image-20200203135844923](images/image-20200203135844923.png)

- empController보면 매개변수에 쓴건 사용자가 입력한거고 service로 호출한건 사용자가 입력한 값에 맞는 레코드가 호출된거다.

![image-20200203144225501](images/image-20200203144225501.png)



- 이제 로그인되면 top에는 logout만 남고 사진도 바껴야됨.
  - 아래처럼 해주면 사용자에 따른 사진 바뀜

![image-20200203145122608](images/image-20200203145122608.png)

- 근데 이렇게 하면 처음에 로그인을 안했을 땐 코드 실행이 안되니까 if문으로 제어해주자.
  - 로그인 안했을땐 로그인만 보여주고 로그인 했을땐 로그아웃과 사진도 보여주자.

![image-20200203145738496](images/image-20200203145738496.png)

- 결과
  - 아래사진은 로그인만 보임

![image-20200203145808026](images/image-20200203145808026.png)

- 아래사진은 로그아웃이랑 이미지가 보임

![image-20200203145843005](images/image-20200203145843005.png)

- 근데 문제는 커뮤니티 들어가면 또 login이 떠버림.
  - 기본적으로 http프로토콜은 요청을 처리해서 응답해줄때 데이터를 다 clear시켜버린다.
  - 그래서 상태정보를 유지하기 위한 기술을 써야됨. (쿠키, 세션)
  - 세션은 서버에 개개인의 id에 따라서 자신의 메모리를 만들고 여기에 저장이됨.
    - 로그인시 세션만들어지고 로그아웃하면 세션이 사라짐. 세션은 메모리를 물고다니는거.
    - 게시판은 request로 구현. 
  - 쿠키는 클라이언트가 가지게되는 메모리라서 중요한거 저장못함. 



### 세션

- 리퀘스트로부터 세션을 얻음
  - mav.addObject()는 기본적으로 request에 데이터를 저장하니까 이거 안씀.

![image-20200203152722591](images/image-20200203152722591.png)

- top.jsp도 request에서 session으로 바꿔줘야함.

![image-20200203152828890](images/image-20200203152828890.png)

- 결과
  - 페이지 옮겨도 로그인이 계속 유지되게 되었음.

![image-20200203153008288](images/image-20200203153008288.png)

![image-20200203153043011](images/image-20200203153043011.png)

![image-20200203153113275](images/image-20200203153113275.png)



- 이제 로그아웃
- 우선 로그아웃에 링크 걸어주고

![image-20200203153407339](images/image-20200203153407339.png)

- 로그아웃의 controller작성 

![image-20200203153346643](images/image-20200203153346643.png)

- 로그아웃 누르면

![image-20200203153628420](images/image-20200203153628420.png)

- 다시 돌아옴

![image-20200203153654212](images/image-20200203153654212.png)



- 로그인한 사용자의 정보가 한 테이블에 있는게 아니고 여러테이블에 있을 수 있음.
  - 여러테이블에있는 정보를 추출하기 -> join
- 아래세개는 member테이블이 아닌 다른테이블에 있는 컬럼들임.

![image-20200203154835702](images/image-20200203154835702.png)

- emp.xml에서 조인하기
  - 아래에 d.job_category = j.job_id는 같은건데 선생님이 변수명을 다르게 정해준거.

![image-20200203155210859](images/image-20200203155210859.png)

- 이제 다시 로그인 하니까 로그인한 사람의 정보를 추출가능
  - 밑줄은 다른테이블에 있는 정보도 추출한걸 보여준거

![image-20200203155532120](images/image-20200203155532120.png) 