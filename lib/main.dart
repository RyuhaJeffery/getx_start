import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(
    GetMaterialApp(
      home: Home(),
    ),
  );
}

class Controller extends GetxController {
  var count = 0.obs;
  increment() => count++;
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Get.put()을 사용하여 클래스를 인스턴스화하여 모든 "child'에서 사용가능하게 합니다.
    final Controller c = Get.put(Controller());

    return Scaffold(
      appBar: AppBar(
        // count가 변경 될 때마다 Obx(()=> 를 사용하여 Text()에 업데이트합니다.
        title: Obx(
          () => Text("Clicks: ${c.count}"),
        ),
      ),
      body: Center(
        // 8줄의 Navigator.push를 간단한 Get.to()로 변경합니다. context는 필요없습니다.
        child: Column(
          children: <Widget>[
            ElevatedButton(
              child: Text("Go to Other"),
              onPressed: () => Get.to(
                Other(),
              ),
            ),
            ElevatedButton(
              child: Text("+1"),
              onPressed: () => Get.put(
                Controller(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Other extends StatelessWidget {
  // 다른 페이지에서 사용되는 컨트롤러를 Get으로 찾아서 redirect 할 수 있습니다.
  final Controller c = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("${c.count}"),
      ),
    );
  }
}
