- NoSQL(Not Only SQL)
- 데이터를 처리할 때 JSON형태로 처리함.
- 사용 목적
  - 비정형 데이터 저장 목적
    - schema(규칙)가 없다. 컬럽에 타입 정해줬던거 같은게 없다.
    - 설문조사할 때 질문을 등록하는데 회사마다 질문 갯수가 다를것임. 이 갯수가 정해져 있지 않아서 MongoDB가 없을 땐 최대의 질문 갯수를 컬럼으로 등록해놓음. 그래서 회사에 따라서 비어있는 컬럼이 생길 수도 있음. 게다가 최대의 질문 갯수를 특정지을수도 없음. 이런 부분을 해결해주는게 MongoDB임.
  - 파이썬, spring 등 여러 프로그램과 연동해서 output을 저장하는 목적

- Join을 할 수 없다.
  - 문서기반임. 하나의 문서 안에 모든 데이터가 전부 들어가는 형태임.



## MongoDB 설치

![image-20200316093457040](images/image-20200316093457040.png)

- 상단에 software -> enterprise server

![image-20200316093611559](images/image-20200316093611559.png)

- MSI는 설치파일이라는 뜻

![image-20200316093713735](images/image-20200316093713735.png)

![image-20200316093829580](images/image-20200316093829580.png)

![image-20200316093929349](images/image-20200316093929349.png)

![image-20200316094003870](images/image-20200316094003870.png)

![image-20200316094339648](images/image-20200316094339648.png)

- 주소복사
  - C:\Program Files\MongoDB\Server\3.6\bin
  - 여기에 mongoDB명령어가 다 등록되어 있음.

![image-20200316094507110](images/image-20200316094507110.png)

- path등록하기(TIL -> JAVA폴더 -> 2019.12.02에 있음.)

![image-20200316095209951](images/image-20200316095209951.png)

![image-20200316100608430](images/image-20200316100608430.png)

- 시스템 변수 편집
  - 맨 앞으로가서 아까 주소복사한거 붙여넣기하고 세미콜론(;) 찍기

![image-20200316100544555](images/image-20200316100544555.png)

- 아래처럼 잘 되면 확인 누르기

![image-20200316100707621](images/image-20200316100707621.png)

- 서버올리기
  - 아직 아래처럼 하면 에러뜸
  - 내부에서 발생하는 데이터가 저장 될 폴더가 필요하다.

![image-20200316100820463](images/image-20200316100820463.png)

- 아래처럼 폴더 만들어주자

![image-20200316101357649](images/image-20200316101357649.png)

- 아래처럼 폴더 등록해주고 서버 올려주자
  - 리눅스 처럼 탭 누르면 경로가 자동으로 쳐짐

![image-20200316101512199](images/image-20200316101512199.png)

- 아래처럼 되면 서버가 올라간거임
  - 서버 올라가고 콘솔 절대 클릭하지 말기. interupt됨.

![image-20200316101723371](images/image-20200316101723371.png)

- 새로운 프롬프트 열기
  - mongo로 서버에 접속 할 수 있다.
  - show dbs는 그냥 작동되는거 확인하려고 해본거. 의미는 아직 안 설명해주심

![image-20200316102136762](images/image-20200316102136762.png)

- 이중 접속 가능

![image-20200316102251457](images/image-20200316102251457.png)

- 서버 콘솔보면 두개의 클라이언트가 접속한걸 볼 수 있음

![image-20200316102339768](images/image-20200316102339768.png)

![image-20200316102501958](images/image-20200316102501958.png)

- 웹에서도 접속가능
  - http://127.0.0.1:27017

![image-20200316102428270](images/image-20200316102428270.png)

![image-20200316102612679](images/image-20200316102612679.png)

- 몽고디비 매뉴얼
  - 상단 document -> server
    - Sharding 하둡처럼 분산저장(HDFS?) 해줄 수 있음. 하둡보다는 성능이 떨어짐.

