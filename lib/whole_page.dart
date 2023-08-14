import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopwebsitewithflutter/model/scroll_ofset.dart';
import 'package:shopwebsitewithflutter/screens/fifth_section.dart';
import 'package:shopwebsitewithflutter/screens/first_section.dart';
import 'package:shopwebsitewithflutter/screens/fourth_section.dart';
import 'package:shopwebsitewithflutter/screens/second_section.dart';
import 'package:shopwebsitewithflutter/screens/sixth_section.dart';
import 'package:shopwebsitewithflutter/screens/third_section.dart';
class WholePage extends StatefulWidget {
  const WholePage({super.key});

  @override
  State<WholePage> createState() => _WholePageState();
}

class _WholePageState extends State<WholePage> {
  late ScrollController controller;

  @override
  void initState() {
    controller=ScrollController();
    controller.addListener(() {
      final displayOffsetCubit = BlocProvider.of<DisplayOffset>(context);
      displayOffsetCubit.changeDisplayOffset(
        (MediaQuery.of(context).size.height + controller.position.pixels).toInt(),
      );
    });

    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: controller,
      child: Column(
        children: [


          FirstSection(),

          SizedBox(height: 20,),
          SecondSection(),
          SizedBox(height: 20,),

          ThirdSection(),
          SizedBox(height: 20,),

          FourthSection(),
          SizedBox(height: 20,),


          FifithSection(),
          SizedBox(height: 20,),
          SixthSection()














        ],


      ),


    );
  }
}
