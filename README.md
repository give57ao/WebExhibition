# WebExhibition

##INDEX

* Background
* Installation Process
* Getting Started
* File Manifest
* THANKS
* License

###Background
---
코로나 시대에 맞는 문화생활을 제공하고 예술가들의 데뷔 접근성을 높이고자 웹 전시회 프로젝트를 추진하게 되었습니다.


###Installation Process
---
[MySQL Server] https://dev.mysql.com/downloads/windows/installer/5.7.html

[Java SE (JDK)] https://www.oracle.com/kr/java/technologies/javase/javase-jdk8-downloads.html

[Apache-tomcat server] https://tomcat.apache.org/download-70.cgi

[Eclipse] https://www.eclipse.org/downloads/download.php?file=/technology/epp/downloads/release/2019-12/R/eclipse-jee-2019-12-R-win32-x86_64.zip


###Getting Started
---
####Back-End


![웹전시회_사용방법](https://user-images.githubusercontent.com/70637205/123607525-f085c980-d838-11eb-8fcb-e06628bff4c9.jpg)

![웹전시회_사용방법 (1)](https://user-images.githubusercontent.com/70637205/123608054-62f6a980-d839-11eb-87b3-adc6a293a122.jpg)

![웹전시회_사용방법 (2)](https://user-images.githubusercontent.com/70637205/123608115-71dd5c00-d839-11eb-942b-a8f6aef1eb75.jpg)

![웹전시회_사용방법 (3)](https://user-images.githubusercontent.com/70637205/123608168-7dc91e00-d839-11eb-9ddb-f8cb7be13045.jpg)

![웹전시회_사용방법 (4)](https://user-images.githubusercontent.com/70637205/123608243-8b7ea380-d839-11eb-93a2-85d37a8c2631.jpg)

---
####Front-End


![웹전시회_사용방법 (5)](https://user-images.githubusercontent.com/70637205/123608444-ba951500-d839-11eb-8b26-628e50a64539.jpg)

![웹전시회_사용방법 (6)](https://user-images.githubusercontent.com/70637205/123608476-bf59c900-d839-11eb-9999-77070a6cd7f0.jpg)

![웹전시회_사용방법 (7)](https://user-images.githubusercontent.com/70637205/123608496-c2ed5000-d839-11eb-8ba4-290c25f765a1.jpg)

![웹전시회_사용방법 (8)](https://user-images.githubusercontent.com/70637205/123608530-ca145e00-d839-11eb-92fd-3d9eccd3c877.jpg)

![웹전시회_사용방법 (9)](https://user-images.githubusercontent.com/70637205/123608546-cda7e500-d839-11eb-9d41-d4cd9b15bcea.jpg)

![웹전시회_사용방법 (10)](https://user-images.githubusercontent.com/70637205/123608573-d39dc600-d839-11eb-8a4a-6243f47ef338.jpg)

![웹전시회_사용방법 (11)](https://user-images.githubusercontent.com/70637205/123608596-d8fb1080-d839-11eb-813e-ecd496d1708f.jpg)

![웹전시회_사용방법 (12)](https://user-images.githubusercontent.com/70637205/123608614-dd272e00-d839-11eb-9b6e-6eb488dc0e6b.jpg)

---
####DB


user
---

|userID|userPassword|
|:--:|:--:|
|admin|1234|

dho (news detail table)
---


|Field|Type|Null|Key|Default|Extra|
|:--:|:--:||:--:|:--:||:--:|:--:|:--:|
|b_id|int(11)|No|PRI|NULL|auto_increment|
|b_name|varchar(30)|No| |NULL| |
|b_title|varchar(50)|YES| |NULL| |
|b_content|mediumtext|YES| |NULL| |
|b_filename|varchar(50)|YES| |NULL| |
|b_filesize|varchar(60)|YES| |NULL| |
|b_date|varchar(50)|YES| |NULL| |

```
	/* 데이터베이스 연동 - 드라이버 설정 */
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bbs?useUnicode=true&characterEncoding=utf8", "id", "pw");
	Statement stmt = conn.createStatement();
```


###File Manifest
---


![파일](https://user-images.githubusercontent.com/70637205/123616446-41012500-d841-11eb-8a3b-51c0101c8d8e.PNG)


###THANKS
---
프로젝트에 도움을 주고계신 (주)캐롯아이 아키텍처 및 CTO를 맡고 계신 김승환 멘토님과 두원공과대학교 스마트IT학과 박철호 교수님께
감사의 인사를 드립니다.


###License
---
This project is licensed under the terms of the MIT license
