import 'package:flutter_driver/flutter_driver.dart';

class IdentificationPage {

  final startButton = find.byValueKey('start_button');
  final textFieldName = find.byValueKey('text_field_name');

  FlutterDriver _driver;

  //Constructor
  IdentificationPage(FlutterDriver driver) {
    this._driver = driver;
  }

  Future<void> tapTextField() async {
    return _driver.tap(textFieldName);
  }

  Future<void> fillName(String name) async {
    return _driver.enterText(name);
  }

  Future<void> tapStart() async {
    return _driver.tap(startButton);
  }
}