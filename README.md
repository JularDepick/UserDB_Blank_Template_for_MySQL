# userdb数据库使用文档
## 一、数据库整体说明
- **数据库名称**：`userdb`  
- **字符集**：`utf8mb4`  
- **校对规则**：`utf8mb4_unicode_ci`  
- **核心定位**：以 `reginfo` 表为核心，通过 `uid` 关联13张旁支表，存储用户注册、基础信息、安全、联系、认证、活动等全维度数据。  
- **版权信息**：本数据库模板版权归属1724834368@qq.com  


## 二、表结构及索引详细说明（按重要程度降序排序）
### 1. 表名：`reginfo`（注册信息）
- **表注释**：注册信息(禁止修改低频访问)  
- **字段结构**：

| 列名               | 数据类型                          | 注释                                  |
|--------------------|-----------------------------------|---------------------------------------|
| `uid`              | `bigint(16) unsigned zerofill`    | 用户ID标识(唯一)                      |
| `username`         | `varchar(32) COLLATE utf8mb4_unicode_ci` | 用户名标识(唯一)                   |
| `register_time`    | `datetime`                        | 注册时间(UTC+0)                      |
| `register_ip`      | `varchar(64) CHARACTER SET utf8mb4 COLLATEutf8mb4_unicode_ci` | 注册IP              |
| `register_location` | `varchar(128) CHARACTER SETutf8mb4 COLLATEutf8mb4_unicode_ci` | 注册定位            |
| `register_device`  | `varchar(64) CHARACTER SETutf8mb4 COLLATEutf8mb4_unicode_ci` | 注册终端            |

- **索引信息**：`PRIMARY KEY(uid)`、`UNIQUE KEY(username)`


### 2. 表名：`basicinfo`（基础信息）
- **表注释**：基础信息(低频修改高频访问)  
- **字段结构**：

| 列名               | 数据类型                          | 注释                                  |
|--------------------|-----------------------------------|---------------------------------------|
| `uid`              | `bigint(16) unsigned zerofill`    | 用户ID标识(唯一)                      |
| `nickname`         | `varchar(64) CHARACTER SETutf8mb4 COLLATEutf8mb4_unicode_ci` | 用户昵称            |
| `utc_tzcode`       | `tinyint`                         | 用户UTC时区                           |
| `gender`           | `tinyint unsigned`                | 性别(0保密,1男,2女)                   |
| `mother_language`  | `varchar(16) CHARACTER SETutf8mb4 COLLATEutf8mb4_unicode_ci` | 第一语言(母语)      |
| `second_language`  | `varchar(16) CHARACTER SETutf8mb4 COLLATEutf8mb4_unicode_ci` | 第二语言            |

- **索引信息**：`UNIQUE KEY(uid)`


### 3. 表名：`secinfo`（账户安全信息）
- **表注释**：账户安全信息(低频修改中频访问)  
- **字段结构**：

| 列名                     | 数据类型                          | 注释                                  |
|--------------------------|-----------------------------------|---------------------------------------|
| `uid`                    | `bigint(16) unsigned zerofill`    | 用户ID标识(唯一)                      |
| `password`               | `char(64) COLLATEutf8mb4_unicode_ci` | 用户密码(SHA-256)                   |
| `secure_email`           | `varchar(256) CHARACTER SETutf8mb4 COLLATEutf8mb4_unicode_ci` | 安全邮箱              |
| `secure_phone_countrycode` | `varchar(10) CHARACTER SETutf8mb4 COLLATEutf8mb4_unicode_ci` | 安全手机号国家代码    |
| `secure_phonenumber`     | `varchar(20) CHARACTER SETutf8mb4 COLLATEutf8mb4_unicode_ci` | 安全手机号号码        |
| `secure_qq`              | `varchar(64) CHARACTER SETutf8mb4 COLLATEutf8mb4_unicode_ci` | 绑定QQ(OpenID)        |
| `secure_wechat`          | `varchar(64) CHARACTER SETutf8mb4 COLLATEutf8mb4_unicode_ci` | 绑定微信(UnionID)     |

- **索引信息**：`UNIQUE KEY(uid)`


### 4. 表名：`logininfo`（登录信息）
- **表注释**：登录信息(中高频修改中高频访问)  
- **字段结构**：

