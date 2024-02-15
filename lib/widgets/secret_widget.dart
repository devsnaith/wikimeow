import 'package:flutter/material.dart';

class SecretWidget extends StatelessWidget {
  const SecretWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text("المكان السري", style: TextStyle(fontWeight: FontWeight.bold))),
          ),
          body: ListView(
            children: [
              Text(
                "Thank You!", 
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Directionality(textDirection: TextDirection.rtl,
              child: Padding(padding: EdgeInsets.all(32), child: Text("""
                هلا والله؛ انا devsnaith سويت هذا التطبيق ولله الحمد بس ما سويته لوحدي؛ لا.. ساعدني فيه اكثر من دكتور وعلمني طريقة بنائه خطوة بخطوة؛ المعسكر كان ارهب شي عشته في هذي اللحظة؛ كونه هو اول معسكر اخش فيه...شكرًا لكل دكتور اخذ من وقته بس عشان يعلمنا.. وشكرا لكل شخص حاول يساعد خويه في هذا المعسكر؛ ما ندمت ابدا بدخولي المعسكر هذا ودليل حبي لهذا المعسكر هو وجود هذا الودجت الي قاعد تقراه الان!
                
                سويت هذا الودجت عشان اخلد الذكرى؛ وبس! 
                """, style: TextStyle(fontWeight: FontWeight.bold)))
              ),
              FilledButton(onPressed: () {
                Navigator.of(context).pop();
              }, child: Text("اذا تبغى ترجع الصفحة الي ورا"))
            ],
          ),
      )
    );
  }
}