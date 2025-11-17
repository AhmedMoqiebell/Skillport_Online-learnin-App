import 'package:flutter/material.dart';
import 'package:our_flutter_project/widgets/main_navigation.dart';
import 'package:provider/provider.dart';
import 'package:iconsax/iconsax.dart';
import 'package:our_flutter_project/providers/auth_provider.dart';
import 'package:our_flutter_project/theme/app_colors.dart';
import 'sginin.dart';


//__________________________________________________________________________
class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({super.key});

  @override
  State<CreateAccountPage> createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  // final _emailController = TextEditingController();
  // final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  List<String> credentials = ["", ""];
  bool _obscure = true;

  // للتحقق من صحة الفورم
  bool get isFormValid =>
      _usernameController.text.trim().isNotEmpty &&
      _emailController.text.trim().isNotEmpty &&
      _passwordController.text.trim().isNotEmpty;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // زر الرجوع
              IconButton(
                icon: const Icon(
                  Iconsax.arrow_left,
                  color: AppColors.textLight,
                ),
                onPressed: () {
                  Navigator.pop(context); // يرجع لصفحة Sign in
                },
              ),
              const SizedBox(height: 20),

              // العنوان
              const Center(
                child: Text(
                  "Create Account",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                
              ),
              
              const SizedBox(height: 30),

              // Username
              TextFormField(
                controller: _usernameController,
                onChanged: (val) {
                  setState(() {
                    credentials[0] = val.trim();
                  });
                },
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Iconsax.user),
                  labelText: 'User Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: const Color.fromARGB(12, 80, 80, 80),
                ),
                validator: (v) {
                  final val = v ?? '';
                  if (val.isEmpty) return 'Please enter your UserName';
                  // if (val.length < 6) return 'Password must be at least 6 characters';
                  return null;
                },
              ),
              const SizedBox(height: 20),

              // Email
              TextFormField(
                controller: _emailController,
                onChanged: (val) {
                  setState(() {
                    credentials[0] = val.trim();
                  });
                },
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Iconsax.sms),
                  labelText: 'Email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: const Color.fromARGB(12, 80, 80, 80),
                ),
                validator: (v) {
                  if (v == null || v.trim().isEmpty)
                    return 'Please enter your email';
                  final re = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');
                  if (!re.hasMatch(v.trim())) {
                    debugPrint('Invalid email format: $v');
                    return 'Please enter a valid email';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),

              // Password
              TextFormField(
                controller: _passwordController,
                onChanged: (val) {
                  setState(() {
                    credentials[0] = val.trim();
                  });
                },
                obscureText: _obscure,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Iconsax.lock),
                  labelText: 'Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: const Color.fromARGB(12, 80, 80, 80),
                  suffixIcon: IconButton(
                    icon: Icon(_obscure ? Iconsax.eye_slash : Iconsax.eye),
                    onPressed: () => setState(() => _obscure = !_obscure),
                  ),
                ),
                validator: (v) {
                  final val = v ?? '';
                  if (val.isEmpty) return 'Please enter your password';
                  if (val.length < 6)
                    return 'Password must be at least 6 characters';
                  return null;
                },
              ),
              const SizedBox(height: 30),

              // زر Sign up
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryLight,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),

                  onPressed: () {
                    debugPrint('Button pressed');
                    if (_formKey.currentState!.validate()) {
                      debugPrint('Creating account with:');
                      // After successful registration, log in and save email
                      final email = _emailController.text.trim();
                      context.read<AuthProvider>().login(email: email);
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (_) => const MainNavigation()),
                      );
                    }
                  },
                  // : null,
                  child: const Text(
                    "Sign Up",
                    key: ValueKey('text'),
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),

              // Or continue with
              Row(
                children: const [
                  Expanded(child: Divider(thickness: 1)),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Text("or continue with"),
                  ),
                  Expanded(child: Divider(thickness: 1)),
                ],
              ),
              const SizedBox(height: 20),

              // أيقونات تسجيل الدخول
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Image.asset('assets/images/google.png', height: 40),
                    onPressed: () {},
                  ),
                  const SizedBox(width: 20),
                  IconButton(
                    icon: Image.asset('assets/images/apple.png', height: 40),
                    onPressed: () {},
                  ),
                ],
              ),
              const SizedBox(height: 30),

              // Sign in
              // Sign in
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("already have an account? "),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const Signin(),
                        ), // ✅ يفتح صفحة Sign in
                      );
                    },
                    child: const Text(
                      "sign in",
                      style: TextStyle(
                        color: AppColors.primaryLight,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
