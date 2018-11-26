package com.jeecg.zjkyschool.entity;

import java.math.BigDecimal;
import java.util.Date;
import java.lang.String;
import java.lang.Double;
import java.lang.Integer;
import java.math.BigDecimal;
import javax.xml.soap.Text;
import java.sql.Blob;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import org.hibernate.annotations.GenericGenerator;
import javax.persistence.SequenceGenerator;
import org.jeecgframework.poi.excel.annotation.Excel;

/**   
 * @Title: Entity
 * @Description: 院校
 * @author onlineGenerator
 * @date 2018-10-26 11:42:35
 * @version V1.0   
 *
 */
@Entity
@Table(name = "zjky_school", schema = "")
@SuppressWarnings("serial")
public class ZjkySchoolEntity implements java.io.Serializable {
	/**主键*/
	private java.lang.Integer id;
	/**创建人名称*/
	private java.lang.String createName;
	/**创建人登录名称*/
	private java.lang.String createBy;
	/**创建日期*/
	private java.util.Date createDate;
	/**更新人名称*/
	private java.lang.String updateName;
	/**更新人登录名称*/
	private java.lang.String updateBy;
	/**更新日期*/
	private java.util.Date updateDate;
	/**代码*/
	@Excel(name="代码",width=15)
	private java.lang.String code;
	/**名称*/
	@Excel(name="名称",width=15)
	private java.lang.String name;
	/**Logo*/
	@Excel(name="Logo",width=15)
	private java.lang.String logo;
	/**封面*/
	@Excel(name="封面",width=15)
	private java.lang.String cover;
	/**城市*/
	@Excel(name="城市",width=15)
	private java.lang.String city;
	/**属性*/
	@Excel(name="属性",width=15,dicCode="schoolAttr")
	private java.lang.String attribute;
	/**类型*/
	@Excel(name="类型",width=15,dicCode="schoolKind")
	private java.lang.String kind;
	/**隶属*/
	@Excel(name="隶属",width=15,dicCode="schoolLs")
	private java.lang.String subjection;
	/**简介*/
	@Excel(name="简介",width=15)
	private java.lang.String info;
	/**招生简章*/
	@Excel(name="招生简章",width=15)
	private java.lang.String guide;
	/**学费*/
	@Excel(name="学费",width=15)
	private java.lang.String tuition;
	/**分数线*/
	@Excel(name="分数线",width=15)
	private java.lang.String score;
	/**复试*/
	@Excel(name="复试",width=15)
	private java.lang.String retest;
	/**备注*/
	@Excel(name="备注",width=15)
	private java.lang.String remark;
	
