# BANKIFY

## I. Overview
This web application, implemented using IntelliJ IDEA Community Edition, Servlets, JSP, MySQL database, and Tomcat server, provides a comprehensive banking system for users and admins.

## II. Key Features
### 1. User Features:
  ### - Registration:
    Users register with their real email addresses. An OTP is sent for email verification.    
  ### - Login:
    Secure user authentication.  
  ### - Deposit Money:
    Add money to your account. 
  ### - Withdraw Money:
    Withdraw money from your account.  
  ### - Transfer Money:
    Send money to another user's account. 
  ### - Check Balance:
    View your account balance.
    
  ### - Request a Loan:
    Submit a loan request. An email is sent to the admin for approval. 
  ### - Pay Utility Bills:
  Conveniently pay for electricity, tuition fees, credit card payments, insurance, and mobile recharge.
  ### - Interactive Icons/Images:
  Clicking an icon/image displays information about that feature, helping new users navigate the system.
  ### - Contact Admin:
    Send feedback or report issues directly to the admin via email.
    
## 2. Admin Features:
  
  - ### Delete Users:
    Remove users from the database.
    
  - ### Grant Loans:
    Approve loan requests. An email notification is sent to the respective user upon approval.
    
## III. Prerequisites
 ### - IntelliJ IDEA Community Edition.
 ### - Apache Tomcat Server.
 ### - MySQL Database.

## IV. Setup and Installation

1. Clone this repository:git clone https://github.com/mounbagna/Bank-Management-System.git
2. Import the project into IntelliJ IDEA.
3. Set up your MySQL database using the provided SQL script(bankdb.sql).
4. Configure the Tomcat Server in IntelliJ IDEA following the steps bellow;
   
  i. Click on Edit Configurations
  
![alt text](https://github.com/mounbagna/Bank-Management-System/blob/master/Pics/1.png)

 ii. click on the + sign on add configuration and choose smart tomcat
  ![alt text](https://github.com/mounbagna/Bank-Management-System/blob/master/Pics/2.png)

 #### If smart tomcat is absent, you can download as follows;
 a. click on settings
  ![alt text](https://github.com/mounbagna/Bank-Management-System/blob/master/Pics/4.png)
  b. choose plugins and install smart tomcat
   ![alt text](https://github.com/mounbagna/Bank-Management-System/blob/master/Pics/5.png)
  iii. Add the path of your tomcate file that you download.Then click on apply and ok.
   ![alt text](https://github.com/mounbagna/Bank-Management-System/blob/master/Pics/3.png)
5. Install all the dependencies of the pom.xml file as follows;
     ![alt text](https://github.com/mounbagna/Bank-Management-System/blob/master/Pics/6.png)
6. Make sure you have the required SDK (Java Development Kit) installed. If not, download it
7. Add the Modules by navigating to Program Structure then Go to Bank-Management-System->src->main->webapp->WEB-INF->lib and add the required modules to your projectfor email authentication
8. Deploy the application to the Tomcat server and start it by Visiting the generated URL in your browser to start using the application..


## V. Google account configuration for email authentication or to receive emails
1. go to your email account for configuration then navigate to security and search for app password
   ![alt text](https://github.com/mounbagna/Bank-Management-System/blob/master/Pics/7.png)
2. Create a new app password
   ![alt text](https://github.com/mounbagna/Bank-Management-System/blob/master/Pics/8.png)
3. Copy the 16 digits generated password and use it for your password in this project for email configuration(replace it in the SendEmail.java, EmailSend.java files and others)
   ![alt text](https://github.com/mounbagna/Bank-Management-System/blob/master/Pics/9.png)
   
## VI. Connect
- [LinkedIn](https://www.linkedin.com/in/mounbagna-abdella-abasse-875958314/) – Connect with me on LinkedIn!

 
## VII. HOW THE APP LOOKS LIKE

![alt text](https://github.com/mounbagna/Bank-Management-System/blob/master/Pics/h1.png)
![alt text](https://github.com/mounbagna/Bank-Management-System/blob/master/Pics/h2.png)
![alt text](https://github.com/mounbagna/Bank-Management-System/blob/master/Pics/h3.png)
![alt text](https://github.com/mounbagna/Bank-Management-System/blob/master/Pics/h4.png)


## Note:This is a 6th semester project of web architechture course
## The name of the admin is Mounbagna and the password is 123456
