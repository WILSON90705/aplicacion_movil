import 'package:flutter/material.dart';
import 'colours/colores.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sabor',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Poppins'),
      home: const SaborHomeScreen(),
    );
  }
}

class SaborHomeScreen extends StatefulWidget {
  const SaborHomeScreen({super.key});

  @override
  State<SaborHomeScreen> createState() => _SaborHomeScreenState();
}

class _SaborHomeScreenState extends State<SaborHomeScreen> {
  String _selectedCategory = 'Platos Fuertes';

  final List<String> _categories = [
    'Entradas',
    'Platos Fuertes',
    'Postres',
    'Bebidas',
  ];

  static const Color _bg = AppColors.bg;
  static const Color _orange = AppColors.orange;

  // Negro translúcido para las sombras (~8% de opacidad)
  static const Color _shadow = AppColors.shadow;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _bg,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),
              _buildHeader(),
              const SizedBox(height: 24),
              const Text(
                '¿Qué te apetece hoy?',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: AppColors.black87,
                ),
              ),
              const SizedBox(height: 16),
              _buildSearchBar(),
              const SizedBox(height: 16),
              _buildCategoryChips(),
              const SizedBox(height: 24),
              _buildSectionHeader(),
              const SizedBox(height: 12),
              _buildFeaturedCard(),
              const SizedBox(height: 20),
              _buildSecondCard(),
              const SizedBox(height: 20),
              _buildFOOTER(),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Sabor',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: AppColors.black87,
              ),
            ),
            Text(
              'Cocina Editorial Moderna',
              style: TextStyle(fontSize: 13, color: AppColors.black87),
            ),
          ],
        ),
        // Cuando tengas una imagen real, usa backgroundImage: NetworkImage(...)
        CircleAvatar(
          radius: 22,
          backgroundColor: AppColors.black12,
          child: Icon(Icons.person, color: Colors.black45),
        ),
      ],
    );
  }

  Widget _buildSearchBar() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: AppColors.shadow,
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: const TextField(
        decoration: InputDecoration(
          hintText: 'Busca platillos, ingredientes...',
          hintStyle: TextStyle(color: Colors.black38),
          prefixIcon: Icon(Icons.search, color: Colors.black45),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 16),
        ),
      ),
    );
  }

  Widget _buildCategoryChips() {
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: _categories.map((category) {
        final bool isSelected = category == _selectedCategory;
        return GestureDetector(
          onTap: () => setState(() => _selectedCategory = category),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
            decoration: BoxDecoration(
              color: isSelected ? _orange : Colors.white,
              borderRadius: BorderRadius.circular(24),
              boxShadow: const [
                BoxShadow(color: _shadow, blurRadius: 6, offset: Offset(0, 2)),
              ],
            ),
            child: Text(
              category,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.black87,
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildSectionHeader() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Especialidades de la Casa',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        Text(
          'Ver todo',
          style: TextStyle(
            color: AppColors.orange,
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
        ),
      ],
    );
  }

  Widget _buildFeaturedCard() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: AppColors.shadow,
            blurRadius: 16,
            offset: Offset(0, 6),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Imagen del platillo
          AspectRatio(
            aspectRatio: 16 / 10,
            child: Image.asset(
              'assets/images/images.jpg', // reemplaza con tu imagen
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                color: AppColors.grey,
                child: const Center(
                  child: Icon(
                    Icons.restaurant,
                    size: 48,
                    color: AppColors.black38,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Seco de Chivo',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors.black87,
                      ),
                    ),
                    Text(
                      '\$14.50',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors.orange,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                const Text(
                  'Estofado tierno de cordero braseado lentamente en '
                  'cerveza y especias tradicionales.',
                  style: TextStyle(
                    fontSize: 13,
                    color: AppColors.black45,
                    height: 1.4,
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Row(
                      children: [
                        Icon(Icons.star, color: AppColors.amber, size: 18),
                        SizedBox(width: 4),
                        Text(
                          '4.9 (42 reseñas)',
                          style: TextStyle(
                            fontSize: 13,
                            color: AppColors.black87,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: 40,
                      height: 40,
                      decoration: const BoxDecoration(
                        color: AppColors.orange,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.add,
                        color: AppColors.white,
                        size: 22,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSecondCard() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: AppColors.shadow,
            blurRadius: 16,
            offset: Offset(0, 6),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Imagen del platillo
          AspectRatio(
            aspectRatio: 16 / 10,
            child: Image.asset(
              'assets/images/sopa_de_pescado.jpg', // reemplaza con tu imagen
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                color: AppColors.grey,
                child: const Center(
                  child: Icon(
                    Icons.restaurant,
                    size: 48,
                    color: AppColors.black38,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Sopa de pescado',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors.black87,
                      ),
                    ),
                    Text(
                      '\$25.50',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors.orange,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                const Text(
                  'Sopa caliente de pescado con verduras y especias tradicionales.',
                  style: TextStyle(
                    fontSize: 13,
                    color: AppColors.black45,
                    height: 1.4,
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Row(
                      children: [
                        Icon(Icons.star, color: AppColors.amber, size: 18),
                        SizedBox(width: 4),
                        Text(
                          '2.0 (50 reseñas)',
                          style: TextStyle(
                            fontSize: 13,
                            color: AppColors.black87,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: 40,
                      height: 40,
                      decoration: const BoxDecoration(
                        color: AppColors.orange,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.add,
                        color: AppColors.white,
                        size: 22,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFOOTER() {
    final iconMap = <String, IconData>{
      'Inicio': Icons.home,
      'Búsqueda': Icons.search,
      'Carrito': Icons.shopping_cart,
      'Favoritos': Icons.favorite,
    };

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          for (var entry in iconMap.entries)
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(entry.value, color: AppColors.black45),
                const SizedBox(height: 4),
                Text(
                  entry.key,
                  style: const TextStyle(
                    fontSize: 12,
                    color: AppColors.black45,
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
