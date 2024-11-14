import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:taskmanager_with_get/ui/utils/app_colors.dart';
import 'package:taskmanager_with_get/ui/widgets/screen_background.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late TapGestureRecognizer _tapGestureRecognizer;

  @override
  void initState() {
    super.initState();
    _tapGestureRecognizer = TapGestureRecognizer()..onTap = _onTabSignIn;
  }

  @override
  void dispose() {
    _tapGestureRecognizer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: ScreenBackground(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                const SizedBox(height: 82),
                Text(
                  'Join With Us',
                  style: textTheme.displaySmall?.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 24),
                _buildSignUpForm(),
                const SizedBox(height: 24),
                Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      _buildSignInSection(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSignUpForm() {
    return Column(
      children: [
        const TextField(
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            hintText: 'Email',
          ),
        ),
        const SizedBox(height: 10),
        const TextField(
          decoration: InputDecoration(
            hintText: 'First Name',
          ),
        ),
        const SizedBox(height: 10),
        const TextField(
          decoration: InputDecoration(
            hintText: 'Last Name',
          ),
        ),
        const SizedBox(height: 10),
        const TextField(
          keyboardType: TextInputType.phone,
          decoration: InputDecoration(
            hintText: 'Mobile ',
          ),
        ),
        const SizedBox(height: 10),
        const TextField(
          obscureText: true,
          decoration: InputDecoration(
            hintText: 'Password',
          ),
        ),
        const SizedBox(height: 24),
        ElevatedButton(
          onPressed: _onTabNextButton,
          child: const Icon(Icons.arrow_circle_right_outlined),
        ),
      ],
    );
  }

  Widget _buildSignInSection() {
    return RichText(
      text: TextSpan(
        style: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w600,
          fontSize: 14,
          letterSpacing: 0.5,
        ),
        text: "Have account? ",
        children: [
          TextSpan(
            text: 'Sign In',
            style: const TextStyle(color: AppColors.themeColor),
            recognizer: _tapGestureRecognizer,
          ),
        ],
      ),
    );
  }

  void _onTabNextButton() {
    // TODO: implement next button
  }

  void _onTabSignIn() {
    Navigator.pop(context);
  }
}
