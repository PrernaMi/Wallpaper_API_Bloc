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
      home: WallpaperScreen(),
    );
  }
}

class WallpaperScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    List<Image> listImages = [
      Image.asset("assets/images/part1/img.png",fit: BoxFit.cover),
      Image.asset("assets/images/img_1.png",fit: BoxFit.cover,height: 200,width: 150,),
      Image.asset("assets/images/img_2.png",fit: BoxFit.cover,height: 200,width: 150,),
      Image.asset("assets/images/part1/img_9.png",fit: BoxFit.cover,height: 200,width: 150),
      Image.asset("assets/images/part1/img_2.png",fit: BoxFit.cover,height: 200,width: 150),
      Image.asset("assets/images/part1/img_3.png",fit: BoxFit.cover,height: 200,width: 150),
      Image.asset("assets/images/part1/img_4.png",fit: BoxFit.cover,height: 200,width: 150),
      Image.asset("assets/images/part1/img_5.png",fit: BoxFit.cover,height: 200,width: 150),
      Image.asset("assets/images/part1/img_6.png",fit: BoxFit.cover,height: 200,width: 150),
      Image.asset("assets/images/part1/img_7.png",fit: BoxFit.cover,height: 200,width: 150),
      Image.asset("assets/images/part1/img_8.png",fit: BoxFit.cover,height: 200,width: 150),
      Image.asset("assets/images/img.png",fit: BoxFit.cover,height: 200,width: 150,),
      Image.asset("assets/images/img_1.png",fit: BoxFit.cover,height: 200,width: 150,),
      Image.asset("assets/images/img_2.png",fit: BoxFit.cover,height: 200,width: 150,),
      Image.asset("assets/images/img_7.png",fit: BoxFit.cover,height: 200,width: 150,),
      Image.asset("assets/images/img_8.png",fit: BoxFit.cover,height: 200,width: 150,),
      Image.asset("assets/images/img_3.png",fit: BoxFit.cover,height: 200,width: 150,),
      Image.asset("assets/images/img_4.png",fit: BoxFit.cover,height: 200,width: 150,),
      Image.asset("assets/images/part1/img_2.png",fit: BoxFit.cover,height: 200,width: 150),
      Image.asset("assets/images/part1/img_3.png",fit: BoxFit.cover,height: 200,width: 150),
      Image.asset("assets/images/part1/img_4.png",fit: BoxFit.cover,height: 200,width: 150),
      Image.asset("assets/images/img_5.png",fit: BoxFit.cover,height: 200,width: 150,),
      Image.asset("assets/images/img_7.png",fit: BoxFit.cover,height: 200,width: 150,),
      Image.asset("assets/images/img_8.png",fit: BoxFit.cover,height: 200,width: 150,),
    ];
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 215,236,237),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5,horizontal: 15),
              child: Text("Nature",style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold),),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5,horizontal: 15),
              child: Text("36 Wallpaper available",style: TextStyle(color: Colors.grey,fontSize: 14),),
            ),
            GridView.builder(
              itemCount: listImages.length,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 9/15,
                ),
                itemBuilder: (_,Index){
                  return Padding(
                    padding:  EdgeInsets.all(15),
                    child: Container(
                      child: ClipRRect(
                          child: listImages[Index],
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  );
                }
            ),
          ],
        ),
      ),
    );
  }

}