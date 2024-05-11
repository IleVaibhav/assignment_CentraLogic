import 'package:assignment_2/authentication/login.dart';
import 'package:assignment_2/customs/common_data.dart';
import 'package:assignment_2/customs/custom_widgets/text_field.dart';
import 'package:assignment_2/home/screens/home.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  final TextEditingController emailController = TextEditingController();
  final TextEditingController mobController = TextEditingController();
  final TextEditingController addController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width > 400 ? 400 : double.infinity,
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'asset/images/logo.png',
                      height: 40,
                      fit: BoxFit.fitHeight
                    ),
                    const SizedBox(
                      height: 0,
                      width: 15.0
                    ),
                    Text(
                      'BookBank',
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: CommonData.bgColor
                      )
                    )
                  ],
                ),
                const SizedBox(
                  height: 25,
                  width: 0
                ),
                Container(
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 5,
                        spreadRadius: 2
                      )
                    ]
                  ),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 15,
                        width: 0
                      ),
            
                      const Text(
                        'Create Account for BookBank',
                        style: TextStyle(
                          fontSize: 18
                        )
                      ),
                      const SizedBox(
                        height: 10,
                        width: 0
                      ),
            
                      Form(
                        key: formKey,
                        child: Column(
                          children: [
                            CustomTextFormField(
                              controller: emailController, 
                              hint: 'Email address',
                              keyboardType: TextInputType.emailAddress,
                              title: 'email'
                            ),
            
                            CustomTextFormField(
                              controller: mobController, 
                              hint: 'Contact number',
                              keyboardType: TextInputType.phone,
                              title: 'contact'
                            ),
            
                            CustomTextFormField(
                              controller: addController, 
                              hint: 'Address',
                              maxLines: 3,
                              keyboardType: TextInputType.streetAddress,
                              title: 'address'
                            ),
            
                            CustomTextFormField(
                              controller: passController, 
                              hint: 'Password',
                              isObsecure: true,
                              keyboardType: TextInputType.text,
                              title: 'password'
                            )
                          ]
                        )
                      ),
            
                      InkWell(
                        onTap: () {
                          if(formKey.currentState!.validate()) {
                            Navigator.pushReplacement(
                              context, 
                              MaterialPageRoute(builder: (context) => const HomeScreen())
                            );
                          }
                        },
                        child: Container(
                          height: 50,
                          width: double.maxFinite,
                          decoration: BoxDecoration(
                            color: Colors.blue.shade800,
                            borderRadius: BorderRadius.circular(10)
                          ),
                          margin: const EdgeInsets.all(15.0),
                          alignment: Alignment.center,
                          child: const Text(
                            'Register',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w700
                            ),
                            textAlign: TextAlign.center
                          )
                        )
                      ),
            
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Allready have an account? ',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500
                            )
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pushReplacement(
                                context, 
                                MaterialPageRoute(builder: (context) => const LoginScreen())
                              );
                            },
                            child: Text(
                              'Login',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: Colors.blue.shade800
                              )
                            )
                          ),
                        ]
                      ),
                      const SizedBox(
                        height: 15,
                        width: 0
                      ),
                    ]
                  )
                )
              ]
            ),
          )
        ),
      )
    );
  }
}