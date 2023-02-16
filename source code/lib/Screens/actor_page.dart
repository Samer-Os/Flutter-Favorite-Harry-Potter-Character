import 'package:flutter/material.dart';
import 'package:harry_potter_character/Models/color_constants.dart';
import 'package:provider/provider.dart';
import '../Models/character.dart';
import '../Widgets/person_card.dart';
import '../providers/character_provider.dart';
import 'my_page.dart';

class ActorPage extends StatefulWidget {
  const ActorPage({Key? key}) : super(key: key);

  @override
  _ActorPageState createState() => _ActorPageState();
}

class _ActorPageState extends State<ActorPage> {
  late Future fetchData;
  Character actor = Character(
    name: '',
    species: '',
    gender: '',
    yearOfBirth: '',
    actor: '',
    imageUrl: '',
  );

  @override
  void initState() {
    fetchData = Provider.of<CharacterProvider>(context, listen: false)
        .fetchActorInfo()
        .catchError((error) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Bir hata oluştu'),
          content: const Text('Daha sonra tekrar deneyiniz'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                'Tamam',
                style: TextStyle(
                  color: MyColors.maastrichtBlue,
                ),
              ),
            ),
          ],
        ),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String actorName =
        Provider.of<CharacterProvider>(context, listen: false).actorName;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: MyColors.maastrichtBlue,
          title: Text(actorName),
          centerTitle: true,
        ),
        body: FutureBuilder(
          future: fetchData,
          builder: (ctx, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            actor = Provider.of<CharacterProvider>(context, listen: false).actor;
            return actor.name.isEmpty
                ? const Center(
                    child: Text('Bir hata oluştu'),
                  )
                : SingleChildScrollView(
                    padding: const EdgeInsets.all(15),
                    child: PersonCard(
                      person: actor,
                      isMe: false,
                      buttonText: 'Show My Profile',
                      routeName: Mypage.routeName,
                    ),
                  );
          },
        ),
      ),
    );
  }
}
