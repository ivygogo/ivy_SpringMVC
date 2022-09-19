<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page buffer="8192kb" autoFlush="true" %>
<% String editState = request.getParameter("edit");
    //System.out.print("editState"+editState);
    if (editState != null && editState.equals("drop")) {
        //request.setAttribute("guarantorIsInvalid", false);
        session.setAttribute("isInvalid", false);
        //request.setAttribute("RefundIsInvalid", false);

        //System.out.print("editState:::::"+editState);
    }
%>
<!doctype html>
<html class="no-js" lang="">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>山水苑後台 | 物業管理系統</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- favicon
        ============================================ -->
    <link rel="shortcut icon"
          type="${pageContext.request.contextPath}/image/x-icon"
          href="img/favicon.ico">
    <!-- Google Fonts
                ============================================ -->
    <link
            href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,700,900"
            rel="stylesheet">
    <!-- Bootstrap CSS
                ============================================ -->
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/bootstrap.min.css">

    <!-- owl.carousel CSS
                ============================================ -->
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/owl.carousel.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/owl.theme.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/owl.transitions.css">
    <!-- meanmenu CSS
                ============================================ -->
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/meanmenu/meanmenu.min.css">
    <!-- animate CSS
                ============================================ -->
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/animate.css">
    <!-- summernote CSS
        ============================================ -->
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/summernote/summernote.css">
    <!-- Range Slider CSS
                ============================================ -->
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/themesaller-forms.css">

    <!-- normalize CSS
                ============================================ -->
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/normalize.css">
    <!-- mCustomScrollbar CSS
                ============================================ -->
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/scrollbar/jquery.mCustomScrollbar.min.css">
    <!-- bootstrap select CSS
        ============================================ -->
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/bootstrap-select/bootstrap-select.css">
    <!-- datapicker CSS
                ============================================ -->
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/datapicker/datepicker3.css">
    <!-- Color Picker CSS
                ============================================ -->
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/color-picker/farbtastic.css">
    <!-- main CSS
                ============================================ -->
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/chosen/chosen.css">

    <!-- notification CSS
        ============================================ -->
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/notification/notification.css">
    <!-- dropzone CSS
        ============================================ -->
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/dropzone/dropzone.css">
    <!-- jvectormap CSS
                ============================================ -->
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/jvectormap/jquery-jvectormap-2.0.3.css">
    <!-- notika icon CSS
                ============================================ -->
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/notika-custom-icon.css">
    <!-- wave CSS
                ============================================ -->
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/wave/waves.min.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/wave/button.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/font-awesome.min.css">
    <!-- main CSS
                ============================================ -->
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/main.css">
    <!-- style CSS
                ============================================ -->
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/style.css">
    <!-- responsive CSS
                ============================================ -->
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/responsive.css">
    <!-- modernizr JS
                ============================================ -->
    <script
            src="${pageContext.request.contextPath}/js/vendor/modernizr-2.8.3.min.js"></script>
    <!-- cropper CSS
        ============================================-->
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/cropper/cropper.min.css">
    <script
            src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
    <script
            src="${pageContext.request.contextPath}/file/jquery.twzipcode.js"></script>
    <script
            src="https://code.jquery.com/jquery-2.2.4.js"
            integrity="sha256-iT6Q9iMJYuQiMWNd9lDyBUStIq/8PuOW33aOqmvFpqI="
            crossorigin="anonymous"></script>

</head>
<script>


  function updateLandlordinfo() {
    innerPage = "updateRefundinfo";
    if (innerPage == "updateRefundinfo") {
      $('#profile').html("");
      $('#profile').load('landlordInfo/editLandlordInfo');
    }
    $("html,body").animate(
        {
          scrollTop: 0,
        },
        600
    );

  }

  function dropForm() {

    $('#profile').html("");
    $('#profile').load('/landlordInfo/showLandlordInfo.jsp?edit=drop');
    //document.location.href="/home/MemberInfo.do"
    document.location.href = "/memberInfo.jsp?edit=drop"

  }

</script>
<body>

<!-- 選單-->
<jsp:include page="fragment/menu_index.jsp"/>





<!-- Breadcomb area Start-->
<!-- 內容 -->

<div class="" id="profile">
    <c:choose>
        <c:when test="${isInvalid==true}">
            <jsp:include page="landlordInfo/validLandlordInfo.jsp"/>

        </c:when>
        <c:otherwise>
            <jsp:include page="landlordInfo/showLandlordInfo.jsp"/>

        </c:otherwise>
    </c:choose>

</div>


<!-- Start Footer area-->

<jsp:include page="fragment/footer.jsp"/>
<!-- End Footer area-->


<!-- bootstrap JS============================================ -->
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>

<!-- wow JS============================================ -->
<script src="${pageContext.request.contextPath}/js/wow.min.js"></script>

<!-- price-slider JS============================================ -->
<script
        src="${pageContext.request.contextPath}/js/jquery-price-slider.js"></script>

<!-- owl.carousel JS
============================================ -->
<script src="${pageContext.request.contextPath}/js/owl.carousel.min.js"></script>

<!-- scrollUp JS
============================================ -->
<script
        src="${pageContext.request.contextPath}/js/jquery.scrollUp.min.js"></script>

