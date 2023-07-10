import 'package:book_app/apps/screens/ebook_screen/view/ebook_screen.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text(
            'Shop',
            style: TextStyle(color: Colors.black),
          ),
          leading: const Icon(
            Icons.menu,
            color: Colors.black,
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 10),
              child: Icon(Icons.search, color: Colors.black),
            ),
          ],
          bottom: TabBar(
            indicatorColor: Colors.blue,
            indicatorSize: TabBarIndicatorSize.label,
            labelColor: Colors.blue,
            unselectedLabelColor: Colors.black,
            tabs: [
              Tab(
                child: Row(
                  children: const [
                    Icon(Icons.book_sharp),
                    SizedBox(width: 5),
                    Text('Ebooks'),
                  ],
                ),
              ),
              Tab(
                child: Row(
                  children: const [
                    Icon(Icons.headset),
                    SizedBox(width: 5),
                    Text('Audiobooks'),
                  ],
                ),
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [EbookScreen(), Text('Audiobook')],
        ),
      ),
    );
  }
}
