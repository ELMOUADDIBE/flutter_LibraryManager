import 'package:flutter/material.dart';
import 'books_screen.dart';
import 'members_screen.dart';
import 'about_screen.dart';
import 'chatbot_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.orangeAccent, Colors.orange],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 50),
                  Hero(
                    tag: 'library_logo',
                    child: Image.asset('assets/library.png', width: 200, height: 200),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Bienvenue à la Bibliothèque',
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Explorez notre collection de livres et adhérez à notre communauté.',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18, color: Colors.white70),
                  ),
                  const SizedBox(height: 30),
                  GridView.count(
                    crossAxisCount: 2,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      _buildFeatureCard(
                        icon: Icons.book,
                        title: 'Explorer les livres',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const BooksScreen()),
                          );
                        },
                      ),
                      _buildFeatureCard(
                        icon: Icons.people,
                        title: 'Gérer les adhérents',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const MembersScreen()),
                          );
                        },
                      ),
                      _buildFeatureCard(
                        icon: Icons.chat,
                        title: 'Assistance Chatbot',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const chatbotScreen()),
                          );
                        },
                      ),
                      _buildFeatureCard(
                        icon: Icons.info,
                        title: 'À propos',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const AboutScreen()),
                          );
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    'Avantages de notre bibliothèque :',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  const ListTile(
                    leading: Icon(Icons.wifi, color: Colors.white),
                    title: Text(
                      'Accès à une grande variété de ressources',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                  const ListTile(
                    leading: Icon(Icons.group_work, color: Colors.white),
                    title: Text(
                      'Espaces de travail collaboratif',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                  const ListTile(
                    leading: Icon(Icons.event, color: Colors.white),
                    title: Text(
                      'Programmes éducatifs et événements communautaires',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 50),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureCard({required IconData icon, required String title, required VoidCallback onTap}) {
    return Card(
      margin: const EdgeInsets.all(10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 5,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 50, color: Colors.deepOrangeAccent),
              const SizedBox(height: 10),
              Text(
                title,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}