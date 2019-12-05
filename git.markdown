## Git

> Git은 분산형버전관리시스템(DVCS)이다.
>
> 소스코드 형상 관리 도구로서, 작성되는 코드의 이력을 관리한다.

## 0.기본설정

아래의 설정은 이력 작성자(author)를 설정하는 것으로, 컴퓨터에서 최초에 한번만 설정하면 된다.

```bash
$ git config --global use.name tawn <<본인 깃허브 계정
$ git config --global user.email tawn0414@naver.com <<본인 깃허브 이메일
```

## 1. 로컬 저장소(repository) 활용

### 1. 저장소 초기화

```bash
$ git init
Initialized empty Git repository in C:/Users/student/Desktop/TIL/.git/
(master) $
```

* (master)는 현재 있는 브랜치 위치를 뜨하며, `.git` 폴더가 생성된다. 
* 해당 폴더를 삭제하게 되면 모든 git과 관련된 이력이 삭제된다.

## 2.  add

이력을 확정하기 위해서는 `add` 명령어를 통하여 `staging area` 에 `stage` 시킨다.

```bash
$ git add .            # 현재 디렉토리를 stage
$ git add README.md	   # 특정 파일을 stage
$ git add images/      # 특정 폴더를 stage
```

