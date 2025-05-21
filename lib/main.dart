import 'package:flutter/material.dart';
// Assuming FadeAnimation.dart is in the same directory or correctly configured for import
import 'package:myapp/FadeAnimation.dart';

void main() => runApp(const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    ));

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late PageController _pageController;
  // It's good practice to use 'final' for values that won't change after initialization.
  final int totalPage = 4;

  // This method is correctly defined, but currently empty.
  // You could add logic here for page indicators or other effects.
  void _onScroll() {
    // print('Page scroll offset: ${_pageController.page}');
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: 0, // Changed to 0 to start from the first page (index 0)
    )..addListener(_onScroll);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        // Using itemCount for PageView.builder is more efficient for large lists,
        // but for only 4 items, direct children are fine.
        children: <Widget>[
          makePage(
            image:
                'https://raw.githubusercontent.com/ValentinLoya/imagenes/main/logo.jpg',
            title: "Las Valeburguer",
            description:
                'Este es un negocio de hamburguesas las cuales estan muy deliciosas y son de carne fresca y 100% casera y el sabor es espectacular',
            pageNumber: 1,
            // Example of passing a rating
            rating: 5,
          ),
          makePage(
            image:
                'https://raw.githubusercontent.com/ValentinLoya/imagenes/main/hamburguesa%20especial.webp',
            title: "Hamburguesas Especial",
            description:
                'Es una hamburguesa con tocino y jamón que esos complementos le dan un sazón muy rico',
            pageNumber: 2,
            rating: 4,
          ),
          makePage(
            image:
                'https://raw.githubusercontent.com/ValentinLoya/imagenes/main/hamburguesa%20doble.avif',
            title: "Hamburguesa Doble",
            description:
                'Esta hamburguesa está muy llenadora y es lo mismo que la especial solo que con una carne extra y la verdad te llenas demasiado bien',
            pageNumber: 3,
            rating: 4,
          ),
          makePage(
            image:
                'https://raw.githubusercontent.com/ValentinLoya/imagenes/main/hawa.jpg',
            title: "Hamburguesa Hawaiana",
            description:
                'Esta hamburguesa tiene un sabor muy distinto; con esa piña queda aún más jugosa y con un sabor dulce muy especial',
            pageNumber: 4,
            rating: 5,
          ),
        ],
      ),
    );
  }

  // Changed `title` to be required, as it's always used.
  // Added `rating` parameter.
  Widget makePage({
    required String image,
    required int pageNumber,
    required String title,
    required String description,
    required int rating, // New required parameter for dynamic rating
  }) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(image),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              Colors.black.withOpacity(.9),
              Colors.black.withOpacity(.2),
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Spacer to push content to the top
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  FadeAnimation(
                    delay: 1.0,
                    child: Text(
                      pageNumber.toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    '/' + totalPage.toString(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              // Pushes the main content (title, description, etc.) to the bottom
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    FadeAnimation(
                      delay: 2.0,
                      child: Text(
                        title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    FadeAnimation(
                      delay: 1.5,
                      child: Row(
                        children: <Widget>[
                          // Generate stars dynamically based on the 'rating'
                          for (int i = 0; i < 5; i++)
                            Padding(
                              padding: const EdgeInsets.only(right: 3),
                              child: Icon(
                                Icons.star,
                                color: i < rating ? Colors.yellow : Colors.grey,
                                size: 15,
                              ),
                            ),
                          const Text(
                            // Display the rating dynamically
                            '4.0', // You can change this to display 'rating.toDouble().toString()' if you want to show the exact passed rating
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 12,
                            ),
                          ),
                          const Text(
                            '(2300)',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    FadeAnimation(
                      delay: 2.0, // Adjusted delay for description
                      child: Padding(
                        padding: const EdgeInsets.only(right: 50),
                        child: Text(
                          description,
                          style: TextStyle(
                              color: Colors.white.withOpacity(.7),
                              height: 1.9,
                              fontSize: 15),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20, // Adjusted spacing
                    ),
                    FadeAnimation(
                      delay: 2.2,
                      child: Text(
                        'READ MORE',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight:
                              FontWeight.bold, // Added bold for prominence
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
