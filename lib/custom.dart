import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final int maxLines;
  final bool isObsecure;
  final TextInputType keyboardType;
  final String title;

  const CustomTextFormField({
    super.key, 
    required this.controller, 
    required this.hint, 
    this.maxLines = 1,
    this.isObsecure = false,
    required this.keyboardType, 
    required this.title
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15.0,
        vertical: 5
      ),
      child: TextFormField(
        controller: controller,
        obscureText: isObsecure,
        maxLines: maxLines,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          isDense: true,
          hintText: hint,
          hintStyle: TextStyle(
            color: Colors.grey.shade400,
            fontSize: 16,
            fontWeight: FontWeight.w400
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20, 
            vertical: 15.0
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: Colors.grey.shade400,
              width: 1
            )
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: Colors.grey.shade400,
              width: 1
            )
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: Colors.grey.shade800,
              width: 1
            )
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: Colors.red.shade900,
              width: 1
            )
          )
        ),
        validator: (value) {
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

          /*
            [A-Z] : match only uppercase alphabates
            [a-z] : match only lowercase alphabates
            [0-9] : match only digits
          */ 
          RegExp upperCase = RegExp(r'[A-Z]');
          RegExp lowerCase = RegExp(r'[a-z]');
          RegExp digit = RegExp(r'[0-9]');

          if(value!.isEmpty) {
            return 'Please enter $hint';
          }

          //  If current call of CustomTextFormField() works for email
          //  return error if mail ID does not match the requirements (emailRegex)
          else if(title == 'email' && !emailRegex.hasMatch(value)) {
            return '$value is not valid mail ID';
          }

          //  If current call of CustomTextFormField() works for address
          //  Address can contains only Uppercase letter, Lowercase letter
          //  numbers and special characters like dot(.), comma(,), and(&)
          else if(title == 'address') {
            RegExp specialChar = RegExp(r'[&,.]');
            if(!(upperCase.hasMatch(value) 
              || lowerCase.hasMatch(value) 
              || digit.hasMatch(value) 
              || specialChar.hasMatch(value))) {
              return 'Address can only Uppercase letter,\nlowercase letter, Numbers \nand special characters (, . &).';
            }
          }

          //  If current call of CustomTextFormField() works for password
          //  Length of password is must be greater than 6
          //  password must contains Uppercase letter, Lowercase letter
          //  Numbers and special characters [!@#\$%^&*(),.?":{}|<>]
          else if(title == 'password') {
            RegExp specialChar = RegExp(r'[!@#\$%^&*(),.?":{}|<>]');
            if(value.length < 6) {
              return 'Password must be minimum 6 character long';
            }
            else if(!(upperCase.hasMatch(value) 
              && lowerCase.hasMatch(value) 
              && digit.hasMatch(value) 
              && specialChar.hasMatch(value))) {
              return 'Password must contains one Uppercase letter,\none lowercase letter, one number \nand one special char.';
            }
          }

          //  If current call of CustomTextFormField() works for contact
          //  Length of contact number is must be 10
          //  contact number only contains numbers
          else if(title == 'contact') {
            if(!digit.hasMatch(value)) {
              return 'Contact number can contain only digits';
            }
            else if(value.length != 10) {
              return 'Contact number must be 10 digits long';
            }
          }

          //  return null if client fulfill all requirements for CustomTextFormField()
          return null;
        }
      )
    );
  }
}

