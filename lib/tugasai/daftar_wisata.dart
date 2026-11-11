
import 'package:flutter/material.dart';
import 'package:belajar_flutter/tugasai/detail_wisata.dart';

class DaftarWisata extends StatefulWidget {
  const DaftarWisata({super.key});

  @override
  State<DaftarWisata> createState() => _DaftarWisataState();
}

class _DaftarWisataState extends State<DaftarWisata> {
  int selectedCategory = 0;
  int selectedMenu = 0;

  final TextEditingController searchController =
      TextEditingController();

  final Color orange = const Color(0xFFFF9800);
  final Color background = const Color(0xFFFFFBF5);

  final List<Map<String, dynamic>> categories = [
  {'name': 'Semua', 'icon': Icons.public},
  {'name': 'Indonesia', 'icon': Icons.flag},
  {'name': 'Asia', 'icon': Icons.temple_buddhist},
  {'name': 'Eropa', 'icon': Icons.castle},
  {'name': 'Amerika', 'icon': Icons.landscape},
  {'name': 'Afrika', 'icon': Icons.wb_sunny},
  {'name': 'Oseania', 'icon': Icons.sailing},
];

 final List<Map<String, dynamic>> destinations = [
  // INDONESIA
  {
    'name': 'Danau Beratan',
    'location': 'Bali, Indonesia',
    'price': 'Rp25.000',
    'rating': '5.0',
    'category': 'Indonesia',
    'image': 'https://images.unsplash.com/photo-1537996194471-e657df975ab4?w=900',
    'description': 'Danau Beratan merupakan destinasi terkenal di Bali dengan pemandangan danau yang indah dan suasana pegunungan yang sejuk.',
  },
  {
    'name': 'Raja Ampat',
    'location': 'Papua Barat, Indonesia',
    'price': 'Rp150.000',
    'rating': '4.9',
    'category': 'Indonesia',
    'image': 'https://images.unsplash.com/photo-1516690561799-46d8f74f9abf?w=900',
    'description': 'Raja Ampat terkenal dengan pulau-pulau karst, air laut jernih, dan kekayaan bawah laut yang menakjubkan.',
  },
  {
    'name': 'Gunung Bromo',
    'location': 'Jawa Timur, Indonesia',
    'price': 'Rp50.000',
    'rating': '4.8',
    'category': 'Indonesia',
    'image': 'https://images.unsplash.com/photo-1500530855697-b586d89ba3ee?w=900',
    'description': 'Gunung Bromo menawarkan panorama pegunungan dan pemandangan matahari terbit yang indah.',
  },

  // ASIA
  {
    'name': 'Mount Fuji',
    'location': 'Yamanashi, Jepang',
    'price': 'Rp500.000',
    'rating': '4.9',
    'category': 'Asia',
    'image': 'https://images.unsplash.com/photo-1493976040374-85c8e12f0c0e?w=900',
    'description': 'Gunung Fuji merupakan ikon Jepang yang terkenal dengan pemandangan alam dan keindahan puncaknya.',
  },
  {
    'name': 'Great Wall',
    'location': 'Beijing, China',
    'price': 'Rp350.000',
    'rating': '4.9',
    'category': 'Asia',
    'image': 'https://images.unsplash.com/photo-1508804185872-d7badad00f7d?w=900',
    'description': 'Tembok Besar China merupakan bangunan bersejarah yang membentang melintasi wilayah pegunungan China.',
  },
  {
    'name': 'Maldives',
    'location': 'Maladewa',
    'price': 'Rp2.500.000',
    'rating': '5.0',
    'category': 'Asia',
    'image': 'https://images.unsplash.com/photo-1514282401047-d79a71a590e8?w=900',
    'description': 'Maladewa terkenal dengan pantai berpasir putih, laut biru jernih, dan resort di atas air.',
  },

  // EROPA
  {
    'name': 'Eiffel Tower',
    'location': 'Paris, Prancis',
    'price': 'Rp450.000',
    'rating': '5.0',
    'category': 'Eropa',
    'image': 'https://images.unsplash.com/photo-1511739001486-6bfe10ce785f?w=900',
    'description': 'Menara Eiffel merupakan landmark terkenal Paris yang menjadi salah satu ikon wisata dunia.',
  },
  {
    'name': 'Colosseum',
    'location': 'Roma, Italia',
    'price': 'Rp300.000',
    'rating': '4.9',
    'category': 'Eropa',
    'image': 'https://images.unsplash.com/photo-1552832230-c0197dd311b5?w=900',
    'description': 'Colosseum merupakan bangunan bersejarah peninggalan Kekaisaran Romawi dengan arsitektur yang megah.',
  },
  {
    'name': 'Swiss Alps',
    'location': 'Swiss',
    'price': 'Rp750.000',
    'rating': '5.0',
    'category': 'Eropa',
    'image': 'https://images.unsplash.com/photo-1531366936337-7c912a4589a7?w=900',
    'description': 'Pegunungan Alpen Swiss menawarkan pemandangan pegunungan bersalju, danau, dan desa yang indah.',
  },

  // AMERIKA
  {
    'name': 'Grand Canyon',
    'location': 'Arizona, Amerika Serikat',
    'price': 'Rp400.000',
    'rating': '4.9',
    'category': 'Amerika',
    'image': 'https://images.unsplash.com/photo-1474044159687-1ee9f3a51722?w=900',
    'description': 'Grand Canyon merupakan ngarai besar dengan formasi batuan alami yang terbentuk selama jutaan tahun.',
  },
  {
    'name': 'Statue of Liberty',
    'location': 'New York, Amerika Serikat',
    'price': 'Rp350.000',
    'rating': '4.8',
    'category': 'Amerika',
    'image': 'https://images.unsplash.com/photo-1501594907352-04cda38ebc29?w=900',
    'description': 'Patung Liberty merupakan landmark terkenal di New York yang menjadi simbol kebebasan.',
  },
  {
    'name': 'Machu Picchu',
    'location': 'Cusco, Peru',
    'price': 'Rp500.000',
    'rating': '4.9',
    'category': 'Amerika',
    'image': 'https://images.unsplash.com/photo-1526392060635-9d6019884377?w=900',
    'description': 'Machu Picchu merupakan situs peninggalan peradaban Inca yang terletak di kawasan pegunungan Peru.',
  },

  // AFRIKA
  {
    'name': 'Pyramids of Giza',
    'location': 'Giza, Mesir',
    'price': 'Rp250.000',
    'rating': '5.0',
    'category': 'Afrika',
    'image': 'https://images.unsplash.com/photo-1539650116574-75c0c6d73f6e?w=900',
    'description': 'Piramida Giza merupakan peninggalan peradaban Mesir Kuno yang menjadi salah satu keajaiban dunia.',
  },
  {
    'name': 'Serengeti',
    'location': 'Tanzania, Afrika',
    'price': 'Rp1.000.000',
    'rating': '4.9',
    'category': 'Afrika',
    'image': 'https://images.unsplash.com/photo-1516426122078-c23e76319801?w=900',
    'description': 'Serengeti terkenal dengan padang savana luas dan keanekaragaman satwa liar Afrika.',
  },

  // OSEANIA
  {
    'name': 'Sydney Opera House',
    'location': 'Sydney, Australia',
    'price': 'Rp400.000',
    'rating': '4.9',
    'category': 'Oseania',
    'image': 'https://images.unsplash.com/photo-1506973035872-a4ec16b8e8d9?w=900',
    'description': 'Sydney Opera House merupakan bangunan ikonik Australia dengan desain arsitektur yang unik.',
  },
  {
    'name': 'Milford Sound',
    'location': 'South Island, Selandia Baru',
    'price': 'Rp650.000',
    'rating': '5.0',
    'category': 'Oseania',
    'image': 'https://images.unsplash.com/photo-1469521669194-babb45599def?w=900',
    'description': 'Milford Sound menawarkan pemandangan fjord, air terjun, dan pegunungan yang menakjubkan.',
  },
];

