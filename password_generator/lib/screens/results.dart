import 'package:flutter/material.dart';


class Results extends StatelessWidget {
  const Results({super.key,
  required this.passwordGenerated
  
  });

  final dynamic passwordGenerated;
  
  

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Your Generated password'),),
      ),

      body: Center(
        child: Text(passwordGenerated)
      ),  


    );
  }
}