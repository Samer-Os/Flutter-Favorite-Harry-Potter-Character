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
    final myInfo = Provider.of<CharacterProvider>(context, listen: false).myInfo;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.maastrichtBlue,
        title: Text(myInfo.name),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            PersonCard(person: myInfo),
            const SizedBox(
              height: 35,
            ),
            SizedBox(
              width: 200,
              child: OutlinedButton(
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed('/');
                },
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(
                    color: MyColors.maastrichtBlue,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'Show My Profile',
                      style: TextStyle(
                        color: MyColors.maastrichtBlue,
                      ),
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Icon(
                      Icons.arrow_forward,
                      color: MyColors.maastrichtBlue,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
