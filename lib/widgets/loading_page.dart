import 'package:flutter/material.dart';
import '../theme.dart';

class LoadingButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      // fungsi infinity memnysuaikan width layar
      width: double.infinity,
      margin: EdgeInsets.only(top: 30),
      child: TextButton(
        onPressed: () {},
        style: TextButton.styleFrom(
            backgroundColor: primaryColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 16,
              height: 16,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation(textColor),
              ),
            ),
            SizedBox(
              width: 4,
            ),
            Text(
              'Loading',
              style: primaryStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
