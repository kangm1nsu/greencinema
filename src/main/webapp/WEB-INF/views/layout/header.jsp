<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8">
            <title>GreenCinema</title>
            <link href="/img/logo_black.ico" rel="shortcut icon" type="image/x-icon">
        </head>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"></script>

        <style>
            a {
                text-decoration: none;
                color: black;
            }

            * {
                margin: 0;
                padding: 0;
            }

            * {
                box-sizing: border-box;
            }

            .header {
                margin: 0 auto;
                width: 960px;
                height: 114px;
                background-color: #fff;
                overflow: hidden;
            }

            .gnb {
                width: 100%;
                hegith: 71px;
                font-size: 12px;
                border-bottom: 1px solid #EEE;
                display: flex;
                justify-content: space-between;
                margin: 15px auto;
                margin-top: 15px;
            }

            .gnb>div>a {
                color: #656565;
            }

            .sign {
                width: 100px;
                display: flex;
                justify-content: space-between;
            }

            .logo {
                display: flex;
                justify-content: center;
            }

            .nav_bar {
                margin: 0 auto;
                margin-top: 10px;
                width: 300px;
                display: flex;
                justify-content: space-between;
            }

            .wrap {
                width: 960px;
                margin: 0 auto;
            }

            .logo img {
                width: 50px;
                height: 50px;
                margin-right: 10px;
            }
        </style>

        <body>
            <div id="header_section" class="header">
                <div class="gnb">
                    <div><a href="#">Facebook</a></div>

                    <h1 class="logo">
                        <img alt="" src="/img/logo_black.png"> <a href="#">GREEN
                            CINEMA</a>
                    </h1>
                    <div class="sign">
                        <a href="#">로그인</a>
                        <a href="#">회원가입</a>
                    </div>
                </div>
                <div id="nav" class="nav_bar">

                    <div><a href="#">예매</a></div>
                    <div>ㅣ</div>
                    <div><a href="#">영화</a></div>
                    <div>ㅣ</div>
                    <div><a href="#">스토어</a></div>
                </div>
            </div>