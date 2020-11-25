class MusicModel {
  final int id;
  final String title;
  final String album;
  final double duration;

  MusicModel({this.id, this.title, this.album, this.duration});

  static List<MusicModel> list = [
    MusicModel(
     id: 0,
     title:"Dady",
     album: "Rumba",
     duration: 03,
    ),
    
  ];
}