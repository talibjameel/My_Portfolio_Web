import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Utility Funcation/social_icons.dart';
import '../app_colors.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:ui';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.background2,
            AppColors.background1,
            AppColors.background2,
          ],
        ),
      ),
      child: Stack(
        children: [
          // Background decorative elements
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                gradient: RadialGradient(
                  center: const Alignment(0.3, -0.2),
                  radius: 1.8,
                  colors: [
                    AppColors.green.withValues(alpha: 0.06),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),

          // Main content
          Container(
            padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 24),
            child: Column(
              children: [
                // Professional Header
                _buildProfessionalHeader(),
                const SizedBox(height: 30),

                // Contact Form Section
                _ModernContactForm(),
                const SizedBox(height: 60),

                // Enhanced Social Section
                _buildProfessionalSocialSection(),
                const SizedBox(height: 60),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfessionalHeader() {
    return Column(
      children: [

        // Professional headline
        Container(
          constraints: const BoxConstraints(maxWidth: 800),
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'Ready to bring your ideas to ',
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 56,
                    fontWeight: FontWeight.w300,
                    height: 1.2,
                    letterSpacing: -1,
                  ),
                ),
                TextSpan(
                  text: 'life?',
                  style: GoogleFonts.poppins(
                    foreground: Paint()
                      ..shader = LinearGradient(
                        colors: [
                          AppColors.green,
                          AppColors.green.withValues(alpha: 0.8),
                        ],
                      ).createShader(const Rect.fromLTWH(0, 0, 200, 70)),
                    fontSize: 56,
                    fontWeight: FontWeight.w700,
                    height: 1.2,
                    letterSpacing: -1,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 24),

        // Subtitle
        Text(
          'Let\'s collaborate and create something extraordinary together',
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(
            color: Colors.white70,
            fontSize: 20,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.5,
            height: 1.5,
          ),
        ),
        const SizedBox(height: 32),

        // Decorative line
        Center(
          child: Container(
            width: 200,
            height: 2,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.transparent,
                  AppColors.green.withValues(alpha: 0.6),
                  Colors.transparent,
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }


  Widget _buildProfessionalSocialSection() {
    return Column(
      children: [
        // Social container with glassmorphism
        Container(
          padding: const EdgeInsets.all(3),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(80),
            gradient: LinearGradient(
              colors: [
                AppColors.green.withValues(alpha: 0.3),
                AppColors.green.withValues(alpha: 0.1),
                AppColors.green.withValues(alpha: 0.3),
              ],
            ),
          ),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 16),
            decoration: BoxDecoration(
              color: AppColors.background1,
              borderRadius: BorderRadius.circular(77),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(77),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: const SocialIconsRow(),
              ),
            ),
          ),
        ),
      ],
    );
  }
}


class _ContactInfoCard extends StatefulWidget {
  final IconData icon;
  final String title;
  final String value;
  final VoidCallback onTap;

  const _ContactInfoCard({
    required this.icon,
    required this.title,
    required this.value,
    required this.onTap,
  });

  @override
  State<_ContactInfoCard> createState() => _ContactInfoCardState();
}

class _ContactInfoCardState extends State<_ContactInfoCard> {
  bool hover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => hover = true),
      onExit: (_) => setState(() => hover = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: LayoutBuilder(
          builder: (context, constraints) {
            double cardWidth = constraints.maxWidth > 600
                ? 450
                : constraints.maxWidth * 0.9; // responsive width

            return AnimatedContainer(
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeOutCubic,
              width: cardWidth,
              child: Container(
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  gradient: LinearGradient(
                    colors: hover
                        ? [
                            AppColors.green.withValues(alpha: 0.4),
                            AppColors.green.withValues(alpha: 0.1),
                          ]
                        : [
                            Colors.white.withValues(alpha: 0.1),
                            Colors.transparent,
                          ],
                  ),
                ),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 28,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.background1,
                    borderRadius: BorderRadius.circular(22),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Animated Icon Container
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 400),
                        width: 64,
                        height: 64,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: hover
                                ? [
                                    AppColors.green.withValues(alpha: 0.3),
                                    AppColors.green.withValues(alpha: 0.15),
                                  ]
                                : [
                                    AppColors.green.withValues(alpha: 0.2),
                                    AppColors.green.withValues(alpha: 0.1),
                                  ],
                          ),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: hover
                              ? [
                                  BoxShadow(
                                    color: AppColors.green.withValues(
                                      alpha: 0.4,
                                    ),
                                    blurRadius: 20,
                                    offset: const Offset(0, 8),
                                  ),
                                ]
                              : [
                                  BoxShadow(
                                    color: Colors.black.withValues(alpha: 0.2),
                                    blurRadius: 10,
                                    offset: const Offset(0, 4),
                                  ),
                                ],
                        ),
                        child: Icon(
                          widget.icon,
                          color: AppColors.green,
                          size: 32,
                        ),
                      ),
                      const SizedBox(width: 24),

                      // Text Content
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.title,
                              style: GoogleFonts.poppins(
                                color: Colors.white70,
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                letterSpacing: 0.5,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              widget.value,
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 18,
                                letterSpacing: -0.3,
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Animated Arrow
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 400),
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: hover
                              ? AppColors.green.withValues(alpha: 0.2)
                              : Colors.white.withValues(alpha: 0.05),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: AnimatedRotation(
                          turns: hover ? 0.25 : 0,
                          duration: const Duration(milliseconds: 400),
                          child: Icon(
                            Icons.arrow_forward,
                            color: hover
                                ? AppColors.green
                                : AppColors.green.withValues(alpha: 0.6),
                            size: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class _ModernContactForm extends StatefulWidget {
  const _ModernContactForm();

  @override
  State<_ModernContactForm> createState() => _ModernContactFormState();
}

class _ModernContactFormState extends State<_ModernContactForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _subjectController = TextEditingController();
  final _messageController = TextEditingController();
  bool _isSubmitting = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _subjectController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final maxWidth = constraints.maxWidth > 900 ? 600.0 : constraints.maxWidth * 0.9;
        
        return Container(
          width: maxWidth,
          padding: const EdgeInsets.all(3),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(32),
            gradient: LinearGradient(
              colors: [
                Colors.white.withValues(alpha: 0.1),
                Colors.transparent,
              ],
            ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(
                padding: const EdgeInsets.all(48),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.05),
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(
                    color: Colors.white.withValues(alpha: 0.1),
                    width: 1,
                  ),
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Name and Email row
                      if (constraints.maxWidth > 600)
                        Row(
                          children: [
                            Expanded(child: _buildNameField()),
                            const SizedBox(width: 24),
                            Expanded(child: _buildEmailField()),
                          ],
                        )
                      else
                        Column(
                          children: [
                            _buildNameField(),
                            const SizedBox(height: 24),
                            _buildEmailField(),
                          ],
                        ),
                      const SizedBox(height: 28),
                      
                      // Subject field
                      _buildSubjectField(),
                      const SizedBox(height: 28),
                      
                      // Message field
                      _buildMessageField(),
                      const SizedBox(height: 40),
                      
                      // Submit button
                      _buildSubmitButton(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildNameField() {
    return _ModernTextField(
      controller: _nameController,
      label: 'Your Name',
      hint: 'John Doe',
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your name';
        }
        return null;
      },
    );
  }

  Widget _buildEmailField() {
    return _ModernTextField(
      controller: _emailController,
      label: 'Email Address',
      hint: 'john@example.com',
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your email';
        }
        if (!RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
          return 'Please enter a valid email';
        }
        return null;
      },
    );
  }

  Widget _buildSubjectField() {
    return _ModernTextField(
      controller: _subjectController,
      label: 'Subject',
      hint: 'Project Discussion',
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter a subject';
        }
        return null;
      },
    );
  }

  Widget _buildMessageField() {
    return _ModernTextArea(
      controller: _messageController,
      label: 'Message',
      hint: 'Tell me about your project...',
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your message';
        }
        if (value.length < 10) {
          return 'Message must be at least 10 characters';
        }
        return null;
      },
    );
  }

  Widget _buildSubmitButton() {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        onPressed: _isSubmitting ? null : _handleSubmit,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          padding: EdgeInsets.zero,
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                AppColors.green,
                AppColors.green.withValues(alpha: 0.8),
              ],
            ),
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: AppColors.green.withValues(alpha: 0.3),
                blurRadius: 20,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Center(
            child: _isSubmitting
                ? const SizedBox(
                    width: 24,
                    height: 24,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
                  )
                : Text(
                    'Send Message',
                    style: GoogleFonts.inter(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.5,
                    ),
                  ),
          ),
        ),
      ),
    );
  }

  void _handleSubmit() async {
    if (_formKey.currentState!.validate()) {
      setState(() => _isSubmitting = true);
      
      // Build email content
      final name = _nameController.text.trim();
      final email = _emailController.text.trim();
      final subject = _subjectController.text.trim();
      final message = _messageController.text.trim();
      
      // Create email body with form data
      final emailBody = '''
Name: $name
Email: $email
Subject: $subject

Message:
$message

---
Sent from your portfolio website
''';
      
      // Create mailto URL using queryParameters to handle encoding correctly
      final Uri emailLaunchUri = Uri(
        scheme: 'mailto',
        path: 'Developer82542@gmail.com',
        queryParameters: {
          'subject': 'Portfolio Contact: $subject',
          'body': emailBody,
        },
      );
      
      setState(() => _isSubmitting = false);
      
      // Launch email client
      try {
        if (await canLaunchUrl(emailLaunchUri)) {
          await launchUrl(emailLaunchUri);
          
          // Show success message
          if(mounted){
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  'Opening your email client...',
                  style: GoogleFonts.inter(),
                ),
                backgroundColor: AppColors.green,
                behavior: SnackBarBehavior.floating,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                duration: const Duration(seconds: 3),
              ),
            );
          }
          
          // Clear form after successful launch
          _nameController.clear();
          _emailController.clear();
          _subjectController.clear();
          _messageController.clear();
        } else {
          // Show error if email client can't be launched
          if(mounted){
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  'Could not open email client. Please email directly to Developer82542@gmail.com',
                  style: GoogleFonts.inter(),
                ),
                backgroundColor: Colors.red.withValues(alpha: 0.8),
                behavior: SnackBarBehavior.floating,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                duration: const Duration(seconds: 5),
              ),
            );
          }
        }
      } catch (e) {
        // Show error message
        if(mounted){
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Error: Could not launch email client. Please email directly to Developer82542@gmail.com',
                style: GoogleFonts.inter(),
              ),
              backgroundColor: Colors.red.withValues(alpha: 0.8),
              behavior: SnackBarBehavior.floating,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              duration: const Duration(seconds: 5),
            ),
          );
        }
      }
    }
  }
}

