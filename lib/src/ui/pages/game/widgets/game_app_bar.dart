import 'package:flutter/material.dart';
import 'package:samudramanthan/src/ui/global/controllers/theme_controller.dart';
import 'package:samudramanthan/src/ui/global/widgets/my_icon_button.dart';
import 'package:samudramanthan/src/ui/icons/puzzle_icons.dart';
import 'package:samudramanthan/src/ui/pages/game/controller/game_controller.dart';
import 'package:samudramanthan/src/ui/utils/dark_mode_extension.dart';
import 'package:samudramanthan/src/ui/utils/platform.dart';
import 'package:provider/provider.dart';

const whiteFlutterLogoColorFilter = ColorFilter.matrix(
  [1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 0],);





class GameAppBar extends StatelessWidget {
  const GameAppBar({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final logo = isIOS
        ? Image.asset("assets/images/ukr.png",width: 40,
        height: 30,
        fit:BoxFit.fill)
        : Image.asset("assets/images/ukr.png",width: 40,
        height: 30,
        fit:BoxFit.fill);



    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 10,
        ),
        child: Row(
          children: [
            FittedBox(
              child: Text.rich(
                TextSpan(
                  text: "${isIOS ? "Peace For " : "Peace For"}\n",
                  children: const [
                    TextSpan(
                      text: "Ukraine",
                      style: TextStyle(
                        fontSize: 24,
                        height: 1,
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.right,
              ),
            ),
            const SizedBox(width: 5),
            if (context.isDarkMode)
              ColorFiltered(
                colorFilter: whiteFlutterLogoColorFilter,
                child: Image.asset("assets/images/ukr.png",width: 40,height: 30,
                    fit:BoxFit.fill),
              )
            else
              Image.asset("assets/images/ukr.png",width: 40,height: 30,
                  fit:BoxFit.fill),

            const Spacer(),
            Consumer<GameController>(
              builder: (_, controller, __) => Row(
                children: [
                  MyIconButton(
                    onPressed: controller.toggleVibration,
                    iconData: controller.state.vibration
                        ? PuzzleIcons.vibration
                        : PuzzleIcons.vibration_off,
                  ),
                  const SizedBox(width: 10),
                  MyIconButton(
                    onPressed: controller.toggleSound,
                    iconData: controller.state.sound ? PuzzleIcons.sound : PuzzleIcons.mute,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 10),
            Consumer<ThemeController>(
              builder: (_, controller, __) => MyIconButton(
                onPressed: controller.toggle,
                iconData: controller.isDarkMode ? PuzzleIcons.dark_mode : PuzzleIcons.brightness,
              ),
            ),
            const SizedBox(width: 10),
            TextButton.icon(



              style: ButtonStyle(

                  backgroundColor:
                  MaterialStateProperty.all(Colors.white)),
              onPressed: () {

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SecondRoute()),
                );
              },
              icon: Image.asset('assets/icons/icon.png',width: 30,height: 50,
                  fit:BoxFit.fill),
              label: const Text('Read More',
                style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,
                ),

              ),
            ),


          ],

        ),
      ),

    );




  }
}


class SecondRoute extends StatelessWidget {
  const SecondRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset : false,
      appBar: AppBar(
        title: const Text('Description'),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(vertical: 20.0),
        height: 200.0,
        child: ListView(
          // This next line does the trick.
          scrollDirection: Axis.vertical,
          children: <Widget>[
            Container(

              child: const Text(
                "(1) Chandra, the moon,"
                    " (2) parijata, a beautiful and fragrant tree now planted in Indra’s heaven,"
                    " (3) the four-tusked elephant Airavata, Indra\’s mount,"
                    " (4) Kamadhenu, the cow of plenty,"
                    " (5) Madira, the goddess of wine, who became Varuni, the wife of Varuna,"
                    " (6) Kalpavriksha, the wish-fulfilling tree,"
                    " (7) the apsaras (celestial dancers),"
                    " (8) the celestial horse Uccaihshravas, "
                    "(9) the goddess Lakshmi, who became Vishnu\’s wife,"
                    " (10) Panchajanya, Vishnu\’s conch, (11) Vishnu\’s mace and magic bow, "
                    "(12) various gems, and (13–14) Dhanvantari, the physician of the gods,"
                    " who rose up out of the waters carrying in his hands the supreme treasure, the amrita",

                textAlign: TextAlign.left,
                overflow: TextOverflow.ellipsis,
                maxLines: 3,

              ),



            ),

          ],
        ),
      ),
    );
  }
}

