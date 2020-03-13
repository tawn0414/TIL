#### sqoop을 써서 oracle로 export하기

##### 에러잡기

- 아래처럼 하면 에러뜸

![image-20200313093946376](images/image-20200313093946376.png)

![image-20200313094719944](images/image-20200313094719944.png)

![image-20200313094742618](images/image-20200313094742618.png)

- 아래꺼가 방금 맵리듀스 한거

![image-20200313094810602](images/image-20200313094810602.png)

![image-20200313094858792](images/image-20200313094858792.png)

- 한 컬럼을 두개로 나누려고 해서 생기는 문제임

![image-20200313094924012](images/image-20200313094924012.png)

- 아래처럼 더 붙여 써주면 한 컬럼을 두개로 나눌 수 있음
  - 원화기호는 sqoop에서 원래 있는 표시라서 원화기호 두개 써준거임.
    - wordcount한 파일이 tab으로 구분되어 있으니까 원화t로 탭을 표현

![image-20200313095033358](images/image-20200313095033358.png)

![image-20200313095203654](images/image-20200313095203654.png)

- export완료

![image-20200313095235919](images/image-20200313095235919.png)



## Flume(data수집을 위한 프로그램)

- 시스템로그, 웹 서버의 로그, 클릭로그, 보안로그 등 비정형 데이터를 HDFS에 적재하기 위해 사용하는 프로그램. 대규모의 로그데이터가 발생하면 효율적으로 수집하고 저장하기위해 관리.
  - Flume, chukwa, scribe, fluentd, splunk

- Web server에서 데이터를 뽑아서 Agent(Flume)를 써서 HDFS에 적재함.
  - Flume의 구성 = Source, Channel, Sink

![image-20200313101038649](images/image-20200313101038649.png)

- Source(데이터의 유입)에 내가 뽑아보고 싶은 유형의 데이터 저장 -> Source에서 데이터를 가져와서 채널링  -> Sink(Output으로 내보내는 역할)
- Source의 유형
  - file system, 네트워크, 콘솔, 또 다른 Flume의 Sink
- Sink의 유형
  - file, 콘솔, HDFS, 또다른 Flume의 source
- Channel
  - Source의 데이터를 모아놨다가 Sink로 보내는 역할. 저장소 역할임.

- documentation -> user guide
  - agent = Flume
  - 일반적인 구성들

![image-20200313101724746](images/image-20200313101724746.png)

![image-20200313101912829](images/image-20200313101912829.png)

![image-20200313102028710](images/image-20200313102028710.png)

- Source, Sink, Channel의 종류들도 다 볼 수 있음



### 다운로드

- 하둡01머신에서 테스트, 하둡02머신에 구축할거임.

![image-20200313102704193](images/image-20200313102704193.png)

![image-20200313103419603](images/image-20200313103419603.png)

![image-20200313103442269](images/image-20200313103442269.png)

![image-20200313103522698](images/image-20200313103522698.png)

![image-20200313103630441](images/image-20200313103630441.png)

[설정]

1. 다운로드(압축풀기)

2. .bashrc에 설정정보 등록

3. flume-env.sh rename하고 정보등록

   -jdk 홈 디렉토리

   -hadoop 홈 디렉토리

4. flume 설정 파일에 등록

   -flume-conf.properties.template을 XXXX.properties으로 rename하기

   -flume agent의 source,channel,sink에 대한 정보를 등록

[Flume의 구성 요소]

- flume의 실행 중인 프로세스를 agent라 부르며 source, channel, sink로 구성

1.  source

   => 데이터가 어떤 방식으로 유입되는지 type으로 명시

   agent명.source.source명.type=값

   1) type

   ​	=> netcat : telnet을 통해서 터미널로 들어오는 입력 데이터

   ​						(bind : 접속IP, port : 사용할 port)

   ​	=> spoolDir : 특정 폴더에 저장된 파일을 가져올 때 사용

   ​						(spoolDir : 폴더명)

2. channel

   => 데이터를 보관하는 곳(source와 sink사이의 Queue(앞뒤가 열려있으니까))

