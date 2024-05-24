import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier {

  int _statusCode = 200;
  int get statusCode => _statusCode;
  setStatusCode(int value) {
    _statusCode = value;
    notifyListeners();
  }

  String _errorText = "Success";
  String get errorText => _errorText;
  setErrorText(String error) {
    _errorText = error;
    notifyListeners();
  }

  bool _loading = false;
  bool get loading => _loading;
  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  void login(String email, String password) async {
    setLoading(true);
    try{
      if(!checkEmail(email) || !checkPassword(password)) {
        setStatusCode(400);
      }
      else {
        setStatusCode(200);
      }
    } catch(e) {
      setStatusCode(200);
    }
    setLoading(false);
  }

  void register(String email, String password, String address, String contact) async {
    setLoading(true);

    try{
      if(!(checkEmail(email) 
        && checkPassword(password) 
        && checkAddress(address) 
        && checkContact(contact))
        ) {
        setStatusCode(400);
      }

      else {
        setStatusCode(200);
      }

    } catch(e) {
      setStatusCode(400);
    }

    setLoading(false);
  }

  bool checkEmail(String email) {
    /*
    emailRegex : 
      ^         : indicates start of string
      [\w_\.]   : matches one or more word characters (\w), hypens (-), or dots (.)
                  This represent part of email address before @ symbol
      @         : Matches @ 
      [a-zA-Z]  : domain contains only alphabates
      \.        : matches dot (.) before Top Level Domain (TLD)
      [a-zA-Z]  : TLD contains only alphabates
      {2,4}     : length of TLD if between 2 and 4
    */ 
    RegExp emailRegex = RegExp(r'^[\w_\.]+@[a-zA-Z]+\.[a-zA-Z]{2,4}$');

    if(!emailRegex.hasMatch(email)) {
      setErrorText("Please enter correct email");
      return false;
    }
    setErrorText("");
    return true;
  }

  bool checkContact(String contact) {
    //  If current call of CustomTextFormField() works for contact
    //  Length of contact number is must be 10
    //  contact number only contains numbers

    /*
      [0-9] : match only digits
    */ 
    RegExp digit = RegExp(r'[0-9]');

    if(!digit.hasMatch(contact)) {
      setErrorText("Contact number can contain only digits");
      return false;
    }
    else if(contact.length != 10) {
      setErrorText("Contact number must be exactly 10 digits long");
      return false;
    }

    setErrorText("");
    return true;
  }

  bool checkAddress(String address) {
    //  If current call of CustomTextFormField() works for address
    //  Address can contains only Uppercase letter, Lowercase letter
    //  numbers and special characters like dot(.), comma(,), and(&)

    /*
      [A-Z] : match only uppercase alphabates
      [a-z] : match only lowercase alphabates
      [0-9] : match only digits
    */ 
    RegExp upperCase = RegExp(r'[A-Z]');
    RegExp lowerCase = RegExp(r'[a-z]');
    RegExp digit = RegExp(r'[0-9]');
    RegExp specialChar = RegExp(r'[&,.]');

    if(!(upperCase.hasMatch(address) 
      || lowerCase.hasMatch(address) 
      || digit.hasMatch(address) 
      || specialChar.hasMatch(address))) {
      setErrorText("Address can contains Uppercase, lowercase letters and digits with special characters (&,.)");
      return false;
    }

    setErrorText("");
    return true;
  }

  bool checkPassword(String password) {
    //  If current call of CustomTextFormField() works for password
    //  Length of password is must be greater than 6
    //  password must contains Uppercase letter, Lowercase letter
    //  Numbers and special characters [!@#\$%^&*(),.?":{}|<>]

    /*
      [A-Z] : match only uppercase alphabates
      [a-z] : match only lowercase alphabates
      [0-9] : match only digits
    */ 
    RegExp upperCase = RegExp(r'[A-Z]');
    RegExp lowerCase = RegExp(r'[a-z]');
    RegExp digit = RegExp(r'[0-9]');
    RegExp specialChar = RegExp(r'[!@#\$%^&*(),.?":{}|<>]');

    if(password.length < 6) {
      setErrorText("Password must be at least 6 characters long");
      return false;
    }
    else if(!(upperCase.hasMatch(password) 
      && lowerCase.hasMatch(password) 
      && digit.hasMatch(password) 
      && specialChar.hasMatch(password))) {
      setErrorText("Password must contains one Uppercase, one Lowercase, one Special character and one Dgit");
      return false;
    }

    setErrorText("");
    return true;
  }
}