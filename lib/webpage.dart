import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


// Widget bottunUp(String number) {
//   return Padding(
//     padding: const EdgeInsets.only(left: 10, right: 10, top: 2),
//     child: Container(
//       height: 50,
//       decoration: BoxDecoration(
//           color: Colors.brown.shade300,
//           borderRadius: BorderRadius.circular(30)),
//       child: Row(
//         mainAxisSize: MainAxisSize.max,
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: <Widget>[
//           Padding(
//             padding: const EdgeInsets.all(3),
//             child: Container(
//               decoration: BoxDecoration(
//                   color: Colors.brown.shade300,
//                   shape: BoxShape.circle,
//                   border: Border.all(
//                     color: Colors.white, //                   <--- border color
//                     width: 2,
//                   )),
//               height: 44,
//               width: 44,
//               child: Text(
//                 number,
//                 textAlign: TextAlign.center,
//                 style: TextStyle(color: Colors.white),
//               ),
//               alignment: Alignment.center,
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(right: 40),
//             child: Expanded(
//               child: Container(
//                   child: Text(
//                 'السلسلة رقم',
//                 style: TextStyle(fontSize: 20, color: Colors.white),
//               )),
//             ),
//           ),
//         ],
//       ),
//     ),
//   );
// }

Widget container22(Color cc) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      height: 50,
      width: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.white, //                   <--- border color
          width: 1,
        ),
        color: cc,
      ),
    ),
  );
}

Widget buttonUp2(Color cc) {
  return Container(
      width: 200,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: cc,
        // border: Border.all(color: Colors.white)),
      ));
}

Widget functionrrrr(String number) {
  return Padding(
    padding: const EdgeInsets.only(left: 10, right: 10, top: 2),
    child: Container(
      height: 50,
      decoration: BoxDecoration(
          color: Colors.brown, borderRadius: BorderRadius.circular(30)),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(3),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.brown,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.white, //                   <--- border color
                    width: 2,
                  )),
              height: 44,
              width: 44,
              child: Text(
                number,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
              ),
              alignment: Alignment.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 40),
            child: Expanded(
              child: Container(
                  child: Text(
                    '   السلسلة رقم',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  )),
            ),
          ),
        ],
      ),
    ),
  );
}

class WebPage extends StatefulWidget {
  @override
  State<WebPage> createState() => _MyAppState();
}

class _MyAppState extends State<WebPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          bottom:
          PreferredSize(child: Text(''), preferredSize: Size.square(70)),
          backgroundColor: Colors.brown,
        ),
        body: Row(
          children: [
            Expanded(
              flex: 6,
              child: Container(
                child: Center(
                  child: Container(
                    height: 500,
                    width: 800,
                    child: Stack(
                      children: [
                        Positioned(
                          bottom: 0,
                          child: Container(
                            padding: EdgeInsets.only(
                                left: 5, right: 5, top: 64, bottom: 64),
                            height: 500,
                            width: 800,
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.white),
                                  borderRadius: BorderRadius.circular(10)),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                  'https://www.capital.fr/imgre/fit/https.3A.2F.2Fi.2Epmdstatic.2Enet.2Fbin.2F2021.2F07.2F16.2Fa803400d-f4e0-402c-b43d-ef34e95c71a3.2Ejpeg/1120x747/quality/80/thumbnail.jpeg',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            decoration: BoxDecoration(
                              color: Colors.brown.shade500,
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(10),
                                topLeft: Radius.circular(10),
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: -2,
                          left: 50,
                          child: Row(
                            children: [
                              container22(Colors.red),
                              container22(Colors.brown.shade300),
                              container22(Colors.brown.shade300),
                              container22(Colors.brown.shade300),
                              container22(Colors.brown.shade300),
                              container22(Colors.green)
                            ],
                          ),
                        ),
                        Positioned(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                functionrrrr('11'),
                                buttonUp2(
                                  Colors.brown.shade300,
                                ),
                                functionrrrr('22')
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                color: Colors.brown.shade300,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 4),
              child: Container(
                child: ListView.builder(itemBuilder: (context, inx) {
                  return functionrrrr('$inx');
                }),
                width: 250,
                height: double.infinity,
                color: Colors.brown.shade300,
              ),
            ),
          ],
        ));
  }
}