![image-20200316094706817](images/image-20200316094706817.png)

- mongoDB에서 용어
  - collection = 테이블
  - document = record 
  - field = column
  - _id = 기본키



## MongoDB 사용하기

- use mydb => mydb를 쓰겠다. (mydb는 걍 내맘대로 지어준 이름임. database를 쓰겠다는 의미)
  - oracle에서 계정 접속한거랑 동일한 의미 => conn scott/tiger
- show dbs; => 아직 collection이 없어서 admin, config, local이 전부 0GB임

- db.stats() => db의 상태 확인하기
- db.logout() => 나가는거. ok 1 뜨면 잘 작동된거임.

![image-20200316103856736](images/image-20200316103856736.png)

1. collection만들기(rdbms에서 테이블과 동일한 개념)

   ​	=> 관계형 데이터베이스처럼 스키마를 정의하지 않는다.

   ​	1) 종류

     - capped collection

         - 고정 사이즈를 주고 생성하는 컬렉션.(size를 필수로 같이 줘야한다.)

           미리 지정한 저장공간이 모두 사용이 되면 맨 처음에 저장된 데이터가 삭제된다.

     - non capped collection

         - 일반적인 컬렉션

   ​     2) 생성

   - db.createCollection("컬렉션명")  => 일반 collection을 만들 때

   - db.createCollection("컬렉션명",{옵션 list})
     - 각각의 옵션을 설정해서 작업(json형태)

   ​     3) 삭제

   - db.collection명.drop()

   ​     4) 컬렉션명 변경

   - db.컬렉션 명.renameCollection("변경할 컬렉션 명");

- createCollection으로 test컬렉션 만들어주니까 mydb가 보이기 시작함.

![image-20200316104348053](images/image-20200316104348053.png)

- show collections; = select * from tab

![image-20200316104449705](images/image-20200316104449705.png)

- 매뉴얼 활용 예시

![image-20200316110433972](images/image-20200316110433972.png)

![image-20200316110518010](images/image-20200316110518010.png)

- [컬렉션 생성]
  - validate써서 컬렉션의 정보를 볼 수 있음.
  - 정보가 출력되어 나오는것도 Json형태임

![image-20200316111420712](images/image-20200316111420712.png)

- isCapped()명령어로 capped 컬렉션인지 아닌지 확인 가능
  - true = capped 컬렉션이다.
  - false = capped 컬렉션아니다.

![image-20200316113532925](images/image-20200316113532925.png)

- [컬렉션 삭제]
  - collection을 drop하기

![image-20200316111724239](images/image-20200316111724239.png)

- [컬렉션명 변경]
  - collection을 rename하기

![image-20200316111815402](images/image-20200316111815402.png)

[실습]

- mini라는 이름의 데이터베이스 생성
- emp (size : 10000 , capped컬렉션으로 만들기)
- shop (일반컬렉션)
- 데이터베이스 목록, 컬렉션 목록을 캡쳐
- 컬렉션 validate()화면 캡쳐

![db생성, collection생성(images/db생성, collection생성(shop,emp).PNG)](../../db생성, collection생성(shop,emp).PNG)

![validate](images/validate.PNG)



## mongoDB CRUD

![image-20200316113728773](images/image-20200316113728773.png)

### Insert

[구문]

db.컬렉션 명.insert({데이터...})

db.컬렉션 명.insertOne({데이터...}) => 하나 삽입

db.컬렉션 명.insertMany({데이터...}) => 여러개 삽입

-- document(관계형 db에서 레코드개념)에 대한 정보는 json의 형식(name:value, name:value)으로 작성.

-- mongodb에서 document를 삽입하면 자동으로 _id가 생성된다. => 기본키 역할

