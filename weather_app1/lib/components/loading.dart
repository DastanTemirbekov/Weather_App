import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(
            height: 100,
          ),
          CircularProgressIndicator(
            backgroundColor: Colors.green,
          ),
        ],
      ),
    );
  }
}
