<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Kyobo 회원가입</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="flex items-center justify-center h-screen bg-gray-100">
    <div class="bg-white p-8 rounded-lg shadow-lg w-96">
        <h2 class="text-2xl font-bold text-center mb-6">회원가입</h2>
        <form action="submit.jsp" method="POST">
            <div class="mb-4">
                <label for="userid" class="block text-gray-700">아이디</label>
                <input type="text" id="userid" name="userid" class="w-full px-4 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500">
            </div>
            <div class="mb-4">
                <label for="password" class="block text-gray-700">비밀번호</label>
                <input type="password" id="password" name="password" class="w-full px-4 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500">
            </div>
            <div class="mb-4">
                <label for="checkpassword" class="block text-gray-700">비밀번호 확인</label>
                <input type="password" id="checkpassword" name="checkpassword" class="w-full px-4 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500">
                <span id="password-error" class="text-red-500 text-sm">
                    <%= request.getAttribute("error") != null ? request.getAttribute("error") : "" %>
                </span>
            </div>
            <div class="mb-4">
   				<label for="name" class="block text-gray-700">이름</label>
    			<input type="text" id="name" name="name" class="w-full px-4 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500">
			</div>
            <div class="mb-4">
                <label for="email" class="block text-gray-700">이메일</label>
                <input type="email" id="email" name="email" class="w-full px-4 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500">
            </div>
            <div class="mb-4">
                <label for="phone" class="block text-gray-700">핸드폰 번호</label>
                <input type="tel" id="phone" name="phone" class="w-full px-4 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500">
            </div>
            <div class="mb-4">
                <label for="address" class="block text-gray-700">주소</label>
                <input type="text" id="address" name="address" class="w-full px-4 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500">
            </div>
            <button type="submit" class="w-full bg-green-500 text-white py-2 rounded-lg hover:bg-green-600">회원가입</button>
        </form>
    </div>
</body>
</html>