import 'package:bookface/constants/strings.dart';
import 'package:bookface/routes/routes.dart';
import 'package:bookface/widgets/category_item.dart';
import 'package:flutter/material.dart';

class CategoryPage extends StatefulWidget {
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  List<bool> _isselected = new List<bool>.filled(20, false, growable: false);
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

  List<Widget> _loadCategories() {
    List<Widget> categoryCells = [];
    List<CategoryItem> categories = categoryList;
    int i = 0;
    for (CategoryItem category in categories) {
      categoryCells.add(getStructuredGridCell(category, i));
      i++;
    }

    return categoryCells;
  }

  Card getStructuredGridCell(CategoryItem item, int i) {
    return Card(
      elevation: 2.0,
      color: Colors.transparent,
      child: InkWell(
        highlightColor: Colors.white.withAlpha(30),
        splashColor: Colors.white.withAlpha(20),
        child: Container(
          constraints: new BoxConstraints.expand(
            height: 791.0,
            width: 400.0,
          ),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(item.image),
              fit: BoxFit.fitWidth,
            ),
          ),
          child: Stack(
            children: <Widget>[
              new Positioned(
                child: Center(
                  child: Text(
                    item.text,
                    style: TextStyle(
                      fontSize: 20,
                      foreground: Paint()
                        ..style = PaintingStyle.stroke
                        ..strokeWidth = 2
                        ..color = Colors.white,
                    ),
                  ),
                ),
              ),
              // Solid text as fill.
              new Positioned(
                child: Center(
                  child: Text(
                    item.text,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              new Positioned(
                top: 0.0,
                right: 0.0,
                child: Icon(
                  _isselected[i] ? Icons.favorite : Icons.favorite_border,
                  color: _isselected[i] ? Colors.red : Colors.yellow,
                ),
              ),
            ],
          ),
        ),
        onTap: () {
          setState(() {
            if (!_isselected[i]) {
              _isselected[i] = true;
            } else {
              _isselected[i] = false;
            }
          });
        },
      ),
    );
  }
}
