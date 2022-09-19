package wuli.controller;

import java.io.IOException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import wuli.dao.LandlordInfoDao;
import wuli.model.LandlordInfo;
import wuli.service.LandlordService;

@Controller
@RequestMapping(value = {"/", "/wuli"})
public class UpdateLandlordInfo {
  LandlordService landlordService;
  ProcessImg processImg;
  int memberIdForTest = 1;
  LandlordInfoDao landlordInfoDao;

  @Autowired
  public UpdateLandlordInfo(
      LandlordService landlordService, ProcessImg processImg) {
    this.landlordService = landlordService;
    this.processImg = processImg;
  }

  @GetMapping("landlordInfo/editLandlordInfo")
  public String showLandlordEditView(@ModelAttribute LandlordInfo lendlordInfo, Model model)
      throws IOException {
    // 1. 取得會員資料
    lendlordInfo = landlordService.queryLandlordInfoByPrimaryKey(memberIdForTest);
    model.addAttribute("LandlordInfo", lendlordInfo);
    System.out.println("讀到的memeber物件: " + lendlordInfo);
    return "wuli/landlordInfo/editLandlordInfo";
  }

  @PostMapping("landlordInfo/editLandlordInfo")
  public String editLandlordEdit(
      @ModelAttribute("LandlordInfo") LandlordInfo landlordInfo, Model model) {
    LandlordInfo oldBean = landlordService.queryLandlordInfoByPrimaryKey(memberIdForTest);
    LandlordInfo newBean = new LandlordInfo();
    int num = -1;
    String tampFilename = "";
    String tampFileSrc = "";
    String tampFileBase64 = "";
    // model.addAttribute("landlordInfo", landlordInfo);
    //    //處理圖片
    //    if (httpSession.getAttribute("num") == null) {
    //      num = 0;
    //    } else {
    //      num = (int) httpSession.getAttribute("num");
    //    }
    //    MultipartFile picture = landlordInfo.getUploadImg();
    //    String fileName = picture.getOriginalFilename();
    //    String imgMimeType = picture.getContentType();
    //
    //    if (num == 0) {
    //      tampFilename = landlordInfo.getStamp();
    //      landlordInfoEdit.setStamp(tampFilename);
    //      String imgPath = System.getProperty("java.io.tmpdir") + "images//" + tampFilename;
    //      // "C:\\_SpringBoot\\workspace\\sansuiyuan\\wuli\\src\\main\\webapp\\file\\temp\\"
    //      //   + tampFilename;
    //      String img64 = getImageEncoderByPath(imgPath);
    //      String imgMimeType = getMimeType(tampFilename);
    //      String imgSrc = "data:" + imgMimeType + ";" + "base64," + img64;
    //      session.setAttribute("imgSrc", imgSrc);
    //      tampFileSrc = imgSrc;
    //      tampFileBase64 = img64;
    //      session.setAttribute("tampFilename", tampFilename);
    //      session.setAttribute("tampFileSrc", tampFileSrc);
    //      session.setAttribute("tampFileBase64", tampFileBase64);
    //
    //    } else if (num > 0 && fileName.length() == 0) {
    //      tampFilename = (String) session.getAttribute("tampFilename");
    //      landlordInfoEdit.setStamp(tampFilename);
    //      tampFileSrc = (String) session.getAttribute("tampFileSrc");
    //      session.setAttribute("imgSrc", tampFileSrc);
    //
    //      // System.out.println("沒傳圖檔");
    //    }
    //
    //    if (fileName != null && fileName.trim().length() > 0 && num >= 0) {
    //      num++;
    //      session.setAttribute("num", num);
    //      fileName = GlobalService.getFileName(p); // 由變數 p 中取出檔案名稱
    //      fileName = GlobalService.adjustFileName(fileName,
    //          GlobalService.IMAGE_FILENAME_LENGTH);
    //
    //      String imgMimeType = getMimeType(fileName);
    //      String img64 = getImageEncoderByPart(p);
    //      String imgSrc = "data:" + imgMimeType + ";" + "base64," + img64;
    //      // System.out.println(img64);
    //      tampFilename = fileName;
    //      tampFileSrc = imgSrc;
    //      tampFileBase64 = img64;
    //      session.setAttribute("tampFilename", tampFilename);
    //      session.setAttribute("tampFileSrc", tampFileSrc);
    //      session.setAttribute("tampFileBase64", tampFileBase64);
    //      landlordInfoEdit.setStamp(tampFilename);
    //      session.setAttribute("imgSrc", tampFileSrc);
    //    }
    //
    //
    //    if (fileName.length() > 0 && fileName.lastIndexOf(".") > -1) {
    //      landlordInfo.setStamp(fileName);
    //    }
    //
    //    if (picture != null && !picture.isEmpty()) {
    //      try {
    //        String img64 = processImg.getImageEncoderByMultipartFile(picture);
    //        String imgSrc = "data:" + imgMimeType + ";" + "base64," + img64;
    //      } catch (Exception e) {
    //        e.printStackTrace();
    //        throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
    //      }
    //    }

    newBean.setId(oldBean.getId());
    newBean.setName(landlordInfo.getName());
    newBean.setPassword(landlordInfo.getPassword());
    newBean.setPhone(landlordInfo.getPhone());
    newBean.setMail(landlordInfo.getMail());
    newBean.setCounty(landlordInfo.getCounty());
    newBean.setDistrict(landlordInfo.getDistrict());
    newBean.setAddress(landlordInfo.getAddress());
    newBean.setStamp(landlordInfo.getStamp());
    model.addAttribute(newBean);

    oldBean.setName(landlordInfo.getName());
    oldBean.setPassword(landlordInfo.getPassword());
    oldBean.setPhone(landlordInfo.getPhone());
    oldBean.setMail(landlordInfo.getMail());
    oldBean.setCounty(landlordInfo.getCounty());
    oldBean.setDistrict(landlordInfo.getDistrict());
    oldBean.setAddress(landlordInfo.getAddress());
    oldBean.setStamp(landlordInfo.getStamp());
    model.addAttribute(oldBean);

    landlordService.updateLandlordInfo(newBean);

    return "redirect:/wuli/memberInfo";
  }
}
