package cn.tblack.mall.service;

import java.util.List;

import cn.tblack.mall.domain.MallUser;

public interface MallUserService {

	public void deleteByUserId(Integer id);

	public void insert(MallUser user);

	public List<MallUser> selectAll();

	public MallUser login(String username, String password);

	public MallUser selectByUserId(Integer id);

	public void updateByUserId(Integer id);

	public Long countAll();

	public MallUser selectByUsername(String username);
}