  final Set<int> favorites = {};

  List<Map<String, dynamic>> get filteredDestinations {
    return destinations.where((destination) {
      final selectedName = categories[selectedCategory]['name'];

      final matchesCategory = selectedCategory == 0 ||
          destination['category'] == selectedName;

      final keyword =
          searchController.text.toLowerCase().trim();

      final matchesSearch =
          destination['name'].toString().toLowerCase().contains(keyword) ||
          destination['location'].toString().toLowerCase().contains(keyword);

      return matchesCategory && matchesSearch;
    }).toList();
  }

  // MEMBUKA HALAMAN DETAIL
  void openDetail(Map<String, dynamic> destination) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailWisata(
          destination: destination,
        ),
      ),
    );
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(bottom: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildHeader(),
                    _buildSearchBar(),

                    const SizedBox(height: 27),

                    _buildSectionTitle('Choose your next trip'),

                    const SizedBox(height: 16),

                    _buildCategories(),

                    const SizedBox(height: 27),

                    _buildPopularTitle(),

                    const SizedBox(height: 16),

                    _buildDestinationList(),

                    const SizedBox(height: 25),

                    _buildExploreBanner(),
                  ],
                ),
              ),
            ),

            _buildBottomNavigation(),
          ],
        ),
      ),
    );
  }

  // HEADER
  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(22, 15, 22, 20),
      child: Row(
        children: [
          _headerButton(Icons.menu_rounded, () {}),

          const Spacer(),

          _headerButton(Icons.search_rounded, () {
            FocusScope.of(context).requestFocus(FocusNode());
          }),

          const SizedBox(width: 10),

          _headerButton(Icons.notifications_none_rounded, () {}),
        ],
      ),
    );
  }

  Widget _headerButton(IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 42,
        height: 42,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(13),
        ),
        child: Icon(icon, size: 23),
      ),
    );
  }

  // SEARCH BAR
  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: Container(
        height: 52,
        padding: const EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            Icon(Icons.search, color: orange, size: 23),
            const SizedBox(width: 10),

            Expanded(
              child: TextField(
                controller: searchController,
                onChanged: (value) => setState(() {}),
                decoration: const InputDecoration(
                  hintText: 'Search destinations',
                  hintStyle: TextStyle(
                    fontSize: 13,
                    color: Colors.grey,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),

            const Icon(
              Icons.tune_rounded,
              color: Colors.black54,
              size: 21,
            ),
          ],
        ),
      ),
    );
  }

  // TITLE
  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 21,
          fontWeight: FontWeight.bold,
          color: Color(0xFF202020),
        ),
      ),
    );
  }

  // CATEGORY
  Widget _buildCategories() {
    return SizedBox(
      height: 45,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 22),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final isSelected = selectedCategory == index;

          return GestureDetector(
            onTap: () {
              setState(() {
                selectedCategory = index;
              });
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              margin: const EdgeInsets.only(right: 10),
              padding: const EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                color: isSelected ? Colors.black : Colors.white,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                children: [
                  Icon(
                    categories[index]['icon'] as IconData,
                    size: 17,
                    color: isSelected ? Colors.white : Colors.black54,
                  ),
                  const SizedBox(width: 7),
                  Text(
                    categories[index]['name'].toString(),
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: isSelected ? Colors.white : Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  // POPULAR TITLE
  Widget _buildPopularTitle() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Popular destinations',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF202020),
            ),
          ),

          GestureDetector(
            onTap: () {
              setState(() {
                selectedCategory = 0;
                searchController.clear();
              });
            },
            child: Text(
              'See all',
              style: TextStyle(
                color: orange,
                fontWeight: FontWeight.w600,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // DESTINATION LIST
  Widget _buildDestinationList() {
    final items = filteredDestinations;

    if (items.isEmpty) {
      return const SizedBox(
        height: 180,
        child: Center(
          child: Text(
            'Destinasi tidak ditemukan',
            style: TextStyle(color: Colors.grey),
          ),
        ),
      );
    }

    return SizedBox(
      height: 220,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 22),
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          final originalIndex = destinations.indexOf(item);

          return _buildDestinationCard(item, originalIndex);
        },
      ),
    );
  }

  // DESTINATION CARD
  Widget _buildDestinationCard(
    Map<String, dynamic> item,
    int originalIndex,
  ) {
    final isFavorite = favorites.contains(originalIndex);

    return GestureDetector(
      onTap: () => openDetail(item),
      child: Container(
        width: 235,
        margin: const EdgeInsets.only(right: 14),
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(23),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(23),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.network(
                item['image'].toString(),
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: const Color(0xFFD7CCC8),
                    child: const Icon(
                      Icons.image_not_supported,
                      size: 40,
                      color: Colors.white,
                    ),
                  );
                },
              ),

              Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black26,
                      Colors.transparent,
                      Colors.black87,
                    ],
                  ),
                ),
              ),

              // RATING
              Positioned(
                top: 13,
                left: 13,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 7,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.star, color: orange, size: 14),
                      const SizedBox(width: 4),
                      Text(
                        item['rating'].toString(),
                        style: const TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // FAVORITE
              Positioned(
                top: 13,
                right: 13,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      if (isFavorite) {
                        favorites.remove(originalIndex);
                      } else {
                        favorites.add(originalIndex);
                      }
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      isFavorite
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: isFavorite ? Colors.red : Colors.black,
                      size: 18,
                    ),
                  ),
                ),
              ),

              // INFORMATION
              Positioned(
                left: 16,
                right: 60,
                bottom: 17,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item['name'].toString(),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 4),

                    Row(
                      children: [
                        const Icon(
                          Icons.location_on,
                          color: Colors.white70,
                          size: 13,
                        ),
                        const SizedBox(width: 3),
                        Expanded(
                          child: Text(
                            item['location'].toString(),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: Colors.white70,
                              fontSize: 11,
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 8),

                    Text(
                      'Mulai ${item['price']} / orang',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),

              // ARROW
              Positioned(
                right: 14,
                bottom: 17,
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.arrow_forward_rounded,
                    color: orange,
                    size: 22,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // EXPLORE BANNER
  Widget _buildExploreBanner() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: Container(
        height: 130,
        width: double.infinity,
        decoration: BoxDecoration(
          color: const Color(0xFFFFE0B2),
          borderRadius: BorderRadius.circular(22),
        ),
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Explore more!',
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'Discover beautiful places\naround Indonesia.',
                    style: TextStyle(
                      fontSize: 11,
                      color: Colors.brown.shade700,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.flight_takeoff_rounded,
              color: orange,
              size: 65,
            ),
          ],
        ),
      ),
    );
  }

  // BOTTOM NAVIGATION
  Widget _buildBottomNavigation() {
    return Container(
      margin: const EdgeInsets.fromLTRB(22, 5, 22, 12),
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 9,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(35),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 15,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(Icons.home_rounded, 'Home', 0),
          _buildNavItem(Icons.map_outlined, 'Explore', 1),
          _buildNavItem(Icons.favorite_border, 'Favorite', 2),
          _buildNavItem(Icons.person_outline, 'Profile', 3),
        ],
      ),
    );
  }

  Widget _buildNavItem(
    IconData icon,
    String title,
    int index,
  ) {
    final isSelected = selectedMenu == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedMenu = index;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 10,
        ),
        decoration: BoxDecoration(
          color: isSelected ? orange : Colors.transparent,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              size: 20,
              color: isSelected ? Colors.white : Colors.black54,
            ),
            if (isSelected) ...[
              const SizedBox(width: 6),
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