class _ModernTextField extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final String hint;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;

  const _ModernTextField({
    required this.controller,
    required this.label,
    required this.hint,
    this.keyboardType,
    this.validator,
  });

  @override
  State<_ModernTextField> createState() => _ModernTextFieldState();
}

class _ModernTextFieldState extends State<_ModernTextField> {
  bool _isFocused = false;

  @override
  Widget build(BuildContext context) {
    return FocusScope(
      onFocusChange: (hasFocus) => setState(() => _isFocused = hasFocus),
      child: TextFormField(
        controller: widget.controller,
        keyboardType: widget.keyboardType,
        validator: widget.validator,
        style: GoogleFonts.inter(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        decoration: InputDecoration(
          labelText: widget.label,
          hintText: widget.hint,
          labelStyle: GoogleFonts.inter(
            color: Colors.white60,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
          hintStyle: GoogleFonts.inter(
            color: Colors.white30,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
          filled: true,
          fillColor: Colors.white.withValues(alpha: 0.05),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: Colors.white.withValues(alpha: 0.1),
              width: 1,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: Colors.white.withValues(alpha: 0.1),
              width: 1,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: AppColors.green.withValues(alpha: 0.6),
              width: 2,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: Colors.red.withValues(alpha: 0.6),
              width: 1,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: Colors.red.withValues(alpha: 0.8),
              width: 2,
            ),
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        ),
      ),
    );
  }
}

class _ModernTextArea extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final String hint;
  final String? Function(String?)? validator;

  const _ModernTextArea({
    required this.controller,
    required this.label,
    required this.hint,
    this.validator,
  });

  @override
  State<_ModernTextArea> createState() => _ModernTextAreaState();
}

class _ModernTextAreaState extends State<_ModernTextArea> {
  bool _isFocused = false;

  @override
  Widget build(BuildContext context) {
    return FocusScope(
      onFocusChange: (hasFocus) => setState(() => _isFocused = hasFocus),
      child: TextFormField(
        controller: widget.controller,
        validator: widget.validator,
        maxLines: 5,
        style: GoogleFonts.inter(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        decoration: InputDecoration(
          labelText: widget.label,
          hintText: widget.hint,
          labelStyle: GoogleFonts.inter(
            color: Colors.white60,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
          hintStyle: GoogleFonts.inter(
            color: Colors.white30,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
          filled: true,
          fillColor: Colors.white.withValues(alpha: 0.05),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: Colors.white.withValues(alpha: 0.1),
              width: 1,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: Colors.white.withValues(alpha: 0.1),
              width: 1,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: AppColors.green.withValues(alpha: 0.6),
              width: 2,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: Colors.red.withValues(alpha: 0.6),
              width: 1,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: Colors.red.withValues(alpha: 0.8),
              width: 2,
            ),
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        ),
      ),
    );
  }
}
