import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import '../../../utils/colors.dart';

class GameBackground extends StatelessWidget {


  final Widget child;
  const GameBackground({
    Key? key,
    required this.child, childeren,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //  Colors.primaries[i].withOpacity(0.2);
    return Stack(
      children: [






        Positioned.fill(
          child: Container(
            color: darkColor,
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Transform.rotate(
            angle: pi *180,
            child: Image.asset(
              'assets/images/bgimage.jpg',fit: BoxFit.fill,
              // color: Colors.primaries[8].withOpacity(0.5),
            ),


                //
                // child: RiveAnimation.asset(
                //
                //
                //   'assets/rive/trishul.riv',alignment: Alignment.bottomRight,fit: BoxFit.none,
                // ),



          ),

        ),


        const Align(

          alignment: Alignment.topLeft,


          child: RiveAnimation.asset(


            'assets/rive/trishul.riv',alignment: Alignment.bottomRight,fit: BoxFit.none,
          ),
        ),

        Positioned(
          child: child,



        )

        // const Visibility(
        //
        //   child: Align(
        //
        //     alignment: Alignment.topLeft,
        //
        //
        //     child: RiveAnimation.asset(
        //
        //
        //       'assets/rive/trishul.riv',alignment: Alignment.bottomRight,fit: BoxFit.none,
        //     ),
        //   ),
        //
        // ),





      ],







    );







  }


}

