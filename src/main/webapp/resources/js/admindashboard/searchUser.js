$(document).ready(function() {
    // #userId 필드에서 엔터 키를 누르면 searchUser() 함수 호출
    $('#userId').keypress(function (event) {
        if (event.key === 'Enter') {
            event.preventDefault(); // 기본 엔터 동작 방지
            searchUser(); // 엔터 시 searchUser 함수 호출
        }
    });
});
    function searchUser() {
        var userID = $('#userId').val();
        $.ajax({
            type: 'POST',
            url: "/admindashboard/searchUser",
            contentType: 'application/json',
            data: JSON.stringify({ userId: userID }),
            success: function(response) {
                if (response.error === "error") {
                    alert("사용자를 찾을 수 없습니다.");
                }
                if (response) {
                    $('#name').val(response.name);
                    $('#colleges').val(response.colleges);
                    $('#departments').val(response.departments);
                    $('#rentalAvailable').val(response.rentalAvailable);
                    $('#status').val(response.status);
                    $('#reason').val(response.reason);

                    // 대출 가능 여부에 따라 스타일 변경
                    if (response.status === "가능") {
                        $('#status').css('border', '1px solid green');
                    } else {
                        $('#status').css('border', '1px solid red');
                    }
                } else {
                    console.log("예상하지 못한 오류가 발생했습니다.");
                }
            },
            error: function() {
                alert("오류가 발생했습니다. 다시 시도해주세요.");
            }
        });
}