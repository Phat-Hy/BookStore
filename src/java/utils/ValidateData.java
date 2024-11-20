/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utils;

import dao.UsersDAO;
import dto.UsersDTO;
import java.sql.SQLException;


/**
 *
 * @author Mlxg
 */
public class ValidateData {
    private boolean userIDLenError; // Bao loi chieu dai id
    private boolean passwordLenError; // Bao loi chieu dau pass
    private boolean notMatch;// ko khop pass
    private boolean passwordFormatError;//sai format
    private boolean isExisted; // da ton tai trong database

    public boolean isUserIDLenError() {
        return userIDLenError;
    }

    public void setUserIDLenError(boolean userIDLenError) {
        this.userIDLenError = userIDLenError;
    }

    public boolean isPasswordLenError() {
        return passwordLenError;
    }

    public void setPasswordLenError(boolean passwordLenError) {
        this.passwordLenError = passwordLenError;
    }

    public boolean isNotMatch() {
        return notMatch;
    }

    public void setNotMatch(boolean notMatch) {
        this.notMatch = notMatch;
    }

    public boolean isPasswordFormatError() {
        return passwordFormatError;
    }

    public void setPasswordFormatError(boolean passwordFormatError) {
        this.passwordFormatError = passwordFormatError;
    }

    public boolean isIsExisted() {
        return isExisted;
    }

    public void setIsExisted(boolean isExisted) {
        this.isExisted = isExisted;
    }
    
    public boolean checkUserIDLen(String userID){
        int len = userID.trim().length();
        userIDLenError = len<6|len>12;
        return userIDLenError;
    }
    
    public boolean checkPasswordLen(String password){
        int len = password.trim().length();
        passwordLenError = len<8;
        return passwordLenError;
    }
    
    public boolean checkPasswordFormat(String password){
        //chua toi thieu 1 chu cai, 1 so , 1 ky tu dac biet, co viet hoa
        passwordFormatError =  !(password.matches(".*[a-z].*") & 
                               password.matches(".*\\d.*") &
                               password.matches(".*[A-Z].*") &
                               password.matches(".*[^a-zA-Z0-9].*"));
        return passwordFormatError;
    }
    
    public boolean checkConfirm(String password, String confirm){
        notMatch = !password.trim().equals(confirm.trim());
        return notMatch;
    }
    public boolean checkPhone(String phone) throws SQLException, ClassNotFoundException{
        isExisted = new UsersDAO().checkPhone(phone);
        return isExisted;
    }    
    public boolean checkExisted(String userID) throws SQLException, ClassNotFoundException{
        isExisted = new UsersDAO().checkExist(userID);
        return isExisted;
    }
    public static void main(String []args){
        ValidateData vd = new ValidateData();
        vd.checkPasswordLen("1234");
        System.out.println(vd.passwordLenError);
    }
        public static boolean isValidPhoneNumber(String phoneNumber) {
        // Remove any non-digit characters
        String digits = phoneNumber.replaceAll("\\D", "");

        // Check if the number of digits is correct (10 or 11)
        if (digits.length() != 10 && digits.length() != 11) {
            return false;
        }

        // Check if the number starts with the correct prefix
        String[] validPrefixes = {"03", "05", "07", "08", "09"};
        boolean hasValidPrefix = false;

        for (String prefix : validPrefixes) {
            if (digits.startsWith(prefix)) {
                hasValidPrefix = true;
                break;
            }
        }

        if (!hasValidPrefix) {
            // Check for landline numbers starting with 02
            if (digits.length() == 11 && digits.startsWith("02")) {
                return true;
            }
            return false;
        }

        return true;
    }
    
    public static boolean isDupPhone(String phoneNumber){
        try {
            UsersDTO u = new UsersDAO().getUserByPhone(phoneNumber);
            if (u!= null){
                return false;
            }else {
                return true;
            }
        } catch (ClassNotFoundException|SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}
