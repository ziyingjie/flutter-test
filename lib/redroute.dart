import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class RedRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("新路由页面"),
      ),
      body: new ListView(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 12.0),
            child: Column(
              children: [
                Text(
                  "Hello world" * 6,
                  textAlign: TextAlign.center,
                ),
                Text(
                  "Hello world! I'm Jack. " * 4,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  "Hello world",
                  textScaleFactor:
                      1.5, //文本相对于当前字体大小的缩放因子（类似于fontsize），该属性的默认值可以通过MediaQueryData.textScaleFactor获得
                ),
                Text("你好",
                    style: TextStyle(
                        background: new Paint()..color = Colors.pink,
                        color: Colors.blue,
                        fontSize: 16,
                        letterSpacing: 12,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Courier",
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.red))
              ],
            ),
          ),
          Container(
            child: Column(
              children: [
                RaisedButton(
                  child: Text('切换'),
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text('提示'),
                            content: Text('确认删除吗？'),
                            backgroundColor: Colors.lightBlueAccent,
                            elevation: 24,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50)),
                            actions: <Widget>[
                              FlatButton(
                                child: Text('取消'),
                                onPressed: () {
                                  Navigator.of(context).pop('cancel');
                                },
                              ),
                              FlatButton(
                                child: Text('确认'),
                                onPressed: () {
                                  Navigator.of(context).pop('ok');
                                },
                              ),
                            ],
                          );
                        });
                  },
                ),
                RaisedButton(
                  child: Text('ios切换'),
                  onPressed: () {
                    showCupertinoDialog(
                        context: context,
                        builder: (context) {
                          return CupertinoAlertDialog(
                            title: Text('提示'),
                            content: Text('确认删除吗？'),
                            actions: <Widget>[
                              CupertinoDialogAction(
                                child: Text('取消'),
                                onPressed: () {},
                              ),
                              CupertinoDialogAction(
                                child: Text('确认'),
                                onPressed: () {},
                              ),
                            ],
                          );
                        });
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
