import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:najlepsze_jedzenie/app/home/add_opinion/add_opinion_page_content.dart';
import 'package:najlepsze_jedzenie/app/home/my_account/my_account_page_content.dart';
import 'package:najlepsze_jedzenie/app/home/restaurants/restautants_page_content.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
    required this.user,
  }) : super(key: key);

  final User user;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue.withOpacity(0.5),
        title: const Text('Najlepsze jedzenie'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            opacity: 0.4,
            image: AssetImage("images/background_image.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Builder(builder: (context) {
          if (currentIndex == 0) {
            return const RestaurantsPageContent();
          }
          if (currentIndex == 1) {
            return AddOpinionPageContent(
              onSave: () {
                setState(() {
                  currentIndex = 0;
                });
              },
            );
          }

          return MyAccountPageContent(email: widget.user.email);
        }),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (newIndex) {
          setState(() {
            currentIndex = newIndex;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.reviews),
            label: 'Opinie',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Dodaj',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Moje Konto',
          ),
        ],
      ),
    );
  }
}
