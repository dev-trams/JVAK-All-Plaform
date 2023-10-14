import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jvak/widgets/custom_toggle_button_view.dart';

void main() {
  runApp(const Test());
}

class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('widgetTestView'),
        ),
        body: Container(
          decoration: const BoxDecoration(color: Colors.white),
          child: const Column(
            children: [
              CustomToggleBtnView(
                  leftDescription: 'view1',
                  rightDescription: 'view2',
                  firstView: SizedBox(
                    child: Text('data1'),
                  ),
                  secondView: SizedBox(
                    child: Text('data2'),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
