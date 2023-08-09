<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<%@ include file="layout/header.jsp"%>

<div class="container">
    <form action="/board" method="GET" class="form-inline p-2 bd-highlight justify-content-between">
        <div class="dropdown" style="float: left">
            <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">정렬 기준</button>
            <div class="dropdown-menu">
                <a class="dropdown-item" href="/board?category=${param.category}&page=${param.page}&sort=id,DESC&searchType=${param.searchType}&searchKeyword=${param.searchKeyword}">최신순</a>
                <a class="dropdown-item" href="/board?category=${param.category}&page=${param.page}&sort=count,DESC&searchType=${param.searchType}&searchKeyword=${param.searchKeyword}">인기순</a>
                <a class="dropdown-item" href="/board?category=${param.category}&page=${param.page}&sort=recommendCount,DESC&searchType=${param.searchType}&searchKeyword=${param.searchKeyword}">추천순</a>
            </div>
        </div>
        <div style="float: right">
            <select id="select" class="form-control" onchange="selectSearchType()">
                <option value="title">제목</option>
                <option value="nickname">작성자</option>
            </select>
            <input type="hidden" name="searchType" id="searchType" value="title">
            <input type="text" name="searchKeyword" id="searchKeyword" class="form-control" placeholder="검색">
            <button type="submit" class="btn btn-primary"><i class="fa-solid fa-search"></i> 검색</button>
        </div>
    </form>
    <table class="table table-hover">
        <thead>
        <tr>
            <th style="font-weight: bold;">No.</th>
            <th style="font-weight: bold;">Title</th>
            <th style="font-weight: bold;">Writer</th>
            <th style="font-weight: bold;">Created</th>
            <th style="font-weight: bold;">View</th>
            <th style="font-weight: bold;">Recommend</th>
        </tr>
        </thead>
        <c:forEach var="board" items="${board.content}">
            <c:set var="user" value="[${Integer.toString(principal.user.id)}]" />
            <tbody style="<c:if test='${fn:contains(board.seen, user)}'>color: gray;</c:if>">
            <tr onclick="location.href='/board/${board.id}/?page=${param.page}&sort=${param.sort}&searchType=${param.searchType}&searchKeyword=${param.searchKeyword}&sortType=${param.sortType}'" style="cursor: pointer;">
                <th>${board.id}</th>
                <th>${board.title}<c:if test="${fn:length(board.replys) > 0}">
                    <span style="color: red;">[${fn:length(board.replys)}]</span>
                    </c:if>
                </th>
                <th>${board.user.nickname}</th>
                <th>${board.createDate}</th>
                <th>${board.count}</th>
                <th>${board.recommendCount}</th>
            </tr>
            </tbody>
        </c:forEach>
    </table>
    <br>

    <div style="text-align: right">
        <button class="btn btn-info" onclick="location.href='/board/writeForm'"><i class="fa-solid fa-pen"></i> 글쓰기</button>
    </div>
    <c:set var="startPage" value="${board.number - board.number % 5}" />
    <ul class="pagination justify-content-center">
        <a class="page-link" href="/board?category=${param.category}&page=${startPage - 5}&sort=${param.sort}&searchType=${param.searchType}&searchKeyword=${param.searchKeyword}"><</a>
        <c:forEach var="page" begin="1" end="5">
            <c:if test="${(startPage + page) <= board.totalPages}">
                <li class="page-item <c:if test='${board.number eq startPage + page - 1}'>active</c:if>"><a class="page-link" href="/board?page=${startPage + page - 1}&sort=${param.sort}&searchType=${param.searchType}&searchKeyword=${param.searchKeyword}">${startPage + page}</a></li>
            </c:if>
        </c:forEach>
        <li class="page-item <c:if test='${startPage + 5 > board.totalPages}'>disabled</c:if>"><a class="page-link" href="/board?page=${startPage + 5}&sort=${param.sort}&searchType=${param.searchType}&searchKeyword=${param.searchKeyword}">></a></li>
    </ul>
</div>
<br>
<script src="/js/board.js"></script>
<%@ include file="layout/footer.jsp"%>