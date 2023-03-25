import 'package:flutter/material.dart';

class SigninButton extends StatelessWidget {
  final image;
  final text;
  const SigninButton({super.key, required this.image, required this.text});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(seconds: 1),
      // clipBehavior: Clip.antiAlias,
      width: 200,
      padding: EdgeInsets.fromLTRB(1, 6, 1, 6),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(width: 1.5),
          borderRadius: BorderRadius.circular(8)),
      child: Row(
        children: [
          Image.asset(
            image,
            width: 35.34,
            // height: 50,
          ),
          Text(
            text,
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 14,
            ),
          )
        ],
      ),
    );
  }
}
