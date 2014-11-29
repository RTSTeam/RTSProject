package com.mercury.dao.impl;

import javax.sql.DataSource;

import org.springframework.jdbc.core.simple.SimpleJdbcTemplate;

import com.mercury.beans.RTSUser;
import com.mercury.dao.RegistrationDao;

public class RegistrationDaoImpl implements RegistrationDao{
	private SimpleJdbcTemplate template;
	
	public void setDataSource(DataSource dataSource) {
		template = new SimpleJdbcTemplate(dataSource);
	}
	
	@Override
	public void save(RTSUser rtsuser) {
		// TODO Auto-generated method stub
		Object[] params = {rtsuser.getUserID(), rtsuser.getPassword(), rtsuser.getFname(), rtsuser.getLname(), rtsuser.getBirthday(), rtsuser.getEmail(), "1"};
		String sql = "insert into RTSUser values(?,?,?,?,?,?,?)";
		template.update(sql, params);
	}

}
