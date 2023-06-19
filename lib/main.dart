import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kpgeodataapp/config/config.dart';
import 'presentation/providers/theme_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Environment.initEnvironment();
  await Preferences.init();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      title: 'KPGeoDataApp',
      theme: AppTheme(
              //selectedColor: Preferences.selectedColor,
              selectedColor: ref.watch(selectedColorProvider),
              isDarkmode: ref.watch(isDarkmodeProvider))
          .theme(),
    );
  }
}
