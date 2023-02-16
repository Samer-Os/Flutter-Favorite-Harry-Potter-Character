import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:harry_potter_character/Models/colors.dart';

import 'custom_button.dart';
import 'info_card.dart';

class PersonCard extends StatelessWidget {
  final person;
  final bool isMe;
  final String routeName;
  final String buttonText;

  const PersonCard({
    Key? key,
    required this.person,
    required this.isMe,
    required this.routeName,
    required this.buttonText,
  }) : super(key: key);

  Widget space(double value) {
    return SizedBox(
      height: value,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: Card(
            elevation: 10,
            color: MyColors.brightNavyBlue,
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    alignment: Alignment.center,
                    child: CachedNetworkImage(
                      imageBuilder: (context, image) => Container(
                        padding: const EdgeInsets.all(1),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: MyColors.white,
                            width: 3,
                          ),
                        ),
                        child: CircleAvatar(
                          backgroundImage: image,
                          radius: 60,
                        ),
                      ),
                      imageUrl: person.imageUrl,
                      placeholder: (context, url) => const CircleAvatar(
                        radius: 60,
                        backgroundColor: MyColors.white,
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  ),
                  space(20),
                  InfoCard(actorInfo: person.name, info: 'Name'),
                  space(10),
                  InfoCard(
                      actorInfo: person.actor,
                      info: !isMe ? 'Actor' : 'Profession'),
                  space(10),
                  InfoCard(actorInfo: person.gender, info: 'Gender'),
                  space(10),
                  InfoCard(
                      actorInfo: person.yearOfBirth, info: 'Year of birth'),
                  space(10),
                  InfoCard(actorInfo: person.species, info: 'Species'),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 35,
        ),
        CustomButton(
            buttonText: buttonText, routeName: routeName, isMe: isMe),
      ],
    );
  }
}
