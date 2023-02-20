import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:harry_potter_character/Screens/actor_page.dart';
import 'package:harry_potter_character/Screens/my_page.dart';

import '../Models/colors.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  final bool isMe;

  const CustomButton({Key? key, required this.buttonText, required this.isMe})
      : super(key: key);

  List<Widget> arrow() {
    return !isMe
        ? [
            const SizedBox(
              width: 6,
            ),
            const Icon(
              Icons.arrow_forward,
              color: MyColors.maastrichtBlue,
            ),
          ]
        : [
            const Icon(
              Icons.arrow_back,
              color: MyColors.maastrichtBlue,
            ),
            const SizedBox(
              width: 6,
            ),
          ];
  }

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {
        !isMe
            ? Get.off(
                const Mypage(),
                transition: Transition.rightToLeft,
              )
            : Get.off(
                const ActorPage(),
                transition: Transition.leftToRight,
              );
      },
      style: OutlinedButton.styleFrom(
        side: const BorderSide(
          color: MyColors.maastrichtBlue,
        ),
      ),
      child: SizedBox(
        width: 210,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (isMe) ...arrow(),
            Text(
              buttonText,
              style: const TextStyle(
                color: MyColors.maastrichtBlue,
              ),
            ),
            if (!isMe) ...arrow(),
          ],
        ),
      ),
    );
  }
}
