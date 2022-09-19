package wuli.dao.impl;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import wuli.dao.LandlordInfoDao;
import wuli.model.LandlordInfo;

@Repository
public class LandlordInfoDaoImpl implements LandlordInfoDao {

  SessionFactory factory;

    @Autowired
    public LandlordInfoDaoImpl(SessionFactory factory) {
      this.factory = factory;
    }

  @Override
  public LandlordInfo queryLandlordInfoByPrimaryKey(int id) {
    return factory.getCurrentSession().get(LandlordInfo.class, id);
  }

  @Override
  public void updateLandlordInfo(LandlordInfo landlordInfo) {
    Session session = getSession();

    //    try {
    //      session = factory.getCurrentSession();
    //      System.out.println("我是update1");
    //    } catch (HibernateException e) {
    //      System.out.println("我是update2");
    //      session = factory.openSession();
    //    }

    session.saveOrUpdate(landlordInfo);

    //    if (landlordInfo != null && landlordInfo.getId() != null) {
    //      Session session = factory.getCurrentSession();
    //      System.out.println("我是update");
    //      session.update(landlordInfo);
    //    }
  }

  public Session getSession() {
    return factory.getCurrentSession();
  }
}
