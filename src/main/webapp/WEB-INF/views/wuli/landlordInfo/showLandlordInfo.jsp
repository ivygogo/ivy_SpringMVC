<%@ page contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script>

  $.getJSON('/getLandlordInfoGson').then(res => {
    console.log(res);
    $("#LandlordName >h3").text(res.resultData.name);
    $("#LandlordPhone >h3").text(res.resultData.phone);
    let landlordAddress = res.resultData.county + res.resultData.district + res.resultData.address;
    $("#LandlordAddress >h3").text(landlordAddress);
    $("#LandlordMail >h3").text(res.resultData.mail);
    let landlordStamp = res.resultData.stampImg;
    $("#LandlordStamp >img").attr("src", landlordStamp);
  })

  //window.location.reload("#LandlordStamp >img");
</script>
<div class="breadcomb-area">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="breadcomb-list">
                    <div class="row">
                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 my-3 ">
                            <div class="breadcomb-wp">
                                <div class="breadcomb-icon">
                                    <i class="notika-icon notika-form"></i>
                                </div>
                                <div class="breadcomb-ctn">
                                    <h1>會員中心－物業資訊</h1>
                                    <p>
                                        <span class="bread-ntd form-intro">歡迎使用山水苑管理系統，查看您的會員基本資料</span>
                                    </p>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-3"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<%--Breadcomb area End--%>
<%-- Form Examples area start--%>
<div class="form-example-area">
    <div class="container">
        <div class="row ">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="form-example-wrap">
                    <div class="cmp-tb-hd mx-4 my-5">
                        <h1>物業資訊</h1>
                    </div>

                    <div class="form-example-int ">
                        <div class="form-group mx-5 mt-4">
                            <h4 class="text-black">物業名稱</h4>
                            <div class="hrinfo mb-3"></div>
                            <div class="nk-int-st mx-3 mb-4 text-black-50" id="LandlordName">
                                <h3></h3>
                            </div>
                        </div>
                    </div>
                    <div class="form-example-int mt-4">
                        <div class="form-group mx-5 mt-4">
                            <h4 class="text-black mt-4">電話</h4>
                            <div class="hrinfo mb-3"></div>
                            <div class="nk-int-st mx-3 mb-4 text-black-50" id="LandlordPhone">
                                <h3></h3>
                            </div>
                        </div>
                    </div>
                    <div class="form-example-int ">
                        <div class="form-group mx-5 mt-4">
                            <h4 class="text-black">地址</h4>
                            <div class="hrinfo mb-3"></div>
                            <div class="nk-int-st mx-3 mb-4 text-black-50" id="LandlordAddress">
                                <h3></h3>
                            </div>
                        </div>
                    </div>
                    <div class="form-example-int ">
                        <div class="form-group mx-5 mt-4">
                            <h4 class="text-black">信箱</h4>
                            <div class="mb-3 hrinfo"></div>
                            <div class="nk-int-st mx-3 mb-4 text-black-50" id="LandlordMail">
                                <h3></h3>
                            </div>
                        </div>
                    </div>
                    <div class="form-example-int ">
                        <div class="form-group mx-5 mt-4">
                            <h4 class="text-black">公司章</h4>
                            <div class="mb-3 hrinfo"></div>
                            <div class="nk-int-st mx-3 mb-4 text-black-50" id="LandlordStamp">
                             <img src=" " alt="">
                            </div>
                        </div>
                    </div>
                    <div class="" style="display: flex; justify-content: center;">
                        <button class="btn btn-edit" id="editLandlordinfo"
                                onclick="updateLandlordinfo()">編輯資料
                        </button>
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12"></div>
        </div>
    </div>
</div>
