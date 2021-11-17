import 'package:flutter/material.dart';
import 'package:task_app/constant/laptop_prod.dart';
import 'package:task_app/laptop_bloc.dart';
import 'package:task_app/pages/cartPage.dart';

import '../model.dart';

class LaptopPage extends StatefulWidget {
  final LaptopPageInterface mListener;

  const LaptopPage({Key? key, required this.mListener}) : super(key: key);
  @override
  _LaptopPageState createState() => _LaptopPageState();
}

abstract class MobilePageInterface {}

class _LaptopPageState extends State<LaptopPage> {
  int selectItem = 0;
  List<Model> cartList = [];
  late LaptopBloc _bloc;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("prodddd....${laptop_list.toList()}");
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Scaffold(
          backgroundColor: Colors.white,
          body: ListView(
            padding: EdgeInsets.all(0.0),
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 34),
                child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white12,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                              spreadRadius: 1,
                              color: Colors.white,
                              //color: Colors.black12.withOpacity(0.4),
                              blurRadius: 2)
                        ]),
                    child: Column(
                        children: List.generate(laptop_list.length, (index) {
                      return Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Container(
                            child: Stack(
                          children: <Widget>[
                            Container(
                              //width: 200,
                              decoration: BoxDecoration(
                                  color: Colors.black12,
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                        spreadRadius: 1,
                                        color: Colors.black.withOpacity(0.05),
                                        blurRadius: 2)
                                  ]),
                              child: Column(
                                children: <Widget>[
                                  Text(
                                    "\$ " + laptop_list[index]['price'],
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Center(
                                    child: Container(
                                      width: 180,
                                      height: 100,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                  laptop_list[index]['img']),
                                              fit: BoxFit.cover)),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    laptop_list[index]['name'],
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Divider(
                                    height: 1,
                                    color: Colors.grey,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      if (mounted) {
                                        setState(() {
                                          selectItem = selectItem + 1;
                                        });
                                      }
                                    },
                                    child: Container(
                                        width: 200,
                                        color: Colors.transparent,
                                        child:
                                            Center(child: Text("Add to Cart"))),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                            ),
                            // Positioned(
                            //     right: 10,
                            //     child: IconButton(icon: SvgPicture.asset("assets/images/heart_icon.svg"),
                            //         onPressed: null))
                          ],
                        )),
                      );
                    }))),
              ),
            ],
          ),
        ),
        checkoutButton()
      ],
    );
  }

  Widget checkoutButton() {
    return Stack(
        children: List.generate(selectItem, (index) {
      return Padding(
        padding: const EdgeInsets.all(6.0),
        child: InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => MyCartPage(
                          cartList: cartList,
                          onRemove: (indexToRemove) {
                            _bloc.cartController.add(cartList.length);
                          },
                        )));
          },
          child: Padding(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: Container(
              height: 40,
              width: 400,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: Colors.black,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "$selectItem",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  Text(
                    "CHECKOUT",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }));
  }
}

class LaptopPageInterface {}
