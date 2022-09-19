<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<script type="text/javascript">
landlordCounty="";
landlordDistrict="";

$.getJSON('getLandlordInfoGson').then(res => {
    <%--console.log(res);--%>
    //$("input[name='landlordName']").val(res.resultData.name);
    //$("input[name='landlordPhone']").val(res.resultData.phone);
    landlordCounty += res.county;
    landlordDistrict += res.district;
    
    $("#zipzip").twzipcode('set', {
        'county': landlordCounty,
        'district': landlordDistrict,
        
    });
    
    $('.selectpicker').selectpicker('refresh');
    //$("input[name='landlordAddress']").val(res.resultData.address);
    //$("input[name='landlordMail']").val(res.resultData.mail);
   
    $("#desc").text(res.stamp);
    let landlordStamp = res.stampImg;
    $('.preview').attr("src" , landlordStamp);
   
}) 
 
 
$(function(){
	document.getElementById('upload_img').onchange = fileChange
	function fileChange(){
	     let file = document.getElementById('upload_img').files[0]
	     message = file.name
	     document.getElementById('desc').textContent = message;
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
          'countySel' : "" ,
          'districtSel' : "" ,
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
	<%--Form Examples area start--%>
	<form:form  method="POST" modelAttribute="LandlordInfo"
			   enctype='multipart/form-data' >
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
											<form:input type="text" name="landlordName"
												cssClass="form-control input-lg "
														placeholder="Input Large" path="name"/>
										</div>
									</div>
								</div>
							</div>

							<div class="row mx-5 mt-3">
								<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
									<h4 class="text-black">電話</h4>
									<div class="form-group">
										<div class="nk-int-st">
											<form:input type="text" name="landlordPhone"
														cssClass="form-control input-lg "
														placeholder="Input Large" path="phone"/>
										</div>
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
														<form:input type="text"
																name="landlordAddress"  cssClass="form-control input-lg "
															placeholder="Input Large" path="address"/>
													</div>
												</div>
											</div>
										</div>

									</div>


								</div>
							</div>

							<div class="row mx-5">
								<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
									<h4 class="text-black">信箱</h4>
									<div class="form-group">
										<div class="nk-int-st">
											<form:input type="email" name="landlordMail"
														cssClass="form-control input-lg"
															placeholder="Input Large"
														required="required"  path="mail"/>
										</div>
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
													<img class="preview my-2"
														style="max-height: 280px; display:block; margin:auto;">
												</div>
											</div>
											<div class="row mx-1 my-3">
												<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
													<div class="size mt-1"></div>
													<div id="desc" class="mt-1"></div>
													
												</div>
											</div>

											<div class="btn-group images-cropper-pro">
												<label class="btn btn-edit img-cropper-cp">
													<form:input path="uploadImg"
													id="upload_img" style="display: none;" type="file"
													cssClass="upl" name="file"
													accept="image/png, image/jpeg, image/jpg"/>
													<i class="fa fa-photo"></i> 上傳圖片
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
                  <button class="btn btn-edit mx-5" onclick="dropForm()" id="dropIt">放棄儲存</button>
                </div>
              </div>
							</div>
							
						</div>
					</div>
				</div>
				
			</div>
	</form:form>