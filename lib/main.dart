import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Icon _coeur = Icon(Icons.favorite_border, color:Colors.white);
  bool _likeBool = false;
  int _indexMenu = 0;
  String _affichage = "0 : Accueil";

  void _likeMethod() {
    setState(() {
      if(_likeBool) {
        _coeur = Icon(Icons.favorite_border, color:Colors.white);
        _likeBool = false;
      } else {
        _coeur = Icon(Icons.favorite, color:Colors.white);
        _likeBool = true;
      }
    });
  }

  void _itemClic(int index) {
    setState(() {
      _indexMenu = index;
      switch(_indexMenu) {
        case 0 :  _affichage = '$_indexMenu : Accueil';
        break;
        case 1 :  _affichage = '$_indexMenu : Mon compte';
        break;
        case 2 :  _affichage = '$_indexMenu : Stat';
        break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(icon : _coeur, onPressed: _likeMethod)
        ],
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "$_affichage",
              style : TextStyle(color:Colors.red, fontSize: 40),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _likeMethod,
        backgroundColor: Colors.red,
        tooltip: 'like',
        child: _coeur,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items : const <BottomNavigationBarItem> [
          BottomNavigationBarItem(
          icon: Icon(Icons.supervised_user_circle, color : Colors.white,
          ),
            title:Text('Accueil', style:TextStyle(color:Colors.white)),
          ),
          BottomNavigationBarItem(
          icon: Icon(Icons.supervised_user_circle, color : Colors.white,
          ),
          title:Text('Mon compte', style:TextStyle(color:Colors.white)),
          ),BottomNavigationBarItem(
          icon: Icon(Icons.assessment, color : Colors.white,
          ),
          title:Text('Stat', style:TextStyle(color:Colors.white)),
          ),
      ],
      onTap: _itemClic,
      currentIndex: _indexMenu,
      backgroundColor: Colors.red,
      ),// This trailing comma makes auto-formatting nicer for build methods.
    drawer:Drawer(
      child: Column(
        children: <Widget>[
          DrawerHeader(child: Text('Navigation')),
          Text('Lien 1'),
          Text('Lien 2'),
          Text('Lien 3'),
        ],
      )
    )
    );
  }
}
