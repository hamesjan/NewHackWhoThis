import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:newhack/pages/center.dart';

class Home extends StatefulWidget {
  final int index;

  const Home({ Key key, this.index}): super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin{
  TabController _tabController;

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 1, initialIndex: widget.index);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        elevation: 0,
        title: Text('Welcome'),
        leading: Container(),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: (){
//              Navigator.pop(context);
//              Navigator.push(
//                  context,
//                  MaterialPageRoute(
//                      builder: (BuildContext context) => MapPage()
//                  )
//              );
            },
          ),

        ],
      ),
      body: SafeArea(
        child: TabBarView(
          controller: _tabController,
          children: <Widget>[
            CenterPage(),
          ],
        ),
      ),

      bottomNavigationBar: SafeArea(
        child: TabBar(
          controller: _tabController,
          labelColor: Colors.black12,
          unselectedLabelColor: Colors.black38,
          tabs: <Widget>[
            Tab(
              icon: Icon(Icons.info, color: Colors.white,),
              child: Text(
                'Information',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