<!-- meanmenu JS
============================================ -->
<script
        src="${pageContext.request.contextPath}/js/meanmenu/jquery.meanmenu.js"></script>

<!-- counterup JS
============================================ -->
<script
        src="${pageContext.request.contextPath}/js/counterup/jquery.counterup.min.js"></script>
<script
        src="${pageContext.request.contextPath}/js/counterup/waypoints.min.js"></script>
<script
        src="${pageContext.request.contextPath}/js/counterup/counterup-active.js"></script>

<!-- mCustomScrollbar JS
============================================ -->
<script
        src="${pageContext.request.contextPath}/js/scrollbar/jquery.mCustomScrollbar.concat.min.js"></script>

<!-- sparkline JS
============================================ -->
<script
        src="${pageContext.request.contextPath}/js/sparkline/jquery.sparkline.min.js"></script>
<script
        src="${pageContext.request.contextPath}/js/sparkline/sparkline-active.js"></script>

<!-- flot JS
============================================ -->
<script src="${pageContext.request.contextPath}/js/flot/jquery.flot.js"></script>
<script
        src="${pageContext.request.contextPath}/js/flot/jquery.flot.resize.js"></script>
<script src="${pageContext.request.contextPath}/js/flot/flot-active.js"></script>

<!-- knob JS
============================================ -->
<script src="${pageContext.request.contextPath}/js/knob/jquery.knob.js"></script>
<script
        src="${pageContext.request.contextPath}/js/knob/jquery.appear.js"></script>
<script src="${pageContext.request.contextPath}/js/knob/knob-active.js"></script>

<!-- icheck JS
============================================ -->
<script
        src="${pageContext.request.contextPath}/js/icheck/icheck.min.js"></script>
<script
        src="${pageContext.request.contextPath}/js/icheck/icheck-active.js"></script>

<!--  Chat JS
============================================ -->
<script src="${pageContext.request.contextPath}/js/chat/jquery.chat.js"></script>

<!--  todo JS
============================================ -->
<script src="${pageContext.request.contextPath}/js/todo/jquery.todo.js"></script>

<!--  wave JS
============================================ -->
<script src="${pageContext.request.contextPath}/js/wave/waves.min.js"></script>
<script src="${pageContext.request.contextPath}/js/wave/wave-active.js"></script>

<!-- autosize JS
============================================ -->
<script src="${pageContext.request.contextPath}/js/autosize.min.js"></script>

<!-- plugins JS
============================================ -->
<script src="${pageContext.request.contextPath}/js/plugins.js"></script>

<!-- main JS
============================================ -->
<script src="${pageContext.request.contextPath}/js/main.js"></script>

<!-- tawk chat JS
============================================ -->
<script src="${pageContext.request.contextPath}/js/tawk-chat.js"></script>

<!-- Input Mask JS
============================================ -->
<script
        src="${pageContext.request.contextPath}/js/jasny-bootstrap.min.js"></script>

<!-- icheck JS
============================================ -->
<script
        src="${pageContext.request.contextPath}/js/icheck/icheck.min.js"></script>
<script
        src="${pageContext.request.contextPath}/js/icheck/icheck-active.js"></script>


<!-- rangle-slider JS
============================================ -->
<script
        src="${pageContext.request.contextPath}/js/rangle-slider/jquery-ui-1.10.4.custom.min.js"></script>
<script
        src="${pageContext.request.contextPath}/js/rangle-slider/jquery-ui-touch-punch.min.js"></script>
<script
        src="${pageContext.request.contextPath}/js/rangle-slider/rangle-active.js"></script>

<!-- datapicker JS
============================================ -->
<script
        src="${pageContext.request.contextPath}/js/datapicker/bootstrap-datepicker.js"></script>


<!-- bootstrap select JS
============================================ -->
<script
        src="${pageContext.request.contextPath}/js/bootstrap-select/bootstrap-select.js"></script>
<!--  color-picker JS
============================================ -->
<script
        src="${pageContext.request.contextPath}/js/color-picker/farbtastic.min.js"></script>
<script
        src="${pageContext.request.contextPath}/js/color-picker/color-picker.js"></script>

<!--  notification JS
============================================ -->
<script
        src="${pageContext.request.contextPath}/js/notification/bootstrap-growl.min.js"></script>
<script
        src="${pageContext.request.contextPath}/js/notification/notification-active.js"></script>

<!--  summernote JS
        ============================================ -->
<script
        src="${pageContext.request.contextPath}/js/summernote/summernote-updated.min.js"></script>
<script
        src="${pageContext.request.contextPath}/js/summernote/summernote-active.js"></script>

<!-- dropzone JS
============================================ -->
<script
        src="${pageContext.request.contextPath}/js/dropzone/dropzone.js"></script>
<!--  chosen JS
============================================ -->
<script
        src="${pageContext.request.contextPath}/js/chosen/chosen.jquery.js"></script>

<!-- cropper JS
============================================ -->
<script
        src="${pageContext.request.contextPath}/js/cropper/cropper.min.js"></script>
<script
        src="${pageContext.request.contextPath}/js/cropper/cropper-actice.js"></script>
<script
        src="${pageContext.request.contextPath}/file/jquery.twzipcode.min.js"></script>
</body>

</html>
