
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'dart:math';



class NestedScrolls extends StatefulWidget {
static const   listHeader = ['Pakistan', 'China','Iran','Turkey'];

  const NestedScrolls({Key? key}) : super(key: key);
  @override
  _NestedScrollsState createState() => _NestedScrollsState();
}

class _NestedScrollsState extends State<NestedScrolls> {
  double get randHeight => Random().nextInt(100).toDouble();

  List<Widget>? _randomChildren;

  // Children with random heights - You can build your widgets of unknown heights here
  // I'm just passing the context in case if any widgets built here needs  access to context based data like Theme or MediaQuery
  // ignore: unused_element
  List<Widget> _randomHeightWidgets(BuildContext context, {header = 'null'}) {
    _randomChildren ??= List.generate(1, (index) {
      final height = randHeight.clamp(
        100.0,
        MediaQuery.of(context)
            .size
            .width, // simply using MediaQuery to demonstrate usage of context
      );
      return Container(
        alignment: Alignment.center,
        color: Colors.primaries[index],
        height: height,
        child: Text(header),
      );
    });

    return _randomChildren!;
  }
var position=0;
  var topHeader;


 Widget? applyWidget() {

   switch(position){
     case 0:
       setState(() {
         topHeader = NestedScrolls.listHeader[0];
       });
       // return widget if user click over pakistan in tab bar
       return grid();
     case 1:
       setState(() {
         topHeader = NestedScrolls.listHeader[1];
       });
       return   list();
     case 2:
       setState(() {
         topHeader = NestedScrolls.listHeader[2];
       });
       return Container(color: Colors.blue,
         child: Center(child: Text(topHeader),),);
     case 3:
       setState(() {
         topHeader = NestedScrolls.listHeader[3];
       });
       return Container(color: Colors.orange,
         child: Center(child:
         Text(topHeader),
         )
         ,

       );


   }



  }
@override
  void initState() {
    // : implement initState
    super.initState();
    //initial header name when activity start first time
     topHeader = NestedScrolls.listHeader[0];
  }
  @override
  Widget build(BuildContext context) {
    topHeader = topHeader;
    return Scaffold(
      // Persistent AppBar that never scrolls
      appBar: AppBar(
        title: const Text('AppBar'),
        elevation: 0.0,
      ),
      body:
           Column(
            children: <Widget>[
              ///header
              Container(
                alignment: Alignment.center,
                color: Colors.blueGrey,
                height: 90,
                child: Text(NestedScrolls.listHeader[position]),
              ),
              /// tabBar
              Container(
                height: 60,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: NestedScrolls.listHeader.length,
                    itemBuilder: (con, index) {
                      return GestureDetector(
                        onTap: () => setState(() {
                          position=index;
                          topHeader = NestedScrolls.listHeader[index];

                        }),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 2.0, horizontal: 10),
                          child: Container(alignment: Alignment.center,
                              width: 100,
                              color: topHeader==NestedScrolls.listHeader[index]?Colors.black26:Colors.transparent,
                              child: Text(NestedScrolls.listHeader[index])),
                        ),
                      );
                    }),
              ),

            ///Widget
            Expanded(
                  child: GestureDetector(

                      // onHorizontalDragStart: (left){
                      //    print('left : ${left.localPosition.direction}');
                      // // left.globalPosition.dx
                      //
                      // },
                      onHorizontalDragEnd: (drag){
                        if (kDebugMode) {
                          print('start : ${drag.velocity.pixelsPerSecond.dx}');
                        }
                        if((drag.velocity.pixelsPerSecond.dx)<-700){
                          if(position<NestedScrolls.listHeader.length-1 && position>=0) {
                            setState(() {
                              position=position+1;
                            });
                          }


                        }else{}

                      if((drag.velocity.pixelsPerSecond.dx)>900){
                        if(position<=NestedScrolls.listHeader.length-1 && position>0) {
                          setState(() {
                            position=position-1;
                          });
                        }

                        }
                        print(position);
                      },
                      child: applyWidget()),
                ),

            ],
          ),
    );
  }

  list() {
    return SingleChildScrollView(scrollDirection: Axis.vertical,
      child: Container(



              child: Column(children: [
                for(var color in Colors.primaries)
                Container(color: color, height: 100.0)

              ],),






      ),
    );
  }

  grid() {
    return  GridView.count(
        padding: EdgeInsets.zero,
        crossAxisCount: 3,
        children: Colors.primaries.map((color) {
          return Container(color: color, height: 100.0);
        }).toList(),
      );
  }
}



class PullUpTab extends StatefulWidget {
  const PullUpTab({Key? key}) : super(key: key);

  @override
  _PullUpTabState createState() => _PullUpTabState();
}


class _PullUpTabState extends State<PullUpTab> {

  double get randHeight => Random().nextInt(100).toDouble();

  List<Widget>? _randomChildren;

  // Children with random heights - You can build your widgets of unknown heights here
  // I'm just passing the context in case if any widgets built here needs  access to context based data like Theme or MediaQuery
  List<Widget> _randomHeightWidgets(BuildContext context,{String header='header'}) {
    _randomChildren ??= List.generate(1, (index) {
      final height = randHeight.clamp(
        100.0,
        MediaQuery.of(context).size.width, // simply using MediaQuery to demonstrate usage of context
      );


      return Container(alignment:Alignment.center,
        color: Colors.primaries[index],
        height: height,
        child: Text(header),
      );
    });

    return _randomChildren!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Persistent AppBar that never scrolls
      appBar: AppBar(
        title: const Text('AppBar'),
        elevation: 0.0,
      ),
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          // allows you to build a list of elements that would be scrolled away till the body reached the top
          headerSliverBuilder: (context, _) {
            return [
              SliverList(
                delegate: SliverChildListDelegate(
                  _randomHeightWidgets(context),
                ),
              ),
            ];
          },
          // You tab view goes here
          body: Column(
            children: <Widget>[
              const TabBar(
                tabs: [
                  Tab(text: 'A'),
                  Tab(text: 'B'),
                ],
              ),
              Expanded(
                child: TabBarView(

                  children: [
                    GridView.count(
                      padding: EdgeInsets.zero,
                      crossAxisCount: 3,
                      children: Colors.primaries.map((color) {
                        return Container(color: color, height: 150.0);
                      }).toList(),
                    ),
                    ListView(
                      padding: EdgeInsets.zero,
                      children: Colors.primaries.map((color) {
                        return Container(color: color, height: 150.0);
                      }).toList(),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
