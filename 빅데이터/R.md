## Rstudio 

- 관리자 모드로 설정하기

![image-20200319095004339](images/image-20200319095004339.png)

![image-20200319095025770](images/image-20200319095025770.png)

- 글자 설정하기
  - 상단 Tools -> global option

![image-20200319100813950](images/image-20200319100813950.png)



- R 실행시키기
  - R은 한줄씩만 실행시킬 수 있다
  - ctrl + enter누르면 한번에 실행됨.

![image-20200319100910422](images/image-20200319100910422.png)

- ctrl + L
  - 콘솔창 지우기

![image-20200319101300682](images/image-20200319101300682.png)

- 실행했던 코드, 변수나 객체에 저장되어있는 값등 확인가능
  - connection은 DBMS나 외부프로그램과 연동할 수 있는 곳

![image-20200319101347406](images/image-20200319101347406.png)

- help가 잘 나와있음

![image-20200319101751640](images/image-20200319101751640.png)



*** ctrl 1 => 스크립트창, ctrl 2 => 콘솔창 ***



## 프로젝트 만들기

- 좌상단 File -> new project 

![image-20200319102006806](images/image-20200319102006806.png)

![image-20200319102017540](images/image-20200319102017540.png)

- 아래대로 Create Project누르면 기존에 작업하던 Rstudio가 교체됨
  - Open in new session누르면 새로운 Rstudio가 생김

![image-20200319102123199](images/image-20200319102123199.png)

- 저장하기
  - 서로다른 스크립트끼리 변수를 공유한다.

![image-20200319102337614](images/image-20200319102337614.png)

![image-20200319102400193](images/image-20200319102400193.png)

- 아래 체크하면 스크립트 창에 코드를 작성할 때 스크립트 창의 크기를 넘어가면 자동으로 줄바꿈이 됨.

![image-20200319102526137](images/image-20200319102526137.png)



- 상단 Tools -> project option
  - 이런것도 있다.

![image-20200319102716372](images/image-20200319102716372.png)



## R사용하기

- 2번처럼 변수를 저장할 꺼임. 1번으로 저장하면 안 먹힐때도 있음.
  - #은 주석문

![image-20200319103133092](images/image-20200319103133092.png)

- 비교연산자

![image-20200319103250388](images/image-20200319103250388.png)

- 코드 전체 범위지정하고 shift + ' 하면 코드전체에 큰 따옴표 쓸 수 있음.
  - 코드 전체 범위지정하기 => shift + Home

- Alt + - 쓰면 변수에 값 저장할때 쓰는 <- 가 생김



- class 함수

![image-20200319104628929](images/image-20200319104628929.png)

- as.character와 as.numeric함수로 형변환

![image-20200319104832293](images/image-20200319104832293.png)

- = 와 <-의 차이점
  - 앞으로 <-를 쓰자

![image-20200319110947315](images/image-20200319110947315.png)

![image-20200319111034761](images/image-20200319111034761.png)

## vector(arraylist느낌)

- c()로 벡터를 만들 수 있음.
  - combine
  - 변수에 여러개의 값을 넣기

![image-20200319111345897](images/image-20200319111345897.png)

- 에러났을 때 빠져나오기
  - 스크립트 17번 라인에서 닫는괄호를 실행안해줘서 에러난것. 
  - 에러에서 빠져나오려면 콘솔창 아무데나 클릭하고 ESC눌러주기

![image-20200319111738671](images/image-20200319111738671.png)

- 덧셈, 뺄셈, 변수끼리 덧셈도 가능

![image-20200319111919448](images/image-20200319111919448.png)

![image-20200319112329215](images/image-20200319112329215.png)

![image-20200319112529829](images/image-20200319112529829.png)

![image-20200319112849782](images/image-20200319112849782.png)

- 나머지 => 짝수만 TRUE

![image-20200319112947566](images/image-20200319112947566.png)

![image-20200319113055360](images/image-20200319113055360.png)

![image-20200319113610433](images/image-20200319113610433.png)

- 벡터의 이름 정해주기
  - 처음엔 이름을 안정해줘서 null나왔다가 c() 이름 정해주니까 이름 출력됨.

