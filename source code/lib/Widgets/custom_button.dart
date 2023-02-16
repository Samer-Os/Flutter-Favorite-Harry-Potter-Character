import 'package:flutter/material.dart';

import '../Models/colors.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  final String routeName;
  final bool isMe;

  const CustomButton(
      {Key? key,
      required this.buttonText,
      required this.routeName,
      required this.isMe})
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
        Navigator.of(context).pushReplacementNamed(routeName);
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
