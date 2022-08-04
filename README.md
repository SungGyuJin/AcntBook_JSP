# 프로젝트명 : AcntBook (가계부)

### 프로젝트 제작 배경 및 설명
>  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;게시판(ManageStaff_JSP)을 구현한 후에 복습차원에서 게시판의 원리를 이용하여 다른것을 만들어 보고 싶었습니다. 그래서 생각한 것이 **가계부** 였습니다. 실제로 제가 휴대폰을 이용해서 가계부를 이용중이고, CRUD를 활용할 수 있어 꽤 괜찮은 주제라고 생각했습니다. 이번 프로그램은 이전 게시판과는 다르게 간단한 로그인, 회원가입기능도 구현하였으며 로그인을 하지않으면 가계부를 쓰지 못하도록 제작했습니다. Ajax라는 기술을 쓰진않았지만 프로그램 자체가 한 화면 내에서 모든 기능들이 동작하게끔 만들었습니다.

## 사용방법

## 1.회원가입 및 로그인 (아래)

* 회원가입 후 로그인을 하면 메인페이지로 이동해서 본격적으로 프로그램을 이용할 수 있습니다.

<img src="https://user-images.githubusercontent.com/79797179/182652197-331e170e-300d-4266-bcdd-0ba7646ecca9.gif">

## 2.거래내역 등록 및 삭제 (아래)

* 원하는 날짜를 달력에서 선택합니다. (설명을 위해 미리 5개의 데이터를 등록해놓은 상태)
* 하단바에서 내용과 금액을 작성 후 원하는 거래내역 버튼을 누르면 등록이 됩니다.

<img src="https://user-images.githubusercontent.com/79797179/182652199-738b2907-7155-4044-ad65-76c79f1b5be4.gif">
<img src="https://user-images.githubusercontent.com/79797179/182652188-c1a2b923-23f6-41c0-80b4-c34c4f4db5cd.gif">

***

## 디테일한 부분

* 그 달에 총 합산수입과 지출 금액이 상단바에 나옵니다.

* 거래내역을 등록하면 해당 날짜 밑에 표시가되는데 수입이면 날짜바로 밑에 수입 총 합산금액이,

 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;지출이면 수입날짜 밑에 지출 총 합산금액이 표시됩니다. (지출만 있을경우 수입자리는 공백표시)
 
 * 숫자가 있는 모든 곳에는 세 자리마다 콤마가 찍히도록 하였습니다.
 
 * 오늘 날짜에는 Today라고 표시가 됩니다.
 
 ***

## Feel a Point
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; "달력 하나를 만들더라도 상당히 많은 생각과 시간을 요하구나"라고 느낀 프로젝트입니다. 처음에는 단순한 달력이였지만 거래내역을 
등록하면 해당 날짜에 체크표시가 되도록했고, 이 후에는 달력만 보고도 그날에 거래내역이 있었는지, 있었다면 수입인지 지출인지 또 얼마를 썼는지 합산이 되도록 수정했습니다. 
그리고 프로젝트를 만드는 도중 실수를 하여 프로젝트가 날아간적이 있는데 백업을 해두지 않아 처음부터 전부 다시 만든 기억이 납니다. 백업의 중요성을 알게해준 프로젝트입니다.
