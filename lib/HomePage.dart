import 'package:flutter/material.dart';
import 'package:task_app/pages/Laptops.dart' as laptopItem;
import 'package:task_app/pages/prod_list.dart' as mobileItem;

class HomePage extends StatefulWidget {
  static String tag = "home-page";
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with
        TickerProviderStateMixin,
        mobileItem.MobilePageInterface,
        laptopItem.LaptopPageInterface {
  late TabController tabController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = new TabController(length: 2, vsync: this, initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Products"),
      ),
      body: getAddProdTab(),
    );
  }

  Widget getAddProdTab() {
    return Padding(
      padding: EdgeInsets.only(top: 10),
      child: Column(
        children: [
          Container(
            height: 30,
            child: DefaultTabController(
              length: 2,
              child: TabBar(
                indicator: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(9)),
                    ),
                    color: Colors.lightBlue),
                controller: tabController,
                tabs: <Widget>[
                  Tab(
                    child: Text(
                      "Shoes",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 10,
                          fontFamily: 'Avenir_Heavy'),
                    ),
                  ),
                  Tab(
                    child: Text(
                      "Laptops",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 10,
                          fontFamily: 'Avenir_Heavy'),
                    ),
                  ),
                ],
              ),
            ),
          ),
          getAddTabScreen()
        ],
      ),
    );
  }

  Widget getAddTabScreen() {
    return Container(
      height: 580,
      child: TabBarView(
        controller: tabController,
        children: [
          new mobileItem.ShoesPage(mListener: this),
          new laptopItem.LaptopPage(mListener: this)
        ],
      ),
    );
  }
}
