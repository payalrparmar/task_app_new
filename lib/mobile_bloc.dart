import 'dart:async';

import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:task_app/model.dart';

class MobileBloc {

  StreamController<List<Model>> streamController = StreamController();
  StreamController<int> cartController = StreamController();
  StreamController<List<Model>> cartRemoveController = StreamController();

  MobileBloc(){loadJsonData();}




  Future<String> loadJsonData() async {
    var jsonText = await rootBundle.loadString('assets/product.json');
    print(jsonText);
    // data = json.decode(jsonText);

    List<Model> gateEntriesAllList = List<Model>.from(
        jsonDecode(jsonText).map((it) => Model.fromJson(it)));
    streamController.sink.add(gateEntriesAllList);

    print(gateEntriesAllList[0].mulImg);
    return jsonText;
  }

  void dispose() {
    streamController.close();
    cartController.close();
    cartRemoveController.close();
  }
}
