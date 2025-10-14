import 'package:isar/isar.dart';

part 'wallpaper.g.dart';

@collection
class Wallpaper {
  Id id = Isar.autoIncrement;
  @Index(type: IndexType.value)
  String? prompt;
  @Index(type: IndexType.value)
  String? template;

  List<byte>? imageData;
  @enumerated
  WallpaperType type = WallpaperType.local;
}

enum WallpaperType {
  local,
  generated,
}
