import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:khqr_widget/khqr_widget.dart';

class QRScreen extends StatefulWidget {
  const QRScreen({super.key});

  @override
  State<QRScreen> createState() => _QRScreenState();
}

class _QRScreenState extends State<QRScreen> {
  // Sample QR data - replace with your actual QR data
  final String qrData =
      "00020101021130510016abaakhppxxx@abaa01151251031081408570208ABA Bank5204539953031165802KH5919DsDigital 6010BATTAMBANG624668420010PAYWAY@ABA010663308202090320087470501163043B1E";

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        body: Stack(
          children: [
            // Background Image
            Positioned.fill(
              child: Image.asset(
                'assets/home_screen.png',
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) =>
                    Container(color: const Color(0xFF0d2836)), // Fallback color
              ),
            ),
            // Blur and Black Overlay
            Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
                child: Container(
                  color: Colors.black.withOpacity(0.2),
                ),
              ),
            ),
            // Main Content
            SafeArea(
              child: Column(
                children: [
                  // Top Bar with Back Button
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 18, vertical: 14),
                    child: Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: IconButton(
                            icon: const Icon(Icons.arrow_back,
                                color: Colors.white),
                            onPressed: () => Navigator.pop(context),
                          ),
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/aba_one.png',
                                height: 30,
                                fit: BoxFit.contain,
                              ),
                              const SizedBox(width: 6),
                              Text(
                                'QR',
                                style: GoogleFonts.inter(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 48), // To balance the back button visually
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 8.0),
                    child: Text(
                      'ប្រើ QRនេះដើម្បីទទួលប្រាក់ពីមិត្តភក្តិឫផ្ទេរប្រាក់ពីធនាគារផ្សេងរបស់អ្នក',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.dangrek(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w500
                      ),
                    ),
                  ),
                  
                  // KHQR Widget Content
                  Expanded(
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 40, left: 22, right: 22),
                        child: KhqrWidget(
                          width: 300,
                          receiverName: "CHEK SEREYODAM",
                          amount: "0",
                          currency: "USD",
                          qr: qrData,
                          qrIcon: Image.asset(
                            "assets/qr.png", // Uses your local QR icon
                            width: 30,
                            height: 30,
                          ),
                          duration: const Duration(minutes: 3),
                          onRetry: () {
                            // Handle retry logic
                            setState(() {});
                          },
                          clearAmountIcon: const Icon(
                            Icons.clear_rounded,
                            color: Colors.white,
                            size: 20,
                          ),

                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}