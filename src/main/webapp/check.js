function voteCheck(){
	if(document.frm.jumin.value.length == 0){
		alert("주민번호가 입력되지 않았습니다!");
		frm.jumin.focus();
		return false;
	}
	if(document.frm.name.value.length == 0){
		alert("성명이 입력되지 않았습니다!");
		frm.name.focus();
		return false;
	}
	if(document.frm.number.value.length == 0){
		alert("후보번호가 입력되지 않았습니다!");
		frm.number.focus();
		return false;
	}
	if(document.frm.time.value.length == 0){
		alert("투표시간이 입력되지 않았습니다!");
		frm.time.focus();
		return false;
	}
	if(document.frm.area.value.length == 0){
		alert("투표장소가 입력되지 않았습니다!");
		frm.area.focus();
		return false;
	}
	if (!document.frm.check[0].checked && !document.frm.check[1].checked) {
    alert("유권자 확인이 선택되지 않았습니다!");
    return false;
}
	
	success();
	
	return true;
}

function success(){
	alert("투표하기 정보가 정상적으로 등록되었습니다!")
}
function cancel(){
	alert("정보를 지우고 처음부터 다시 입력합니다!")
}