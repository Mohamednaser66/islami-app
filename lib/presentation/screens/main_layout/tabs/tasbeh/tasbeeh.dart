import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:islami_c14_offline_sun/core/assets_manager.dart';
import 'package:islami_c14_offline_sun/core/colors_manager.dart';

class Tasbeh extends StatefulWidget {
  const Tasbeh({super.key});

  @override
  State<Tasbeh> createState() => _TasbehState();
}

class _TasbehState extends State<Tasbeh> {
  double angel =0;
  int counter=0;
  List<String> azkar = ['سبحان الله','الحمد الله','الله اكبر'];
  int currentIndex=0;
  @override
  Widget build(BuildContext context) {
    var size =MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(AssetsManager.sebhaBg), fit: BoxFit.fill)),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(AssetsManager.islamiLogo,height: size.height*0.15,),
            Text(
              'سَبِّحِ اسْمَ رَبِّكَ الأعلى ',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge
            ),
            Stack(
              clipBehavior:Clip.none ,
              alignment: Alignment.topCenter,
              children: [
                Image.asset(AssetsManager.sebhaHead,height: size.height*0.1,),
                Positioned(
                  top: size.height*0.085,
                    child: Transform.rotate(angle: angel,
                        child: Image.asset(AssetsManager.sebhaBody,height: size.height*0.5,))),
                Positioned(
                  top: size.height*0.24,
                  child: InkWell(
                    onTap: (){onSebhaClicked();},
                    child: Column(
                      children: [
                        Text(azkar[currentIndex%azkar.length],style: Theme.of(context).textTheme.bodyLarge,),
                        Text('$counter',style: Theme.of(context).textTheme.bodyLarge,)
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  void onSebhaClicked() {
    angel-=15;
    counter++;
    if(counter==33){
      counter=0;
      currentIndex++;
    }
    setState(() {

    });
  }
}
