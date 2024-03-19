![index](https://github.com/ajs0813/HRD_Voting/assets/143467352/f3b2e349-aef8-42b7-83d1-3e900efaeeef)
<b>지역구의원투표 프로그램의 홈화면</b>
<br><br>
학습을 위한 JSP MODEL1 방식의 지역구의원투표 프로그램의 첫화면입니다.
<br><br>
일반적으로 기본적인 요구사항에 관하여 적혀있습니다. 
<br><br><br><br><br><br>
![list](https://github.com/ajs0813/HRD_Voting/assets/143467352/bcbbfacf-d80e-4af0-8eea-c46fc7a24a6b)
<b>지역구의원투표 프로그램의 후보조회</b>
<br><br>
Oracle로 작성한 후보 DB 테이블 내에서 등록된 후보들에 대한 정보를 SELECT 합니다.

<br><br><br><br><br><br>
![vote](https://github.com/ajs0813/HRD_Voting/assets/143467352/197ca937-9438-48a4-90ae-2210f6ab1cb9)
<b>지역구의원투표 프로그램의 투표</b>
<br><br>
유권자는 투표 페이지를 통해 투표를 진행하며 등록된 정보는 DB 투표 테이블 내에 INSERT 됩니다.
<br><br>
JS를 통한 간단한 유효성 검사가 포함되어 있습니다.
<br><br><br><br><br><br>
![votelist](https://github.com/ajs0813/HRD_Voting/assets/143467352/d2f6dc30-4602-4a8f-8d84-209ad9a8e18a)
<b>지역구의원투표 프로그램의 투표검수조회</b>
<br><br>
유권자들이 진행한 DB내의 투표 테이블 정보를 DECODE 함수를 통해 원하는 양식으로 SELECT하는 페이지입니다.

<br><br><br><br><br><br>
![rank](https://github.com/ajs0813/HRD_Voting/assets/143467352/faa8db98-205d-435d-a70f-f4a24e9fbbcc)
<b>지역구의원투표 프로그램의 후보자등수</b>
<br><br>
후보 테이블과 투표 테이블의 결과를 GROUP BY 한 뒤 COUNT를 통한 후보자 투표 결과를 SELECT 하는 페이지입니다. 
