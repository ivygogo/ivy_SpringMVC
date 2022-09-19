<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<script type="text/javascript">
landlordCounty="";
landlordDistrict="";
var resultJson =`${landlordInfoJson}`;
var errJson =`${errMsgsJson}`;
//alert(resultJson)

$(function(){
if(resultJson.length!=0){
const objResult = JSON.parse(resultJson);
$("input[name='landlordName']").val(objResult.result.name);
$("input[name='landlordPhone']").val(objResult.result.phone);
landlordCounty += objResult.result.county;
landlordDistrict += objResult.result.district;

$("#zipzip").twzipcode('set', {
    'county': objResult.result.county,
    'district': objResult.result.district,
});
$("input[name='landlordAddress']").val(objResult.result.address);

$("input[name='landlordMail']").val(objResult.result.mail);
let landlordStamp =`${imgSrc}`;
$("#preview").attr("src" , landlordStamp);
$("#desc").text(objResult.result.stamp);

}
});
 
 
$(function(){
	document.getElementById('upload_img').onchange = fileChange
	function fileChange(){
	     let file = document.getElementById('upload_img').files[0]
	     // console.log(file);
	     //let message = `${file.name}`;
	     message = file.name
	     document.getElementById('desc').textContent = message;
	     //alert(message)
	 }
	 
	
 function format_float(num, pos){
     var size = Math.pow(10, pos);
     return Math.round(num * size) / size;
 }

 function preview(input) {
     if (input.files && input.files[0]) {
         var reader = new FileReader();
         reader.onload = function (e) {

             $('.preview').attr('src', e.target.result);
             var KB = format_float(e.total / 1024, 2);
             $('.size').text("檔案大小：" + KB + " KB");
         }
         reader.readAsDataURL(input.files[0]);
     }
 }

 $("body").on("change", ".upl", function (){
     preview(this);
 })
})

$(function() {
        $('#zipzip').twzipcode({
          'countySel' : landlordCounty,
          'districtSel' : landlordDistrict,
          zipcodeIntoDistrict : true,
          css : [ "county form-control", "district form-control" ],
          countyName : "county", 
          districtName : "district", 
          onCountySelect : changecb,
          onDistrictSelect : changecb
        });
        var el = document.querySelectorAll("select");

        el[0].className = "selectpicker";
        el[0].id = "inputState";
        el[1].className = "selectpicker";
        el[1].id = "inputState2";

        function changecb() {
          var county = $('#zipzip').twzipcode('get', 'county');
          var district = $('#zipzip').twzipcode('get', 'district');
          $('.selectpicker').selectpicker('refresh');
        }
      });
     
  $(function() {
      var oldChild = document.getElementById('inputState');
      
      var wrapper = document.createElement('div');
      wrapper.className = "col-lg-3 col-md-6 col-sm-6 col-xs-12"
      
      var wrapper2 = document.createElement('div');
      wrapper2.className = "bootstrap-select fm-cmp-mg pt-2"
      
      var oldParent = document.getElementById('zipzip');
      
      oldParent.appendChild(wrapper);
      wrapper.appendChild(wrapper2);
      wrapper2.appendChild(oldChild);
      
      
      var oldChild2 = document.getElementById('inputState2');
      var wrapper3 = document.createElement('div');
      wrapper3.className = "col-lg-3 col-md-6 col-sm-6 col-xs-12";
      
      
      var wrapper4 = document.createElement('div');
      wrapper4.className = "bootstrap-select fm-cmp-mg pt-2";
      
      
      
      oldParent.appendChild(wrapper3);
      wrapper3.appendChild(wrapper4);
      wrapper4.appendChild(oldChild2);
    
      $('.selectpicker').selectpicker('refresh');
    })
    
