package domain;

import java.util.HashSet;
import java.util.Set;

public class User {
	/*
	 * CREATE TABLE `sys_user` (
	  `user_id` bigint(32) NOT NULL AUTO_INCREMENT COMMENT '用户id',
	  `user_code` varchar(32) NOT NULL COMMENT '用户账号',
	  `user_name` varchar(64) NOT NULL COMMENT '用户名称',
	  `user_password` varchar(32) NOT NULL COMMENT '用户密码',
	  `user_state` char(1) NOT NULL COMMENT '1:正常,0:暂停',
	  PRIMARY KEY (`user_id`)
	) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
	 */
	private Long user_id;
	private String user_code;
	private String user_name;
	private String user_password;
	private String user_phone;
	private String user_mobile;
	private String user_email;
	private String user_image;
	private String user_section;

	public String getUser_section() {
		return user_section;
	}

	public void setUser_section(String user_section) {
		this.user_section = user_section;
	}

	public String getUser_image() {
		return user_image;
	}

	public void setUser_image(String user_image) {
		this.user_image = user_image;
	}

	public Long getUser_id() {
		return user_id;
	}

	public void setUser_id(Long user_id) {
		this.user_id = user_id;
	}

	public String getUser_code() {
		return user_code;
	}

	public void setUser_code(String user_code) {
		this.user_code = user_code;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getUser_password() {
		return user_password;
	}

	public void setUser_password(String user_password) {
		this.user_password = user_password;
	}

	public String getUser_phone() {
		return user_phone;
	}

	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}

	public String getUser_mobile() {
		return user_mobile;
	}

	public void setUser_mobile(String user_mobile) {
		this.user_mobile = user_mobile;
	}

	public String getUser_email() {
		return user_email;
	}

	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
}
