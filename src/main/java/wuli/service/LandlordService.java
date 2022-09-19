package wuli.service;

import org.springframework.stereotype.Service;
import wuli.model.LandlordInfo;


@Service
public interface LandlordService {

  LandlordInfo queryLandlordInfoByPrimaryKey(int id);
  void updateLandlordInfo(LandlordInfo landlordInfo);

}
