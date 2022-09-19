package wuli.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import wuli.dao.LandlordInfoDao;
import wuli.model.LandlordInfo;
import wuli.service.LandlordService;

@Service
public class LandlordServiceImpl implements LandlordService {
  LandlordInfoDao landlordInfoDao;

@Autowired
  public LandlordServiceImpl(LandlordInfoDao landlordInfoDao) {
    this.landlordInfoDao = landlordInfoDao;
  }
  @Transactional
  @Override
  public LandlordInfo queryLandlordInfoByPrimaryKey(int id) {
    return landlordInfoDao.queryLandlordInfoByPrimaryKey(id);
  }
  @Transactional
  @Override
  public void updateLandlordInfo(LandlordInfo landlordInfo) {
    System.out.println("我是service");
    landlordInfoDao.updateLandlordInfo(landlordInfo);
  }
}
