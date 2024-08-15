import 'package:flutter/material.dart';
import 'package:app_comerce/components/my_list_tile.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surfaceBright,
      child: Column(
        children: [
          // Custom Sized Drawer Header with Padding
          Padding(
            padding: const EdgeInsets.only(top: 60.0), // Add top padding
            child: Container(
              height: 170,
              width: 160, // Set a specific height and width for the header
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                gradient: LinearGradient(
                  colors: [
                    Colors.black.withOpacity(0.7),
                    Color.fromARGB(0, 32, 31, 31)
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomLeft,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('lib/assets/user.png'),
                  ),
                  const SizedBox(height: 15),
                  AnimatedText(),
                ],
              ),
            ),
          ),
          const SizedBox(height: 25),

          // Shop tile
          MyListTile(
            text: "Shop",
            icon: Icons.home,
            onTap: () => Navigator.pop(context),
          ),

          // Cart tile
          MyListTile(
            text: "Cart",
            icon: Icons.shopping_cart,
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/cart_page');
            },
          ),

          // Spacer to push the exit tile to the bottom
          const Spacer(),

          // Exit tile
          Padding(
            padding: const EdgeInsets.only(bottom: 25),
            child: MyListTile(
              text: "Exit",
              icon: Icons.logout,
              onTap: () => Navigator.pushNamedAndRemoveUntil(
                  context, '/intro_page', (route) => false),
            ),
          ),
        ],
      ),
    );
  }
}

class AnimatedText extends StatefulWidget {
  @override
  _AnimatedTextState createState() => _AnimatedTextState();
}

class _AnimatedTextState extends State<AnimatedText>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animation,
      child: Text(
        'Welcome Back!',
        style: TextStyle(
          color: Colors.blueAccent, // Change this to your desired color
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}