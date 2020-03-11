

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:list_tile_more_customizable/list_tile_more_customizable.dart';

final Color backgroundColor = Color(0xff4a4a58);

class MenuDashBoardPage extends StatefulWidget {
  @override
  _MenuDashBoardPageState createState() => _MenuDashBoardPageState();
}

class _MenuDashBoardPageState extends State<MenuDashBoardPage> {
  List<bool> _selected = List.generate(6, (i) => false);
  bool isCollapsed = true;
  double screenWidth, screenHeight;
  final Duration duration = const Duration(milliseconds: 300);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    screenWidth = size.width;
    screenHeight = size.height;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: Stack(
        children: <Widget>[menu(context), dashBoard(context)],
      ),
    );
  }

  Widget menu(context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Align(
          alignment: Alignment.centerLeft,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              navNar(),
              devider(
                mheight: 50,
              ),
              dashboaredItem("Dashboared", Icons.account_balance_wallet, 0),
              dashboaredItem("Messages", Icons.message, 1),
              dashboaredItem("Utility Bills", Icons.receipt, 2),
              dashboaredItem("Funds Transfer", Icons.compare_arrows, 3),
              dashboaredItem("Branches", Icons.view_compact, 4),
              devider(mheight: 40),
              dashboaredItem("log out", Icons.exit_to_app, 5)
            ],
          )),
    );
  }

  Widget dashBoard(context) {
    return AnimatedPositioned(
      duration: duration,
      top: isCollapsed ? 0 : 0.2 * screenHeight,
      left: isCollapsed ? 0 : 0.6 * screenWidth,
      bottom: isCollapsed ? 0 : 0.2 * screenWidth,
      right: isCollapsed ? 0 : -0.4 * screenWidth,
      child: Material(
        elevation: 8,
        borderRadius:
            isCollapsed ? null : BorderRadius.all(Radius.circular(40)),
        color: backgroundColor,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: ClampingScrollPhysics(),
          child: Container(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 48),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    InkWell(
                      child: Icon(
                        Icons.menu,
                        color: Colors.white,
                      ),
                      onTap: () {
                        setState(() {
                          isCollapsed = !isCollapsed;
                        });
                      },
                    ),
                    Text(
                      "My Cards",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    Icon(
                      Icons.settings,
                      color: Colors.white,
                    ),
                  ],
                ),
                devider(mheight: 40),
                Container(
                  height: 200,
                  child: PageView(
                    controller: PageController(viewportFraction: 0.8),
                    scrollDirection: Axis.horizontal,
                    pageSnapping: true,
                    children: <Widget>[
                      cardImage('images/lake.jpg'),
                      cardImage('images/lake.jpg'),
                      cardImage('images/lake.jpg')
                    ],
                  ),
                ),
                devider(mheight: 20),
                Text("Transactions",style: TextStyle(color: Colors.white,fontSize: 16)),
                devider(mheight: 10),
                Text("Today",style: TextStyle(color: Colors.grey,fontSize: 13)),
                ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return ListTile(
                        selected: true,
                        title: Text("Android Tut " ,style: TextStyle(color: Colors.white),),
                        subtitle: Text("book  ",style: TextStyle(color: Colors.grey)),
                        trailing: Text("-2000\$",style: TextStyle(color: Colors.grey)),
                        leading: Icon(Icons.android),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return Divider(
                        height: 5,
                      );
                    },
                    itemCount: 20)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget cardImage(name) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(45)),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Image.asset(
          name,
          width: 100,
          height: 220,
        ),
      ),
    );
  }

  Widget navNar() {
    return Container(
      padding: EdgeInsets.only(left: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          CircleAvatar(
            radius: 40,
            backgroundImage: AssetImage('images/lake.jpg'),
          ),
          devider(mheight: 20),
          Text("Islam Sams",
              style: TextStyle(color: Colors.white, fontSize: 18)),
          SizedBox(
            height: 10,
          ),
          Text("Luxor , Egypt",
              style: TextStyle(color: Colors.grey, fontSize: 13))
        ],
      ),
    );
  }

  Widget dashboaredItem(msg, icon, index) {
    return ListTileMoreCustomizable(
      title: Text(
        msg,
        style: TextStyle(color: _selected[index] ? Colors.white : Colors.grey),
      ),
      leading: Icon(
        icon,
        color: _selected[index] ? Colors.white : Colors.grey,
      ),
      horizontalTitleGap: 8.0,
      onTap: (details) {
        setState(() {
          _selected[index] = !_selected[index];
        });
      },
    );
  }

  Widget devider({double mheight = 10}) {
    return SizedBox(
      height: mheight,
    );
  }
}
