import 'package:flutter/material.dart';

class LoadImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 方法一:
    const ImgOne = Image(
      image: AssetImage('assets/image/avatar.png'),
      width: 100,
      color: Colors.blue,
      colorBlendMode: BlendMode.difference,
    );


    return Scaffold(
      appBar: AppBar(
        title: Text('loadImage'),
      ),
      body: Center(
        child: Column(
            children:[
            // Image.asset('images/avatar.png',width: 100,)
            //   ImgOne
              ImgOne
            ],
        )
      ),
    );
  }
}
