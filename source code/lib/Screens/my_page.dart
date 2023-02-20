import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Models/colors.dart';
import '../Widgets/person_card.dart';
import '../Controllers/character_controller.dart';

class Mypage extends StatelessWidget {
  const Mypage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final myInfo = Get.find<CharacterController>().myInfo;
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
          ),
        ),
      ),
    );
  }
}
