import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FavoritesProvider extends ChangeNotifier {
  final Set<String> _favorites = <String>{};

  Set<String> get favorites => Set.unmodifiable(_favorites);

  bool isFavorite(String affirmation) {
    return _favorites.contains(affirmation);
  }

  void toggleFavorite(String affirmation) {
    if (_favorites.contains(affirmation)) {
      _favorites.remove(affirmation);
    } else {
      _favorites.add(affirmation);
    }
    notifyListeners();
  }
}

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => FavoritesProvider(),
      child: const AffirmationApp(),
    ),
  );
}

class AffirmationApp extends StatelessWidget {
  const AffirmationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Affirmation App',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      home: const HomeScreen(),
    );
  }
}

// Global affirmation data to be shared between screens
final Map<String, List<String>> affirmationData = {
  'Love': [
    'I am worthy of love and affection.',
    'Love flows through me and around me always.',
    'I attract loving relationships into my life.',
    'I love and accept myself completely.',
    'My heart is open to giving and receiving love.',
    'I radiate love and compassion to all beings.',
    'I deserve to be loved for who I am.',
    'Love is my natural state of being.',
    'I choose love over fear in every situation.',
    'I am surrounded by love in all its forms.',
    'My capacity to love grows stronger each day.',
    'I express love freely and authentically.',
  ],
  'Confidence': [
    'I believe in myself and my abilities.',
    'I am confident in my decisions and choices.',
    'My self-confidence grows stronger every day.',
    'I trust myself to handle any challenge.',
    'I speak with clarity and conviction.',
    'I am proud of my unique qualities and strengths.',
    'I face challenges with courage and determination.',
    'My confidence inspires and uplifts others.',
    'I embrace my imperfections as part of my growth.',
    'I am worthy of success and recognition.',
    'I trust my intuition to guide me forward.',
    'I radiate confidence in everything I do.',
  ],
  'Health': [
    'My body is strong, healthy, and full of energy.',
    'I nourish my body with healthy choices.',
    'Every cell in my body vibrates with health.',
    'I listen to my body and give it what it needs.',
    'I am grateful for my body and all it does for me.',
    'Healing energy flows through me constantly.',
    'I choose foods and activities that support my health.',
    'My mind and body are in perfect harmony.',
    'I sleep deeply and wake up refreshed.',
    'I breathe deeply and fill my lungs with life.',
    'My immune system is strong and protective.',
    'I radiate vitality and wellness.',
  ],
  'Wealth': [
    'Money flows to me easily and effortlessly.',
    'I am worthy of financial abundance.',
    'I attract wealth through my positive actions.',
    'My income increases consistently over time.',
    'I make wise financial decisions.',
    'Abundance is my natural state of being.',
    'I am grateful for the wealth I have and receive.',
    'Money is a tool that helps me create positive impact.',
    'I deserve to live a life of financial freedom.',
    'New opportunities for wealth come to me daily.',
    'I manage my money with wisdom and care.',
    'Prosperity flows through all areas of my life.',
  ],
  'Peace': [
    'I am at peace with myself and the world.',
    'Calmness and serenity fill my mind and heart.',
    'I release all worry and embrace inner peace.',
    'Peace flows through me in every moment.',
    'I choose peaceful responses in all situations.',
    'My mind is clear and tranquil.',
    'I find peace in the present moment.',
    'Harmony surrounds me and guides my actions.',
    'I let go of what I cannot control.',
    'Peace is my natural state of being.',
    'I breathe in peace and exhale tension.',
    'I create peaceful energy wherever I go.',
  ],
  'Motivation': [
    'I am motivated and driven to achieve my goals.',
    'Each day brings new energy and inspiration.',
    'I take action toward my dreams with enthusiasm.',
    'My motivation grows stronger with each step.',
    'I am committed to my personal growth.',
    'Challenges motivate me to become stronger.',
    'I find inspiration in everyday moments.',
    'My passion fuels my determination.',
    'I am unstoppable in pursuing my dreams.',
    'Every obstacle is an opportunity to grow.',
    'I maintain focus on what truly matters.',
    'My energy and drive inspire others.',
  ],
  'Success': [
    'Success flows to me naturally and easily.',
    'I am successful in all my endeavors.',
    'My efforts create positive and lasting results.',
    'I celebrate my achievements, big and small.',
    'Success is my birthright and natural state.',
    'I attract opportunities for success daily.',
    'My skills and talents lead me to success.',
    'I am persistent and resilient in pursuit of my goals.',
    'Success comes to me in expected and unexpected ways.',
    'I define success on my own terms.',
    'Every step I take leads me closer to success.',
    'I am grateful for my journey toward success.',
  ],
  'Happiness': [
    'Happiness is my natural state of being.',
    'I choose joy in every moment of my life.',
    'I find reasons to smile and laugh every day.',
    'My happiness radiates and touches others.',
    'I create my own happiness from within.',
    'Joy fills my heart and lights up my spirit.',
    'I am grateful for all the happiness in my life.',
    'Happy thoughts create happy experiences.',
    'I deserve to be happy and fulfilled.',
    'I attract positive and joyful experiences.',
    'My optimism brightens every situation.',
    'Happiness flows through me like a river.',
  ],
  'Gratitude': [
    'I am grateful for all the blessings in my life.',
    'Gratitude fills my heart and transforms my perspective.',
    'I appreciate the beauty and wonder around me.',
    'Thank you for this moment and all its possibilities.',
    'I am thankful for my journey and growth.',
    'Gratitude opens my heart to receive more blessings.',
    'I express appreciation for the people in my life.',
    'Every day brings new reasons to be grateful.',
    'I am thankful for both challenges and triumphs.',
    'Gratitude is my pathway to abundance.',
    'I notice and celebrate the good in my life.',
    'My grateful heart attracts more to be grateful for.',
  ],
  'Positivity': [
    'I choose positive thoughts and attitudes.',
    'Positivity radiates from me in all directions.',
    'I see the good in every person and situation.',
    'My positive energy attracts positive experiences.',
    'I replace negative thoughts with positive ones.',
    'Optimism is my natural way of being.',
    'I focus on solutions rather than problems.',
    'Positive energy flows through me constantly.',
    'I am a beacon of light and positivity.',
    'My positive mindset creates positive outcomes.',
    'I spread positivity wherever I go.',
    'Every day offers new opportunities for joy.',
  ],
  'Focus': [
    'My mind is clear and focused on my goals.',
    'I concentrate fully on the task at hand.',
    'Distractions fade away as I maintain my focus.',
    'I am present and attentive in every moment.',
    'My focus brings clarity to my thoughts and actions.',
    'I direct my energy toward what matters most.',
    'Mental clarity guides my decisions and choices.',
    'I maintain focus despite external pressures.',
    'My concentration improves with each passing day.',
    'I am disciplined and committed to my priorities.',
    'Focus is my superpower for achieving success.',
    'I train my mind to stay centered and calm.',
  ],
  'Calm': [
    'I am calm and centered in all situations.',
    'Tranquility flows through my mind and body.',
    'I breathe deeply and release all tension.',
    'Calmness is my natural response to stress.',
    'I remain peaceful even in challenging times.',
    'My inner calm radiates outward to others.',
    'I choose serenity over anxiety.',
    'Still waters run deep within my soul.',
    'I find calm in the eye of any storm.',
    'My peaceful energy calms those around me.',
    'I release what I cannot control with grace.',
    'Calm confidence guides my every action.',
  ],
};

