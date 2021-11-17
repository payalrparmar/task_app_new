import 'dart:async';

import 'package:flutter/material.dart';
import 'package:task_app/constant/product_data.dart';
import 'package:task_app/mobile_bloc.dart';
import 'package:task_app/model.dart';
import 'package:task_app/pages/cartPage.dart';

class ShoesPage extends StatefulWidget {
  final MobilePageInterface mListener;

  const ShoesPage({Key? key, required this.mListener}) : super(key: key);

  @override
  _ShoesPageState createState() => _ShoesPageState();
}

abstract class MobilePageInterface {}

class _ShoesPageState extends State<ShoesPage> {
  int selectItem = 0;
  late MobileBloc _bloc;
  List<Model> cartList = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _bloc = MobileBloc();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Scaffold(
            backgroundColor: Colors.white,
            body: StreamBuilder<List<Model>>(
                stream: _bloc.streamController.stream,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (BuildContext context, int index) {
                          debugPrint(
                              "img path" + snapshot.data![index].mulImg!);
                          return Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Container(
                              width: 200,
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
                                    "\$ " +
                                        snapshot.data![index].price.toString(),
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
                                              image: AssetImage(
                                                  'assets/images/${snapshot.data![index].mulImg}'),
                                              fit: BoxFit.cover)),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    snapshot.data![index].name.toString(),
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
                                      cartList.add(snapshot.data![index]);
                                      _bloc.cartController.sink
                                          .add(cartList.length);
                                    },
                                    child: Container(
                                        color: Colors.transparent,
                                        child: Text("Add to Cart")),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                            ),
                          );
                        });
                  } else {
                    return CircularProgressIndicator();
                  }
                })),
        Positioned(
          //right: 40,
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => MyCartPage(
                          cartList: cartList,
                          onRemove: (indexToRemove) {
                            _bloc.cartController.add(cartList.length);
                          },
                        )),
              );
            },
            child: Container(
              width: 250,
              height: 50,
              decoration: BoxDecoration(
                  color: Colors.lightBlueAccent,
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                children: [
                  StreamBuilder<int>(
                      stream: _bloc.cartController.stream,
                      builder: (context, snapshot) {
                        return Text(
                          '${snapshot.data ?? 0}',
                          style: TextStyle(fontSize: 20),
                        );
                      }),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                      //width: 100,
                      //height: 50,
                      decoration: BoxDecoration(
                          color: Colors.lightBlueAccent,
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: Text(
                          'Checkout',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      )),
                  SizedBox(
                    width: 100,
                  ),
                  Icon(Icons.arrow_forward_ios)
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
