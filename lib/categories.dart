import 'package:bookface/constants/strings.dart';
import 'package:bookface/routes/routes.dart';
import 'package:bookface/widgets/category_item.dart';
import 'package:flutter/material.dart';

class CategoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back_ios),
        title: Text(Strings.choose_category),
        backgroundColor: Color(0xFF915FB5),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [const Color(0xFF915FB5), const Color(0xFFCA436B)],
              begin: FractionalOffset.topLeft,
              end: FractionalOffset.bottomRight,
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              GridView.count(
                primary: false,
                padding: const EdgeInsets.all(1.5),
                crossAxisCount: 2,
                childAspectRatio: 0.80,
                mainAxisSpacing: 1.0,
                crossAxisSpacing: 1.0,
                children: _loadCategories(), //new Cards()
                shrinkWrap: true,
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_forward_ios),
        backgroundColor: Color(0xFF915FB5),
        onPressed: () => Navigator.of(context).pushNamed(Routes.home),
      ),
    );
  }
}

List<Widget> _loadCategories() {
  List<Widget> categoryCells = [];
  List<CategoryItem> categories = categoryList;

  for (CategoryItem category in categories) {
    categoryCells.add(getStructuredGridCell(category));
  }

  return categoryCells;
}

Card getStructuredGridCell(CategoryItem item) {
  return Card(
    elevation: 2.0,
    color: Colors.transparent,
    child: InkWell(
      highlightColor: Colors.white.withAlpha(30),
      splashColor: Colors.white.withAlpha(20),
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(item.image),
            fit: BoxFit.fitWidth,
          ),
        ),
        child: Text(
          item.text,
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      onTap: () {},
    ),
  );
}
