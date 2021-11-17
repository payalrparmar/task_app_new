import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class orderDialog extends StatelessWidget {
  bool _isDialogShow = true;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      onDoubleTap: () {},
      child: Visibility(
        visible: true,
        child: Center(
          child: Padding(
            padding:
                EdgeInsets.only(top: 250, bottom: 250, right: 20, left: 20),
            child: new Container(
              decoration: new BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  new BoxShadow(
                    color: Colors.black,
                    blurRadius: 20.0,
                  ),
                ],
              ),
              child: new Card(
                child: new Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.black)),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: new Text(
                          "Your order has been placed successfully!!!",
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w600),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          if (_isDialogShow) {
                            _isDialogShow = false;
                            //SystemNavigator.pop();
                            Navigator.pop(context);
                          }
                        },
                        child: Align(
                            alignment: Alignment.bottomRight,
                            child: Padding(
                              padding: EdgeInsets.only(right: 30, bottom: 10),
                              child: Container(
                                color: Colors.transparent,
                                child: new Text(
                                  "OK",
                                  style: new TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            )),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
