import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int lastTime = 0;
  PageController pageController;
  int page = 0;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
            body: PageView(
              children: <Widget>[
                HomePage(),
                OrderPage(),
                NewsPage(),
                MinePage()
              ],
              onPageChanged: onPageChanged,
              controller: pageController,
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {},
              child: Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
            floatingActionButtonLocation:
            FloatingActionButtonLocation.centerDocked,
            bottomNavigationBar: BottomNavigationBar(
                items: [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.account_balance), title: Text('首页')),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.airport_shuttle), title: Text('订单')),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.home), title: Text('发布')),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.send), title: Text('消息')),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.home), title: Text('我的')),
                ],
                type: BottomNavigationBarType.fixed,
                fixedColor: Theme.of(context).primaryColor,
                onTap: onTap,
                currentIndex: page)
        ),
        onWillPop: () {
          int newTime = DateTime.now().millisecondsSinceEpoch;
          int result = newTime - lastTime;
          lastTime = newTime;
          if (result > 2000) {

          } else {
            SystemNavigator.pop();
          }
          return null;
        });
  }

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: this.page);
  }

  void onPageChanged(int value) {
    if (value >= 2) {
      value = value + 1;
    }
    setState(() {
      this.page = value;
    });
  }
  void onTap(int value) {
    if (value == 2) return;
    if (value > 2) {
      value = value - 1;
    }
    pageController.animateToPage(value,
        duration: const Duration(milliseconds: 100), curve: Curves.ease);
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class OrderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: new AppBar(
        leading:
        IconButton(icon: Icon(Icons.dehaze), onPressed: null),

      ),
      body: Column(
          children: <Widget>[
            SizedBox(height: 10,),
            Text('   正在进行',
            style: TextStyle(
              color: Colors.black45,
              fontSize: 15,
              fontWeight: FontWeight.w500,),
              textAlign: TextAlign.start,
            ),
           SizedBox(height: 10,),
           Row(
               children: <Widget>[
                 SizedBox(width: 30,),
                 Container(
                   height: 200,
                   width: 350,
                   decoration: new BoxDecoration(
                     color: Colors.black12,
                     borderRadius: new BorderRadius.circular(20.0),
                   ),


                   child: Row(
                     children: <Widget>[
                       Container(
                         width: 110,
                         height: 200,
                         child: Column(
                           children: <Widget>[
                             SizedBox(height: 10,),
                             Text('送货单号',
                               style: TextStyle(
                                 color: Colors.black45,
                                 fontSize: 15,
                                 fontWeight: FontWeight.w500,),
                               textAlign: TextAlign.start,
                             ),
                             SizedBox(height: 10,),
                             new Text('xx市',
                               style: TextStyle(
                                 fontWeight: FontWeight.w800,
                                 fontSize: 20,
                                 color: Colors.black,
                               ),
                             ),
                             SizedBox(height: 5,),
                             new Text(
                               '司机名字',
                               style: TextStyle(
                                 fontSize: 15,
                                 color: Colors.black54
                               ),
                             ),
                             SizedBox(height: 5,),
                         new Text(
                           '送货单消息',
                           style: TextStyle(
                               fontSize: 15,
                               color: Colors.black54
                           ),
                         ),
                           ],
                         ),
                       ),
                       new Container(
                         width: 130,
                         height: 200,
                         child: Column(
                           children: <Widget>[
                             SizedBox(height: 50,),
                             Text('状态',
                               style: TextStyle(
                                   fontSize: 15,
                                   color: Colors.black54
                               ),),
                             SizedBox(height: 5,),
                             Icon(Icons.arrow_forward)
                           ],
                         ),
                       ),
                       new Container(
                         width: 110,
                         child: Column(
                           children: <Widget>[
                             SizedBox(height: 40,),
                             new Text('目的地',
                               style: TextStyle(
                                 fontWeight: FontWeight.w800,
                                 fontSize: 20,
                                 color: Colors.black,
                               ),
                             ),
                             SizedBox(height: 5,),
                             new Text(
                               '项目名',
                               style: TextStyle(
                                   fontSize: 15,
                                   color: Colors.black54
                               ),
                             ),
                           ],
                         ),

                       ),
                     ],
                   ),


                 ),
               ],
             ),
            SizedBox(height: 20,),
            Text('   已完成',
              style: TextStyle(
                color: Colors.black45,
                fontSize: 15,
                fontWeight: FontWeight.w500,),
              textAlign: TextAlign.start,
            ),
            SizedBox(height: 10,),
            Row(
              children: <Widget>[
                SizedBox(width: 30,),
                Container(
                  height: 200,
                  width: 350,
                  decoration: new BoxDecoration(
                    color: Colors.black12,
                    borderRadius: new BorderRadius.circular(20.0),
                  ),


                  child: Row(
                    children: <Widget>[
                      Container(
                        width: 110,
                        height: 200,
                        child: Column(
                          children: <Widget>[
                            SizedBox(height: 10,),
                            Text('送货单号',
                              style: TextStyle(
                                color: Colors.black45,
                                fontSize: 15,
                                fontWeight: FontWeight.w500,),
                              textAlign: TextAlign.start,
                            ),
                            SizedBox(height: 10,),
                            new Text('xx市',
                              style: TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 20,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(height: 5,),
                            new Text(
                              '司机名字',
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black54
                              ),
                            ),
                            SizedBox(height: 5,),
                            new Text(
                              '送货单消息',
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black54
                              ),
                            ),
                          ],
                        ),
                      ),
                      new Container(
                        width: 130,
                        height: 200,
                        child: Column(
                          children: <Widget>[
                            SizedBox(height: 50,),
                            Text('状态',
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black54
                              ),),
                            SizedBox(height: 5,),
                            Icon(Icons.arrow_forward)
                          ],
                        ),
                      ),
                      new Container(
                        width: 110,
                        child: Column(
                          children: <Widget>[
                            SizedBox(height: 40,),
                            new Text('目的地',
                              style: TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 20,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(height: 5,),
                            new Text(
                              '项目名',
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black54
                              ),
                            ),
                          ],
                        ),

                      ),
                    ],
                  ),


                ),
              ],
            ),

          ],
        ),


    );


  }
}

class NewsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class MinePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}