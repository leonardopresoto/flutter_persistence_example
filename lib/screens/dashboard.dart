import 'package:flutter/material.dart';
import 'package:flutter_persistence_example/screens/list.dart';

class Dashboard extends StatelessWidget {

  final String myListScreenTitle = 'My Contact List';
  final String buttonContactTitle = 'Contacts';
  final String wallpaperJpg = 'images/wallpaper.jpg';

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: Text(myListScreenTitle),
        centerTitle: false,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(wallpaperJpg),
          ),
          Row(
            children: [
              _createButton(context, buttonContactTitle),
            ],
          )
        ],
      ),
    );

  Widget _createButton(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, bottom: 8),
      child: Material(
        color: Theme.of(context).primaryColor,
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => MyList()),
            );
          },
          child: Container(
            padding: EdgeInsets.all(8.0),
            height: 90,
            width: 120,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Icon(
                  Icons.people,
                  color: Colors.white,
                  size: 24,
                ),
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