$(function(){
	if(resultJson.length!=0){
	const objErr = JSON.parse(errJson);
	arr = Object.keys(objErr)
	for (let i=0 ; i<arr.length; i++){
	  if(arr[i]==="errlandlordName") {
	    $("#errlandlordName").prev().attr("class","nk-int-st-invalid");
	    $("#errlandlordName").html(objErr.errlandlordName);
	  }else if (arr[i]==="errlandlordPhone"){
	    $("#errlandlordPhone").prev().attr("class","nk-int-st-invalid");
	    $("#errlandlordPhone").html(objErr.errlandlordPhone);
	  }else if (arr[i]==="errlandlordAddress"){
	    $("#errlandlordAddress").prev().attr("class","nk-int-st-invalid");
	    $(".bootstrap-select>.btn-default").css("border-bottom","1px solid #dc3545");
	      $("#errlandlordAddress").html(objErr.errlandlordAddress);
	  }else if (arr[i]==="errlandlordMail"){
	      $("#errlandlordMail").prev().attr("class","nk-int-st-invalid");
	        $("#errlandlordMail").html(objErr.errlandlordMail);
	    }
	}
	}
})    
</script>

<body>

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
										<h1>會員中心－物業資訊valid</h1>
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
	<%-- Breadcomb area End--%>
	<%-- Form Examples area start--%>
	<form action="<c:url value="/landlordInfo.do"/>" method="post" class=""
		enctype="multipart/form-data">
		<div class="form-element-area">
			<div class="container">
				<div class="row">
					<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
						<div class="form-element-list">
							<div class="basic-tb-hd mx-4 my-5">
								<h1>編輯物業資訊</h1>
							</div>
							<div class="row mx-5">
								<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
									<h4 class="text-black">物業名稱</h4>
									<div class="form-group">
										<div class="nk-int-st">
											<input type="text" name="landlordName"
												class="form-control input-lg invalid" placeholder="請輸入公司名稱 ">

										</div>
										<div class="invalid-feedback mx-1 my-2" id="errlandlordName"></div>
									</div>
								</div>
							</div>

							<div class="row mx-5 mt-3">
								<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
									<h4 class="text-black">電話</h4>
									<div class="form-group">
										<div class="nk-int-st">
											<input type="text" name="landlordPhone"
												class="form-control input-lg " placeholder="請輸入公司代表手機電話">
										</div>
										<div class="invalid-feedback mx-1 my-2" id="errlandlordPhone"></div>
									</div>
								</div>
							</div>


							<div class="row ms-5 mt-3">
								<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">


									<h4 class="text-black">地址</h4>

									<div class="row mt-4">
										<div class="form-group">
											<div class="form-row" id="zipzip"></div>

											<div class="col-lg-6 col-md-12 col-sm-12 col-xs-12">
												<div class="form-group me-5">
													<div class="nk-int-st">
														<input type="text" name="landlordAddress"
															class="form-control input-lg " placeholder="請輸入公司地址">
													</div>
												</div>
											</div>
										</div>
									</div>
									<div class="invalid-feedback mx-1 mb-4" id="errlandlordAddress"></div>

								</div>
							</div>

							<div class="row mx-5">
								<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
									<h4 class="text-black">信箱</h4>
									<div class="form-group ">
										<div class="nk-int-st">
											<input type="email" name="landlordMail"
												class="form-control input-lg" placeholder="請輸入信箱">
										</div>
										<div class="invalid-feedback mx-1 my-2" id="errlandlordMail"></div>
									</div>
								</div>
							</div>

							<div class="row mx-5 mt-4">
								<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
									<div class="form-group">
										<div class="nk-int-st">
											<h4 class="text-black">公司章</h4>
											<div class="row mx-1 my-3">
												<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 imgShow"
													id="landlordStamp">
													<img class="preview my-2" id="preview"
														style="max-height: 280px; display: block; margin: auto;">
												</div>
											</div>
											<div class="row mx-1 my-3">
												<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
													<div class="size mt-1"></div>
													<div id="desc" class="mt-1"></div>
													<div class="invalid-feedback mx-1 my-2" id="errStamp"></div>
												</div>
											</div>

											<div class="btn-group images-cropper-pro">
												<label class="btn btn-edit img-cropper-cp"> <input
													id="upload_img" style="display: none;" type="file"
													class="upl" name="file"> <i class="fa fa-photo"></i>
													上傳圖片
												</label>

											</div>

										</div>
									</div>
								</div>
							</div>

							<div class="row mx-5 mt-4">
								<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
									<div class="" style="display: flex; justify-content: center;">
										<button class="btn btn-edit">儲存資料</button>
										<button class="btn btn-edit mx-5" onclick="dropForm()"
											id="dropIt">放棄儲存</button>
									</div>
								</div>
							</div>

						</div>
					</div>
				</div>

			</div>
	</form>