import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Concepts Demo App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Poppins',
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF6366F1),
          brightness: Brightness.light,
        ),
        scaffoldBackgroundColor: const Color(0xFF0F172A),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/form': (context) => const FormScreen(),
        '/images': (context) => const ImageGridScreen(),
        '/animation': (context) => const AnimationScreen(),
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isDesktop = size.width > 768;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text(
          'HomeScreen',
          style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 0.5),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.white,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF0F172A),
              Color(0xFF1E1B4B),
              Color(0xFF311042),
            ],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(
              horizontal: isDesktop ? 48.0 : 20.0,
              vertical: 20.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Hero Banner Header
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(28),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    gradient: const LinearGradient(
                      colors: [Color(0xFF6366F1), Color(0xFFA855F7), Color(0xFFEC4899)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF6366F1).withOpacity(0.4),
                        blurRadius: 25,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: const Text(
                                'ASSIGNMENT 4 • CS KHARGHAR',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.2,
                                ),
                              ),
                            ),
                            const SizedBox(height: 12),
                            const Text(
                              'Flutter Concepts Showcase',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 26,
                                fontWeight: FontWeight.w800,
                                height: 1.2,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Interactive implementation of Forms, Grid Assets, Custom Fonts & AnimatedContainer',
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.85),
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                      ),
                      if (isDesktop) ...[
                        const SizedBox(width: 20),
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.15),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(Icons.rocket_launch_rounded, size: 48, color: Colors.white),
                        ),
                      ]
                    ],
                  ),
                ),
                const SizedBox(height: 28),

                const Text(
                  'Explore Modules',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 0.5,
                  ),
                ),
                const SizedBox(height: 16),

                // Cards Grid / Responsive Column
                LayoutBuilder(
                  builder: (context, constraints) {
                    if (constraints.maxWidth > 700) {
                      return Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: _buildModernCard(
                              context,
                              title: 'User Input & Forms',
                              subtitle: 'Form validation, controllers, custom decorations & SnackBars',
                              icon: Icons.assignment_rounded,
                              accentGradient: const [Color(0xFF6366F1), Color(0xFF818CF8)],
                              badgeText: 'Screen 1',
                              route: '/form',
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: _buildModernCard(
                              context,
                              title: 'Images & Fonts',
                              subtitle: 'Asset loading, GridView.count & custom Poppins Google font',
                              icon: Icons.grid_view_rounded,
                              accentGradient: const [Color(0xFF06B6D4), Color(0xFF3B82F6)],
                              badgeText: 'Screen 2',
                              route: '/images',
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: _buildModernCard(
                              context,
                              title: 'Animations',
                              subtitle: 'Interactive AnimatedContainer smoothly altering size, color & radius',
                              icon: Icons.auto_awesome_rounded,
                              accentGradient: const [Color(0xFFEC4899), Color(0xFFF43F5E)],
                              badgeText: 'Screen 3',
                              route: '/animation',
                            ),
                          ),
                        ],
                      );
                    }
                    return Column(
                      children: [
                        _buildModernCard(
                          context,
                          title: 'User Input & Forms',
                          subtitle: 'Form validation, controllers, custom decorations & SnackBars',
                          icon: Icons.assignment_rounded,
                          accentGradient: const [Color(0xFF6366F1), Color(0xFF818CF8)],
                          badgeText: 'Screen 1',
                          route: '/form',
                        ),
                        const SizedBox(height: 16),
                        _buildModernCard(
                          context,
                          title: 'Images, Assets & Fonts',
                          subtitle: 'Asset loading, GridView.count & custom Poppins Google font',
                          icon: Icons.grid_view_rounded,
                          accentGradient: const [Color(0xFF06B6D4), Color(0xFF3B82F6)],
                          badgeText: 'Screen 2',
                          route: '/images',
                        ),
                        const SizedBox(height: 16),
                        _buildModernCard(
                          context,
                          title: 'Animations',
                          subtitle: 'Interactive AnimatedContainer smoothly altering size, color & radius',
                          icon: Icons.auto_awesome_rounded,
                          accentGradient: const [Color(0xFFEC4899), Color(0xFFF43F5E)],
                          badgeText: 'Screen 3',
                          route: '/animation',
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildModernCard(
    BuildContext context, {
    required String title,
    required String subtitle,
    required IconData icon,
    required List<Color> accentGradient,
    required String badgeText,
    required String route,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () => Navigator.pushNamed(context, route),
        borderRadius: BorderRadius.circular(20),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: const Color(0xFF1E293B).withOpacity(0.8),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: Colors.white.withOpacity(0.08),
              width: 1.5,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                blurRadius: 15,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(colors: accentGradient),
                      borderRadius: BorderRadius.circular(14),
                      boxShadow: [
                        BoxShadow(
                          color: accentGradient.first.withOpacity(0.4),
                          blurRadius: 12,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Icon(icon, color: Colors.white, size: 26),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: accentGradient.first.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: accentGradient.first.withOpacity(0.3)),
                    ),
                    child: Text(
                      badgeText,
                      style: TextStyle(
                        color: accentGradient.last,
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                subtitle,
                style: TextStyle(
                  color: Colors.grey[400],
                  fontSize: 13,
                  height: 1.4,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'Explore Module',
                      style: TextStyle(
                        color: accentGradient.last,
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(width: 4),
                  Icon(Icons.arrow_forward_rounded, size: 16, color: accentGradient.last),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            children: [
              const Icon(Icons.check_circle_rounded, color: Colors.white),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  'Success! Welcome ${_nameController.text}',
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
          backgroundColor: const Color(0xFF10B981),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          margin: const EdgeInsets.all(16),
        ),
      );
    }
  }

  void _resetForm() {
    _formKey.currentState!.reset();
    _nameController.clear();
    _emailController.clear();
    _phoneController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text('User Input & Forms', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.white,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF0F172A), Color(0xFF1E1B4B)],
          ),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24.0),
              child: Container(
                constraints: const BoxConstraints(maxWidth: 480),
                padding: const EdgeInsets.all(28.0),
                decoration: BoxDecoration(
                  color: const Color(0xFF1E293B).withOpacity(0.9),
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(color: Colors.white.withOpacity(0.1)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.4),
                      blurRadius: 30,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: const Color(0xFF6366F1).withOpacity(0.2),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Icon(Icons.person_add_rounded, color: Color(0xFF818CF8)),
                          ),
                          const SizedBox(width: 14),
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'User Registration',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                'Form validation & SnackBar feedback',
                                style: TextStyle(fontSize: 12, color: Colors.grey),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),

                      _buildDarkTextField(
                        controller: _nameController,
                        label: 'Full Name',
                        hint: 'John Doe',
                        icon: Icons.person_outline_rounded,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Please enter your name';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),

                      _buildDarkTextField(
                        controller: _emailController,
                        label: 'Email Address',
                        hint: 'john@example.com',
                        icon: Icons.email_outlined,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Please enter your email';
                          }
                          if (!value.contains('@') || !value.contains('.')) {
                            return 'Enter a valid email address';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),

                      _buildDarkTextField(
                        controller: _phoneController,
                        label: 'Phone Number',
                        hint: '+91 9876543210',
                        icon: Icons.phone_outlined,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Please enter your phone number';
                          }
                          if (value.trim().length < 10) {
                            return 'Enter a valid 10-digit number';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 28),

                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(vertical: 16),
                                backgroundColor: const Color(0xFF6366F1),
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(14),
                                ),
                                elevation: 4,
                              ),
                              onPressed: _submitForm,
                              child: const Text(
                                'Submit Form',
                                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(vertical: 16),
                                foregroundColor: Colors.grey[300],
                                side: BorderSide(color: Colors.grey.withOpacity(0.3)),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(14),
                                ),
                              ),
                              onPressed: _resetForm,
                              child: const Text('Reset', style: TextStyle(fontSize: 15)),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDarkTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
    required IconData icon,
    required String? Function(String?) validator,
  }) {
    return TextFormField(
      controller: controller,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.grey[400]),
        hintText: hint,
        hintStyle: TextStyle(color: Colors.grey[600]),
        prefixIcon: Icon(icon, color: const Color(0xFF818CF8)),
        filled: true,
        fillColor: const Color(0xFF0F172A).withOpacity(0.6),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: Colors.white.withOpacity(0.1)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: Colors.white.withOpacity(0.1)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: Color(0xFF6366F1), width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: Color(0xFFEF4444)),
        ),
      ),
      validator: validator,
    );
  }
}