![image-20200319113911753](images/image-20200319113911753.png)

![image-20200319114033336](images/image-20200319114033336.png)

## matrix(행렬인데 저장할 수 있는 데이터타입이 같아야함)

- 그냥 아무것도 없이 출력했을 때 1열임

![image-20200319131326317](images/image-20200319131326317.png)

- 아래처럼 열의 수를 지정해줄 수도 있고 행방향으로 출력하게해줄 수도 있다.
  - ncol, byrow

![image-20200319131753785](images/image-20200319131753785.png) 

![image-20200319132118867](images/image-20200319132118867.png)

![image-20200319132253799](images/image-20200319132253799.png)

![image-20200319132539870](images/image-20200319132539870.png)

- cbind()
  - 아래는 행이 5개인데 cbind에 4개짜리 행만 값을 넣어줘서 경고 먹은거

![image-20200319133131320](images/image-20200319133131320.png)

- rbind()

![image-20200319133325605](images/image-20200319133325605.png)

- comnames, rownames

![image-20200319133551076](images/image-20200319133551076.png)

- 행렬의 평균구하기

![image-20200319133643309](images/image-20200319133643309.png)

- 미니 실습

![image-20200319141748435](images/image-20200319141748435.png)

- 내 풀이

![스크립트](images/스크립트.PNG)

![콘솔](images/콘솔.PNG)

- 선생님 풀이

![image-20200319142629135](images/image-20200319142629135.png)

![image-20200319142708718](images/image-20200319142708718.png)

- byrow는 행렬을 생성할 때 주는 옵션임. 행렬을 만든 후에 값의 위치를 바꾸고 싶을때는??

![image-20200319150946620](images/image-20200319150946620.png)

![image-20200319150959466](images/image-20200319150959466.png)

## list



## dataframe(행렬인데 저장할 수 있는 데이터 타입이 달라도됨)

- matrix를 dataframe으로 변환

![image-20200319143401232](images/image-20200319143401232.png)

![image-20200319143512481](images/image-20200319143512481.png)

- 아래는 dataframeMat1의 1열만 character로 바꾸고 싶어서 코드를 짠건데 모든 값들이 다 character로 바뀌었다.

![image-20200319143623553](images/image-20200319143623553.png)

- str함수써서 dataframe의 1열이 int형에서 char형으로 바뀐것을 볼 수 있음

![image-20200319143916641](images/image-20200319143916641.png)

-  $사용

![image-20200319144049000](images/image-20200319144049000.png)

- dataframe에 열 추가

![image-20200319144147428](images/image-20200319144147428.png)

- dataframe을 matrix로 변환

![image-20200319144251248](images/image-20200319144251248.png)

- 벡터로 dataframe만들기
  - 열로 만들어지네
  - 각 열당 평균도 구할 수 있음

![image-20200319144853869](images/image-20200319144853869.png)

- dataframe을 직접 만들기

![image-20200319145010874](images/image-20200319145010874.png)

## 제어구문(if, while...)

### if(자바랑 똑같음)

![image-20200319153725618](images/image-20200319153725618.png)

![image-20200319153826641](images/image-20200319153826641.png)

### for

- print()를 이용해서 출력

![image-20200319154240738](images/image-20200319154240738.png)

- 합 구하기
  - version 1 => 평소에 하던대로 로직 짜는거
  - version 2 => 함수 이용하기

![image-20200319154958268](images/image-20200319154958268.png)

## csv파일 실행하기

![image-20200319161323847](images/image-20200319161323847.png)

- 조건주기

![image-20200319161740416](images/image-20200319161740416.png)

- csv파일 쓰기

![image-20200319161957181](images/image-20200319161957181.png)

[실습]

csv_exam.csv를 읽어서 데이터를 수정한 후 csv_exam_result.csv로 저장하기

- science가 80이상인 데이터를 추출
- 추출된 데이터에 mytotal과 myavg컬럼을 추가
- mytotal: 모든 과목(math,eng,science)의 총점
- myavg: 모든 과목의 평균

![image-20200319165706386](images/image-20200319165706386.png)

![콘솔](images/콘솔-1584604491429.PNG)