| 列名               | 数据类型                          | 注释                                  |
|--------------------|-----------------------------------|---------------------------------------|
| `uid`              | `bigint(16) unsigned zerofill`    | 用户ID标识(唯一)                      |
| `login_token`      | `varchar(256) CHARACTER SETutf8mb4 COLLATEutf8mb4_unicode_ci` | 登录令牌            |
| `login_token_deadline` | `datetime`                    | 登录令牌失效时间                      |
| `last_login_time`  | `datetime`                        | 最后登录时间(UTC+0)                  |
| `last_login_ip`    | `varchar(64) CHARACTER SETutf8mb4 COLLATEutf8mb4_unicode_ci` | 最后登录IP          |
| `last_login_location` | `varchar(128) CHARACTER SETutf8mb4 COLLATEutf8mb4_unicode_ci` | 最后登录定位        |
| `last_login_device` | `varchar(64) CHARACTER SETutf8mb4 COLLATEutf8mb4_unicode_ci` | 最后登录终端        |

- **索引信息**：`UNIQUE KEY(uid)`


### 5. 表名：`identinfo`（居民身份证件信息）
- **表注释**：居民身份证件信息(低频修改低频访问)  
- **字段结构**：

| 列名               | 数据类型                          | 注释                                  |
|--------------------|-----------------------------------|---------------------------------------|
| `uid`              | `bigint(16) unsigned zerofill`    | 用户ID标识(唯一)                      |
| `my_identdoc_id`   | `tinyint unsigned`                | 证件序号(相对于用户ID唯一)            |
| `identdoc_type`    | `varchar(64) COLLATEutf8mb4_unicode_ci` | 证件类型                   |
| `identdoc_number`  | `varchar(256) COLLATEutf8mb4_unicode_ci` | 证件号码                   |
| `real_name`        | `varchar(128) COLLATEutf8mb4_unicode_ci` | 真实姓名                   |
| `gender`           | `varchar(8) COLLATEutf8mb4_unicode_ci` | 性别                     |
| `ethnic`           | `varchar(64) COLLATEutf8mb4_unicode_ci` | 民族                     |
| `birthdate`        | `date`                            | 出生日期                              |
| `country_code`     | `varchar(16) COLLATEutf8mb4_unicode_ci` | 用户所属国家/地区代码     |
| `country_name`     | `varchar(64) COLLATEutf8mb4_unicode_ci` | 用户所属国家/地区名称     |
| `residence_address` | `varchar(512) COLLATEutf8mb4_unicode_ci` | 户籍地址                 |

- **索引信息**：`UNIQUE KEY(uid)`


### 6. 表名：`contactinfo`（联系信息）
- **表注释**：联系信息(低频修改中低频访问)  
- **字段结构**：

| 列名               | 数据类型                          | 注释                                  |
|--------------------|-----------------------------------|---------------------------------------|
| `uid`              | `bigint(16) unsigned zerofill`    | 用户ID标识(唯一)                      |
| `contact_id`       | `tinyint unsigned`                | 联系信息序号(相对于用户ID唯一)        |
| `contact_name`     | `varchar(64) COLLATEutf8mb4_unicode_ci` | 联系人姓名                   |
| `email`            | `varchar(256) CHARACTER SETutf8mb4 COLLATEutf8mb4_unicode_ci` | 联系邮箱            |
| `phonenumber`      | `varchar(32) CHARACTER SETutf8mb4 COLLATEutf8mb4_unicode_ci` | 联系电话            |
| `country_code`     | `varchar(16) CHARACTER SETutf8mb4 COLLATEutf8mb4_unicode_ci` | 国家/地区代码        |
| `country_name`     | `varchar(64) CHARACTER SETutf8mb4 COLLATEutf8mb4_unicode_ci` | 国家/地区名称        |
| `address_detail`   | `varchar(512) CHARACTER SETutf8mb4 COLLATEutf8mb4_unicode_ci` | 详细地址            |
| `post_code`        | `varchar(16) CHARACTER SETutf8mb4 COLLATEutf8mb4_unicode_ci` | 邮政编码            |

- **索引信息**：`UNIQUE KEY(uid)`


### 7. 表名：`certinfo`（特殊认证信息）
- **表注释**：特殊认证信息(低频修改中高频访问)  
- **字段结构**：

| 列名               | 数据类型                          | 注释                                  |
|--------------------|-----------------------------------|---------------------------------------|
| `uid`              | `bigint(16) unsigned zerofill`    | 用户ID标识(唯一)                      |
| `my_cert_id`       | `tinyint unsigned`                | 认证序号(相对于用户ID唯一)            |
| `cert_name`        | `varchar(128) COLLATEutf8mb4_unicode_ci` | 认证名称                   |
| `cert_nature`      | `varchar(32) CHARACTER SETutf8mb4 COLLATEutf8mb4_unicode_ci` | 认证性质            |
| `cert_profile`     | `longtext CHARACTER SETutf8mb4 COLLATEutf8mb4_unicode_ci` | 认证描述            |
| `cert_start_time`  | `datetime`                        | 认证开始时间                          |
| `cert_deadline`    | `datetime`                        | 认证失效时间                          |

