<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<%@ include file="../layout/header.jsp"%>

<%--필요 없는 세션 줄이기--%>
<%@ page session="false" %>

<div class="container">
    <form>
        <div class="form-group">
            <label for="username">Username:</label>
            <input type="text" class="form-control" id="username" placeholder="Enter username">
        </div>
        <div class="form-group">
            <label for="password">Password:</label>
            <input type="password" class="form-control" id="password" placeholder="Enter password">
        </div>
        <div class="form-group">
            <label for="email">Email address:</label>
            <input type="email" class="form-control" id="email" placeholder="Enter email">
        </div>
    </form>
    <button id="btn-save" class="btn btn-primary">회원가입</button>
</div>
<%@ include file="../layout/footer.jsp"%>
<script src="/js/user.js"></script>