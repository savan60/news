import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:news/dummydata.dart';

class VideoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      var maxh = constraints.maxHeight;
      var maxw = constraints.maxWidth;
      return Scaffold(
        body: Column(
          children: [
            Expanded(
              flex: 4,
              child: Column(
                children: [
                  Expanded(
                    flex: 3,
                    child: Container(
                      padding: EdgeInsets.only(left:6,bottom: 8),
                      width: maxw,
                                    color: Colors.teal[900],
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child:  Icon(Icons.menu,color: Colors.white,),
                        
                      )
                      // Image.asset('assets/images/Hamburger.png',height: 2,width: 2,),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      margin: EdgeInsets.only(bottom: 6),
                      padding: EdgeInsets.only(top: 4),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey[350],
                              offset: Offset(0.0046 * constraints.maxHeight,
                                  0.0046 * constraints.maxHeight),
                              blurRadius: 0.0046 * constraints.maxHeight)
                        ],
                      ),
                      child: Center(
                        child: Text(
                          "Videos",
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 10,
              child: Column(
                children: [
                  Expanded(
                    flex: 9,
                    child: Container(
                      width: maxw,
                      color: Colors.white,
                      child: Image.asset(
                        'assets/images/video.png',
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 8,
                    child: Container(
                      padding: EdgeInsets.only(top: 14, left: 8, right: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Flexible(
                            child: Text(
                              "This is the heading of the related new ws this is another",
                              maxLines: 1,
                              style: TextStyle(
                                  fontSize: 13, fontWeight: FontWeight.w600),
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Flexible(
                            child: Text(
                              "Date & Time here",
                              maxLines: 1,
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.w300),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Flexible(
                            flex: 2,
                            child: Text(
                              "This is the heading of the related new ws this is another Heading of the",
                              style: TextStyle(
                                  fontSize: 13, fontWeight: FontWeight.w300),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Expanded(
                            flex: 2,
                            child: Container(
                              // padding: EdgeInsets.only(top: 10),
                              width: maxw,
                              height: 40,
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius:
                                    BorderRadius.circular(4 * maxh / 647),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey[350],
                                    offset: Offset(
                                      0.005 * constraints.maxHeight,
                                      0.0046 * constraints.maxHeight,
                                    ),
                                    blurRadius: 0.0046 * constraints.maxHeight,
                                  ),
                                ],
                              ),
                              child: Center(
                                child: Text(
                                  "Information",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                          )
                          // Text()
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 8,
              child: Container(
                margin: EdgeInsets.only(left: 8, right: 8),
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return Container(
                      height: maxh * 0.09,
                      margin: EdgeInsets.only(bottom: 24),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 4,
                            child: Container(height: maxh*0.116,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(3),
                              ),
                              // padding: EdgeInsets.only(top:2,bottom: 2,right: 2),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(3),
                                child: Image.asset(
                                  DUMMY_NEWS[index].url,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 8,
                            child: Container(
                              padding: EdgeInsets.only(
                                  left: 10,top:1),
                              child: Column(
                                children: [
                                  Expanded(
                                    flex: 3,
                                    child: Text(
                                      DUMMY_NEWS[index].title,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                  Expanded(
                                      flex: 2,
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Icon(
                                                  Icons.calendar_today,
                                                ),
                                                SizedBox(width: 4),
                                                Text(
                                                  DUMMY_NEWS[index].date,
                                                  style: TextStyle(fontWeight: FontWeight.w300,fontSize: 12),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Flexible(
                                            child: Container(
                                              width: 80,
                                              height: 16,
                                              decoration: BoxDecoration(
                                                color: Colors.deepOrange,
                                                borderRadius:
                                                    BorderRadius.circular(1),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  "Info",
                                                  style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500),
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ))
                                ],
                              ),
                            ),
                          )
                          // Text(DUMMY_NEWS[index].title)
                        ],
                      ),
                    );
                  },
                  itemCount: DUMMY_NEWS.length,
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