- **索引信息**：无


### 8. 表名：`mfainfo`（多因素验证信息）
- **表注释**：多因素验证信息(中频修改中频访问)  
- **字段结构**：

| 列名               | 数据类型                          | 注释                                  |
|--------------------|-----------------------------------|---------------------------------------|
| `uid`              | `bigint(16) unsigned zerofill`    | 用户ID标识(唯一)                      |
| `email_vc`         | `varchar(8) CHARACTER SETutf8mb4 COLLATEutf8mb4_unicode_ci` | 邮箱验证码          |
| `email_vc_deadline` | `datetime`                        | 邮箱验证码失效时间                    |
| `phone_vc`         | `varchar(8) CHARACTER SETutf8mb4 COLLATEutf8mb4_unicode_ci` | 手机验证码          |
| `phone_vc_deadline` | `datetime`                        | 手机验证码失效时间                    |

- **索引信息**：`UNIQUE KEY(uid)`


### 9. 表名：`actinfo`（活动信息）
- **表注释**：活动信息(高频修改高频访问)  
- **字段结构**：

| 列名               | 数据类型                          | 注释                                  |
|--------------------|-----------------------------------|---------------------------------------|
| `uid`              | `bigint(16) unsigned zerofill`    | 用户ID标识(唯一)                      |
| `last_act_time`    | `datetime`                        | 最后活动时间(UTC+0)                   |

- **索引信息**：`UNIQUE KEY(uid)`


### 10. 表名：`mediainfo`（社交媒体信息）
- **表注释**：社交媒体信息(低频修改中频访问)  
- **字段结构**：

| 列名               | 数据类型                          | 注释                                  |
|--------------------|-----------------------------------|---------------------------------------|
| `uid`              | `bigint(16) unsigned zerofill`    | 用户ID标识(唯一)                      |
| `blog`             | `varchar(256) CHARACTER SETutf8mb4 COLLATEutf8mb4_unicode_ci` | 个人博客地址        |
| `bilibili`         | `varchar(256) CHARACTER SETutf8mb4 COLLATEutf8mb4_unicode_ci` | Bilibili个人主页地址 |
| `github`           | `varchar(256) CHARACTER SETutf8mb4 COLLATEutf8mb4_unicode_ci` | Github个人主页地址  |
| `qq`               | `varchar(16) CHARACTER SETutf8mb4 COLLATEutf8mb4_unicode_ci` | QQ号码              |
| `wechat`           | `varchar(16) CHARACTER SETutf8mb4 COLLATEutf8mb4_unicode_ci` | WeChat号码          |
| `facebook`         | `varchar(256) CHARACTER SETutf8mb4 COLLATEutf8mb4_unicode_ci` | Facebook个人主页地址 |
| `tiktok`           | `varchar(256) CHARACTER SETutf8mb4 COLLATEutf8mb4_unicode_ci` | TikTok个人主页地址  |
| `youtube`          | `varchar(256) CHARACTER SETutf8mb4 COLLATEutf8mb4_unicode_ci` | YouTube个人主页地址 |

- **索引信息**：`UNIQUE KEY(uid)`


### 11. 表名：`ecardinfo`（电子个性名片信息）
- **表注释**：电子个性名片信息(低频修改中频访问)  
- **字段结构**：

| 列名               | 数据类型                          | 注释                                  |
|--------------------|-----------------------------------|---------------------------------------|
| `uid`              | `bigint(16) unsigned zerofill`    | 用户ID标识(唯一)                      |
| `ecard_id`         | `tinyint unsigned`                | 名片序号(相对于用户ID唯一)            |
| `diy_content`      | `longtext CHARACTER SETutf8mb4 COLLATEutf8mb4_unicode_ci` | 自定义内容            |

- **索引信息**：`UNIQUE KEY(uid)`


### 12. 表名：`organinfo`（组织信息）
- **表注释**：组织信息(低频修改低频访问)  
- **字段结构**：

