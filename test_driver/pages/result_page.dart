import 'package:flutter_driver/flutter_driver.dart';

class ResultPage {

  final textName = find.byValueKey('text_name');
  final textResult = find.byValueKey('text_result');

  FlutterDriver _driver;

  //Constructor
  ResultPage(FlutterDriver driver) {
    this._driver = driver;
  }

  Future<String> getName() async {
    return _driver.getText(textName);
  }

  Future<String> getTextResult() async {
    return _driver.getText(textResult);
  }
}
