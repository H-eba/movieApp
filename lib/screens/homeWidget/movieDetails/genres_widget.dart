import 'package:flutter/material.dart';

class GenresWidget extends StatelessWidget {
  String? movieType;
  GenresWidget({super.key,required this.movieType});

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.all(10),
      child: Text(
        movieType ?? '',
        style: TextStyle(color: Colors.white),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Color(0xffCBCBCB),
        ),
      ),
    );
  }
}
