import "package:flutter/material.dart";
import '../models/category_model.dart';
import '../services/data.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home>{
  List<CategoryModel> categories=[];
  @override
  void initState(){
    categories=getCategories();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text("News"),Text("Nest", style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold )
          ),
          ],
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Container(
        child: Column(
            children: [
              Container(
                child: ListView.builder(
                  shrinkWrap: true,
                    itemCount: categories.length,
                    itemBuilder: (context, index){
                      return CategoryTile(
                        image:categories[index].image,
                        categoryName: categories[index].categoryName,
                      );
                    }),
              )
        ])
      ),
    );
  }
}

class CategoryTile extends StatelessWidget {
  final image, categoryName;
  CategoryTile({this.categoryName, this.image});


  @override
  Widget build(BuildContext context) {
    return Stack(children:[
      Image.asset(
          image,
          width:120,
          height: 60,
      )
    ],
    );
  }
}