class ImageGridScreen extends StatelessWidget {
  const ImageGridScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> images = [
      {'path': 'assets/images/img1.png', 'title': 'Mountain Peak', 'tag': 'Nature'},
      {'path': 'assets/images/img2.png', 'title': 'Ocean Wave', 'tag': 'Water'},
      {'path': 'assets/images/img3.png', 'title': 'Sunset Horizon', 'tag': 'Sky'},
      {'path': 'assets/images/img4.png', 'title': 'Forest Valley', 'tag': 'Landscape'},
    ];

    final size = MediaQuery.of(context).size;
    final crossAxisCount = size.width > 900 ? 4 : (size.width > 600 ? 2 : 2);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text('Images, Assets & Fonts', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.white,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF0F172A), Color(0xFF0F2942)],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: const Color(0xFF06B6D4).withOpacity(0.15),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: const Color(0xFF06B6D4).withOpacity(0.3)),
                  ),
                  child: const Row(
                    children: [
                      Icon(Icons.font_download_rounded, color: Color(0xFF06B6D4), size: 28),
                      SizedBox(width: 14),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Custom Typography: Poppins Font',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              'Rendered cleanly with Image.asset() inside GridView.count',
                              style: TextStyle(color: Colors.grey, fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: GridView.count(
                    physics: const BouncingScrollPhysics(),
                    crossAxisCount: crossAxisCount,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 0.9,
                    children: images.map((item) {
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.white.withOpacity(0.1)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              blurRadius: 12,
                              offset: const Offset(0, 6),
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Stack(
                            fit: StackFit.expand,
                            children: [
                              Image.asset(
                                item['path']!,
                                fit: BoxFit.cover,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Colors.transparent,
                                      Colors.black.withOpacity(0.85),
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 12,
                                right: 12,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                                  decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.5),
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(color: Colors.white.withOpacity(0.2)),
                                  ),
                                  child: Text(
                                    item['tag']!,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 14,
                                left: 14,
                                right: 14,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      item['title']!,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const Text(
                                      'Asset: Image.asset()',
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 11,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AnimationScreen extends StatefulWidget {
  const AnimationScreen({super.key});

  @override
  State<AnimationScreen> createState() => _AnimationScreenState();
}

class _AnimationScreenState extends State<AnimationScreen> {
  bool _isExpanded = false;

  void _toggleAnimation() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text('Interactive Animations', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.white,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF0F172A), Color(0xFF3B0764)],
          ),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'AnimatedContainer Demo',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 6),
              const Text(
                'Tap container or button to trigger fluid visual property change',
                style: TextStyle(color: Colors.grey, fontSize: 13),
              ),
              const SizedBox(height: 40),

              GestureDetector(
                onTap: _toggleAnimation,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 700),
                  curve: Curves.elasticOut,
                  width: _isExpanded ? 240 : 130,
                  height: _isExpanded ? 240 : 130,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: _isExpanded
                          ? [const Color(0xFFEC4899), const Color(0xFF8B5CF6)]
                          : [const Color(0xFF06B6D4), const Color(0xFF3B82F6)],
                      begin: _isExpanded ? Alignment.topLeft : Alignment.bottomRight,
                      end: _isExpanded ? Alignment.bottomRight : Alignment.topLeft,
                    ),
                    borderRadius: BorderRadius.circular(_isExpanded ? 120 : 20),
                    boxShadow: [
                      BoxShadow(
                        color: (_isExpanded ? const Color(0xFFEC4899) : const Color(0xFF06B6D4))
                            .withOpacity(0.5),
                        blurRadius: 30,
                        spreadRadius: 2,
                        offset: const Offset(0, 12),
                      ),
                    ],
                  ),
                  alignment: _isExpanded ? Alignment.center : Alignment.center,
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    child: Icon(
                      _isExpanded ? Icons.auto_awesome_rounded : Icons.touch_app_rounded,
                      key: ValueKey<bool>(_isExpanded),
                      color: Colors.white,
                      size: _isExpanded ? 70 : 45,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 50),

              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFEC4899),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 8,
                  shadowColor: const Color(0xFFEC4899).withOpacity(0.5),
                ),
                onPressed: _toggleAnimation,
                icon: Icon(
                  _isExpanded ? Icons.refresh_rounded : Icons.play_arrow_rounded,
                ),
                label: Text(
                  _isExpanded ? 'Reset Container' : 'Trigger Animation',
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
