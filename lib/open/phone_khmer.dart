import 'package:aba_bank_clone/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PhoneKhmerScreen extends StatefulWidget {
  const PhoneKhmerScreen({super.key});

  @override
  State<PhoneKhmerScreen> createState() => _PhoneKhmerScreenState();
}

class _PhoneKhmerScreenState extends State<PhoneKhmerScreen> {
  // Controllers for phone number fields
  final TextEditingController _countryCodeController = TextEditingController(
    text: '+855',
  );
  final TextEditingController _phoneNumberController = TextEditingController();

  // Check if phone number is filled (at least 8 digits for Cambodian numbers)
  bool get _isPhoneValid {
    final phone = _phoneNumberController.text.trim();
    // Cambodian phone numbers are typically 8-9 digits after country code
    return phone.length >= 8 && RegExp(r'^[0-9]+$').hasMatch(phone);
  }

  @override
  void dispose() {
    _countryCodeController.dispose();
    _phoneNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0d2836),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF1a4a5e), Color(0xFF0d2836)],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // --- HEADER ---
              Padding(
                padding: const EdgeInsets.only(
                  left: 1.0,
                  top: 0.0,
                  bottom: 0.0,
                ),
                child: Row(
                  children: [
                    // 1. Back Button
                    IconButton(
                      icon: const Icon(
                        Icons.arrow_back_ios_new,
                        color: Colors.white,
                        size: 20,
                      ),
                      onPressed: () => Navigator.pop(context),
                      padding: EdgeInsets.zero,
                    ),
                    const SizedBox(width: 12),

                    // 2. Logo (BIGGER SIZE)
                    SizedBox(
                      height: 120,
                      width: 120,
                      child: Image.asset(
                        'assets/aba_logo.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ],
                ),
              ),

              // ------------------
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    children: [
                      const SizedBox(height: 20),

                      // Phone Icon in Circle
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.08),
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.white.withOpacity(0.15),
                            width: 1,
                          ),
                        ),
                        child: const Icon(
                          Icons.phone_outlined,
                          color: Colors.white54,
                          size: 36,
                        ),
                      ),

                      const SizedBox(height: 20),

                      // Title
                      Text(
                        'លេខទូរស័ព្ទ',
                        style: GoogleFonts.dangrek(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 8),

                      // Description
                      Text(
                        'សូមបញ្ចូលលេខទូរស័ព្ទរបស់អ្នក ដើម្បីផ្ទៀងផាត់ជាមួយ ABA ប្រព័ន្ធរបស់យើង។',
                        style: GoogleFonts.dangrek(
                          color: Colors.white,
                          fontSize: 13,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 50),

                      // Phone Number Fields
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'លេខទូរស័ព្ទ',
                            style: GoogleFonts.dangrek(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Row(
                            children: [
                              // Country Code
                              SizedBox(
                                width: 90,
                                child: TextField(
                                  controller: _countryCodeController,
                                  style: GoogleFonts.dangrek(
                                    color: Colors.white,
                                    fontSize: 14,
                                  ),
                                  decoration: InputDecoration(
                                    hintText: '+855',
                                    hintStyle: GoogleFonts.dangrek(
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                    border: const UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.white30,
                                      ),
                                    ),
                                    enabledBorder: const UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.white30,
                                      ),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.white.withOpacity(0.6),
                                      ),
                                    ),
                                    contentPadding: const EdgeInsets.symmetric(
                                      vertical: 6,
                                      horizontal: 2,
                                    ),
                                  ),
                                  keyboardType: TextInputType.phone,
                                  onChanged: (_) =>
                                      setState(() {}), // Refresh button state
                                ),
                              ),
                              const SizedBox(width: 16),
                              // Phone Number
                              Expanded(
                                child: TextField(
                                  controller: _phoneNumberController,
                                  style: GoogleFonts.dangrek(
                                    color: Colors.white,
                                    fontSize: 14,
                                  ),
                                  decoration: InputDecoration(
                                    hintText: 'លេខទូរស័ព្ទ',
                                    hintStyle: GoogleFonts.dangrek(
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                    border: const UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.white30,
                                      ),
                                    ),
                                    enabledBorder: const UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.white30,
                                      ),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.white.withOpacity(0.6),
                                      ),
                                    ),
                                    contentPadding: const EdgeInsets.symmetric(
                                      vertical: 8,
                                      horizontal: 4,
                                    ),
                                  ),
                                  keyboardType: TextInputType.phone,
                                  onChanged: (_) =>
                                      setState(() {}), // Refresh button state
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),

                      const Spacer(),

                      // Continue Button - GRAY when empty, RED when filled
                      SizedBox(
                        width: double.infinity,
                        height: 48,
                        child: ElevatedButton(
                          onPressed: _isPhoneValid
                              ? () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const HomeScreen(),
                                    ),
                                  );
                                }
                              : null,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: _isPhoneValid
                                ? const Color(0xFFE53935) // RED when enabled
                                : Colors.grey.withOpacity(
                                    0.3,
                                  ), // GRAY when disabled
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            elevation: 0,
                          ),
                          child: Text(
                            'បន្ត',
                            style: GoogleFonts.dangrek(
                              color: _isPhoneValid
                                  ? Colors.white
                                  : Colors.white54,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 32),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
