import 'package:fb_login/custom.dart';
import 'package:fb_login/home.dart';
import 'package:fb_login/register.dart';
import 'package:flutter/material.dart';

class FBLogin extends StatefulWidget {
  const FBLogin({super.key});

  @override
  State<FBLogin> createState() => _FBLoginState();
}

class _FBLoginState extends State<FBLogin> {

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
                Image.asset(
                  'asset/fb_logo.png',
                  height: 50,
                  fit: BoxFit.fitHeight
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
                        'Login to Facebook',
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
                            'Log in',
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
                            "Don't have an account? ",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500
                            )
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pushReplacement(
                                context, 
                                MaterialPageRoute(builder: (context) => const FBRegister())
                              );
                            },
                            child: Text(
                              'Register',
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