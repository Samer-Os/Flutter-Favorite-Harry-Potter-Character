import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'Screens/actor_page.dart';
import 'Screens/my_page.dart';
import 'providers/character_provider.dart';

void main() {
  CachedNetworkImage.logLevel = CacheManagerLogLevel.debug;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => CharacterProvider(),
      child: MaterialApp(
        title: 'Favorite Character App',
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case '/':
              return PageTransition(
                duration: const Duration(milliseconds: 250),
                child: const ActorPage(),
                type: PageTransitionType.leftToRight,
              );
            case Mypage.routeName:
              return PageTransition(
                duration: const Duration(milliseconds: 250),
                child: const Mypage(),
                type: PageTransitionType.rightToLeft,
              );
            default:
              return null;
          }
        },
      ),
    );
  }
}
