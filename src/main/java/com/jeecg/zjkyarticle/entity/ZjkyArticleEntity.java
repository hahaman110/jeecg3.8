package com.jeecg.zjkyarticle.entity;

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
 * @Description: 资讯
 * @author onlineGenerator
 * @date 2018-10-24 16:07:45
 * @version V1.0   
 *
 */
@Entity
@Table(name = "zjky_article", schema = "")
@SuppressWarnings("serial")
public class ZjkyArticleEntity implements java.io.Serializable {
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
	/**标题*/
	@Excel(name="标题",width=15)
	private java.lang.String title;
	/**作者OR来源*/
	@Excel(name="作者OR来源",width=15)
	private java.lang.String author;
	/**封面*/
	@Excel(name="封面",width=15)
	private java.lang.String cover;
	/**标签*/
	@Excel(name="标签",width=15)
	private java.lang.String tags;
	/**简介*/
	@Excel(name="简介",width=15)
	private java.lang.String info;
	/**内容*/
	@Excel(name="内容",width=15)
	private java.lang.String content;
	/**阅读数*/
	@Excel(name="阅读数",width=15)
	private java.lang.String readnum;
	/**权重*/
	@Excel(name="权重",width=15)
	private java.lang.String weight;
	/**分类*/
	@Excel(name="分类",width=15,dicCode="A04")
	private java.lang.String categoryid;
	/**状态*/
	@Excel(name="状态",width=15,dicCode="status")
	private java.lang.String status;
	
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
	 *@return: java.lang.String  标题
	 */
	@Column(name ="TITLE",nullable=true,length=32)
	public java.lang.String getTitle(){
		return this.title;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  标题
	 */
	public void setTitle(java.lang.String title){
		this.title = title;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  作者OR来源
	 */
	@Column(name ="AUTHOR",nullable=true,length=32)
	public java.lang.String getAuthor(){
		return this.author;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  作者OR来源
	 */
	public void setAuthor(java.lang.String author){
		this.author = author;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  封面
	 */
	@Column(name ="COVER",nullable=true,length=32)
	public java.lang.String getCover(){
		return this.cover;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  封面
	 */
	public void setCover(java.lang.String cover){
		this.cover = cover;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  标签
	 */
	@Column(name ="TAGS",nullable=true,length=32)
	public java.lang.String getTags(){
		return this.tags;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  标签
	 */
	public void setTags(java.lang.String tags){
		this.tags = tags;
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
	 *@return: java.lang.String  内容
	 */
	@Column(name ="CONTENT",nullable=true,length=32)
	public java.lang.String getContent(){
		return this.content;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  内容
	 */
	public void setContent(java.lang.String content){
		this.content = content;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  阅读数
	 */
	@Column(name ="READNUM",nullable=true,length=32)
	public java.lang.String getReadnum(){
		return this.readnum;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  阅读数
	 */
	public void setReadnum(java.lang.String readnum){
		this.readnum = readnum;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  权重
	 */
	@Column(name ="WEIGHT",nullable=true,length=32)
	public java.lang.String getWeight(){
		return this.weight;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  权重
	 */
	public void setWeight(java.lang.String weight){
		this.weight = weight;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  分类
	 */
	@Column(name ="CATEGORYID",nullable=true,length=32)
	public java.lang.String getCategoryid(){
		return this.categoryid;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  分类
	 */
	public void setCategoryid(java.lang.String categoryid){
		this.categoryid = categoryid;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  状态
	 */
	@Column(name ="STATUS",nullable=true,length=32)
	public java.lang.String getStatus(){
		return this.status;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  状态
	 */
	public void setStatus(java.lang.String status){
		this.status = status;
	}
}
