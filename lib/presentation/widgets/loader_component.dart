import 'package:flutter/material.dart';

class LoaderComponent extends StatelessWidget {
  final String text;

  const LoaderComponent({Key? key, this.text = ''}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Center(
      child: Container(
        width: 200,
        height: 200,
        decoration: BoxDecoration(
            color: colors.inversePrimary,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: colors.primary,
            )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Image(
              image: AssetImage('assets/loading.gif'),
              width: 200,
            ),
            const SizedBox(
              height: 0,
            ),
            Text(text, style: const TextStyle(fontSize: 15)),
          ],
        ),
      ),
    );
  }
}
