import 'package:flutter/material.dart';

class GrButton extends StatelessWidget {
  final String bName;
  final Icon icon;
  final Color bcolor;
  final VoidCallback callBack;

  const GrButton(
      {super.key,
      required this.callBack,
      required this.icon,
      required this.bcolor,
      required this.bName});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          callBack();
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: bcolor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        ),
        child: Icon != null
            ? Row(
                children: [
                  SizedBox(width: MediaQuery.of(context).size.width * 0.3),
                  icon,
                  Text(bName),
                ],
              )
            : Text(
                bName,
              ));
  }
}
