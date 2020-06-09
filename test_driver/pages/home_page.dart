import 'package:flutter_driver/flutter_driver.dart';

class HomePage {

  final initButton = find.byValueKey('init_button');

  FlutterDriver _driver;

  //Constructor
  HomePage(FlutterDriver driver) {
    this._driver = driver;
  }

  Future<void> tapInitQuiz() async {
    return _driver.tap(initButton);
  }
}