- 확인해보니까 우리가 안쓴 _id가 생김

  - find는 select * from 임

  - "_id" : ObjectId("5e6ee73f7cbfd58c3cc1504f"

    ​                             ---------------------------------------- 

    현재timestamp + machine ID + mongodb프로세스id + 순차번호(추가할때마다 증가)

- 스키마가 없는거 확인

  - insert했을 때 처음껀 field가 두개, 지금은 field가 세개.
  - insert성공되고 select 해보니까 컬럼 수가 다른데도 괜찮을 것을 볼 수 있음.

![image-20200316114514936](images/image-20200316114514936.png)

- insert하는 다른 방법. mydata에 변수에 대한 값을 할당한 다음에 save()명령어로 insert

![image-20200316131237671](images/image-20200316131237671.png)

- for문으로 insert하기
  - mongoDB는 자바스크립트라서 for문 사용가능
  - it 을 치면 안보였던 데이터들도 다 볼 수 있음.

![image-20200316131546795](images/image-20200316131546795.png)

- 배열로도 입력 가능
  - 대괄호 이용.

![image-20200316132032245](images/image-20200316132032245.png)

- 여러개를 한 번에 삽입하고 싶을 때 배열로 GOGO
  - _id(primary key)도 바꿀 수 있음.

![image-20200316132523247](images/image-20200316132523247.png)

- 이미 _id가 있는데 같은 값으로 insert하면 아래 처럼 에러뜸

![image-20200316132856865](images/image-20200316132856865.png)

[실습]

김샘자바 mongo_실습1

![image-20200316135523780](images/image-20200316135523780.png)



### Update

- document 수정
- 조건을 적용해서 수정하기 위한 코드도 json으로 구현
  - json => name : value 형태
- capped된 사이즈를 벗어나면 안됨.



[update를 위한 명령어]

$set : 해당 필드의 값을 변경(업데이트를 하기 위한 명령어) => set절

​           non capped  collection인 경우 없데이트할 필드가 없는 경우 추가해버린다.

$inc : increment(더하기), 해당 필드에 저장된 숫자의 값을 증가

$unset : 원하는 필드를 삭제할 수 있다.

$addToSet => 배열의 요소를 추가 : 없는 경우에만 추가함. 중복을 허용 안함, 주로 배열에서만 씀.

$push => 배열의 요소를 추가 : 중복을 허용

$pop : 배열에서 요소를 제거할 때 사용

 			1이면 마지막 요소를 제거, -1이면 첫 번째 요소를 제거

$each : addToSet이나 push에서 사용할 수 있다. 여러개를 배열에 추가할 때 사용

$sort : 정렬(1: 오름차순, -1: 내림차순)

$pull : 조건에 만족하는 데이터를 지우겠다.(조건은 한 개)

$pullAll => 배열에서 조건에 만족하는 요소를 제거 (조선을 여러개 줄 수 있다.)

업데이트 옵션:

​		multi => true를 추가하지 않으면 조건에 만족하는 document중 첫 번째 document만 update

- 아래 사진의 pass를 a,b,c,d로 바꿀꺼

![image-20200316142038872](images/image-20200316142038872.png)

[구문]

filter : 조건을 줄 field => sql의 update문에서 where절에 해당됨.

db.컬렉션명.update({조건필드:값}, 

​                                    {$set:{수정할 필드 : 수정값}},

​                                    {update와 관련된 옵션:옵션값})

![image-20200316142749095](images/image-20200316142749095.png)

- 아래처럼 그냥 업데이트를 옵션없이 하면 id가 일치하는 kang이 4갠데 그중 가장 위에 있는거 하나만 수정된다.

![image-20200316143443288](images/image-20200316143443288.png)

![image-20200316143610224](images/image-20200316143610224.png)

- 옵션주기
  - 이제 id가 kang인 애들 전부 바뀌었음.

![image-20200316143639406](images/image-20200316143639406.png)

![image-20200316143706471](images/image-20200316143706471.png)

![image-20200316143725406](images/image-20200316143725406.png)

- 내가 컬렉션을 안 만들었어도 insert하면 컬렉션이 자동으로 만들어짐
  - capped가 아닌 일반 컬렉션이면 없는 field값을 넣어줄때 자동으로 생김.

![image-20200316144436628](images/image-20200316144436628.png)

![image-20200316144505953](images/image-20200316144505953.png)

- $inc => increment(더하기), 해당 필드에 저장된 숫자의 값을 증가
  - 아래의 kang의 val1이 3000이었던것이 5000으로 바뀜

![image-20200316144939704](images/image-20200316144939704.png)

![image-20200316145023025](images/image-20200316145023025.png)

[update 실습]

1. id가 kang인 사람의 dept를 "총무"로 변경
2. dept가 "전산"인 모든 addr을 "안양"으로 변경
3. id가 jang인 document의 bonus를 1000추가하기
4. dept가 "인사"인 모든 document의 bonus에 2000을 추가하기

![실습 1](images/실습 1.PNG)

![실습 2](images/실습 2.PNG)

![실습 3](images/실습 3.PNG)

![실습 4](images/실습 4.PNG)

- $unset
  - 원하는 필드 삭제 가능

![image-20200316153130380](images/image-20200316153130380.png)

![image-20200316153151453](images/image-20200316153151453.png)



### mongodb에서 배열 관리

db.score.update({id:"jang"},

{$set:

{info:

{city:["서울","안양"],

movie:["겨울왕국2","극한직업","쉬리"]}}});



[배열에서 사용할 수 있는 명령어]

$addToSet => 배열의 요소를 추가 : 없는 경우에만 추가함. 중복을 체크, 주로 배열에서만 씀.

​	db.score.update({id:"jang"},{$addToSet:{"info.city":"인천"}})

​	- info 안의 city에 인천이 추가됨. 같은 값인 인천은 또 추가가 되지 않음.

![image-20200316154817482](images/image-20200316154817482.png)

$push => 배열의 요소를 추가 : 중복을 허용

​	db.score.update({id:"jang"},{$push:{"info.city":"천안"}})

​	- info안의 city에 천안이 여러번 추가됨.

![image-20200316155014371](images/image-20200316155014371.png)

$pop => 지우는 용도, 1 ==> 오른쪽 끝에서부터 지운다.   -1 ==> 왼쪽 끝에서 부터 지운다.

![image-20200316161116043](images/image-20200316161116043.png)

​	db.score.update({id:"jang"},{$pop:{"info.city":1}})

![image-20200316160950253](images/image-20200316160950253.png)

​	db.score.update({id:"jang"},{$pop:{"info.city":-1}})

![image-20200316161027779](images/image-20200316161027779.png)



$each  => each를 이용해서 천안, 가평, 군산을 한번에 추가

​	db.score.update({id:"jang"},{$push:{"info.city":{$each:["천안","가평","군산"]}}})

![image-20200316161647316](images/image-20200316161647316.png)

​	db.score.update({id:"jang"},{$push:{"info.city":{$each:["천안","가평","군산"],$sort:1}}})

​	db.score.update({id:"song"},{$push:{"info.city":{$each:["천안","가평","군산"],$sort:1}}})

​			천안, 가평, 군산이 또 push되었고 오름차순으로 정렬됨.

![image-20200316161746917](images/image-20200316161746917.png)



$pull => info안의 city가 천안인 데이터를 지운다.

​	db.score.update({id:"jang"},{$pull:{"info.city":["천안"]}]}})

