package wuli.dao;


import org.springframework.stereotype.Repository;

import wuli.model.LandlordInfo;

@Repository
public interface LandlordInfoDao {

  LandlordInfo queryLandlordInfoByPrimaryKey(int id);

  void updateLandlordInfo(LandlordInfo landlordInfo);
}
