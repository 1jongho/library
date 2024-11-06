<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>도서 대여/반납 시스템</title>
    <style>
        * { box-sizing: border-box; }
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 20px;
        }
        .stats-container {
            display: flex;
            justify-content: space-between;
            margin-bottom: 30px;
        }
        .stat-box {
            background: #fff;
            padding: 15px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            text-align: center;
            width: 23%;
        }
        .form-container {
            background: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            margin-bottom: 20px;
        }
        .form-group {
            margin-bottom: 15px;
        }
        .form-group label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }
        .form-control {
            width: 100%;
            padding: 8px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }
        .btn {
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        .btn-primary {
            background: #3366ff;
            color: white;
        }
        .alert {
            padding: 10px;
            margin: 10px 0;
            border-radius: 4px;
        }
        .alert-info { background: #e8f0ff; }
        .alert-warning { background: #fff3cd; }
        .alert-danger { background: #ffe8e8; }

        .book-list {
            margin-top: 20px;
        }
        .book-list table {
            width: 100%;
            border-collapse: collapse;
        }
        .book-list th, .book-list td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
    </style>
</head>
<body>
<!-- 통계 섹션 -->
<div class="stats-container">
    <div class="stat-box">
        <h4>현재까지 등록된 도서</h4>
        <strong>12,542</strong>
    </div>
    <div class="stat-box">
        <h4>현재 도서실 건물 수</h4>
        <strong>1</strong>
    </div>
    <div class="stat-box">
        <h4>도서관 총 이용자 수</h4>
        <strong>4,021</strong>
    </div>
    <div class="stat-box">
        <h4>대여 진행중인 도서 수</h4>
        <strong>23</strong>
    </div>
</div>

<!-- 도서 대여 폼 -->
<div class="form-container">
    <h2>도서 대여</h2>
    <p>사용자의 학번과 도서 등록코드를 입력해 주세요</p>

    <form action="/admin/loan" method="post">
        <div class="form-group">
            <label>학번</label>
            <input type="text" class="form-control" name="studentId" placeholder="ex) 20131122">
        </div>

        <div class="form-group">
            <label>이름</label>
            <input type="text" class="form-control" name="name" value="홍길동">
        </div>

        <div class="form-group">
            <label>단과대학</label>
            <input type="text" class="form-control" name="department" value="공과대학">
        </div>

        <div class="form-group">
            <label>전공</label>
            <input type="text" class="form-control" name="major" value="소프트웨어학과">
        </div>

        <div class="form-group">
            <label>대출 권수 수량</label>
            <input type="number" class="form-control" name="loanCount" value="3">
        </div>

        <div class="form-group">
            <label>사유</label>
            <input type="text" class="form-control" name="reason" value="연체">
        </div>

        <div class="form-group">
            <label>도서 코드</label>
            <input type="text" class="form-control" name="bookCode" placeholder="도서 코드를 입력하세요">
        </div>

        <div class="form-group">
            <label>도서명</label>
            <input type="text" class="form-control" name="bookTitle" value="출근길">
        </div>

        <div class="form-group">
            <label>저자</label>
            <input type="text" class="form-control" name="author" value="제레드다이아몬드 저;김진준 옮김">
        </div>

        <div class="form-group">
            <label>출판사</label>
            <input type="text" class="form-control" name="publisher" value="문학사상">
        </div>

        <div class="form-group">
            <label>출판일</label>
            <input type="text" class="form-control" name="publishYear" value="2014">
        </div>

        <div class="form-group">
            <label>대출 기간</label>
            <div style="display: flex; gap: 10px;">
                <input type="date" class="form-control" name="loanStart" value="2024-10-12" style="width: 50%;">
                <input type="date" class="form-control" name="loanEnd" value="2024-10-26" style="width: 50%;">
            </div>
        </div>

        <button type="submit" class="btn btn-primary">대출 신청</button>
    </form>
</div>

<!-- 도서 반납 섹션 -->
<div class="form-container">
    <h2>도서 반납</h2>
    <p>사용자의 학번과 반납 도서를 체크해 주세요</p>

    <form action="/admin/return" method="post">
        <div class="form-group">
            <label>학번</label>
            <input type="text" class="form-control" name="studentId" placeholder="ex) 20131122">
        </div>

        <div class="book-list">
            <table>
                <thead>
                <tr>
                    <th></th>
                    <th>도서명</th>
                    <th>저자</th>
                    <th>출판사</th>
                    <th>기한</th>
                    <th>연체</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td><input type="checkbox" name="returnBooks"></td>
                    <td>출근길</td>
                    <td>제레드다이아몬드 저;김진준 옮김</td>
                    <td>문학사상</td>
                    <td>2024-10-10 - 2024-10-24</td>
                    <td>0일</td>
                </tr>
                </tbody>
            </table>
        </div>

        <button type="submit" class="btn btn-primary" style="margin-top: 20px;">반납 신청</button>
    </form>
</div>
</body>
</html>