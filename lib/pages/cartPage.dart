import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_app/mobile_bloc.dart';
import 'package:task_app/model.dart';
import 'package:task_app/order_dialog.dart';

class MyCartPage extends StatefulWidget {
  final Function onRemove;
  final List<Model> cartList;

  const MyCartPage({Key? key, required this.cartList, required this.onRemove})
      : super(key: key);

  @override
  _MyCartPageState createState() => _MyCartPageState();
}

class _MyCartPageState extends State<MyCartPage> {
  late MobileBloc _bloc;

  @override
  void initState() {
    _bloc = MobileBloc();
    _bloc.cartRemoveController.add(widget.cartList);
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    _bloc.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Scaffold(
          appBar: AppBar(
            title: Text("My Cart"),
          ),
          body: StreamBuilder<List<Model>>(
              stream: _bloc.cartRemoveController.stream,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 80,
                            width: 400,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: Colors.black,
                              ),
                            ),
                            child: ListTile(
                              title: Text(snapshot.data![index].name ?? ""),
                              subtitle: Text(snapshot.data![index].price ?? ""),
                              trailing: TextButton(
                                onPressed: () {
                                  widget.cartList.removeAt(index);
                                  _bloc.cartRemoveController
                                      .add(widget.cartList);
                                  widget.onRemove(index);
                                },
                                child: Text("Remove"),
                              ),
                            ),
                          ),
                        );
                      });
                } else {
                  return Text("Add item to card");
                }
              }),
        ),
        DoneButtonLayout()
      ],
    );
  }

  Widget DoneButtonLayout() {
    return GestureDetector(
      onTap: () {
        showDialog(
            barrierDismissible: false,
            context: context,
            builder: (BuildContext context) => new orderDialog());
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
              Card(
                child: Text(
                  "${widget.cartList.length}",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Colors.black),
                ),
              ),
              Card(
                child: Text(
                  "DONE   >",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
