import 'package:sensemind_counselor/screen/selfup/play_list.dart';

class AlbumInfo {
  final String fileName;
  final String imagePath;
  final List<Chapter> playList;

  const AlbumInfo({
    this.fileName,
    this.imagePath,
    this.playList,
  });
}

final List<AlbumInfo> album = [
  AlbumInfo(
    fileName: "MBCT",
    imagePath: "MBCT.jpg",
    playList: mbct,
  ),
  AlbumInfo(
    fileName: "自然音乐",
    imagePath: "natural.jpg",
    playList: natural,
  ),
  AlbumInfo(
    fileName: "展示悲伤",
    imagePath: "natural.jpg",
    playList: test1,
  ),
  AlbumInfo(
    fileName: "测试表单",
    imagePath: "MBCT.jpg",
    playList: test2,
  ),
  AlbumInfo(
    fileName: "MBCT",
    imagePath: "MBCT.jpg",
    playList: mbct,
  ),
  AlbumInfo(
    fileName: "自然音乐",
    imagePath: "natural.jpg",
    playList: natural,
  ),
  AlbumInfo(
    fileName: "展示悲伤",
    imagePath: "natural.jpg",
    playList: test1,
  ),
  AlbumInfo(
    fileName: "测试表单",
    imagePath: "MBCT.jpg",
    playList: test2,
  ),
];