	/**
	 *方法: 取得java.lang.Integer
	 *@return: java.lang.Integer  主键
	 */
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name ="ID",nullable=false,length=20)
	public java.lang.Integer getId(){
		return this.id;
	}

	/**
	 *方法: 设置java.lang.Integer
	 *@param: java.lang.Integer  主键
	 */
	public void setId(java.lang.Integer id){
		this.id = id;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  创建人名称
	 */
	@Column(name ="CREATE_NAME",nullable=true,length=50)
	public java.lang.String getCreateName(){
		return this.createName;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  创建人名称
	 */
	public void setCreateName(java.lang.String createName){
		this.createName = createName;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  创建人登录名称
	 */
	@Column(name ="CREATE_BY",nullable=true,length=50)
	public java.lang.String getCreateBy(){
		return this.createBy;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  创建人登录名称
	 */
	public void setCreateBy(java.lang.String createBy){
		this.createBy = createBy;
	}
	/**
	 *方法: 取得java.util.Date
	 *@return: java.util.Date  创建日期
	 */
	@Column(name ="CREATE_DATE",nullable=true,length=20)
	public java.util.Date getCreateDate(){
		return this.createDate;
	}

	/**
	 *方法: 设置java.util.Date
	 *@param: java.util.Date  创建日期
	 */
	public void setCreateDate(java.util.Date createDate){
		this.createDate = createDate;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  更新人名称
	 */
	@Column(name ="UPDATE_NAME",nullable=true,length=50)
	public java.lang.String getUpdateName(){
		return this.updateName;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  更新人名称
	 */
	public void setUpdateName(java.lang.String updateName){
		this.updateName = updateName;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  更新人登录名称
	 */
	@Column(name ="UPDATE_BY",nullable=true,length=50)
	public java.lang.String getUpdateBy(){
		return this.updateBy;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  更新人登录名称
	 */
	public void setUpdateBy(java.lang.String updateBy){
		this.updateBy = updateBy;
	}
	/**
	 *方法: 取得java.util.Date
	 *@return: java.util.Date  更新日期
	 */
	@Column(name ="UPDATE_DATE",nullable=true,length=20)
	public java.util.Date getUpdateDate(){
		return this.updateDate;
	}

	/**
	 *方法: 设置java.util.Date
	 *@param: java.util.Date  更新日期
	 */
	public void setUpdateDate(java.util.Date updateDate){
		this.updateDate = updateDate;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  代码
	 */
	@Column(name ="CODE",nullable=true,length=32)
	public java.lang.String getCode(){
		return this.code;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  代码
	 */
	public void setCode(java.lang.String code){
		this.code = code;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  名称
	 */
	@Column(name ="NAME",nullable=true,length=50)
	public java.lang.String getName(){
		return this.name;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  名称
	 */
	public void setName(java.lang.String name){
		this.name = name;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  Logo
	 */
	@Column(name ="LOGO",nullable=true,length=100)
	public java.lang.String getLogo(){
		return this.logo;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  Logo
	 */
	public void setLogo(java.lang.String logo){
		this.logo = logo;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  城市
	 */
	@Column(name ="CITY",nullable=true,length=32)
	public java.lang.String getCity(){
		return this.city;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  城市
	 */
	public void setCity(java.lang.String city){
		this.city = city;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  属性
	 */
	@Column(name ="ATTRIBUTE",nullable=true,length=32)
	public java.lang.String getAttribute(){
		return this.attribute;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  属性
	 */
	public void setAttribute(java.lang.String attribute){
		this.attribute = attribute;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  类型
	 */
	@Column(name ="KIND",nullable=true,length=32)
	public java.lang.String getKind(){
		return this.kind;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  类型
	 */
	public void setKind(java.lang.String kind){
		this.kind = kind;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  隶属
	 */
	@Column(name ="SUBJECTION",nullable=true,length=32)
	public java.lang.String getSubjection(){
		return this.subjection;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  隶属
	 */
	public void setSubjection(java.lang.String subjection){
		this.subjection = subjection;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  简介
	 */
	@Column(name ="INFO",nullable=true,length=32)
	public java.lang.String getInfo(){
		return this.info;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  简介
	 */
	public void setInfo(java.lang.String info){
		this.info = info;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  招生简章
	 */
	@Column(name ="GUIDE",nullable=true,length=32)
	public java.lang.String getGuide(){
		return this.guide;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  招生简章
	 */
	public void setGuide(java.lang.String guide){
		this.guide = guide;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  学费
	 */
	@Column(name ="TUITION",nullable=true,length=32)
	public java.lang.String getTuition(){
		return this.tuition;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  学费
	 */
	public void setTuition(java.lang.String tuition){
		this.tuition = tuition;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  分数线
	 */
	@Column(name ="SCORE",nullable=true,length=32)
	public java.lang.String getScore(){
		return this.score;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  分数线
	 */
	public void setScore(java.lang.String score){
		this.score = score;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  复试
	 */
	@Column(name ="RETEST",nullable=true,length=32)
	public java.lang.String getRetest(){
		return this.retest;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  复试
	 */
	public void setRetest(java.lang.String retest){
		this.retest = retest;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  备注
	 */
	@Column(name ="REMARK",nullable=true,length=32)
	public java.lang.String getRemark(){
		return this.remark;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  备注
	 */
	public void setRemark(java.lang.String remark){
		this.remark = remark;
	}
	
	public java.lang.String getCover() {
		return cover;
	}

	public void setCover(java.lang.String cover) {
		this.cover = cover;
	}
}