| 列名               | 数据类型                          | 注释                                  |
|--------------------|-----------------------------------|---------------------------------------|
| `uid`              | `bigint(16) unsigned zerofill`    | 用户ID标识(唯一)                      |
| `my_organ_id`      | `tinyint unsigned`                | 组织序号(相对于用户ID唯一)            |
| `organ_name`       | `varchar(128) COLLATEutf8mb4_unicode_ci` | 组织名称                   |
| `organ_nature`     | `varchar(32) CHARACTER SETutf8mb4 COLLATEutf8mb4_unicode_ci` | 组织性质            |
| `organ_found_time` | `date`                            | 组织成立时间                          |
| `organ_profile`    | `longtext CHARACTER SETutf8mb4 COLLATEutf8mb4_unicode_ci` | 组织介绍            |
| `organ_country_code` | `varchar(16) CHARACTER SETutf8mb4 COLLATEutf8mb4_unicode_ci` | 组织所属国家/地区代码 |
| `organ_country_name` | `varchar(64) CHARACTER SETutf8mb4 COLLATEutf8mb4_unicode_ci` | 组织所属国家/地区名称 |
| `organ_address`    | `varchar(512) CHARACTER SETutf8mb4 COLLATEutf8mb4_unicode_ci` | 组织所在地          |
| `organ_post_code`  | `varchar(16) CHARACTER SETutf8mb4 COLLATEutf8mb4_unicode_ci` | 组织所在地邮政编码  |
| `organ_email`      | `varchar(64) CHARACTER SETutf8mb4 COLLATEutf8mb4_unicode_ci` | 组织邮箱            |
| `organ_phonenumber` | `varchar(32) CHARACTER SETutf8mb4 COLLATEutf8mb4_unicode_ci` | 组织电话            |
| `organ_official_website` | `varchar(256) CHARACTER SETutf8mb4 COLLATEutf8mb4_unicode_ci` | 组织官方网站      |
| `my_position`      | `varchar(64) CHARACTER SETutf8mb4 COLLATEutf8mb4_unicode_ci` | 组织内职位/身份      |

- **索引信息**：`UNIQUE KEY(uid)`


### 13. 表名：`preferinfo`（操作偏好信息）
- **表注释**：操作偏好信息(低频修改中低频访问)  
- **字段结构**：

| 列名               | 数据类型                          | 注释                                  |
|--------------------|-----------------------------------|---------------------------------------|
| `uid`              | `bigint(16) unsigned zerofill`    | 用户ID标识(唯一)                      |
| `prefer_id`        | `smallint unsigned`               | 偏好序号(相对于用户ID唯一)            |
| `theme`            | `varchar(16) CHARACTER SETutf8mb4 COLLATEutf8mb4_unicode_ci` | 主题(默认light)      |
| `ui_language`      | `varchar(16) CHARACTER SETutf8mb4 COLLATEutf8mb4_unicode_ci` | 界面语言(默认Chinese) |

- **索引信息**：`UNIQUE KEY(uid)`


### 14. 表名：`suiteinfo`（配套功能产品注册状态信息）
- **表注释**：配套功能产品注册状态信息(低频修改中低频访问)  
- **字段结构**：

| 列名               | 数据类型                          | 注释                                  |
|--------------------|-----------------------------------|---------------------------------------|
| `uid`              | `bigint(16) unsigned zerofill`    | 用户ID标识(唯一)                      |
| `email`            | `varchar(8) COLLATEutf8mb4_unicode_ci` | 配套邮箱注册状态(默认no)     |
| `blog`             | `varchar(8) COLLATEutf8mb4_unicode_ci` | 配套博客注册状态(默认no)     |
| `ai`               | `varchar(8) COLLATEutf8mb4_unicode_ci` | 配套AI注册状态(默认no)       |
| `disk`             | `varchar(8) COLLATEutf8mb4_unicode_ci` | 配套云盘注册状态(默认no)     |
| `music`            | `varchar(8) COLLATEutf8mb4_unicode_ci` | 配套音乐平台注册状态(默认no) |
| `media`            | `varchar(8) COLLATEutf8mb4_unicode_ci` | 配套社交媒体注册状态(默认no) |

- **索引信息**：`UNIQUE KEY(uid)`


## 三、数据库核心关联规则
1. **主键关联**：所有表均以 `uid` 作为用户唯一标识，其中 `reginfo.uid` 为 **主键（PRIMARY KEY）**，其他表的 `uid` 均为 **唯一键（UNIQUE KEY）**，与 `reginfo.uid` 逻辑关联，确保用户数据一致性。  
2. **数据修改约束**：`reginfo` 表标注“禁止修改”，其他表按注释区分修改频率（高频/中频/低频），适配业务读写性能需求。