$pullAll => 배열에서 조건에 만족하는 요소를 제거 (조선을 여러개 줄 수 있다.)

​	db.score.update({id:"jang"},{$pullAll:{"info.city":["가평","군산"]}})

![image-20200316162836934](images/image-20200316162836934.png)

- pretty()

![image-20200317094254865](images/image-20200317094254865.png)

- comment안에 배열로 content,count1,count2,writedate만들기
  - 아래의 코드처럼 계속 넣어주면 배열안에 json object가 여러개 생김

![image-20200317094127319](images/image-20200317094127319.png)

![image-20200317094416103](images/image-20200317094416103.png)

***오라클에서 sysdate =몽고디비에서 new date()***

![20200317_094453](images/20200317_094453.jpg)

### mongoDB에서 데이터 조회하기

- findOne() => 첫번째 데이터를 가져옴
  - 아래처럼 변수 x에 저장 가능

![image-20200317094707687](images/image-20200317094707687.png)

- 아래처럼 x에 num이란 변수에 120을 저장하면 find()에는 삽입 안되는데 x를 조회하면 num이 있음.

![image-20200317094742231](images/image-20200317094742231.png)

![image-20200317094858525](images/image-20200317094858525.png)

![image-20200317094830812](images/image-20200317094830812.png)

- save()로 x를 넣어주면 find()했을 때 num이 들어간다. (collection에 x를 저장하는 것.)

