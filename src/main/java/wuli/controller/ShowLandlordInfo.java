package wuli.controller;

import com.google.gson.Gson;
import java.io.IOException;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import wuli.model.LandlordInfo;
import wuli.service.LandlordService;
@RequestMapping(value = {"/", "/wuli"})
@Controller
public class ShowLandlordInfo {
  LandlordService landlordService;
  ProcessImg processImg;
  int memberIdForTest = 1;

  @Autowired
  public ShowLandlordInfo(LandlordService landlordService, ProcessImg processImg) {
    this.landlordService = landlordService;
    this.processImg = processImg;
  }

  //導首頁
  @RequestMapping(value = {"/index", "/"})
  public String showIndexView(Model model) {
    return "wuli/index";
  }

  //導會員資料頁
  @GetMapping(value ={"memberInfo"})
  public String showLandlordInfoView(Model model) {
    return "wuli/memberInfo";
  }

  //導會員資料頁
  @ResponseBody
  @GetMapping("/getLandlordInfoGson")
  public String getLandlordInfoGson() throws IOException {

    //1. 取得會員資料
    LandlordInfo landlordInfo = landlordService.queryLandlordInfoByPrimaryKey(memberIdForTest);
    System.out.println(landlordInfo.getStamp());
    System.out.println(landlordInfo.getName());
    System.out.println(landlordInfo.getCounty());
    //2. 取得公司章圖片
    String imgPath = System.getProperty("java.io.tmpdir") + "//images//" + landlordInfo.getStamp();
    //String imgPath = System.getProperty("java.io.tmpdir") + "//images//" + "stamp.png";
    //System.out.println("ivy!!!!"+System.getProperty("java.io.tmpdir"));
    // 3.將圖片處理成 Data URI資料
    String imgBase64 = processImg.getImageEncoderByPath(imgPath);
    String imgMimeType = processImg.getMimeTypeByFileName(landlordInfo.getStamp());
    String myimgSrc = "data:" + imgMimeType + ";" + "base64," + imgBase64;

    landlordInfo.setStampImg(myimgSrc);

    var landlordDataMap = Map.of("resultData", landlordInfo, "resultImg", myimgSrc);

    final Gson gson = new Gson();
    var landlordInfoJson = gson.toJson(landlordDataMap);
    return landlordInfoJson;
  }



//  @GetMapping("changeInfo")
//  public String changeLandlordInfo(Model model) {
//    return "wuli/index ";
//  }



}
