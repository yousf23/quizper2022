void main() {


  // questions.addAll([
  //   {...{
  //     'correct': {'aaaaaaaaa','ssssssss'.toString()},
  //   }}
  // ]);
  Map mylist = {};

  List<Map<dynamic,dynamic>> map = [];

  mylist.addAll({'dd': 'se'});
  mylist.addAll({'dd': 'sedddddd'});

  map.addAll([
    {
      ...{
        'correct': {mylist},
      }
    }
  ]);




  print(map );







}
