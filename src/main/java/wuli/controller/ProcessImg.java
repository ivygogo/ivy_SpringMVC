package wuli.controller;

import java.io.ByteArrayOutputStream;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Base64;
import java.util.Date;
import javax.servlet.http.Part;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component
public class ProcessImg {

  //透過表單傳送回的Part取得檔案名稱
  private String getFileNameByPart(final Part part) {
    for (String content : part.getHeader("content-disposition").split(";")) {
      if (content.trim().startsWith("filename")) {
        return content.substring(content.indexOf('=') + 1).trim().replace("\"", "");
      }
    }
    return null;
  }

  //將表單傳送回Part裡的圖片，轉成Base64
  public String getImageEncoderByPart(final Part part) throws IOException {
    // read image from file
    InputStream stream = part.getInputStream();

    // get byte array from image stream
    int bufLength = 2048;
    byte[] buffer = new byte[2048];
    byte[] data;

    ByteArrayOutputStream out = new ByteArrayOutputStream();
    int readLength;
    while ((readLength = stream.read(buffer, 0, bufLength)) != -1) {
      out.write(buffer, 0, readLength);
    }

    data = out.toByteArray();
    String imageString = Base64.getEncoder().withoutPadding().encodeToString(data);

    out.close();
    stream.close();
    // System.out.println("Encode Image Result : " + imageString);
    return imageString;
  }

  //將表單傳送回MultipartFile裡的圖片，轉成Base64
  public String getImageEncoderByMultipartFile(final MultipartFile multipartfile) throws IOException {
    // read image from file
    InputStream stream = multipartfile.getInputStream();

    // get byte array from image stream
    int bufLength = 2048;
    byte[] buffer = new byte[2048];
    byte[] data;

    ByteArrayOutputStream out = new ByteArrayOutputStream();
    int readLength;
    while ((readLength = stream.read(buffer, 0, bufLength)) != -1) {
      out.write(buffer, 0, readLength);
    }

    data = out.toByteArray();
    String imageString = Base64.getEncoder().withoutPadding().encodeToString(data);

    out.close();
    stream.close();
    // System.out.println("Encode Image Result : " + imageString);
    return imageString;
  }


  //從圖片檔名取出MimeType
  public String getMimeTypeByFileName(String filename) {
    String fileType = filename.substring(filename.lastIndexOf("."), filename.length());
    fileType = fileType.substring(1, fileType.length());
    String fileMimeType = "";
    if (fileType.equals("png") || fileType.equals("PNG")) {
      fileMimeType = "image/png";
    } else if (fileType.equals("jpg") || fileType.equals("JPG")) {
      fileMimeType = "image/jpg";
    } else if (fileType.equals("jpeg") || fileType.equals("JPEG")) {
      fileMimeType = "image/jpeg";
    }
    return fileMimeType;
  }

  //將圖片編碼為base64
  public String getImageEncoderByPath(final String imgPath) throws IOException {

    // read image from file
    FileInputStream stream = new FileInputStream(imgPath);

    // get byte array from image stream
    int bufLength = 2048;
    byte[] buffer = new byte[2048];
    byte[] data;

    ByteArrayOutputStream out = new ByteArrayOutputStream();
    int readLength;
    while ((readLength = stream.read(buffer, 0, bufLength)) != -1) {
      out.write(buffer, 0, readLength);
    }

    data = out.toByteArray();
    String imageString = Base64.getEncoder().withoutPadding().encodeToString(data);

    out.close();
    stream.close();

    // System.out.println("Encode Image Result : " + imageString);
    // byte[] decodeImg = Base64.getDecoder().decode(imageString);
    // https://medium.com/javarevisited/encode-and-decode-images-to-base64-in-java-c0b1cd3055b8
    return imageString;
  }

  //儲存圖片
  public String saveImage(final String tampFileBase64, final String fileName, int uid)
      throws IOException {
    String fileNewName = "";

    /*======== 1.建立目錄 ===========*/
    //    File filePath =
    //        new
    // File("C:\\_SpringBoot\\workspace\\sansuiyuan\\wuli\\src\\main\\webapp\\file\\stamps");
    //    if (!filePath.exists()) {
    //      filePath.mkdir();
    //    }

    if (tampFileBase64 == null) { // 影象資料為空
      // System.out.println("img64為空值");
    } else {
      try {
        byte[] decodeImg = Base64.getDecoder().decode(tampFileBase64); // Base64解碼

        String fileType = fileName.substring(fileName.lastIndexOf("."), fileName.length());
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
        Date fileNameDate = new Date();
        fileNewName = "mid_" + uid + "_" + sdf.format(fileNameDate) + fileType;
        String imgFilePath =
            System.getProperty("java.io.tmpdir") + "images//" + fileNewName; // 新生成的圖片

        OutputStream out = new FileOutputStream(imgFilePath);
        out.write(decodeImg);
        out.flush();
        out.close();
      } catch (IOException e) {
        e.printStackTrace();
        // System.out.println("寫入檔案出錯了...~zZ");
      }
    }
    return fileNewName;
  }

}
