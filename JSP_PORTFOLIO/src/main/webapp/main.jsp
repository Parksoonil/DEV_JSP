<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Kyobo Bookstore Clone</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }
        .header, .footer {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px 20px;
            background-color: #007bff;
            color: white;
            position: fixed;
            width: 100%;
            left: 0;
        }
        .header {
            top: 0;
        }
        .footer {
            bottom: 0;
            text-align: center;
        }
        .header .buttons button {
            margin-left: 10px;
            padding: 5px 10px;
            border: none;
            background-color: white;
            color: #007bff;
            cursor: pointer;
            border-radius: 4px;
        }
        .content {
            flex: 1;
            padding: 80px 20px 60px; /* Adjust for fixed header and footer */
            max-width: 800px;
            margin: 0 auto;
        }
        .grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(150px, 1fr));
            gap: 20px;
        }
        .card {
            border: 1px solid #ddd;
            border-radius: 8px;
            padding: 10px;
            text-align: center;
            box-shadow: 2px 2px 10px rgba(0, 0, 0, 0.1);
        }
        .card img {
            width: 100%;
            height: 150px;
            object-fit: cover;
            border-radius: 4px;
        }
        .pagination {
            display: flex;
            justify-content: center;
            margin-top: 20px;
        }
        .pagination button {
            padding: 10px;
            margin: 5px;
            border: none;
            background-color: #007bff;
            color: white;
            cursor: pointer;
            border-radius: 4px;
        }
        .pagination button:disabled {
            background-color: #ccc;
            cursor: not-allowed;
        }
    </style>
</head>
<body>
    <div class="header">
        <h1>Kyobo Bookstore</h1>
        <div class="buttons">
            <button>로그인</button>
            <button>회원가입</button>
        </div>
    </div>
    <div class="content">
        <div class="grid">
            <div class="card">
                <img src="https://via.placeholder.com/150" alt="Book 1">
                <h2>Book 1</h2>
                <p>Author 1</p>
            </div>
            <div class="card">
                <img src="https://via.placeholder.com/150" alt="Book 2">
                <h2>Book 2</h2>
                <p>Author 2</p>
            </div>
            <div class="card">
                <img src="https://via.placeholder.com/150" alt="Book 3">
                <h2>Book 3</h2>
                <p>Author 3</p>
            </div>
            <div class="card">
                <img src="https://via.placeholder.com/150" alt="Book 4">
                <h2>Book 4</h2>
                <p>Author 4</p>
            </div>
        </div>
        <div class="pagination">
            <button id="prev" disabled>이전</button>
            <span id="page-number">Page 1</span>
            <button id="next">다음</button>
        </div>
    </div>
    <div class="footer">
        <p>&copy; 2025 Kyobo Bookstore. All rights reserved.</p>
    </div>
    <script>
        let page = 1;
        document.getElementById('next').addEventListener('click', function() {
            page++;
            document.getElementById('page-number').textContent = `Page ${page}`;
            document.getElementById('prev').disabled = false;
        });
        document.getElementById('prev').addEventListener('click', function() {
            if (page > 1) {
                page--;
                document.getElementById('page-number').textContent = `Page ${page}`;
                if (page === 1) this.disabled = true;
            }
        });
    </script>
</body>
</html>

