class ImageConstants {
  static ImageConstants? _instance;
  static ImageConstants get instance {
    _instance ??= ImageConstants._init();
    return _instance!;
  }

  ImageConstants._init();

  String get logo => toPng('logo');
  String get flagRu => toPng('flag_ru');
  String get flagEn => toPng('flag_en');
  String get theme => toPng('dusk');

  String toPng(String name) => 'assets/image/$name.png';
}