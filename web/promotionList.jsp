<%-- 
    Document   : promotionList
    Created on : Jun 21, 2021, 2:47:10 PM
    Author     : Thang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Promotion List</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
    <style>
    body {
        color: #566787;
        background: #f5f5f5;
        font-family: 'Varela Round', sans-serif;
        font-size: 13px;
    }
    
    .table-wrapper {
        min-width: 1000px;
        background: #fff;
        padding: 20px 25px;
        border-radius: 3px;
        box-shadow: 0 1px 1px rgba(0,0,0,.05);
    }
    .table-title {
        padding-bottom: 15px;
        background: #299be4;
        color: #fff;
        padding: 16px 30px;
        margin: -20px -25px 10px;
        border-radius: 3px 3px 0 0;
    }
    .table-title h2 {
        margin: 5px 0 0;
        font-size: 24px;
    }
    .table-title .btn {
        color: #566787;
        float: right;
        font-size: 13px;
        background: #fff;
        border: none;
        min-width: 50px;
        border-radius: 2px;
        border: none;
        outline: none !important;
        margin-left: 10px;
    }
    .table-title .btn:hover, .table-title .btn:focus {
        color: #566787;
        background: #f2f2f2;
    }
    .table-title .btn i {
        float: left;
        font-size: 21px;
        margin-right: 5px;
    }
    .table-title .btn span {
        float: left;
        margin-top: 2px;
    }
    table.table tr th, table.table tr td {
        border-color: #e9e9e9;
        padding: 12px 15px;
        vertical-align: middle;
    }
    table.table tr th:first-child {
        width: 60px;
    }
    table.table tr th:last-child {
        width: 100px;
    }
    table.table-striped tbody tr:nth-of-type(odd) {
        background-color: #fcfcfc;
    }
    table.table-striped.table-hover tbody tr:hover {
        background: #f5f5f5;
    }
    table.table th i {
        font-size: 13px;
        margin: 0 5px;
        cursor: pointer;
    }	
    table.table td:last-child i {
        opacity: 0.9;
        font-size: 22px;
        margin: 0 5px;
    }
    table.table td a {
        font-weight: bold;
        color: #566787;
        display: inline-block;
        text-decoration: none;
    }
    table.table td a:hover {
        color: #2196F3;
    }
    table.table td a.addtolist {
        color: green;
    }
    table.table td a.settings {
        color: #2196F3;
    }
    table.table td a.delete {
        color: #F44336;
    }
    table.table td i {
        font-size: 19px;
    }
    table.table .avatar {
        border-radius: 50%;
        vertical-align: middle;
        margin-right: 10px;
    }
    .status {
        font-size: 30px;
        margin: 2px 2px 0 0;
        display: inline-block;
        vertical-align: middle;
        line-height: 10px;
    }
    .text-success {
        color: #10c469;
    }
    .text-info {
        color: #62c9e8;
    }
    .text-warning {
        color: #FFC107;
    }
    .text-danger {
        color: #ff5b5b;
    }
    .pagination {
        float: right;
        margin: 0 0 5px;
    }
    .pagination li a {
        border: none;
        font-size: 13px;
        min-width: 30px;
        min-height: 30px;
        color: #999;
        margin: 0 2px;
        line-height: 30px;
        border-radius: 2px !important;
        text-align: center;
        padding: 0 6px;
    }
    .pagination li a:hover {
        color: #666;
    }	
    .pagination li.active a, .pagination li.active a.page-link {
        background: #03A9F4;
    }
    .pagination li.active a:hover {        
        background: #0397d6;
    }
    .pagination li.disabled i {
        color: #ccc;
    }
    .pagination li i {
        font-size: 16px;
        padding-top: 6px
    }
    .hint-text {
        float: left;
        margin-top: 10px;
        font-size: 13px;
    }
    .search-box {
        position: relative;        
        float: right;
    }
    .search-box input {
        height: 34px;
        border-radius: 20px;
        padding-left: 35px;
        border-color: #ddd;
        box-shadow: none;
    }
    .search-box input:focus {
        border-color: #3FBAE4;
    }
    .search-box i {
        color: #a0a5b1;
        position: absolute;
        font-size: 19px;
        top: 8px;
        left: 10px;
    }
    .profile-img-card {
        width: 125px;
        height: 125px;
        margin: 0 auto 10px;
        display: block;
        -moz-border-radius: 50%;
        -webkit-border-radius: 50%;
        border-radius: 50%;
    }
    .modal-confirm {		
	color: #434e65;
	width: 525px;
    }
    .modal-confirm .modal-content {
            padding: 20px;
            font-size: 16px;
            border-radius: 5px;
            border: none;
    }
    .modal-confirm .modal-header {
            background: #47c9a2;
            border-bottom: none;   
            position: relative;
            text-align: center;
            margin: -20px -20px 0;
            border-radius: 5px 5px 0 0;
            padding: 35px;
    }
    .modal-confirm h4 {
            text-align: center;
            font-size: 36px;
            margin: 10px 0;
    }
    .modal-confirm .form-control, .modal-confirm .btn {
            min-height: 40px;
            border-radius: 3px; 
    }
    .modal-confirm .close {
            position: absolute;
            top: 15px;
            right: 15px;
            color: #fff;
            text-shadow: none;
            opacity: 0.5;
    }
    .modal-confirm .close:hover {
            opacity: 0.8;
    }
    .modal-confirm .icon-box {
            color: #fff;		
            width: 95px;
            height: 95px;
            display: inline-block;
            border-radius: 50%;
            z-index: 9;
            border: 5px solid #fff;
            padding: 15px;
            text-align: center;
    }
    .modal-confirm .icon-box i {
            font-size: 64px;
            margin: -4px 0 0 -4px;
    }
    .modal-confirm.modal-dialog {
            margin-top: 80px;
    }
    .modal-confirm .btn, .modal-confirm .btn:active {
            background: #47c9a2 !important;
            color: #fff;
            border: none;
    }
    .modal-confirm .btn:hover, .modal-confirm .btn:focus {
            background: #2c9777 !important;
            outline: none;
    }
    .modal-confirm-fail {		
            color: #434e65;
            width: 525px;
    }
    .modal-confirm-fail .modal-content {
            padding: 20px;
            font-size: 16px;
            border-radius: 5px;
            border: none;
    }
    .modal-confirm-fail .modal-header {
            background: #e85e6c;
            border-bottom: none;   
            position: relative;
            text-align: center;
            margin: -20px -20px 0;
            border-radius: 5px 5px 0 0;
            padding: 35px;
    }
    .modal-confirm-fail h4 {
            text-align: center;
            font-size: 36px;
            margin: 10px 0;
    }
    .modal-confirm-fail .form-control, .modal-confirm .btn {
            min-height: 40px;
            border-radius: 3px; 
    }
    .modal-confirm-fail .close {
            position: absolute;
            top: 15px;
            right: 15px;
            color: #fff;
            text-shadow: none;
            opacity: 0.5;
    }
    .modal-confirm-fail .close:hover {
            opacity: 0.8;
    }
    .modal-confirm-fail .icon-box {
            color: #fff;		
            width: 95px;
            height: 95px;
            display: inline-block;
            border-radius: 50%;
            z-index: 9;
            border: 5px solid #fff;
            padding: 15px;
            text-align: center;
    }
    .modal-confirm-fail .icon-box i {
            font-size: 58px;
            margin: -2px 0 0 -2px;
    }
    .modal-confirm-fail.modal-dialog {
            margin-top: 80px;
    }
    .modal-confirm-fail .btn, .modal-confirm-fail .btn:active {
            color: #fff;
            border-radius: 4px;
            background: #e85e6c !important;
            border: none;
    }
    .modal-confirm-fail .btn:hover, .modal-confirm-fail .btn:focus {
            background: #da1f32 !important;
            outline: none;
    }
    </style>
    <script>
        $(document).ready(function(){
                $('[data-toggle="tooltip"]').tooltip();
                $('[data-toggle="modal"]').tooltip();
        });
        
        function initCheck() {
            <c:if test="${requestScope.UPDATERANKERROR}">
                $("#updatePromotionFail").modal();
            </c:if>
        };
    </script>
    </head>
    <body onload="initCheck()">
        <c:if test="${not empty sessionScope.USER}">
            <c:if test="${sessionScope.ADMIN}">
                <div style="width: 100%">
                    <div class="table-responsive">
                        <div class="table-wrapper">
                            <div class="table-title">
                                <div class="row">
                                    <div class="col-sm-5">
                                        <h2>Promotion <b>List</b></h2>
                                    </div>
                                    <div class="col-sm-7">		
                                        <a href="initSearch" class="btn btn-secondary"><i class="material-icons">&larr;</i> <span>Back to admin page</span></a>	
                                    </div>
                                </div>
                            </div>
                            <div>
                                Welcome, <b>${sessionScope.USER}</b> <a href="logout">Log out</a>
                            </div>
                            <c:set var="promoList" value="${sessionScope.PROMOTIONLIST}" />
                            <c:if test="${not empty promoList}">
                                <c:set var="items" value="${promoList.items}"/>
                                <table class="table table-striped table-hover" style="margin-top: 10px;">
                                    <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>User Id</th>						
                                            <th>Rank</th>
                                            <th>Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="item" items="${items}" varStatus="counter">
                                            <tr>
                                                <form action="updateItem">
                                                <td>${counter.count}</td>
                                                <td>
                                                    ${item.key}
                                                    <input type="hidden" name="txtUserID" value="${item.key}"/>
                                                </td>
                                                <td style="width: 30%;">
                                                    <input type="text" 
                                                           class="form-control" 
                                                           name="txtRank" 
                                                           value="${item.value}"
                                                           oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" 
                                                           required
                                                           />
                                                </td>
                                                <td style="width: 15%;" >
                                                    <c:url var="removeLink" value="removeItem">
                                                        <c:param name="txtUserID" value="${item.key}" />
                                                    </c:url>
                                                    <input type="submit" style="margin-bottom: 10px;" data-toggle="tooltip" class="btn setting" title="Update" value="Update"/>
                                                    <a href="#" data-toggle="modal" data-target="#${item.key}confirm-remove" class="delete" title="Remove"><i class="material-icons">&#xE5C9;</i></a>
                                                </td>
                                                </form>
                                            </tr>
                                            <%-- delete modal --%>
                                            <div class="modal fade" id="${item.key}confirm-remove" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                                <div class="modal-dialog">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <h5 class="modal-title" id="exampleModalLabel">Confirm Delete</h5>
                                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                              <span aria-hidden="true">&times;</span>
                                                            </button>
                                                          </div>
                                                        <div class="modal-body" style="font-size: 1rem;">
                                                            <p>You are about to remove this user from the promotion list.</p>
                                                            <p>Do you want to remove?</p>
                                                        </div>
                                                        <div class="modal-footer">
                                                            <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                                                            <a href="${removeLink}" class="btn btn-danger" style="color: white;">Remove</a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:forEach>
                                        <tr>
                                            <td colspan="3"></td>
                                            <td>
                                                <form action="confirmPromotion"><input class="btn btn-primary" type="submit" value="Confirm"/></form>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </c:if>
                            <c:if test="${empty promoList}">
                                <div class="pl-3" style="font-size: 1.5rem;">
                                    No promotion list !
                                </div>
                            </c:if>
                        </div>
                    </div>
                </div>
                          
                <%--update promotion list fail modal --%>
                <div id="updatePromotionFail" class="modal fade">
                    <div class="modal-dialog modal-confirm-fail">
                            <div class="modal-content">
                                    <div class="modal-header justify-content-center">
                                            <div class="icon-box">
                                                <i class="material-icons" style="list-style-type: none;">&#xE14C;</i>
                                            </div>
                                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                    </div>
                                    <div class="modal-body text-center">
                                            <h4>OOPS!</h4>	
                                            <p>The rank is not updated!</p>
                                            <p>Rank has value from 1 to 10.</p>
                                            <button type="button" class="btn btn-default" data-dismiss="modal">Ok</button>
                                    </div>
                            </div>
                    </div>
                </div> 
            </c:if>
            <c:if test="${!sessionScope.ADMIN}">
                <a href="login.jsp">Login</a>
            </c:if>
        </c:if>
        <c:if test="${empty sessionScope.USER}">
            <a href="login.jsp">Login</a>
        </c:if>
    </body>
</html>
