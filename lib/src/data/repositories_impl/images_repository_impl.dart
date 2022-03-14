import 'dart:typed_data';
import 'dart:math' as math;
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:image/image.dart';
import 'package:samudramanthan/src/domain/models/puzzle_image.dart';
import 'package:samudramanthan/src/domain/repositories/images_repository.dart';


const puzzleOptions = <PuzzleImage>[
  PuzzleImage(
    name: 'Numeric',
    assetPath: 'assets/images/numeric-puzzle.png',
    soundPath: '',
  ),
  PuzzleImage(
    name: 'Chandra',
    assetPath: 'assets/elements/chanadra.jpg',
    soundPath: 'assets/sounds/bg.mp3',
  ),
  PuzzleImage(
    name: 'parijata',
    assetPath: 'assets/elements/prajkta.jpeg',
    soundPath: 'assets/sounds/bg.mp3',
  ),
  PuzzleImage(
    name: 'Airavata',
    assetPath: 'assets/elements/airavata.jpeg',
    soundPath: 'assets/sounds/bg.mp3',
  ),
  PuzzleImage(
    name: 'Kamadhenu',
    assetPath: 'assets/elements/kamadhenu.jpg',
    soundPath: 'assets/sounds/bg.mp3',
  ),
  PuzzleImage(
    name: 'Madira',
    assetPath: 'assets/elements/Madira.png',
    soundPath: 'assets/sounds/bg.mp3',
  ),
  PuzzleImage(
    name: 'Kalpavriksha',
    assetPath: 'assets/elements/kalpavriksha.jpg',
    soundPath: 'assets/sounds/bg.mp3',
  ),
  PuzzleImage(
    name: 'Uccaihshravas',
    assetPath: 'assets/elements/uccaihshravas.jpg',
    soundPath: 'assets/sounds/bg.mp3',
  ),
  PuzzleImage(
    name: 'Vish',
    assetPath: 'assets/elements/vish.jpg',
    soundPath: 'assets/sounds/bg.mp3',
  ),
  PuzzleImage(
    name: 'Laxmi',
    assetPath: 'assets/elements/laxmi.jpeg',
    soundPath: 'assets/sounds/bg.mp3',
  ),
  PuzzleImage(
    name: 'Panchajanya',
    assetPath: 'assets/elements/panchajanya.jpg',
    soundPath: 'assets/sounds/bg.mp3',
  ),
  PuzzleImage(
    name: 'Vishnubow',
    assetPath: 'assets/elements/vishnubow.jpeg',
    soundPath: 'assets/sounds/bg.mp3',
  ),
  PuzzleImage(
    name: 'Dhanvantari',
    assetPath: 'assets/elements/dhanvantari.jpg',
    soundPath: 'assets/sounds/bg.mp3',
  ),

];

Future<Image> decodeAsset(ByteData bytes) async {
  return decodeImage(
    bytes.buffer.asUint8List(),
  )!;
}




class SPlitData {
  final Image image;
  final int crossAxisCount;

  SPlitData(this.image, this.crossAxisCount);
}

Future<List<Uint8List>> splitImage(SPlitData data) {
  final image = data.image;
  final crossAxisCount = data.crossAxisCount;
  final int length = (image.width / crossAxisCount).round();
  List<Uint8List> pieceList = [];

  for (int y = 0; y < crossAxisCount; y++) {
    for (int x = 0; x < crossAxisCount; x++) {
      pieceList.add(
        Uint8List.fromList(
          encodePng(
            copyCrop(
              image,
              x * length,
              y * length,
              length,
              length,
            ),
          ),
        ),
      );
    }
  }
  return Future.value(pieceList);
}

class ImagesRepositoryImpl implements ImagesRepository {
  Map<String, Image> cache = {};

  @override
  Future<List<Uint8List>> split(String asset, int crossAxisCount) async {
    late Image image;
    if (cache.containsKey(asset)) {
      image = cache[asset]!;
    } else {
      final bytes = await rootBundle.load(asset);

      /// use compute because theimage package is a pure dart package
      /// so to avoid bad ui performance we do this task in a different
      /// isolate
      image = await compute(decodeAsset, bytes);

      final width = math.min(image.width, image.height);

      /// convert to square
      image = copyResizeCropSquare(image, width);
      cache[asset] = image;
    }

    final pieces = await compute(
      splitImage,
      SPlitData(image, crossAxisCount),
    );



    return pieces;
  }
}
