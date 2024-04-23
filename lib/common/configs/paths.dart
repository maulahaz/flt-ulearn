//--Icons:
const String _iconBase = "lib/assets/icons";
const String pathSvgProfile = '$_iconBase/person.svg';
const String pathImgGoogle = '$_iconBase/google.png';
const String pathImgFacebook = '$_iconBase/facebook.png';
const String pathImgApple = '$_iconBase/apple.png';
const String pathImgUser = '$_iconBase/user.png';
const String pathImgLock = '$_iconBase/lock.png';
//--Images:
const String _imageBase = "lib/assets/images";
const String pathLogo = '$_imageBase/lg2.png';
const String pathReading = '$_imageBase/reading.png';
const String pathMan = '$_imageBase/man.png';
const String pathBoy = '$_imageBase/boy.png';
//
final String imageAssetsRoot = "images/";
final String logo2 = _getImagePath("lg2.png");
final String bg3 = _getImagePath("bg3.png");
final String android = _getImagePath("and.png");
final String android2 = _getImagePath("and2.png");
final String iphone = _getImagePath("iphone.png");
final String apple = _getImagePath("apple.png");
final String playIcon = _getImagePath("play.png");
final String routeIcon = _getImagePath("route.png");
final String locationIcon = _getImagePath("location.png");

String _getImagePath(String fileName) {
  return imageAssetsRoot + fileName;
}
