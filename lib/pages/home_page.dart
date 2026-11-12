
import 'package:flutter/material.dart';
import 'package:belajar_flutter/routes/app_route.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const Color primary = Color(0xFF37474F);
  static const Color accent = Color(0xFF42A5F5);
  static const Color background = Color(0xFFF3F6FA);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,

      appBar: AppBar(
        backgroundColor: background,
        elevation: 0,
        scrolledUnderElevation: 0,
        title: const Row(
          children: [
            Icon(Icons.dashboard_rounded, color: primary),
            SizedBox(width: 10),
            Text(
              'My Dashboard',
              style: TextStyle(
                color: primary,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ],
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 18),
            padding: const EdgeInsets.all(9),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(
              Icons.notifications_none_rounded,
              color: primary,
            ),
          ),
        ],
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // WELCOME CARD
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFF37474F),
                    Color(0xFF546E7A),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: primary.withOpacity(0.2),
                    blurRadius: 18,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: Stack(
                children: [
                  Positioned(
                    right: -15,
                    top: -15,
                    child: Icon(
                      Icons.dashboard_rounded,
                      size: 120,
                      color: Colors.white.withOpacity(0.08),
                    ),
                  ),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 7,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.15),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Text(
                          'FLUTTER LEARNING',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            letterSpacing: 1.5,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      const SizedBox(height: 22),

                      const Text(
                        'Welcome Back!',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 27,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 8),

                      const Text(
                        'Terus belajar dan kembangkan\nkemampuan programming-mu.',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 13,
                          height: 1.6,
                        ),
                      ),

                      const SizedBox(height: 22),

                      Row(
                        children: [
                          const Icon(
                            Icons.auto_awesome,
                            color: Color(0xFFFFD180),
                            size: 17,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            'Keep learning, keep growing!',
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.9),
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            // STATISTICS
            Row(
              children: [
                Expanded(
                  child: statCard(
                    icon: Icons.menu_book_rounded,
                    title: '6',
                    subtitle: 'Learning Menu',
                    color: const Color(0xFF42A5F5),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: statCard(
                    icon: Icons.code_rounded,
                    title: 'Flutter',
                    subtitle: 'Programming',
                    color: const Color(0xFF26A69A),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 30),

            // SECTION TITLE
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Menu Utama',
                  style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF263238),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE3F2FD),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    '6 MENU',
                    style: TextStyle(
                      color: Color(0xFF1976D2),
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 7),

            const Text(
              'Pilih menu untuk mulai menjelajahi aplikasi.',
              style: TextStyle(
                color: Colors.blueGrey,
                fontSize: 13,
              ),
            ),

            const SizedBox(height: 18),

            menuCard(
              context,
              title: 'Profile',
              subtitle: 'Lihat informasi dan biodata',
              icon: Icons.person_outline_rounded,
              color: const Color(0xFF42A5F5),
              onTap: () {
                Navigator.pushNamed(context, AppRoute.about);
              },
            ),

            menuCard(
              context,
              title: 'Article List',
              subtitle: 'Jelajahi daftar artikel',
              icon: Icons.article_outlined,
              color: const Color(0xFF26A69A),
              onTap: () {
                Navigator.pushNamed(context, AppRoute.articleList);
              },
            ),

            menuCard(
              context,
              title: 'Instagram Grid',
              subtitle: 'Tampilan grid ala Instagram',
              icon: Icons.grid_view_rounded,
              color: const Color(0xFFAB7AE8),
              onTap: () {
                Navigator.pushNamed(context, AppRoute.ig);
              },
            ),

            menuCard(
              context,
              title: 'Latihan 3',
              subtitle: 'Eksplorasi widget Flutter',
              icon: Icons.terminal_rounded,
              color: const Color(0xFFFFA726),
              onTap: () {
                Navigator.pushNamed(context, AppRoute.lat3);
              },
            ),

            menuCard(
              context,
              title: 'Form Page',
              subtitle: 'Formulir pengisian biodata',
              icon: Icons.assignment_outlined,
              color: const Color(0xFFEC6B83),
              onTap: () {
                Navigator.pushNamed(context, AppRoute.form);
              },
            ),

            menuCard(
              context,
              title: 'Pendaftaran Eskul',
              subtitle: 'Formulir pendaftaran ekstrakurikuler',
              icon: Icons.school_outlined,
              color: const Color(0xFF78909C),
              onTap: () {
                Navigator.pushNamed(context, AppRoute.eskul);
              },
            ),

            menuCard(
              context,
              title: 'Tiket Wisata',
              subtitle: 'Jelajahi dan pesan tiket wisata',
              icon: Icons.travel_explore_rounded,
              color: const Color(0xFF26A69A),
              onTap: () {
                Navigator.pushNamed(context, AppRoute.wisata);
              },
            ),

            menuCard(
              context,
              title: 'fetch API',
              subtitle: 'Jelajahi dan pesan tiket wisata',
              icon: Icons.travel_explore_rounded,
              color: const Color(0xFF26A69A),
              onTap: () {
                Navigator.pushNamed(context, AppRoute.fetchApi);
              },
            ),

             menuCard(
              context,
              title: 'post API',
              subtitle: 'Jelajahi dan pesan tiket wisata',
              icon: Icons.travel_explore_rounded,
              color: const Color(0xFF26A69A),
              onTap: () {
                Navigator.pushNamed(context, AppRoute.postApi);
              },
            ),
            
            menuCard(
              context,
              title: 'comment API',
              subtitle: 'Jelajahi dan pesan tiket wisata',
              icon: Icons.travel_explore_rounded,
              color: const Color(0xFF26A69A),
              onTap: () {
                Navigator.pushNamed(context, AppRoute.commentApi);
              },
            ),

            const SizedBox(height: 25),

            // FOOTER
            Center(
              child: Column(
                children: [
                  Container(
                    width: 40,
                    height: 4,
                    decoration: BoxDecoration(
                      color: const Color(0xFFCFD8DC),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Made with Flutter',
                    style: TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'Keep learning, keep creating.',
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
  }

  // STATISTIC CARD
  Widget statCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.035),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: color, size: 25),
          const SizedBox(height: 12),
          Text(
            title,
            style: const TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.bold,
              color: Color(0xFF263238),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            subtitle,
            style: const TextStyle(
              fontSize: 11,
              color: Colors.blueGrey,
            ),
          ),
        ],
      ),
    );
  }

  // MENU CARD
  Widget menuCard(
    BuildContext context, {
    required String title,
    required String subtitle,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.035),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(18),
        child: InkWell(
          borderRadius: BorderRadius.circular(18),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              children: [
                Container(
                  width: 52,
                  height: 52,
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.12),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Icon(
                    icon,
                    color: color,
                    size: 26,
                  ),
                ),

                const SizedBox(width: 15),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF263238),
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        subtitle,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.blueGrey,
                        ),
                      ),
                    ],
                  ),
                ),

                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF3F6FA),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 13,
                    color: Color(0xFF607D8B),
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
