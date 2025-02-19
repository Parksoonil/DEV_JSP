<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Kyobo 로그인</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="flex items-center justify-center h-screen bg-gray-100">
    <div class="bg-white p-8 rounded-lg shadow-lg w-96">
        <h2 class="text-2xl font-bold text-center mb-6">교보문고 로그인</h2>
        <form action="#" method="POST">
            <div class="mb-4">
                <label for="username" class="block text-gray-700">아이디</label>
                <input type="text" id="username" name="username" class="w-full px-4 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500">
            </div>
            <div class="mb-4">
                <label for="password" class="block text-gray-700">비밀번호</label>
                <input type="password" id="password" name="password" class="w-full px-4 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500">
            </div>
            <button type="submit" class="w-full bg-blue-500 text-white py-2 rounded-lg hover:bg-blue-600">로그인</button>
        </form>
        <div class="text-center mt-4">
            <a href="#" class="text-blue-500 text-sm">아이디 찾기</a> | 
            <a href="#" class="text-blue-500 text-sm">비밀번호 찾기</a>
        </div>
        <div class="text-center mt-4">
            <a href="#" class="text-blue-500 text-sm">회원가입</a>
        </div>
    </div>
</body>
</html>