import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:harry_potter_character/Models/colors.dart';
import '../Models/character.dart';
import '../Widgets/person_card.dart';
import '../Controllers/character_controller.dart';
import 'my_page.dart';

class ActorPage extends StatefulWidget {
  const ActorPage({Key? key}) : super(key: key);

  @override
  _ActorPageState createState() => _ActorPageState();
}

class _ActorPageState extends State<ActorPage> {
  late Future fetchData;
  CharacterController characterController = Get.find();
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
    fetchData = characterController.fetchActorInfo().catchError((error) {
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
    String actorName = characterController.actorName;
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
            actor = characterController.actor;
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
                    ),
                  );
          },
        ),
      ),
    );
  }
}
