# Google Map 라이브러리 사용





새 프로젝트 생성 : map_location_pro

![image-20200413092137899](images/image-20200413092137899.png)





location, map 패키지 추가

![image-20200413092315774](images/image-20200413092315774.png)



* API발급 사이트에서 발급받기

  https://console.developers.google.com/

![image-20200413093347704](images/image-20200413093347704.png)

![image-20200413093441819](images/image-20200413093441819.png)





![image-20200413093740808](images/image-20200413093740808.png)

![image-20200413093719095](images/image-20200413093719095.png)

![image-20200413093911611](images/image-20200413093911611.png)

![image-20200413093919952](images/image-20200413093919952.png)

![image-20200413093939771](images/image-20200413093939771.png)

![image-20200413093951267](images/image-20200413093951267.png)

![image-20200413094010868](images/image-20200413094010868.png)



패키지명을 등록해야한다. 





Project Structure > dependency 목록을 볼 수 있다. -추후 사용할 예정

![image-20200413094403071](images/image-20200413094403071.png)







![image-20200413094548420](images/image-20200413094548420.png)

![image-20200413094717999](images/image-20200413094717999.png)

![image-20200413094825736](images/image-20200413094825736.png)



* 선생님 블로그에 있는 implementation 복붙해서 gradle에 넣는다.

  ```xml
  implementation 'com.google.android.gms:play-services-maps:17.0.0'
  implementation 'com.google.android.gms:play-services-location:17.0.0'
  ```

  

![image-20200413100629158](images/image-20200413100629158.png)











![image-20200413100755082](images/image-20200413100755082.png)

* 그 다음 Linear로 변경





* xml 에 fragment추가

![image-20200413101151543](images/image-20200413101151543.png)



* manifest에 use permission이랑 meta-data 추가한다.

* value에는 api사이트의 key번호가 들어간다.

![image-20200413101426940](images/image-20200413101426940.png)



* java에서 실행

  ![image-20200413101633385](images/image-20200413101633385.png)

  





## LocationManager(668p)





### BasicLocationTest 액티비티 추가

![image-20200413102542493](images/image-20200413102542493.png)





![image-20200413103802712](images/image-20200413103802712.png)

* 빨간줄이 뜨는 이유는 권한 등록을 안해줬기 때문이다.

* 매니페스트에 가서 권한 등록 해준다.

![image-20200413104441775](images/image-20200413104441775.png)





* java에서 권한체크 부분 써준다.

![image-20200413104423152](images/image-20200413104423152.png)

![image-20200413111613593](images/image-20200413111613593.png)



### LocationListener

- 위도경도가 바뀔때 호출되도록.

![image-20200413141127823](images/image-20200413141127823.png)

- 4개 메소드 오버라이드

![image-20200413141315050](images/image-20200413141315050.png)

- 위치 바뀔때 호출되는 메소드

![image-20200413141710054](images/image-20200413141710054.png)

- 위의 메소드를 연결하자

![image-20200413142054668](images/image-20200413142054668.png)



## 구글지도에서 마커

![image-20200413144105226](images/image-20200413144105226.png)

![image-20200413144127060](images/image-20200413144127060.png)

![image-20200413144140605](images/image-20200413144140605.png)

![image-20200413144209930](images/image-20200413144209930.png)

### Location코드



## Fragment사용방법(스프링에서 타일즈개념)

- 우선 Fragment를 여러개 만들어 놓음. ->  화면을 여러개 만들어놓는다는 의미 -> Fragment는 화면?
  - 프래그먼트 1,2,3...
- 버튼 1 누르면 Fragment1이 보이게
  - 2 누르면 2가 보이게 ....

- Fragment만들기

![image-20200413151245706](images/image-20200413151245706.png)

![image-20200413151305605](images/image-20200413151305605.png)

![image-20200413151532598](images/image-20200413151532598.png)

![image-20200413151811584](images/image-20200413151811584.png)

![image-20200413152040722](images/image-20200413152040722.png)

- fragment를 교체해서 보여줄 메소드
  - 트랜잭션 처리

![image-20200413153005298](images/image-20200413153005298.png)

- 결과

![image-20200413153037519](images/image-20200413153037519.png)

![image-20200413153051800](images/image-20200413153051800.png)

![image-20200413153110726](images/image-20200413153110726.png)

![image-20200413153119905](images/image-20200413153119905.png)



### 실습

- 버튼 1 -> fragment1, 버튼 2 -> fragment2, 버튼 3 -> fragment3 나오게 하기

![image-20200413161717198](images/image-20200413161717198.png)

![image-20200413161731558](images/image-20200413161731558.png)

![image-20200413161746738](images/image-20200413161746738.png)

![image-20200413161757633](images/image-20200413161757633.png)

- weight를 1 주는 이유
  - weight는 여백을 채우는 애임
    - 근데 다 match_parent 로 하면 여백이 없음. 그래서 weight가 채울 여백이 없어서 지워지는 것.

![image-20200413161825576](images/image-20200413161825576.png)

![image-20200413161839233](images/image-20200413161839233.png)

- 결과

![1](images/1-1586765678820.PNG)

![2](images/2-1586765686646.PNG)

![3](images/3-1586765690948.PNG)

***xml에 fragmaent를 추가하면 코드로 제어할 수가 없다.***

### 실습 풀이

- activity_view_pager_main.xml에서 fragment의 weight=1을 지우고 Linearlayout을 FrameLayout으로 바꿔주면 똑같이 결과가 나옴.

![image-20200413171418408](images/image-20200413171418408.png)