import 'package:flutter/material.dart';
import 'package:harry_potter_character/Models/color_constants.dart';

class InfoCard extends StatelessWidget {
  final String actorInfo;
  final String info;

  const InfoCard({Key? key, required this.actorInfo, required this.info})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (ctx, constraints) {
        return SizedBox(
          width: double.infinity,
          child: Card(
            color: MyColors.pictonBlue,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(15),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    alignment: Alignment.center,
                    child: Text(
                      info,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: MyColors.brightNavyBlue,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 7,
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    color: MyColors.maastrichtBlue,
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(15),
                    ),
                  ),
                  width: constraints.maxWidth * 0.5,
                  child: Text(
                    actorInfo,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: MyColors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
