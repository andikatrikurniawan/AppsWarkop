import 'package:flutter/material.dart';

class ProfileItem extends StatelessWidget {
  const ProfileItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: AlignmentGeometry.topCenter,
              end: AlignmentGeometry.bottomCenter,
              colors: [
                Colors.red,
                Colors.yellowAccent,
              ],
              ),
          borderRadius: BorderRadius.circular(40),
          ),
        ),
        Container(
          width: 70,
          height: 70,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/paes.png"),
              fit: BoxFit.cover
              ),
            color: Colors.grey[400],
            border: Border.all(
              color: Colors.white,
              width: 2,
            ),
          borderRadius: BorderRadius.circular(35),
          ),
        ),
      ],
    );
  }
}