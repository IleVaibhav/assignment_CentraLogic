import 'package:assignment_3_provider/authentication/provider/auth_provider.dart';
import 'package:assignment_3_provider/navigation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../customs/custom_widgets/text_field.dart';
import 'register.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
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
                  'asset/images/logo.png',
                  height: 100,
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
                        'Login to BookBank',
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
            
                      !authProvider.loading ? InkWell(
                        onTap: () {
                          if(formKey.currentState!.validate()) {
                            authProvider.login(
                              emailController.text.toString(), 
                              passController.text.toString()
                            );

                            if(authProvider.statusCode == 200) {
                              Navigator.pushReplacement(
                                context, 
                                MaterialPageRoute(builder: (context) => const AppNavigation())
                              );
                            }
                            else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text(authProvider.errorText))
                              );
                            }
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
                      ) : Container(
                        height: 50,
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                          color: Colors.blue.shade800,
                          borderRadius: BorderRadius.circular(10)
                        ),
                        margin: const EdgeInsets.all(15.0),
                        alignment: Alignment.center,
                        child: const CircularProgressIndicator(
                          color: Colors.white
                        ),
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
                                MaterialPageRoute(builder: (context) => const RegisterScreen())
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