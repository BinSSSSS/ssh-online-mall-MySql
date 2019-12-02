package cn.tblack.mall.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.tblack.mall.dao.MallUserDao;
import cn.tblack.mall.domain.MallUser;

@Service
public class MallUserServiceImpl implements MallUserService {

	@Autowired
	private MallUserDao userDao;

	@Override
	public void deleteByUserId(Integer id) {

		userDao.deleteByPrimaryKey(selectByUserId(id));
	}

	@Override
	public void insert(MallUser user) {

		userDao.insert(user);
	}

	@Override
	public List<MallUser> selectAll() {
		return userDao.selectAll();
	}

	@Override
	public MallUser login(String username, String password) {
		return userDao.selectByPassword(username, password);
	}

	@Override
	public MallUser selectByUserId(Integer id) {
		return userDao.selectByPrimaryKey(id);
	}

	@Override
	public void updateByUserId(Integer id) {
		userDao.updateByPrimaryKey(selectByUserId(id));
	}

	@Override
	public Long countAll() {
		return userDao.countAll();
	}

	@Override
	public MallUser selectByUsername(String username) {
		return userDao.selectByUsername(username);
	}

}
