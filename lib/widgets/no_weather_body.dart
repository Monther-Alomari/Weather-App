import 'package:flutter/material.dart';

class NoWeatherBody extends StatelessWidget {
  const NoWeatherBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                'there is no weather 😔 start searching now 🔍',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
            ),
            // Text(
            //   'searching now 🔍',
            //   style: TextStyle(
            //     fontSize: 30,
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
