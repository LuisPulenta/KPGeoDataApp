import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/theme_provider.dart';

class ThemeConfigScreen extends StatelessWidget {
  const ThemeConfigScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configuración'),
        centerTitle: true,
      ),
      body: const _ThemeConfigView(),
    );
  }
}
//---------------------------------------------------
//---------- _ThemeConfigView -----------------------
//---------------------------------------------------

class _ThemeConfigView extends ConsumerWidget {
  const _ThemeConfigView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Color> colors = ref.watch(colorListProvider);

    final colorsSelected = Theme.of(context).colorScheme;

    return Center(
      child: Column(
        children: [
          SwitchListTile(
            title: Row(
              children: [
                ref.watch(isDarkmodeProvider.notifier).state
                    ? Icon(
                        Icons.dark_mode,
                        color: colorsSelected.primary,
                      )
                    : Icon(
                        Icons.light_mode,
                        color: colorsSelected.primary,
                      ),
                const SizedBox(
                  width: 10,
                ),
                const Text('Modo oscuro'),
              ],
            ),
            value: ref.read(isDarkmodeProvider.notifier).state,
            onChanged: (value) {
              ref.read(isDarkmodeProvider.notifier).update((state) => !state);
            },
          ),
          Divider(
            color: colorsSelected.primary,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: SizedBox(
              height: 50,
              width: double.infinity,
              child: Row(children: [
                const Text('Color seleccionado:'),
                const Spacer(),
                _CuadroColor(
                    size: const Size(300, 300),
                    selectedColor: ref.watch(selectedColorProvider),
                    color: ref.watch(
                        colorListProvider)[ref.watch(selectedColorProvider)])
              ]),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: ListView.builder(
                itemCount: 7,
                itemBuilder: (context, index) => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _CustomContainer(colors[index * 6], index * 6),
                    _CustomContainer(colors[index * 6 + 1], index * 6 + 1),
                    _CustomContainer(colors[index * 6 + 2], index * 6 + 2),
                    _CustomContainer(colors[index * 6 + 3], index * 6 + 3),
                    _CustomContainer(colors[index * 6 + 4], index * 6 + 4),
                    _CustomContainer(colors[index * 6 + 5], index * 6 + 5),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//---------------------------------------------------
//---------- _CustomContainer -----------------------
//---------------------------------------------------
class _CustomContainer extends ConsumerWidget {
  final Color color;
  final int selectedColor;

  const _CustomContainer(this.color, this.selectedColor);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        ref.read(selectedColorProvider.notifier).state = selectedColor;
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 3),
        child: _CuadroColor(
          size: size,
          color: color,
          selectedColor: selectedColor,
        ),
      ),
    );
  }
}

//---------------------------------------------------
//---------------- _CuadroColor ---------------------
//---------------------------------------------------
class _CuadroColor extends ConsumerWidget {
  final Size size;
  final Color color;
  final int selectedColor;

  const _CuadroColor({
    required this.size,
    required this.color,
    required this.selectedColor,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: size.width * 0.15,
      height: size.width * 0.15,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
            width:
                ref.read(selectedColorProvider.notifier).state == selectedColor
                    ? 5
                    : 1,
            color: Colors.black),
        boxShadow: [
          BoxShadow(
            color: color,
            spreadRadius: 0,
            blurRadius: 0,
            offset: const Offset(0, 0), // changes position of shadow
          ),
        ],
      ),
    );
  }
}
