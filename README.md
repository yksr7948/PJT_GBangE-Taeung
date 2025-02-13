# PJT_GBangE
## 프로젝트 개요
전국 매해 200개 넘는 마라톤 대회가 열리고 있고 대부분 수도권이 아닌 지방에서 개최되는데, 러너들 사이에서 
"지방 대회"라고 불리고 있고 지방에서 열리는 대회에 관한 정보 사이트를 만들자는 취지로 지방이(Gbange)를 제작하였습니다.

## 특징
  - 대회정보 조회
  - 회원 CRUD 기능
  - 마이페이지
  - 공지사항 게시판
  - 대회참여인증 게시판
  - 러닝일지 게시판
  - Q&A 게시판

## 개발 기간
  - 2024.05.01 ~ 2024.05.17

## 참여 인원 : 
  - 5명 (프론트엔드, 백엔드 구분 X)

## 담당 기능
  - 회원가입, 로그인, 아이디&비밀번호 찾기 등 CRUD 기능
  - 마이페이지

## 기술 스택
  - 개발 언어 : Java (11)
  - 개발 도구 : Eclipse, Visual Studio Code
  - Front-End : HTML5, CSS3, JavaScript, JQuery, Ajax
  - Back-End : JAVA, JSP&Servlet
  - DB : Oracle 11c
  - API : GoogleMap, Daum PostCode

## ERD
![GBANGE-ERD](https://github.com/user-attachments/assets/4263e8e5-7f14-4fea-a6fa-e28a73036e95)

## 스크린샷

  ### 회원가입
  ![enroll-gif](https://github.com/user-attachments/assets/cdfaa4fc-55b9-440f-a393-f8b8ffee65c7)

  아이디와 주민등록번호같은 경우에는 데이터베이스에 같은 값이 존재하면 false 반환

  입력한 정보 정규표현식으로 형식에 맞는 값인지 판별

  └ 만약 형식에 맞지 않은 정보이면 숨겨진 div가 나타남(맞으면 다시 숨겨주기)

  [회원가입 JS 코드로 이동](https://github.com/yksr7948/PJT_GBangE-Taeung/blob/0853076bdff8edd91f32d39a23998b0106b8ca7f/GBangE/src/main/webapp/views/member/enrollForm.jsp#L12)
  
  ---
  
  ### 아이디 비밀번호 찾기 & 로그인
  ![find-gif](https://github.com/user-attachments/assets/e50dd848-59bf-43bd-a758-8dd60ab653ae)

  - 로그인 시 쿠키 설정 및 세션에 담기
  ![image](https://github.com/user-attachments/assets/2c94a8f4-734b-4723-8cd3-50b685493507)
  
  ---

  ### 프로필 변경, 회원 정보 변경
  ![mypage-gif](https://github.com/user-attachments/assets/c4c6eb9b-f523-440d-b5c9-ddc9aae66b66)

  - 프로필 변경 기능
    
    ![image](https://github.com/user-attachments/assets/5ee50f63-be1f-4969-bd77-005661ec6ea2)

    첨부파일에 사용자가 입력한 파일 이름이 들어가면 인식을 못 할수도 있으니 이름 변환 작업이 필요함
    현재날짜 + 랜덤값 + 확장자를 붙여 changeName으로 바꿔주었음
  
    ![image](https://github.com/user-attachments/assets/5aa5a432-0762-4bb6-b608-926b25a2fb05)
    MultipartRequest에 파일 저장경로, 최대크기, 인코딩, 파일 변환이름을 설정하고 member테이블을 update 해주었음

  ---

  ### 마일리지 추가
  ![mileage-gif](https://github.com/user-attachments/assets/b93b0644-8130-4d8a-b74e-eb39ecaaa0f5)
    

    
    


  ---

  
