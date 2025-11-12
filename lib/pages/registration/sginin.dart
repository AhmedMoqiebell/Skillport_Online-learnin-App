import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:iconsax/iconsax.dart';
import 'package:our_flutter_project/widgets/main_navigation.dart';
import 'package:our_flutter_project/providers/auth_provider.dart';
import 'package:our_flutter_project/theme/app_colors.dart';
import 'createaccount.dart';

class Signin extends StatefulWidget {
  const Signin({super.key});

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  final _formKey = GlobalKey<FormState>();
  bool _rememberMe = false;
  bool _obscure = true;
  bool _isLoading = false;
  // Controllers
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // تخزين القيم (username, password)
  List<String> credentials = ["", ""]; // [email, password]

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backgroundLight,
        elevation: 0,
        scrolledUnderElevation: 0,
        surfaceTintColor: Colors.transparent,
        actions: [
          TextButton(
            onPressed: _isLoading
                ? null
                : () async {
                    setState(() => _isLoading = true);
                    await Future.delayed(const Duration(seconds: 1));
                    if (mounted) {
                      setState(() => _isLoading = false);
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const MainNavigation(),
                        ),
                        (Route<dynamic> route) => false,
                      );
                    }
                  },
            child: _isLoading
                ? const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : const Text(
                    "Skip for Now",
                    style: TextStyle(color: AppColors.primaryLight),
                  ),
          ),
        ],
        
      ),
      backgroundColor: AppColors.backgroundLight,
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // زر الرجوع
              const SizedBox(height: 20),

              // العنوان
              const Center(
                child: Text(
                  "Sign in",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Poppins",
                  ),
                ),
              ),
              const SizedBox(height: 10),

              Center(
                child: Text(
                  "Hi! Welcome back, you've been missed",
                  style: TextStyle(
                    fontSize: 15,
                    color: AppColors.textLight.withOpacity(0.6),
                    fontFamily: "Poppins",
                  ),
                ),
              ),
              const SizedBox(height: 30),

              // حقل Username
              TextFormField(
                controller: _emailController,
                onChanged: (val) {
                  setState(() {
                    credentials[0] = val.trim();
                  });
                },
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Iconsax.user),
                  labelText: 'Email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: const Color.fromARGB(12, 80, 80, 80),
                ),
                validator: (v) {
                  final val = v ?? '';
                  if (val.isEmpty) return 'Please enter your Email';
                  if (!val.contains('@') || !val.contains('.'))
                    return 'Please enter a valid Email';
                  return null;
                },
              ),
              const SizedBox(height: 20),

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
                  if (val.length < 6) {
                    return 'Password must be at least 6 characters';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 15),

              // Remember me + Forgot password
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Checkbox(
                        value: _rememberMe,
                        activeColor: AppColors.primaryLight,
                        onChanged: (val) {
                          setState(() {
                            _rememberMe = val ?? false;
                          });
                        },
                      ),
                      const Text("Remember me"),
                    ],
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Forgot password?",
                      style: TextStyle(color: AppColors.primaryLight),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // زر Sign in
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
                  onPressed: _isLoading
                      ? null
                      : () async {
                          debugPrint('Button pressed');
                          if (_formKey.currentState!.validate()) {
                            setState(() => _isLoading = true);
                            await Future.delayed(const Duration(seconds: 1));
                            if (mounted) {
                              // Mark as logged in
                              context.read<AuthProvider>().login();
                              setState(() => _isLoading = false);
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => const MainNavigation(),
                                ),
                                (Route<dynamic> route) => false,
                              );
                            }
                          }
                        },
                  child: _isLoading
                      ? const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            valueColor: AlwaysStoppedAnimation<Color>(
                              Colors.white,
                            ),
                          ),
                        )
                      : const Text(
                          "Sign In",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                            fontFamily: "Poppins",
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

              // Sign up
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("don’t have an account? "),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const CreateAccountPage(),
                        ),
                      );
                    },
                    child: const Text(
                      "Sign up",
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
