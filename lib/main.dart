import 'package:english_words/english_words.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';
void main() {
  runApp(MaterialApp( home: App(),));
}

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  double value=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.blue,
                      Colors.blue,
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  )
                ),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('About',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,letterSpacing: 2.5,color: Colors.white),),
                  ),
                ),
              ),
              SafeArea(
                child: Container(
                  width: 250.0,
                  padding:EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      DrawerHeader(child:Column(
                        children: [
                            CircleAvatar(backgroundColor: Colors.green,radius: 50,),
                            SizedBox(height: 10,),
                            Expanded(child: Text('Fidele Kirezi Cyisa',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),))
                          ],
                        ),
                      ),
                      Expanded(child: ListView(
                        children: [
                            ListTile(
                              leading: Icon(Icons.home,color: Colors.white,),
                              title: Text('Home',style: TextStyle(fontSize: 20,color: Colors.white,letterSpacing: 2.0),),
                            ),
                          ListTile(
                            leading: Icon(Icons.help,color: Colors.white,),
                            title: Text('Help',style: TextStyle(fontSize: 20,color: Colors.white),),
                          ),
                          ListTile(
                            leading: Icon(Icons.settings,color: Colors.white,),
                            title: Text('Settings',style: TextStyle(fontSize: 20,color: Colors.white),),
                          ),
                          ListTile(
                            leading: Icon(Icons.logout,color: Colors.white,),
                            title: Text('Logout',style: TextStyle(fontSize: 20,color: Colors.white),),
                          ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              TweenAnimationBuilder(
                  tween: Tween<double>(begin: 0,end: value),
                  duration: Duration(milliseconds: 500),
                  builder:(_,double val,__){
                        return (Transform(
                          alignment: Alignment.center,
                          transform: Matrix4.identity()
                          ..setEntry(3, 2, 0.001)
                          ..setEntry(0, 3, 200*val)
                          ..rotateY((pi/6)*val),
                          child: GestureDetector(
                            onTap: (){
                              setState(() {
                                value==0?value=1:value=0;
                              });
                            },
                            child: Scaffold(
                              backgroundColor: Colors.blue,
                              appBar: value==0?AppBar(
                                title: Text('3D Animation'),
                          ):null,
                              body: Container(
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.height,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: value==1?BorderRadius.only(topLeft: Radius.circular(20),bottomLeft: Radius.circular(20)):null,
                                ),
                                child: Center(child: Text('Swipe Right')),
                              ),
                            ),
                          ),
                        ));
                  },
              ),
            ],
          ),
        ),
    );
  }
}
