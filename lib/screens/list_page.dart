import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:player/models/music_model.dart';
import 'package:player/screens/detail_page.dart';
import 'package:player/theme/const.dart';
import 'package:player/widgets/customButton.dart';

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  List<MusicModel> _list;
  int _playId;
  //MusicFinder audioPlayer;

  @override
  void initState() {
    _playId = 0;
   // audioPlayer = new MusicFinder();
    //var list =  MusicFinder.allSongs();
    _list = MusicModel.list;
    super.initState();

   /* setState(() {
      _list = list;
    });
  }
  
  */
 // Future _playLocal(String url) async {
  //  final result = await AudioPlayer.play(url, isLocal: true);
    
        
    }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.mainColor,
        centerTitle: true,
        title: Text(
          "Skin - Flume",
          style: TextStyle(color: AppColors.styleColor),
        ),
      ),
      backgroundColor: AppColors.mainColor,
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    CustomButtonWidget(
                      child: Icon(
                        Icons.favorite,
                        color: AppColors.styleColor,
                      ),
                      size: 50,
                      onTap: (){},
                    ),
                    CustomButtonWidget(
                      image: "assets/splash.jpg",
                      size: 150,
                      borderWidth: 5,
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (_) =>DetailPage(),),);
                      },
                    ),
                    CustomButtonWidget(
                      child: Icon(
                        Icons.more_horiz,
                        color: AppColors.styleColor,
                      ),
                      size: 50,
                      onTap: (){},
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: _list.length,
                    padding: EdgeInsets.all(12),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (_) =>DetailPage(),),);
                        },
                                              child: AnimatedContainer(
                          duration: Duration(milliseconds: 500),
                          decoration: BoxDecoration(
                            color: _list[index].id == _playId
                                ? AppColors.activeColor
                                : AppColors.mainColor,
                            borderRadius: BorderRadius.all(
                              Radius.circular(5),
                            ),
                          ),
                          padding: EdgeInsets.all(12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    _list[index].title,
                                    style: TextStyle(
                                      color: AppColors.styleColor,
                                      fontSize: 16,
                                    ),
                                  ),
                                  Text(
                                    _list[index].album,
                                    style: TextStyle(
                                      color: AppColors.styleColor.withAlpha(90),
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                              CustomButtonWidget(
                                child: Icon(
                                  _list[index].id == _playId
                                      ? Icons.pause
                                      : Icons.play_arrow,
                                  color: _list[index].id == _playId
                                      ? Colors.white
                                      : AppColors.styleColor,
                                ),
                                size: 50,
                                isActive: _list[index].id == _playId,
                                onTap: (){
                                  setState(() {
                                    
                                    _playId = _list[index].id;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 48,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppColors.mainColor.withAlpha(0),
                    AppColors.mainColor,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
