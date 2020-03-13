- apache 사이트 -> sqoop -> documentation -> sqoop1 -> 1.4.6
  - 앞으로 도큐먼트 잘 봐야줘야함.

![image-20200312092334747](images/image-20200312092334747.png)



- sqoop 압축풀기

![image-20200312092612717](images/image-20200312092612717.png)





- 웹11과 다른부분

![image-20200312094925825](images/image-20200312094925825.png)





- JSTL(선생님 블로그에 올려주심)

![image-20200312103634501](images/image-20200312103634501.png)

![image-20200312103707543](images/image-20200312103707543.png)



## sqoop과 hadoop을 연결하기 위해 설정하기

- hadoop01에서 etc들어가서 profile 들어가기
  - profile = 설정 정보를 기록하는 파일.

![image-20200312104316084](images/image-20200312104316084.png)

- 계정 사용자가 로그인 했을때 기록되는 내용

![image-20200312104505034](images/image-20200312104505034.png)

- .bashrc
  - 기본적으로 설정정보를 여기에 기록함.

![image-20200312104621746](images/image-20200312104621746.png)

- 이제 새로운 프로그램 등록하는 작업 할꺼임.(sqoop, hadoop, flume등)
  - 스펠링 절대 틀리면 안됨.
  - 아래처럼하면 프로그램 설치할 때마다 정보를 추가해서 등록해주면됨.

![image-20200312105037660](images/image-20200312105037660.png)

- 오라클 드라이버 복사하기
  - 오라클 실행하려면 무조건 드라이버 있어야함

![image-20200312111113163](images/image-20200312111113163.png)

![image-20200312111218684](images/image-20200312111218684.png)

- 우리가 작성한 설정파일 실행하기 : source
  - etc의 profile은 일반계정에서 작성 못하니까 .bashrc에 작성한다.

![image-20200312105258822](images/image-20200312105258822.png)

- sqoop이 host에 있는 오라클에 접속이 되는지 확인하기
  - sql실행하는게 eval명령어
  - -connect => 어떤 DB에 연결할 껀지

![image-20200312111241862](images/image-20200312111241862.png)

- 이제 oracle데이터 조회에서 테이블에 있는 데이터를 hdfs로 가져오자.
  - -m 1 => maptask를 하나만 쓰겠다.

![image-20200312113016838](images/image-20200312113016838.png)

- maptask를 두개로 나눠서 처리하려면 split by로 primary key기준으로 나눠줘야함

![image-20200312113948926](images/image-20200312113948926.png)

- hdfs에서 분석한 결과를 oracle로 보내기
  - 미리 oracle에 데이터를 담을 테이블을 만들어줘야함.

![image-20200312114153210](images/image-20200312114153210.png)

![image-20200312114842867](images/image-20200312114842867.png)

![image-20200312172835716](images/image-20200312172835716.png)



***패턴으로 조사 제거하기***

![image-20200312161348965](images/image-20200312161348965.png)



- log확인하기
  - 3월12일의 log기록을 볼 수 있다. 이걸 통해서 원하는 것을 분석할 수 있음.

![image-20200313093416208](images/image-20200313093416208.png)



### bigdata실습(댓글분석하기)

- 선생님 블로그에 풀이과정 올려주신다했음.

- 조건을 줘서 데이터를 가져오는 방법.

sqoop import -connect jdbc:oracle:thin ~~~

-query "select prd_no,prd_nm from tb_product" -target-dir /sqoop_where (w달러)$CONDITIONS -m 1

- sqoop userguide

wordcount는 탭으로 구분되어있고 하나의 컬럼임. userguide를 찾아서 한 컬럼을 두개의 컬럼으로 나누는거를 찾아야함.











*** 빅데이터 면접질문 ***

- 프로젝트에서 빅데이터 썼으면 이걸 어떻게 구현했는지 물어봄
- HDFS, 빅데이터가 뭔지 등을 물어봄