import 'package:flutter/material.dart';

class FavouritesPage extends StatefulWidget {
  @override
  _FavouritesPageState createState() => _FavouritesPageState();
}

class _FavouritesPageState extends State<FavouritesPage> {
  // List of favorite news articles (each item is represented as a map)
  List<Map<String, String>> favouriteArticles = [
    {
      'title': 'Breaking News: Flutter 3.0 Released!',
      'description': 'Explore the new features of Flutter 3.0.',
    },
    {
      'title': 'Global Markets Surge',
      'description': 'Stock markets around the world rally.',
    },
    {
      'title': 'AI Revolution in 2024',
      'description': 'How AI is transforming industries globally.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favourites'),
      ),
      body: favouriteArticles.isEmpty
          ? Center(
              child: Text(
                'No favourites yet!',
                style: TextStyle(fontSize: 18),
              ),
            )
          : ListView.builder(
              itemCount: favouriteArticles.length,
              itemBuilder: (context, index) {
                final article = favouriteArticles[index];
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: ListTile(
                    title: Text(
                      article['title']!,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(article['description']!),
                    trailing: IconButton(
                      icon: Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        setState(() {
                          favouriteArticles.removeAt(index);
                        });
                      },
                    ),
                    onTap: () {
                      // Navigate to article details page (implement navigation logic)
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('Open details for "${article['title']}"'),
                      ));
                    },
                  ),
                );
              },
            ),
    );
  }
}