![image-20200317095053187](images/image-20200317095053187.png)

- 전체 데이터의 갯수

![image-20200317095149474](images/image-20200317095149474.png)

- while문 써서 모든 document에 num = 1000 필드를 추가하기

![image-20200317101602076](images/image-20200317101602076.png)

![image-20200317101612469](images/image-20200317101612469.png)

![image-20200317101650188](images/image-20200317101650188.png)

- 원하는 document 지우기 => remove({_id:~~~},true)

![image-20200317102107240](images/image-20200317102107240.png)

![image-20200317102150752](images/image-20200317102150752.png)

- find

  - db.컬렉션명.find(조건,조회할 필드에 대한 명시)

    - db.컬렉션명.find({})와 동일

      - {}안에 아무것도 없으면 전체 데이터 조회

    - 조건, 조회할 필드에 대한 명시 모두 json

    - 조회할 필드의 정보 명시

      - 형식:{필드명:1...} => 화면에 표시하고 싶은 필드

        ​		 {필드명:0...} => 명시된 필드가 조회되지 않도록 처리

  - findOne() : 첫 번째 document만 리턴

  - find() : 모든 document리턴

  - count() : 행의 갯수를 리턴

  - sort({필드명:sort옵션}) : 정렬

    - sort옵션
      - 1 => 오름차순
      - -1 => 내림차순

  - limit(숫자) : 숫자만큼의 document만 조회

  - skip(숫자) : 숫자만큼의 document를 skip하고 조회

  [비교조건]

  $lt: < ===================> lt = less than

  $gt: > ===================> gt = greater than

  $lte: <=

  $gte: >=

  [논리조건]

  $or - 여러 필드를 이용해서 같이 비교 가능

  $and

  $in - 하나의 필드에서만 비교할 수 있음.

  $nin - not in =====> $in으로 정의한 조건을 제외한 document를 조회

- 정규표현식 적용

  db.컬렉션명.find({조건필드명:/정규표현식/옵션})

  [기호]

  | : or

  ^ : ^뒤의 문자로 시작하는지 체크

  [] : 영문자 하나는 한 글자를 의미하고 []로 묶으면 여러 글자를 표현할 수 있다.

  ​		[a-i]  =>  a에서 i까지의 모든 영문자

  [옵션]

  i : 대소문자 구분없이 조회 가능





- addr이 인천인 데이터 조회하기 :id, name,dept, addr
  - db.score.find({addr:"인천"},{id:1,name:1,dept:1,addr:1});
    - 이렇게 하면 _id가 자동으로 같이 조회됨

![image-20200317103243988](images/image-20200317103243988.png)

![image-20200317103432903](images/image-20200317103432903.png)

![image-20200317103449552](images/image-20200317103449552.png)

- score컬렉션에서 java가 90점 이상인 document조회: id,name,dept,java만 출력
  - db.score.find({java:{$gte:90}},{id:1,name:1,dept:1,java:1,_id:0});

![image-20200317103755839](images/image-20200317103755839.png)

![image-20200317103808976](images/image-20200317103808976.png)

