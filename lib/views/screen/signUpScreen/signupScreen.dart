import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:to_do_list/views/screen/loginScreen/loginUI.dart';
import 'package:to_do_list/views/screen/signUpScreen/components/headerImage.dart';
import 'package:to_do_list/views/widgets/constants.dart';
import 'package:to_do_list/views/widgets/custom_image.dart';
import 'package:to_do_list/views/widgets/custom_button.dart';
import 'package:to_do_list/viewmodels/authViewModel.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list/viewmodels/authViewModel/email_auth_view_model.dart';
class SignUpScreen extends StatelessWidget {
  static const String SignupId = "SignUpId";
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          // Background với ảnh và gradient overlay
          Container(
            width: double.infinity,

            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/image/photo2.png'),
                fit: BoxFit.cover,
                scale: 1,
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.3),
                  BlendMode.darken,
                ),
              ),
            ),
          ),
          // Content
          SafeArea(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(height: 40),
                    // Logo hoặc App Name
                    Center(
                      child: Text(
                        "Create Account",
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(height: 40),
                    
                    // Form Container với background trắng và bo góc
                    Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 15,
                            offset: Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                            _buildTextField(
                            textEditing: _nameController,
                            label: "Name",
                            hint: "Enter your name",
                            icon: Icons.person_outline,
                          ),
                          SizedBox(height: 20),
                          _buildTextField(
                            label: "Email",
                            hint: "Enter your email",
                            icon: Icons.email_outlined,
                            keyboardType: TextInputType.emailAddress,
                            textEditing: _emailController,
                          ),
                          SizedBox(height: 20),
                          _buildTextField(
                            textEditing: _passwordController,
                            label: "Password",
                            hint: "Enter your password",
                            icon: Icons.lock_outline,
                            isPassword: true,
                          ),
                          SizedBox(height: 30),
                          
                          // Sign Up Button
                          Consumer<EmailAuthViewModel>(
                            builder: (context,authViewModel,child) {
                              return authViewModel.isLoading?const Center(child: CircularProgressIndicator()):kCustomButton(
                                text: "Sign Up",
                                function: () async {
                                  if(await authViewModel.signUpWithEmail(_emailController.text,_passwordController.text,_nameController.text) == true){
                                    Navigator.pushNamed(context, LoginScreen.LoginScreenId);
                                  }
                                },

                              );
                            }
                          )
                        ],
                      ),
                    ),
                    
                    SizedBox(height: 20),
                    // Already have account
                    Center(
                      child: TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, LoginScreen.LoginScreenId);
                        },
                        child: RichText(
                          text: TextSpan(
                            text: "Already have an account? ",
                            style: TextStyle(color: Colors.white70),
                            children: [
                              TextSpan(
                                text: "Sign In",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required String hint,
    required IconData icon,
    bool isPassword = false,
    required TextEditingController textEditing,
    TextInputType? keyboardType,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.grey[800],
          ),
        ),
        SizedBox(height: 8),
        TextFormField(
          controller:textEditing,
          obscureText: isPassword,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            hintText: hint,
            prefixIcon: Icon(icon, color: kPrimaryColor),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(color: Colors.grey[300]!),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(color: kPrimaryColor),
            ),
            filled: true,
            fillColor: Colors.grey[50],
            contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          ),
        ),
      ],
    );
  }
}
