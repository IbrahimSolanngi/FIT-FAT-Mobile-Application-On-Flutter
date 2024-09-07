import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 800,
      child: Column(
        children: [
          _buildDaysBar(),
          _buildDashboardCards(),
        ],
      ),
    );
  }

  Expanded _buildDashboardCards() {
    return Expanded(
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
        ),
        child: Column(
          children: [
            // HeadingWidget(
            //   text1: 'ACTIVITY',
            //   text2: 'Show All',
            // ),
          ],
        ),
      ),
    );
  }

  Container _buildDaysBar() {
    return Container(
      margin: EdgeInsets.only(
        top: 200,
        bottom: 30,
      ),
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            'Today',
            //style: CustomTextStyle.dayTabBarStyleActive,
          ),
          Text(
            'Week',
            //style: CustomTextStyle.dayTabBarStyleInactive,
          ),
          Text(
            'Month',
            //style: CustomTextStyle.dayTabBarStyleInactive,
          ),
          Text(
            'Year',
            //style: CustomTextStyle.dayTabBarStyleInactive,
          ),
        ],
      ),
    );
  }

  Container _buildActivityCard() {
    return Container(
      height: 50,
      width: 90,
      margin: EdgeInsets.symmetric(vertical: 100),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0), color: Colors.deepPurple),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Container(
              height: 30,
              width: 23,
              decoration: BoxDecoration(
                  // color: color1,
                  // borderRadius: BorderRadius.only(
                  //   bottomLeft: Radius.circular(130),
                  //   topRight: Radius.circular(20),
                  // ),
                  ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.only(bottom: 20),
              child: CircleAvatar(
                // backgroundColor: color2,
                radius: 20,
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              height: 20,
              width: 40,
              decoration: BoxDecoration(
                  // color: color3,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(5),
                      bottomRight: Radius.circular(56))),
            ),
          ),
          Positioned(
            bottom: 5,
            right: 10,
            child: CircleAvatar(
                //backgroundColor: color4,
                //radius: SizeConfig.blockSizeHorizontal * 6,
                ),
          ),
          Positioned(
            //top: SizeConfig.blockSizeVertical * 10,
            //left: SizeConfig.blockSizeHorizontal * 16,
            child: CircleAvatar(
                //backgroundColor: color4,
                //radius: SizeConfig.blockSizeHorizontal * 2,
                ),
          ),
          Positioned(
            // top: SizeConfig.blockSizeVertical * 3,
            // left: SizeConfig.blockSizeHorizontal * 6,
            child: Container(
              child: Row(
                children: [
                  // SvgPicture.asset(
                  //   iconPath,
                  //   height: 20,
                  // ),
                  SizedBox(
                    width: 12,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Text(
                      //   activityType,
                      //   style: TextStyle(color: Color(0xffc4bbcc)),
                      // ),
                      // Text(
                      //   metric1,
                      //   //style: CustomTextStyle.metricTextStyle,
                      // ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 5,
            left: 6,
            child: Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Text(
                  //metric2,
                  //style: CustomTextStyle.metricTextStyle,
                  // ),
                  Text(
                    ' m',
                    //style: TextStyle(color: CustomColors.kLightColor),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              height: 12,
              width: 75,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: LinearProgressIndicator(
                  //value: value,
                  valueColor: AlwaysStoppedAnimation(Colors.white),
                  backgroundColor: Color(0xffc4bbcc).withOpacity(0.2),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