- dept가 인사이거나 addr이 인천인 데이터를 조회
  - db.score.find({$or:[{dept:"인사"},{addr:"인천"}]});

![image-20200317104503905](images/image-20200317104503905.png)

- id가 song, kang, hong인 데이터 조회 [or써도 되고 in 써도됨]
  - db.score.find({$or:[{id:"song"},{id:"kang"},{id:"hong"}]});
  - db.score.find({id: {$in:["song","kang","hong"]}});

![image-20200317104742691](images/image-20200317104742691.png)

- id가 song, kang, hong이 아닌 데이터 조회[nin]
  - db.score.find({id: {$nin:["song","kang","hong"]}});

![image-20200317105351529](images/image-20200317105351529.png)

- null인 데이터 조회하기

![image-20200317111003855](images/image-20200317111003855.png)

- sort

![image-20200317111552229](images/image-20200317111552229.png)

- limit => 숫자만큼만 위에서부터 조회

![image-20200317111639942](images/image-20200317111639942.png)

- skip => 숫자만큼만 위에서부터 제외하고 조회

![image-20200317111733108](images/image-20200317111733108.png)

- 정규표현식을 써서 id가 kim과 park인 document를 조회
  - db.score.find({id:/kim|park/});
    - 대소문자를 구분함.
  - db.score.find({id:/kim|park/i});
    - 대소문자 구분안함

![image-20200317112422317](images/image-20200317112422317.png)

- 정규표현식 써서 id가 k로 시작하는 document를 조회
  - db.score.find({id:/^k/});

![image-20200317112602006](images/image-20200317112602006.png)

- [a-i]까지의 영문이 있는 id를 조회
  - db.score.find({id:/[a-i]/});
    - a~i가 있는건 다 조회됨

![image-20200317113130262](images/image-20200317113130262.png)

- id가 k-p로 시작하는 document 조회
  - db.score.find({id:/^[k-p]/});

![image-20200317113246240](images/image-20200317113246240.png)

- k와 p로만 시작하는 document 조회
  - db.score.find({id:/^[kp]/});

![image-20200317113519359](images/image-20200317113519359.png)

- $exists => 존재하는 것.
  - 아래처럼 하면 servlet이 null인 데이터를 조회하는 것.

![image-20200317141326091](images/image-20200317141326091.png)

- exists로 null이 아닌 것 조회하기
  - $not이 들어가면 부정임.

![image-20200317141442594](images/image-20200317141442594.png)

### mongodb에 저장된 데이터 삭제하기 -> remove()

- 조건을 정의하는 방법은 find()나 update()와 동일
  - db.score.remove({servlet:{$lt:80}});

![image-20200317113940334](images/image-20200317113940334.png)

## mongoDB에서 Aggregation

![image-20200317142630591](images/image-20200317142630591.png)

- group by와 같은 의미
- 간단한 집계를 구하는 경우 mapreduce를 적용하는 것 보다 간단하게 작업.
- Pipeline을 내부에서 구현
  - 한 연산의 결과가 또 다른 연산의 input데이터로 활용된다.

#### 명령어(RDBMS와 비교)

$match : where절, having절

$group : group by

$sort : order by

$avg : avg그룹함수

$sum : sum 그룹함수

$max : max 그룹함수



#### 형식

db.컬렉션명.aggregate(aggregate명령어를 정의)

​                                         ------------------------------------

​                                         여러가지를 적용해야하는 경우에는 배열로 나타내야됨

​			$group:{_id:그룹으로 표시할 필드명, 연산결과를 저장할 필드명:{연산함수:값}}

​																																	값 = 숫자나 필드참조

​			$match:{필드명:{연산자:조건값}}

​										----------------------

​										비교연산 or 조건이 여러개

