import 'package:flutter/material.dart';
import 'package:player/theme/const.dart';
import 'package:player/widgets/customButton.dart';
import 'package:player/widgets/custom_Progress_widget.dart';

class DetailPage extends StatefulWidget {
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage>
    with SingleTickerProviderStateMixin {
  var _value;
  AnimationController _controller;
  var isPlay;


  @override
  void initState() {
    _value = 0.0;
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 250));
    isPlay = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      body: Column(
        children: <Widget>[
          SizedBox(height: 25),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                CustomButtonWidget(
                  size: 50,
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Icon(
                    Icons.arrow_back,
                    color: AppColors.styleColor,
                  ),
                ),
                Text(
                  " PLAYING NOW",
                  style: TextStyle(
                      color: AppColors.styleColor, fontWeight: FontWeight.bold),
                ),
                CustomButtonWidget(
                  size: 50,
                  onTap: () {},
                  child: Icon(
                    Icons.menu,
                    color: AppColors.styleColor,
                  ),
                ),
              ],
            ),
          ),
          CustomButtonWidget(
            image: "assets/splash.jpg",
            size: MediaQuery.of(context).size.width * .7,
            borderWidth: 5,
            onTap: () {},
          ),
          Text(
            "Flume",
            style: TextStyle(
              color: AppColors.styleColor,
              fontSize: 32,
              fontWeight: FontWeight.bold,
              height: 2,
            ),
          ),
          Text(
            "Flume - DADY",
            style: TextStyle(
              color: AppColors.styleColor.withAlpha(90),
              fontSize: 15,
            ),
          ),
          Expanded(child: SizedBox()),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: CustomProgress(
              value: _value,
              labelStart: "0",
              labelEnd: "4:15",
            ),
          ),
          Expanded(child: SizedBox()),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 42),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                CustomButtonWidget(
                  size: 70,
                  onTap: () {
                    setState(() {
                      if (_value > .1) {
                        _value -= .1;
                      }
                    });
                  },
                  child: Icon(
                    Icons.fast_rewind,
                    color: AppColors.styleColor,
                  ),
                  borderWidth: 5,
                ),
                CustomButtonWidget(
                  size: 70,
                  onTap: () {
                    if (_controller.value == 0.0) {
                      _controller.forward();
                      setState(() {
                        isPlay = true;
                       
                      });
                    } else {
                      _controller.reverse();
                      setState(() {
                        isPlay = true;
                      });
                    }
                  },
                  child: AnimatedIcon(
                    icon: AnimatedIcons.pause_play,
                    progress: _controller,
                    color: isPlay ? Colors.white : AppColors.styleColor,
                  ),
                  borderWidth: 5,
                  isActive: true,
                ),
                CustomButtonWidget(
                  size: 70,
                  onTap: () {
                    setState(() {
                      if (_value < .9) {
                        _value += .1;
                      }
                    });
                  },
                  child: Icon(
                    Icons.fast_forward,
                    color: AppColors.styleColor,
                  ),
                  borderWidth: 5,
                ),
              ],
            ),
          ),
          SizedBox(height: 25),
        ],
      ),
    );
  }
}
