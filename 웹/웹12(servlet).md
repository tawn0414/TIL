### 요청 재지정

- 응답화면을 insertResult.html로 분리할 것임

  ![image-20200117092118636](images/image-20200117092118636.png)

  ![image-20200117092446720](images/image-20200117092446720.png)

  ![image-20200117092511706](images/image-20200117092511706.png)

  ![image-20200117092527184](images/image-20200117092527184.png)

- 이제 비즈니스 메소드 호출해서 받은 결과값인 result를 응답화면에 생성할 수 있게 활용해야한다. 근데 insertResult는 html이라서 자바코드를 쓸 수 없다. 그래서 JSP로 구현한다.

  - servlet으로 자바코드를 해석, JSP로는 화면을 구성

- jsp파일 만들기

![image-20200117093812770](images/image-20200117093812770.png)

- 아래는 html5는 지원안함. 그래서 지워줌

  ![image-20200117094121225](images/image-20200117094121225.png)

![image-20200117094221697](images/image-20200117094221697.png)

![image-20200117094234609](images/image-20200117094234609.png)

- <% %>는 자바를 실행할 수 있는 구간

![image-20200117094402183](images/image-20200117094402183.png)

- <%= %>

![image-20200117094713113](images/image-20200117094713113.png)



- 아래대로 하면 jsp파일을 생성할 때 마다 위쪽에 지워줄 필요 없음
  - 아래사진 오른쪽에 edit눌러서 지워줄 부분을 지워주자.

![image-20200117094957955](images/image-20200117094957955.png)



- import를 직접 써줘야함.

![image-20200117103437001](images/image-20200117103437001.png)

![image-20200117103552029](images/image-20200117103552029.png)

- ctl + spacebar를 쓰면 자동 import됨

  ![image-20200117103715869](images/image-20200117103715869.png)





- 요청재지정

![image-20200117151547043](images/image-20200117151547043.png)

- setattribute로 dept를 mydata로 공유

![image-20200117151609260](images/image-20200117151609260.png)

![image-20200117151713773](images/image-20200117151713773.png)

![image-20200117151731964](images/image-20200117151731964.png)

![image-20200117151748263](images/image-20200117151748263.png)

- sendRedirect(두번의 요청)
  - 클라이언트가 요청 -> 서블릿에서 요청객체 생성 -> 이 요청객체에  setattribute-> sendRedirect만나면 클라이언트에게 응답 하면서 요청객체 자동삭제 -> 바로 요청이 jsp로 전달 -> 요청객체가 jsp에 생성 -> 이 요청객체에서 getattribute -> 클라이언트에게 응답 
    - 비어져 있는요청객체에서 getattribute 하니까 null이 나오는 것. (공유가 안됨.)



- forward방법
  - ![image-20200117153237478](images/image-20200117153237478.png)
  - ![image-20200117153338628](images/image-20200117153338628.png)
  - ![image-20200117153359321](images/image-20200117153359321.png)

- forward의 실행흐름(한번의 요청)
  - 클라이언트가 서블릿 요청 -> 서블릿에서 요청객체 생성됨 -> 여기에 setAttribute로 데이터공유 -> requestDispatcher.forward(request,response) 만나면 jsp로 요청을 전달할 때 request와 response객체를 같이 전달. -> 생성되어져 있던 요청객체에서 getAttribute로 데이터 가져옴 -> 클라이언트에게 응답.

- include

  ![image-20200117162020974](images/image-20200117162020974.png)

  ![image-20200117162055663](images/image-20200117162055663.png)

  ![image-20200117162113768](images/image-20200117162113768.png)





- include의 실행흐름
  - 클라이언트가 서블릿 요청 -> 서블릿에서 요청객체 생성 -> 여기에 setAttribute로 데이터공유 ->include로 jsp가 요청재지정(호출)됨 -> jsp에서의 실행결과를 갖고 다시 서블릿으로 돌아옴 -> 서블릿에서 클라이언트에게 응답 

- 데이터를 공유하기위해선 forward와 include방식을 써야한다. 근데 jsp를 쓸때는 제어를 모두 서블릿으로 넘기는 include방식이 적합