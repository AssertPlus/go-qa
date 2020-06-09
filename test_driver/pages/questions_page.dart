import 'package:flutter_driver/flutter_driver.dart';

class QuestionsPage {

  FlutterDriver _driver;

  //Constructor
  QuestionsPage(FlutterDriver driver) {
    this._driver = driver;
  }

  Future<void> tapAnswer(answer) async {
    return _driver.tap(find.text(answer));
  }
}