- addr별 인원수
  - db.exam.aggregate([{$group:{_id:"$addr",num:{$sum:1} ])
    - 이렇게 해주면 sum할 때 계속 한개씩 더해져서. num에 담긴다.

![image-20200317144925690](images/image-20200317144925690.png)

- dept별 인원수

  ![image-20200317150406096](images/image-20200317150406096.png)

- dept별 java점수의 평균

  - db.exam.aggregate([{$group:{_id:"$dept",mean:{$avg:"$java"}}}]);

![image-20200317150634315](images/image-20200317150634315.png)

- addr별 servlet 합계

  - db.exam.aggregate([{$group:{_id:"$addr",mean:{$sum:"$servlet"}}}]);

  ![image-20200317151609049](images/image-20200317151609049.png)

- dept별 java점수의 평균. 단, addr이 인천인 데이터만 작업. => $match를 추가해야됨.
  
  - db.exam.aggregate([{$match:{addr:"인천"}},{$group:{_id:"$dept",평균:{$avg:"$java"}}}]);

![image-20200317152308764](images/image-20200317152308764.png)

[실습]

![image-20200317160533419](images/image-20200317160533419.png)

1. ![실습 1](images/실습 1-1584428749042.PNG)
2. ![실습 2](images/실습 2-1584428755789.PNG)
3. ![실습 3](images/실습 3-1584428764175.PNG)









### Spring 에서 mongoDB테스트

- Spring Data
  - 데이터 핸들링에 관련된 신기술에 대응하기 위해 만들어진 것.

![image-20200317161557190](images/image-20200317161557190.png)

![image-20200317161902194](images/image-20200317161902194.png)

![image-20200317162803680](images/image-20200317162803680.png)

![image-20200317162830029](images/image-20200317162830029.png)

- 버전 변경해주기

![image-20200317163243314](images/image-20200317163243314.png)

- mongodb의 repository 추가하기.

![image-20200317163227812](images/image-20200317163227812.png)

- 스프링에서 mongod 서버에 접속해야함
  - 자바에서 mongodb사용하기 위함
  - spring Data를 통해서 mongodb에 접속해야됨.

![image-20200317163812495](images/image-20200317163812495.png)

![image-20200317170848917](images/image-20200317170848917.png)

![image-20200317170913339](images/image-20200317170913339.png)



### mongoimport랑 mongoexpot로 collection을 가져오고 내보내는 작업

- mydb라는 데이터베이스에 score컬렉션 export하기 
  - -d => 데이터베이스이름
  - -c => 컬렉션 이름
  - -o => export하고서 지정해줄 이름

![image-20200318092515190](images/image-20200318092515190.png)

![image-20200318092745454](images/image-20200318092745454.png)

-- json형태로 export되었음. --

![image-20200318092834568](images/image-20200318092834568.png)

![image-20200318092810358](images/image-20200318092810358.png)

- import하기
  - /file : 파일이 있는 경로
    - 여기에서는 지금 iot폴더 경로고 이 안에 test.csv가 있으니까 바로 test.csv라고 쓴거
  - /headerline
    - test.csv파일에 첫번째 줄을 제외하겠다는 의미
      - ![image-20200318093842943](images/image-20200318093842943.png)
  - /type
    - 어떤 타입으로 할껀지. 디폴트가 json이라서 csv로 할 경우 지정해주자.

![image-20200318093659816](images/image-20200318093659816.png)

 -- 데이터가 test컬렉션으로 import됨 --

![image-20200318093937192](images/image-20200318093937192.png)

### CRUD

- mongodb의 DTO는 컬렉션과 자동으로 매핑됨.
  - 아래처럼 어노테이션 써주자.

![image-20200318095100962](images/image-20200318095100962.png)

- 이거 보고 멤버변수 입력 해줌

![image-20200318100609517](images/image-20200318100609517.png)

- 생성자, setget, toString 모두 만들어주기

![image-20200318100929531](images/image-20200318100929531.png)

## PagingAndSorting

- Spring data프레임 워크 내부에서 사용 할 저장소인 interface만들기
  - T => 어떤 document를 쓸껀지
  - Serializable => primary key의 타입

### ![image-20200318101533505](images/image-20200318101533505.png)

![image-20200318101818137](images/image-20200318101818137.png)

- repository를 쓰려면 아래처럼 등록해줘야함.

![image-20200318101946123](images/image-20200318101946123.png)

#### list

- 아래는 페이징 처리된 list보기.
  - 처음에 보여질 페이지 번호를 넘겨주면 된다.

![image-20200318104138540](images/image-20200318104138540.png)

- servlet-context에 prefix와 suffix가 저렇게 설정되어있어서 setViewName에 list만 써준것.

![image-20200318104926625](images/image-20200318104926625.png)

![image-20200318105124491](images/image-20200318105124491.png)

- serviceImpl은 평소랑 똑같은데 DAOImpl이 중요함

![image-20200318112251310](images/image-20200318112251310.png)

![image-20200318113643170](images/image-20200318113643170.png)

![image-20200318113743701](images/image-20200318113743701.png)

![image-20200318113952447](images/image-20200318113952447.png)

![image-20200318114008223](images/image-20200318114008223.png)

- findAll()

![image-20200318132148601](images/image-20200318132148601.png)

### Insert

![image-20200318132324304](images/image-20200318132324304.png)

![image-20200318133740893](images/image-20200318133740893.png)

- 전체보기

![image-20200318133810598](images/image-20200318133810598.png)

- insert페이지

![image-20200318133836461](images/image-20200318133836461.png)

- 필터 처리해줘야 한글이 안깨짐

![image-20200318135050735](images/image-20200318135050735.png)

- insert 시작!

![image-20200318134807469](images/image-20200318134807469.png)

- insert 성공!

![image-20200318134822552](images/image-20200318134822552.png)

- mongoDB프롬프트에도 삽입된 것을 볼 수 있음.

![image-20200318134912874](images/image-20200318134912874.png)

- multiInsert

![image-20200318141501327](images/image-20200318141501327.png)

- 아래 사진대로 클릭

![image-20200318141747335](images/image-20200318141747335.png)

- 아래처럼 multi0 ~ 10까지 자동 삽입됨.

![image-20200318141717563](images/image-20200318141717563.png)



- id로 search하기
  - mongoDB는 key:value형태임. 그래서 조건을 줄때 key와 value를 매개변수로 같이 받아야함.
  - action은 jsp파일에서 Get방식으로 넘길 때 READ나 UPDATE로 넘기는 것을 받는 매개변수

![image-20200318142807306](images/image-20200318142807306.png)

![image-20200318143247909](images/image-20200318143247909.png)

- 동그라미
  - 도큐먼트 하나와 맵핑할 꺼

![image-20200318144058012](images/image-20200318144058012.png)

![image-20200318145211970](images/image-20200318145211970.png)

![image-20200318145240154](images/image-20200318145240154.png)

![image-20200318145251240](images/image-20200318145251240.png)

![image-20200318145305773](images/image-20200318145305773.png)

![image-20200318145318765](images/image-20200318145318765.png)

- 검색하기

![image-20200318145335702](images/image-20200318145335702.png)

![image-20200318145352648](images/image-20200318145352648.png)

![image-20200318161809169](images/image-20200318161809169.png)

![image-20200318161823806](images/image-20200318161823806.png)

![image-20200318163018920](images/image-20200318163018920.png)

![image-20200318163050965](images/image-20200318163050965.png)



![image-20200318164909855](images/image-20200318164909855.png)

![image-20200318164836510](images/image-20200318164836510.png)

![image-20200318164850893](images/image-20200318164850893.png)



### Update

![image-20200318171215194](images/image-20200318171215194.png)

![image-20200318171617843](images/image-20200318171617843.png)

![image-20200318171654416](images/image-20200318171654416.png)

![image-20200318171738507](images/image-20200318171738507.png)

- 수정 완료

![image-20200318171758296](images/image-20200318171758296.png)