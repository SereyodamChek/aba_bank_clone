import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:aba_bank_clone/home/khqr.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isBalanceVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/home_screen.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 10),

                // Header Section
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Profile
                      Row(
                        children: [
                          Container(
                            width: 45,
                            height: 45,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: const Color(0xFF8B6914),
                                width: 3.0,
                              ),
                              image: const DecorationImage(
                                image: AssetImage('assets/profile.jpg'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'សួស្តី!',
                                style: GoogleFonts.dangrek(
                                  color: const Color(0xFF8B6914),
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500
                                ),
                              ),
                              Text(
                                'Sereyodam',
                                style: GoogleFonts.openSans(
                                  color: const Color(0xFF5C4A0F),
                                  fontSize: 19,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),

                      // Icons
                      Row(
                        children: [
                          _buildIcon(Iconsax.message_notif5),
                          const SizedBox(width: 5),
                          _buildIcon(Iconsax.notification_status5),
                          const SizedBox(width: 5),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                PageRouteBuilder(
                                  pageBuilder: (context, animation, secondaryAnimation) =>
                                      const QRScreen(),
                                  transitionsBuilder: (context, animation, secondaryAnimation, child) {
                                    const begin = Offset(1.0, 0.0); // Slide from right
                                    const end = Offset.zero;
                                    const curve = Curves.easeInOutCubic;
                                    var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                                    return SlideTransition(
                                      position: animation.drive(tween),
                                      child: FadeTransition(
                                        opacity: animation,
                                        child: child,
                                      ),
                                    );
                                  },
                                  transitionDuration: const Duration(milliseconds: 400),
                                ),
                              );
                            },
                            child: Container(
                              child: Padding(
                                padding: const EdgeInsets.all(1.0),
                                child: Image.asset(
                                  'assets/qr.png',
                                  height: 49,
                                  width: 49,
                                  cacheHeight: 44,
                                  cacheWidth: 44,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 12),

                // Balance Card
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(1),
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.08),
                        blurRadius: 16,
                        offset: const Offset(0, 6),
                      ),
                    ],
                    image: const DecorationImage(
                      image: AssetImage('assets/background.png'),
                      fit: BoxFit.cover,
                      opacity: 0.90,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 12),
                                Row(
                                  children: [
                                    AnimatedCrossFade(
                                      duration: const Duration(milliseconds: 300),
                                      firstChild: SizedBox(
                                        height: 35,
                                        width: 120,
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            '\$13,140,250',
                                            style: GoogleFonts.openSans(
                                              color: const Color(0xFF6B4A12),
                                              fontSize: 22,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                      secondChild: Container(
                                        width: 130,
                                        height: 45,
                                        alignment: Alignment.centerLeft,
                                        decoration: BoxDecoration(
                                          gradient: const LinearGradient(
                                            colors: [
                                              Color(0xFFE0BE6B),
                                              Color(0xFFC8942D),
                                            ],
                                          ),
                                          borderRadius: BorderRadius.circular(12),
                                        ),
                                      ),
                                      crossFadeState: _isBalanceVisible
                                          ? CrossFadeState.showFirst
                                          : CrossFadeState.showSecond,
                                    ),
                                    const SizedBox(width: 15),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          _isBalanceVisible = !_isBalanceVisible;
                                        });
                                      },
                                      child: Container(
                                        width: 32,
                                        height: 32,
                                        decoration: BoxDecoration(
                                          color: const Color(0xFFD0A049),
                                          border: Border.all(
                                            color: const Color(0xFF6B4A12),
                                            width: 1.5,
                                          ),
                                          borderRadius: BorderRadius.circular(12),
                                        ),
                                        child: AnimatedSwitcher(
                                          duration: const Duration(milliseconds: 300),
                                          transitionBuilder: (child, animation) {
                                            return FadeTransition(
                                              opacity: animation,
                                              child: ScaleTransition(
                                                  scale: animation, child: child),
                                            );
                                          },
                                          child: Icon(
                                            _isBalanceVisible
                                                ? Icons.visibility_off_outlined
                                                : Icons.visibility_outlined,
                                            key: ValueKey<bool>(_isBalanceVisible),
                                            color: const Color(0xFF7A5517),
                                            size: 20,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 12),
                                Row(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 10,
                                        vertical: 5,
                                      ),
                                      decoration: BoxDecoration(
                                        color: const Color(0xFFD0A049),
                                    border: Border.all(
                                      color: const Color(0xFF6B4A12),
                                      width: 1.0,
                                    ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Text(
                                        'គណនីគោល',
                                        style: GoogleFonts.dangrek(
                                          color: const Color(0xFF6B4A12),
                                          fontSize: 13,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    const Text(
                                      'USD',
                                      style: TextStyle(
                                        color: Color(0xFF6B4A12),
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 12),
                          Image.asset(
                            'assets/buddha.png',
                            width: 88,
                            height: 88,
                            errorBuilder: (context, error, stackTrace) =>
                                const SizedBox(),
                          ),
                        ],
                      ),
                      const SizedBox(height: 18),
                      Row(
                        children: [
                          Expanded(
                            child: _buildActionButton(
                              imagePath: 'assets/receive.png',
                              label: 'ទទួលលុយ',
                            ),
                          ),
                          const SizedBox(width: 8),
                          Container(
                            width: 1,
                            height: 32,
                            color: const Color(0xFFD5C4A7),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: _buildActionButton(
                              imagePath: 'assets/transfer.png',
                              label: 'ផ្ញើលុយ',
                            ),
                          ),
                          const SizedBox(width: 8),
                          Container(
                            width: 1,
                            height: 32,
                            color: const Color(0xFFD5C4A7),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: _buildActionButton(
                              imagePath: 'assets/analysis.png',
                              label: 'វិភាគ',
                              
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                // Quick Services Grid (3x2)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: _buildServiceCard(
                              'គណនី',
                      'assets/1.png',
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: _buildServiceCard(
                              'កាត',
                             'assets/2.png',
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: _buildServiceCard(
                              'ទូទាត់',
                             'assets/3.png',
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          Expanded(
                            child: _buildServiceCard(
                              'ABA ស្កេន',
                              'assets/4.png',
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: _buildServiceCard(
                              'គំរូទូទាត់ប្រចាំ',
                              'assets/5.png',
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: _buildServiceCard(
                              'ផ្ទេរប្រាក់',
                              'assets/6.png',
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 24),

                // More Services
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    children: [
                      _buildHorizontalServiceCard('កាដូ', 'assets/001.png'),
                      const SizedBox(width: 12),
                      _buildHorizontalServiceCard('អាជីវករ ABA', 'assets/002.png'),
                      const SizedBox(width: 12),
                      _buildHorizontalServiceCard('សេវាកម្មរដ្ឋាភិបាល', 'assets/003.png'),
                      const SizedBox(width: 12),
                      _buildHorizontalServiceCard('មីនីអេប', 'assets/004.png'),
                      const SizedBox(width: 12),
                      _buildHorizontalServiceCard('ណារី', 'assets/005.png'),
                      const SizedBox(width: 12),
                      _buildHorizontalServiceCard('ផ្ញើក្រាក់ទៅ ATM', 'assets/006.png'),
                      const SizedBox(width: 12),
                      _buildHorizontalServiceCard('ការទូទាត់ស្វ័យប្រវត្តិ', 'assets/007.png'),
                      const SizedBox(width: 12),
                      _buildHorizontalServiceCard('មុខងារវិភាគ', 'assets/008.png'),
                      const SizedBox(width: 12),
                      _buildHorizontalServiceCard('គណនីថ្មី', 'assets/009.png'),
                      const SizedBox(width: 12),
                      _buildHorizontalServiceCard('ណែនាំដល់មិត្តភក្តិ', 'assets/010.png'),
                      const SizedBox(width: 12),
                      _buildHorizontalServiceCard('កម្ចី', 'assets/011.png'),
                      const SizedBox(width: 12),
                      _buildHorizontalServiceCard('ABA ចាយបានលុយ', 'assets/012.png'),
                      const SizedBox(width: 12),
                      _buildHorizontalServiceCard('អត្រាប្តូរប្រាក់', 'assets/013.png'),
                      const SizedBox(width: 12),
                      _buildHorizontalServiceCard('ទីតាំង ABA', 'assets/014.png'),
                      const SizedBox(width: 12),
                      _buildHorizontalServiceCard('សៀវភៅមូលប្បទានប័ត្រ', 'assets/015.png'),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                // Promotional Slider
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 11.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'ដំណឹង & ប្រម៉ូសិន',
                        style: GoogleFonts.dangrek(
                          color: const Color(0xFF5C4A0F),
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Container(
                        height: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              blurRadius: 10,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: const _AutoImageSlider(),
                      ),
                      const SizedBox(height: 24),
                      Text(
                        'ការទូទាត់ញឹកញាប់',
                        style: GoogleFonts.dangrek(
                          color: const Color(0xFF5C4A0F),
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 12),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            SizedBox(
                              width: 110,
                              child: _buildServiceCard('គណនី', 'assets/1.png'),
                            ),
                            const SizedBox(width: 12),
                            SizedBox(
                              width: 110,
                              child: _buildServiceCard('កាត', 'assets/2.png'),
                            ),
                            const SizedBox(width: 12),
                            SizedBox(
                              width: 110,
                              child: _buildServiceCard('ប្រាក់', 'assets/3.png'),
                            ),
                            const SizedBox(width: 12),
                            SizedBox(
                              width: 110,
                              child: _buildServiceCard('ABA វិក័យ', 'assets/4.png'),
                            ),
                            const SizedBox(width: 12),
                            SizedBox(
                              width: 110,
                              child: _buildServiceCard('កម្ចី', 'assets/5.png'),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),
                      Text(
                        'សេវាស្ថាប័ន្ថរដ្ឋាភិបាល',
                        style: GoogleFonts.dangrek(
                          color: const Color(0xFF5C4A0F),
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 12),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            SizedBox(
                              width: 110,
                              child: _buildServiceCard('សេដ្ឋកិច្ច', 'assets/0A.png'),
                            ),
                            const SizedBox(width: 12),
                            SizedBox(
                              width: 110,
                              child: _buildServiceCard('ពាណិជ្ជកម្ម', 'assets/0B.png'),
                            ),
                            const SizedBox(width: 12),
                            SizedBox(
                              width: 110,
                              child: _buildServiceCard('សុខាភិបាល', 'assets/0C.png'),
                            ),
                            const SizedBox(width: 12),
                            SizedBox(
                              width: 110,
                              child: _buildServiceCard('ពត៌មាន', 'assets/0D.png'),
                            ),
                            const SizedBox(width: 12),
                            SizedBox(
                              width: 110,
                              child: _buildServiceCard('សារធារណការ', 'assets/0E.png'),
                            ),
                            const SizedBox(width: 12),
                            SizedBox(
                              width: 110,
                              child: _buildServiceCard('ឧស្សាហកម្ម', 'assets/0F.png'),
                            ),
                            const SizedBox(width: 12),
                            SizedBox(
                              width: 110,
                              child: _buildServiceCard('ទេសចរណ៏', 'assets/0G.png'),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),
                      Text(
                        'មីនីអេប',
                        style: GoogleFonts.dangrek(
                          color: const Color(0xFF5C4A0F),
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 12),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            _buildMiniAppCard(
                                imagePath: 'assets/4A.png', label: 'ស្មាតណាស់'),
                            const SizedBox(width: 16),
                            _buildMiniAppCard(
                                imagePath: 'assets/3A.png', label: 'សែលកាត'),
                            const SizedBox(width: 16),
                            _buildMiniAppCard(
                                imagePath: 'assets/2A.png', label: 'មិត្តហ្វូន'),
                            const SizedBox(width: 16),
                            _buildMiniAppCard(
                                imagePath: 'assets/1A.png', label: 'សុីថែល'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'ស្តារបាកស៍',
                        style: GoogleFonts.dangrek(
                          color: const Color(0xFF5C4A0F),
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 240, 231, 208),
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.05),
                              blurRadius: 10,
                              offset: const Offset(0, 9),
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Stack(
                            children: [
                              Positioned(
                                right: -70,
                                top: -10,
                                bottom: -10,
                                child: Opacity(
                                  opacity: 0.5,
                                  child: Image.asset(
                                    'assets/starbucks1.png',
                                    width: 150,
                                    height: 150,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Image.asset(
                                      'assets/starbucks.png',
                                      height: 70,
                                      width: 170,
                                      fit: BoxFit.contain,
                                    ),
                                    const SizedBox(height: 4),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Container(
                                            padding: const EdgeInsets.symmetric(vertical: 10),
                                            decoration: BoxDecoration(
                                              color: const Color(0xFF00704A),
                                              borderRadius: BorderRadius.circular(12),
                                            ),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                const Icon(Icons.add_circle_outline, color: Colors.white, size: 20),
                                                const SizedBox(width: 8),
                                                Text(
                                                  'បញ្ចូលលុយ',
                                                  style: GoogleFonts.dangrek(color: Colors.white, fontSize: 13),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 12),
                                        Expanded(
                                          child: Container(
                                            padding: const EdgeInsets.symmetric(vertical: 10),
                                            decoration: BoxDecoration(
                                              color: const Color(0xFF00704A),
                                              borderRadius: BorderRadius.circular(12),
                                            ),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                const Icon(Icons.account_balance_wallet, color: Colors.white, size: 20),
                                                const SizedBox(width: 8),
                                                Text(
                                                  'គិតលុយក្នុងហាង',
                                                  style: GoogleFonts.dangrek(color: Colors.white, fontSize: 13),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
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

  Widget _buildMiniAppCard({required String imagePath, required String label}) {
    return Container(
      width: 100,
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
      decoration: BoxDecoration(
        image: const DecorationImage(
          image: AssetImage('assets/background.png'),
          fit: BoxFit.cover,
          opacity: 0.9,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.01),
            blurRadius: 5,
            offset: const Offset(0, 9),
          ),
        ],
      ),
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.white,
            backgroundImage: AssetImage(imagePath),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.dangrek(
              color: const Color(0xFF5C4A0F),
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIcon(IconData icon) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Icon(icon, color: const Color.fromARGB(255, 255, 255, 255), size: 24),
    );
  }

  Widget _buildActionButton({
    required String imagePath,
    required String label,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          imagePath,
          width: 58,
          height: 48,
          errorBuilder: (context, error, stackTrace) => Container(
            width: 54,
            height: 54,
            decoration: BoxDecoration(
              color: const Color(0xFFD4AF37),
              borderRadius: BorderRadius.circular(13),
            ),
            child: const Icon(
              Icons.error_outline,
              color: Colors.white,
              size: 20,
            ),
          ),
        ),
        const SizedBox(height: 1),
        Text(
          label,
          textAlign: TextAlign.center,
          style: GoogleFonts.dangrek(
            color: const Color(0xFF6B4A12),
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildServiceCard(String label, dynamic iconOrImage) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 6),
      decoration: BoxDecoration(
        image: const DecorationImage(
          image: AssetImage('assets/background.png'),
          fit: BoxFit.cover,
          opacity: 0.9,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.01),
            blurRadius: 5,
            offset: const Offset(0, 9),
          ),
        ],
      ),
      child: Column(
        children: [
          if (iconOrImage is IconData)
            Icon(iconOrImage, color: const Color(0xFFD4AF37), size: 60)
          else if (iconOrImage is String)
            Image.asset(iconOrImage, width: 75, height: 65, fit: BoxFit.contain),
          const SizedBox(height: 8),
          Text(
            label,
            style: GoogleFonts.dangrek(
              color: const Color(0xFF5C4A0F),
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHorizontalServiceCard(String label, dynamic iconOrImage) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 11, horizontal: 10),
      decoration: BoxDecoration(
        image: const DecorationImage(
          image: AssetImage('assets/background.png'),
          fit: BoxFit.cover,
          opacity: 0.9,
        ),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.01),
            blurRadius: 2,
            offset: const Offset(0, 9),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (iconOrImage is IconData)
            Icon(iconOrImage, color: const Color(0xFFD4AF37), size: 50)
          else if (iconOrImage is String)
            Image.asset(iconOrImage, width: 55, height: 30, fit: BoxFit.contain),
          const SizedBox(width: 4),
          Text(
            label,
            style: GoogleFonts.dangrek(
              color: const Color(0xFF5C4A0F),
              fontSize: 16,
              fontWeight: FontWeight.w500
            ),
          ),
        ],
      ),
    );
  }
}

class _AutoImageSlider extends StatefulWidget {
  const _AutoImageSlider();

  @override
  State<_AutoImageSlider> createState() => _AutoImageSliderState();
}

class _AutoImageSliderState extends State<_AutoImageSlider> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  Timer? _timer;
  final List<String> _images = [
    'assets/A.png',
    'assets/B.png',
    'assets/C.png',
    'assets/D.png',
  ];

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (_currentPage < _images.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      if (_pageController.hasClients) {
        _pageController.animateToPage(
          _currentPage,
          duration: const Duration(milliseconds: 350),
          curve: Curves.easeIn,
        );
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: PageView.builder(
        controller: _pageController,
        itemCount: _images.length,
        onPageChanged: (int page) {
          setState(() {
            _currentPage = page;
          });
        },
        itemBuilder: (context, index) {
          return Image.asset(
            _images[index],
            fit: BoxFit.cover,
          );
        },
      ),
    );
  }
}