import 'package:flutter/material.dart';
import 'package:kpgeodataapp/presentation/widgets/widgets.dart';

class CheckStatusScreen extends StatelessWidget {
  const CheckStatusScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Center(
            child: LoaderComponent(
          text: "Por favor espere...",
        )),
      ),
    );
  }
}
