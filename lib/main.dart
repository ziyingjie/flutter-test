import 'package:flutter/material.dart';
import './redroute.dart';
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

class NewRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("新路由页面"),
      ),
      body: Center(
        child: Text("新路由页面的内容"),
      ),
    );
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
            decoration: BoxDecoration(color: Colors.pink),
            child: Column(
              children: <Widget>[
                Image.network(
                    'https://avatars3.githubusercontent.com/u/22075669?s=460&u=e12ac5574c57671b6a54a5f8bb2bcd5e784c20f3&v=4'),
                Text('加载网络图'),
                FlatButton(
                  child: Text("路由跳转"),
                  textColor: Colors.red,
                  onPressed: () {
                    //导航到新路由
                    Navigator.push(
                        context,
                        // MaterialPageRoute({
                        //   WidgetBuilder builder,构建路由页面的具体内容，返回值是一个widget。我们通常要实现此回调，返回新路由的实例。
                        //   RouteSettings settings,包含路由的配置信息，如路由名称、是否初始路由（首页
                        //   bool maintainState = true,默认情况下，当入栈一个新路由时，原来的路由仍然会被保存在内存中，
                        //                          如果想在路由没用的时候释放其所占用的所有资源，可以设置maintainState为false。
                        //   bool fullscreenDialog = false,新的路由页面是否是一个全屏的模态对话框
                        // })
                        MaterialPageRoute(
                            builder: (context) {
                              return new RedRoute();
                            },
                            fullscreenDialog: true));
                  },
                )
              ],
            ),
          ),
          // Center(child: CircularProgressIndicator()),
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
      ),
    );
  }
}
