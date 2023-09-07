

import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

  class Loading extends StatelessWidget {
     Loading({Key? key}) : super(key: key);
  
    @override
    Widget build(BuildContext context) {
      return Shimmer.fromColors(
          baseColor:Colors.grey.shade400,
          highlightColor:Colors.grey.shade500,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            color: Colors.white,
            height: 40,
            width: double.infinity,
          ),
        )
      );
    }
  }
  