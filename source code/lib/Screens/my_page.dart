import 'package:flutter/material.dart';
import '../Models/colors.dart';
import '../Widgets/person_card.dart';
import '../providers/character_provider.dart';
import 'package:provider/provider.dart';

class Mypage extends StatelessWidget {
  const Mypage({Key? key}) : super(key: key);
  static const routeName = 'myPageRoute';

  @override
  Widget build(BuildContext context) {
    final myInfo =
        Provider.of<CharacterProvider>(context, listen: false).myInfo;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: MyColors.maastrichtBlue,
          title: Text(myInfo.name),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(15),
          child: PersonCard(
            person: myInfo,
            isMe: true,
            buttonText: 'Go Back To Character Profile',
            routeName: '/',
          ),
        ),
      ),
    );
  }
}
