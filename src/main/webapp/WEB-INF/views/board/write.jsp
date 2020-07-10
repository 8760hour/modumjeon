<%@ page import="java.io.File" %><%--
  Created by IntelliJ IDEA.
  User: jenny
  Date: 2020-06-17
  Time: 오후 4:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script src="/smarteditor2/js/HuskyEZCreator.js" charset="utf-8"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>


    <title>글쓰기</title>
    <style>
        .container {
            margin: 0 auto;
            margin-top: 3%;
            margin-bottom: 3%;
            text-align: center;
            width: 80%;
        }

        .formTable {
            width: 100%;
        }

        .container[id="saveBtn"] {
            text-align: center;
        }
    </style>
</head>
<body>
<header>
    <h1><a href="#">모둠전</a></h1>
</header>
<div class="menubar">
    <%@include file="/WEB-INF/views/navbar.jsp" %>
</div>

<div class="container">
    <form id="insert_Form" method="post" enctype="multipart/form-data" action="/board/insert.do">
        <table class="formTable">
            <tr>
                <td>제목</td>
                <td><input name="B_Title" id="B_Title" placeholder="글 제목 입력"></td>
            </tr>
            <tr>
                <td>비밀번호</td>
                <td><input name="B_Password" id="B_Password" placeholder="비밀번호 입력"></td>
            </tr>
            <tr>
                <td>이름</td>
                <td><input name="B_Writer" id="B_Writer" placeholder="이름 입력"></td>
            </tr>
            <tr>
                <td>내용</td>
                <td>

                    <textarea name="B_Context" id="smartEditor" rows="10" cols="100"
                              style="width:100%; height:412px;">
                    </textarea>
                </td>
            </tr>
            <tr>
                <td>
                    <input type="button" id="saveBtn" value="확인"/>
                </td>
            </tr>
        </table>
    </form>
</div>
<script type="text/javascript">
    $(document).ready(function () {
        var oEditors = [];

        nhn.husky.EZCreator.createInIFrame({
            oAppRef: oEditors,
            elPlaceHolder: "smartEditor", //저는 textarea의 id와 똑같이 적어줬습니다.
            sSkinURI: "/smarteditor2/SmartEditor2Skin.html", //경로를 꼭 맞춰주세요!
            fCreator: "createSEditor2",
            htParams: {
                bUseToolbar: true,
                bUseVerticalResizer: true,
                bUseModeChanger: true,
                fOnBeforeUnload: function () {
                }
            }
        });
        $("#saveBtn").click(function () {
            oEditors.getById["smartEditor"].exec("UPDATE_CONTENTS_FIELD", []);
            $("#insert_Form").submit();
        });
    });

    var pasteHTML = function (filename) {                     //업로드한 사진을 화면에 보여주게 만드는 스크립트입니다.
        var sHTML = '<img src="${pageContext.request.contextPath}/image/uploadFile/' + filename + '">'; //사진이 저장된 경로입니다.
        oEditors.getById["smartEditor"].exec("PASTE_HTML", [sHTML]);

    };
</script>

</body>
</html>

