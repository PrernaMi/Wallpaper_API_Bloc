import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "My App",
      home: DashBoardPage(),
    );
  }
}

class DashBoardPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    List<Image> listImages1 = [
      Image.asset("assets/images/part1/img.png"),
      Image.asset("assets/images/part1/img_9.png"),
      Image.asset("assets/images/part1/img_2.png"),
      Image.asset("assets/images/part1/img_3.png"),
      Image.asset("assets/images/part1/img_4.png"),
      Image.asset("assets/images/part1/img_5.png"),
      Image.asset("assets/images/part1/img_6.png"),
      Image.asset("assets/images/part1/img_7.png"),
      Image.asset("assets/images/part1/img_8.png"),
    ];
    List<Image> listImage2 = [
      Image.asset("assets/images/img.png",fit: BoxFit.cover,),
      Image.asset("assets/images/img_1.png",fit: BoxFit.cover,),
      Image.asset("assets/images/img_2.png",fit: BoxFit.cover,),
      Image.asset("assets/images/img_3.png",fit: BoxFit.cover,),
      Image.asset("assets/images/img_4.png",fit: BoxFit.cover,),
      Image.asset("assets/images/img_5.png",fit: BoxFit.cover,),
      Image.asset("assets/images/img_7.png",fit: BoxFit.cover,),
      Image.asset("assets/images/img_8.png",fit: BoxFit.cover,),
    ];
    List<Color> mColor = [
      Colors.yellowAccent,
      Colors.greenAccent,
      Colors.purpleAccent,
      Colors.yellow,
      Colors.cyanAccent,
      Colors.brown,
      Colors.blueAccent,
      Colors.pinkAccent.shade400,
      Colors.yellowAccent,
      Colors.greenAccent,
      Colors.purpleAccent,
      Colors.yellow,
      Colors.cyanAccent,
      Colors.brown,
      Colors.blueAccent,
      Colors.pinkAccent.shade400,
    ];
    List<String> text = [
      "SunView",
      "Forest",
      "Cloudy",
      "Mountain",
      "Hill",
      "Forest",
      "Village",
      "Nature",
    ];
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 215,236,237),
       body: Padding(
         padding: EdgeInsets.symmetric(horizontal: 20,vertical: 50),
         child: SingleChildScrollView(
           scrollDirection: Axis.vertical,
           child: Column(
             children: [
               SizedBox(
                 height: 50,
                 child: TextField(
                   decoration: InputDecoration(
                     border: OutlineInputBorder(
                       borderRadius: BorderRadius.circular(12),
                       borderSide: BorderSide.none,
                     ),
                     hintText: "Find Wallpapers...",
                     hintStyle: TextStyle(color: Colors.black12),
                     filled: true,
                     fillColor: Colors.white60,
                     suffixIcon: Icon(Icons.search_outlined),
                     suffixIconColor: Colors.black12,
                   ),
                 ),
               ),
               Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   SizedBox(height: 20,),
                   Text("Best of the Month",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                   SizedBox(height: 10,),
                   SizedBox(
                     height: 180,
                     child: ListView.builder(
                       itemCount: listImages1.length,
                       scrollDirection: Axis.horizontal,
                       itemBuilder : (Context,index){
                         return Row(
                           children: [
                           Container(
                           width: 100,
                           child: ClipRRect(
                             child: listImages1[index],
                             borderRadius: BorderRadius.circular(12),
                           ),
                         ),
                             SizedBox(width: 10,),
                           ],
                         );
                       },
                     ),
                   ),
                   SizedBox(height: 20,),
                   Text("The color tone",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                   SizedBox(height: 10,),
                   SizedBox(
                     height: 50,
                     child: ListView.builder(
                       scrollDirection: Axis.horizontal,
                       itemCount: mColor.length,
                       itemBuilder: (_,Index) {
                         return Row(
                           children: [
                             Container(
                               width: 50,
                               decoration: BoxDecoration(
                                 color: mColor[Index],
                                 borderRadius: BorderRadius.circular(6),
                               ),
                             ),
                             SizedBox(width: 10,),
                           ],
                         );
                       },
                     ),
                   ),
                   SizedBox(height: 20,),
                   Text("Categories",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                   SizedBox(height: 10,),
                   Stack(
                     children: [
                       Container(
                         width: double.infinity,
                         child: GridView.builder(
                             itemCount: listImage2.length,
                             physics: NeverScrollableScrollPhysics(),
                             shrinkWrap: true,
                             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                               crossAxisCount: 2,
                               childAspectRatio: 5/3,
                             ),
                             itemBuilder: (_,Index){
                               return Padding(
                                 padding: EdgeInsets.fromLTRB(0, 12, 12, 12),
                                 child: ClipRRect(
                                   borderRadius: BorderRadius.circular(12),
                                   child: listImage2[Index],
                                 ),
                               );
                             }
                         ),
                       ),
                       Container(
                         width: double.infinity,
                         child: GridView.builder(
                             itemCount: text.length,
                             physics: NeverScrollableScrollPhysics(),
                             shrinkWrap: true,
                             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                               crossAxisCount: 2,
                               childAspectRatio: 5/3,
                             ),
                             itemBuilder: (_,Index){
                               return Padding(
                                 padding: EdgeInsets.fromLTRB(0, 12, 12, 12),
                                 child: ClipRRect(
                                   borderRadius: BorderRadius.circular(12),
                                   child: Center(child: Text("${text[Index]}",style: TextStyle(fontWeight: FontWeight.bold),)),
                                 ),
                               );
                             }
                         ),
                       ),
                     ],
                   ),
                 ],
               ),
             ],
           ),
         ),
       ),
    );
  }
}