// Global categories list to be shared between screens
final List<AffirmationCategory> categories = const [
  AffirmationCategory(
    name: 'Love',
    icon: Icons.favorite,
    color: Colors.pink,
  ),
  AffirmationCategory(
    name: 'Confidence',
    icon: Icons.psychology,
    color: Colors.orange,
  ),
  AffirmationCategory(
    name: 'Health',
    icon: Icons.health_and_safety,
    color: Colors.green,
  ),
  AffirmationCategory(
    name: 'Wealth',
    icon: Icons.trending_up,
    color: Colors.teal,
  ),
  AffirmationCategory(
    name: 'Peace',
    icon: Icons.self_improvement,
    color: Colors.blue,
  ),
  AffirmationCategory(
    name: 'Motivation',
    icon: Icons.rocket_launch,
    color: Colors.red,
  ),
  AffirmationCategory(
    name: 'Success',
    icon: Icons.emoji_events,
    color: Colors.amber,
  ),
  AffirmationCategory(
    name: 'Happiness',
    icon: Icons.sentiment_very_satisfied,
    color: Colors.yellow,
  ),
  AffirmationCategory(
    name: 'Gratitude',
    icon: Icons.volunteer_activism,
    color: Colors.purple,
  ),
  AffirmationCategory(
    name: 'Positivity',
    icon: Icons.wb_sunny,
    color: Colors.orange,
  ),
  AffirmationCategory(
    name: 'Focus',
    icon: Icons.center_focus_strong,
    color: Colors.indigo,
  ),
  AffirmationCategory(
    name: 'Calm',
    icon: Icons.spa,
    color: Colors.lightBlue,
  ),
];

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<Map<String, dynamic>> shuffledAffirmations;

  @override
  void initState() {
    super.initState();
    shuffledAffirmations = _createShuffledAffirmations();
  }

  // Create a list of all affirmations with their associated category information
  List<Map<String, dynamic>> _createShuffledAffirmations() {
    final List<Map<String, dynamic>> result = [];
    for (final category in categories) {
      final affirmations = affirmationData[category.name] ?? [];
      for (final affirmation in affirmations) {
        result.add({
          'text': affirmation,
          'category': category,
        });
      }
    }
    result.shuffle(); // Randomize the order once
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Daily Affirmations',
          style: GoogleFonts.poppins(
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const CategoriesScreen(),
              ),
            );
          },
          icon: const Icon(Icons.category),
          tooltip: 'Categories',
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const FavoritesScreen(),
                ),
              );
            },
            icon: const Icon(Icons.favorite),
            tooltip: 'Favorites',
          ),
        ],
      ),
      body: shuffledAffirmations.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : PageView.builder(
              scrollDirection: Axis.vertical,
              itemCount: shuffledAffirmations.length,
              itemBuilder: (context, index) {
                final affirmationData = shuffledAffirmations[index];
                final affirmation = affirmationData['text'] as String;
                final category = affirmationData['category'] as AffirmationCategory;
                
                return Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        category.color.withOpacity(0.05),
                        category.color.withOpacity(0.15),
                      ],
                    ),
                  ),
                  child: SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.all(32.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            category.icon,
                            size: 64,
                            color: category.color.withOpacity(0.7),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            category.name,
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: category.color.withOpacity(0.8),
                            ),
                          ),
                          const SizedBox(height: 32),
                          Text(
                            affirmation,
                            style: GoogleFonts.poppins(
                              fontSize: 28,
                              fontWeight: FontWeight.w500,
                              height: 1.4,
                              color: Colors.black87,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 32),
                          Consumer<FavoritesProvider>(
                            builder: (context, favoritesProvider, child) {
                              final isFavorite = favoritesProvider.isFavorite(affirmation);
                              return IconButton(
                                onPressed: () {
                                  favoritesProvider.toggleFavorite(affirmation);
                                },
                                icon: Icon(
                                  isFavorite ? Icons.favorite : Icons.favorite_border,
                                  color: isFavorite ? Colors.red : category.color.withOpacity(0.6),
                                  size: 32,
                                ),
                                tooltip: isFavorite ? 'Remove from favorites' : 'Add to favorites',
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Categories',
          style: GoogleFonts.poppins(
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const FavoritesScreen(),
                ),
              );
            },
            icon: const Icon(Icons.favorite),
            tooltip: 'Favorites',
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 0.8,
          ),
          itemCount: categories.length,
          itemBuilder: (context, index) {
            final category = categories[index];
            return CategoryCard(
              category: category,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AffirmationsScreen(category: category),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
    required this.category,
    required this.onTap,
  });

  final AffirmationCategory category;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                category.color.withOpacity(0.1),
                category.color.withOpacity(0.2),
              ],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                category.icon,
                size: 48,
                color: category.color,
              ),
              const SizedBox(height: 8),
              Text(
                category.name,
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: category.color.withOpacity(0.8),
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AffirmationCategory {
  const AffirmationCategory({
    required this.name,
    required this.icon,
    required this.color,
  });

  final String name;
  final IconData icon;
  final Color color;
}

class AffirmationsScreen extends StatefulWidget {
  const AffirmationsScreen({super.key, required this.category});

  final AffirmationCategory category;

  @override
  State<AffirmationsScreen> createState() => _AffirmationsScreenState();
}

class _AffirmationsScreenState extends State<AffirmationsScreen> {
  @override
  Widget build(BuildContext context) {
    final affirmations = affirmationData[widget.category.name] ?? [];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${widget.category.name} Affirmations',
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: widget.category.color.withOpacity(0.1),
        foregroundColor: widget.category.color,
      ),
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: affirmations.length,
        itemBuilder: (context, index) {
          final affirmation = affirmations[index];
          return Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  widget.category.color.withOpacity(0.05),
                  widget.category.color.withOpacity(0.15),
                ],
              ),
            ),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      widget.category.icon,
                      size: 64,
                      color: widget.category.color.withOpacity(0.7),
                    ),
                    const SizedBox(height: 32),
                    Text(
                      affirmation,
                      style: GoogleFonts.poppins(
                        fontSize: 28,
                        fontWeight: FontWeight.w500,
                        height: 1.4,
                        color: Colors.black87,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 32),
                    Consumer<FavoritesProvider>(
                      builder: (context, favoritesProvider, child) {
                        final isFavorite = favoritesProvider.isFavorite(affirmation);
                        return IconButton(
                          onPressed: () {
                            favoritesProvider.toggleFavorite(affirmation);
                          },
                          icon: Icon(
                            isFavorite ? Icons.favorite : Icons.favorite_border,
                            color: isFavorite ? Colors.red : widget.category.color.withOpacity(0.6),
                            size: 32,
                          ),
                          tooltip: isFavorite ? 'Remove from favorites' : 'Add to favorites',
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Favorite Affirmations',
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: Colors.red.withOpacity(0.1),
        foregroundColor: Colors.red,
      ),
      body: Consumer<FavoritesProvider>(
        builder: (context, favoritesProvider, child) {
          final favorites = favoritesProvider.favorites.toList();
          
          if (favorites.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.favorite_border,
                    size: 64,
                    color: Colors.grey.withOpacity(0.5),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'No favorite affirmations yet',
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      color: Colors.grey.withOpacity(0.7),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Add affirmations to favorites by tapping the heart icon',
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: Colors.grey.withOpacity(0.6),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            );
          }

          return PageView.builder(
            scrollDirection: Axis.vertical,
            itemCount: favorites.length,
            itemBuilder: (context, index) {
              final affirmation = favorites[index];
              return Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.red.withOpacity(0.05),
                      Colors.red.withOpacity(0.15),
                    ],
                  ),
                ),
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.favorite,
                          size: 64,
                          color: Colors.red.withOpacity(0.7),
                        ),
                        const SizedBox(height: 32),
                        Text(
                          affirmation,
                          style: GoogleFonts.poppins(
                            fontSize: 28,
                            fontWeight: FontWeight.w500,
                            height: 1.4,
                            color: Colors.black87,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 32),
                        IconButton(
                          onPressed: () {
                            favoritesProvider.toggleFavorite(affirmation);
                          },
                          icon: const Icon(
                            Icons.favorite,
                            color: Colors.red,
                            size: 32,
                          ),
                          tooltip: 'Remove from favorites',
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}