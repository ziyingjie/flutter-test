import 'package:flutter/material.dart';
// import 'package:transparent_image/transparent_image.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  //Flutter在构建页面时，会调用组件的build方法，
  //widget的主要工作是提供一个build()方法来描述如何构建UI界面（通常是通过组合、拼装其它基础widget）。
  Widget build(BuildContext context) {
    //MaterialApp 是Material库中提供的Flutter APP框架，
    //通过它可以设置应用的名称、主题、语言、首页及路由列表等。MaterialApp也是一个widget。
    return new MaterialApp(
        title: 'Flutter Demo',
        theme: new ThemeData(
          primarySwatch: Colors.green,
        ),
        home: new MyHomePage(title: '主页'));
  }
}

//Statefulwidget至少由两个类组成 1,StatefulWidget类。2, State类；
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState(); //State类
}

class _MyHomePageState extends State<MyHomePage> {
  final _defaultColor = Color(0xff8a8a8a);
  final _activeColor = Color(0xff50b4ed);
  int _counter = 0;
  int _currentIndex = 1;
  final PageController _controller = PageController(
    initialPage: 0,
  );
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
//Scaffold 是 Material 库中提供的页面脚手架，
//它提供了默认的导航栏、标题和包含主屏幕widget树（后同“组件树”或“部件树”）的body属性，组件树可以很复杂
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new ListView(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(bottom: 12.0),
            decoration: BoxDecoration(color: Colors.grey),
            child: Column(
              children: <Widget>[
                Image.network(
                    'https://avatars3.githubusercontent.com/u/22075669?s=460&u=e12ac5574c57671b6a54a5f8bb2bcd5e784c20f3&v=4'),
                Text('Image.network')
              ],
            ),
          ),
          Center(child: CircularProgressIndicator()),
          Container(
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Text(
                  '按了几次了:',
                ),
                new Text(
                  '$_counter',
                  style: Theme.of(context).textTheme.headline6,
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            _controller.jumpToPage(index);
            setState(() {
              _currentIndex = index;
            });
          },
          type: BottomNavigationBarType.fixed,
          selectedFontSize: 12,
          items: [
            BottomNavigationBarItem(
              icon: Image.asset(
                'images/xiecheng.png',
                width: 22,
                height: 22,
              ),
              activeIcon: Image.asset(
                'images/xiecheng_active.png',
                width: 22,
                height: 22,
              ),
              title: Text(
                '首页',
                style: TextStyle(
                  color: _currentIndex != 0 ? _defaultColor : _activeColor,
                ),
              ),
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'images/mude.png',
                width: 24,
                height: 24,
              ),
              activeIcon: Image.asset(
                'images/mude_active.png',
                width: 24,
                height: 24,
              ),
              title: Text(
                '目的地',
                style: TextStyle(
                  color: _currentIndex != 1 ? _defaultColor : _activeColor,
                ),
              ),
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'images/lvpai.png',
                width: 23,
                height: 23,
              ),
              activeIcon: Image.asset(
                'images/lvpai_active.png',
                width: 23,
                height: 23,
              ),
              title: Text(
                '旅拍',
                style: TextStyle(
                  color: _currentIndex != 2 ? _defaultColor : _activeColor,
                ),
              ),
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'images/wode.png',
                width: 23,
                height: 23,
              ),
              activeIcon: Image.asset(
                'images/wode_active.png',
                width: 23,
                height: 23,
              ),
              title: Text(
                '我的',
                style: TextStyle(
                  color: _currentIndex != 3 ? _defaultColor : _activeColor,
                ),
              ),
            ),
          ]),
      floatingActionButton: new FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: new Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

// void main(){
//   runApp(
//     Center(
//       child: Text(
//         '你好',
//         textDirection:TextDirection.ltr,
//         style:TextStyle(fontSize:26)
//       ),
//     )
//   );
// }