3. sink

   => 데이터를 내보내는 곳(어떤 방식으로 내보낼지 type으로 정의)

   1) type

   ​	=> logger : flume서버 콘솔에 출력이 전달

   ​						flume을 실행할 때 -Dflume.root.logger=INFO,console를 추가해야됨

   ​	=> file_roll : file을 읽어서 가져오는 경우

   ​						  (directory : 읽어온 파일을 저장할 output폴더를 명시)

[flume의 실행]

실행명령어: ./bin/flume-ng agent

옵션(conf-file이랑 name은 내가 어떻게 주느냐에 따라 바뀜 )

​	--conf : 설정파일이 저장된 폴더명(= -c)

​	--conf-file : 설정파일명(= -f)

​	--name : agent의 이름(= -n)

​	-Dflume.root.logger=INFO,console : flume의 로그창에 기록, source가 telnet으로 입려하는 데이터인 경우



### 설정

- 압축풀기

![image-20200313103826964](images/image-20200313103826964.png)

- 깔았으니까 설정해주기
  - /home/hadoop/.bashrc에 설정 정보 등록

![image-20200313103907021](images/image-20200313103907021.png)

![image-20200313104140135](images/image-20200313104140135.png)

- .bashrc 실행

![image-20200313104742835](images/image-20200313104742835.png)

- 뒤에 template가 붙으면 설정파일로 인식을 못함. (conf폴더는 설정파일 모아놓는 곳)
  - flume-env.sh.template가 Flume의 설정파일이 모여있는 곳임.

![image-20200313104930130](images/image-20200313104930130.png)

- cp는 로컬에서 복사, scp는 remote에서 복사할때임
  - cp로 rename해서 복사해줘야 template를 설정파일로 사용할 수 있음.

![image-20200313105059871](images/image-20200313105059871.png)

![image-20200313110730709](images/image-20200313110730709.png)

![image-20200313110745580](images/image-20200313110745580.png)

![image-20200313110955197](images/image-20200313110955197.png)

![image-20200313111316707](images/image-20200313111316707.png)

## Flume의 구성요소

- '#' = 주석
- agent의 이름
  - source,channel,sinks의 이름을 지어줌
- channel
  - source가 사용하는 채널은 s를 붙이고 sink가 사용하는 채널은 s를 안붙임
- sink
  - 콘솔에 찍을때 사용하는게 logger
- channel
  - 저장한거를 memory라고 하고 수용가능용량을 1000으로 지정

## flume의 실행

![image-20200313133248619](images/image-20200313133248619.png)

- telnet실행하기 => text통신하는게 telnet임.
  - yum이라는 명령어로 설치

![image-20200313135042404](images/image-20200313135042404.png)

- telnet으로 text를 치면 다른 터미널에 입력됨.

![image-20200313141100374](images/image-20200313141100374.png)

- telnet 빠져나오는 법
  - ctrl + ] -> quit

![image-20200313143215809](images/image-20200313143215809.png)

- 이제 폴더에서 폴더로 옮겨봅시다(파일에서 파일로)
  - input(source) 폴더에서 output(sink)폴더로 옮겨보자

![image-20200313143522197](images/image-20200313143522197.png)

![image-20200313143611405](images/image-20200313143611405.png)

![image-20200313143913133](images/image-20200313143913133.png)

![image-20200313144500024](images/image-20200313144500024.png)

![image-20200313150635117](images/image-20200313150635117.png)

- flume을 시작하기 위한 명령어
  - -n : agent 이름
  - -c  : 설정 폴더
  -  -f : 설정 파일

![image-20200313150953826](images/image-20200313150953826.png)

- input파일에 console.properties넣으니까 COMPLETED로 바뀌고 output에 동일한 파일이 생긴다.

![image-20200313151452776](images/image-20200313151452776.png)

![image-20200313151508456](images/image-20200313151508456.png)

- rollInterval=0
  - 원래 롤링해서 input폴더에 있는 파일을 계속 읽고 output폴더에 넣는데 이렇게 하면 롤링을 하지 않음

![image-20200313151803619](images/image-20200313151803619.png)



- input 폴더에 있는거를 HDFS로 옮기기

![image-20200313154209188](images/image-20200313154209188.png)

![image-20200313155013748](images/image-20200313155013748.png)

![image-20200313160515301](images/image-20200313160515301.png)

![image-20200313160904884](images/image-20200313160904884.png)

![image-20200313160919528](images/image-20200313160919528.png)

