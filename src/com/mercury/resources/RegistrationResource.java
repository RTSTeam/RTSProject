package com.mercury.resources;

import javax.ws.rs.FormParam;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.mercury.beans.RTSUser;
import com.mercury.beans.RTSUserInfo;
import com.mercury.service.RegistrationService;

@Path("/registration")
public class RegistrationResource {
	private RegistrationService rs;
	
	public RegistrationResource() {
		if (rs==null) {
			ApplicationContext actx = new ClassPathXmlApplicationContext("config.xml");
			rs = (RegistrationService)actx.getBean("RegistrationService");
		}
	}
	
	@POST
	@Produces({MediaType.APPLICATION_XML, MediaType.APPLICATION_JSON})
	public RTSUserInfo execute(
			@FormParam("username") String userid,
			@FormParam("password") String password,
			@FormParam("fname") String fname,
			@FormParam("lname") String lname,
			@FormParam("birthday") String birthday,
			@FormParam("email") String email){
		RTSUser rtsuser = new RTSUser();
		rtsuser.setUserID(userid);
		rtsuser.setPassword(password);
		rtsuser.setFname(fname);
		rtsuser.setLname(lname);
		rtsuser.setBirthday(birthday);
		String[] content = birthday.split(" ");
		StringBuilder processedBirthdy = new StringBuilder(); 
		processedBirthdy.append(content[1]).append(" ").append(content[2]).append(" ").append(content[3]);
		rtsuser.setBirthday(processedBirthdy.toString());
		rtsuser.setEmail(email);
		rtsuser.setStatus(1);
		rtsuser.setAuthority("ROLE_USER");
		return rs.process(rtsuser);
	}
}
