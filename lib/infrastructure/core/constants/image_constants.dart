/// ImagesConstant: Enum for images.
enum ImagesConstant {
  logo,
  webRTC,
}

const imageBase= 'assets/images/';
const iconBase = 'assets/icons/';

extension ImagesConstantExtension on ImagesConstant {
  String get imagePath {
    switch (this) {
      case ImagesConstant.logo:
        return '${iconBase}webRTC_logo.png';

      case ImagesConstant.webRTC:
        return '${imageBase}webRTC.png';

    }
  }
}