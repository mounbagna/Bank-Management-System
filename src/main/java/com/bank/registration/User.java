package com.bank.registration;

public class User {
    String name;
    String email;
    String code;
    //String an;
    public User(String name,String email,String code){
        this.name=name;
        this.email=email;
        this.code=code;
        //this.an = an;

    }
    public User(){

    }
    public String getName(){
        return name;
    }
    public void setName(String name){
        this.name= name;
    }
    public String getEmail(){
        return email;
    }
    public void setEmail(String email){
        this.email= email;
    }
    public String getCode(){
        return code;
    }
    public void setCode(String code){
        this.code= code;
    }
    //public String getAn(){return an;}
    //public void setAn(String an){this.an= an;}
}
