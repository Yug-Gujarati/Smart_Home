import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import '../util/smart_devices_box.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final double horizontalpadding = 40;
  final double verticalpadding = 25;
  List mySmartDevices = [
    ["Smart Light" , "lib/Icons/light-bulb.png" , true],
    ["Smart Ac" , "lib/Icons/air-conditioner.png" ,true],
    ["Smart TV" , "lib/Icons/smart-tv.png" , true],
    ["Smart Fan" , "lib/Icons/fan.png" , true],
  ];
  void powerSwitchChanged(bool value,int index){
    setState((){
      mySmartDevices[index][2] = value;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
              Padding(
                padding: EdgeInsets.symmetric(
                horizontal :horizontalpadding,
                vertical: verticalpadding,
              ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  'lib/icons/menu.png',
                  height: 45,
                  color: Colors.grey[800],
                ),
                Icon(
                  Icons.person,
                  size: 45,
                  color: Colors.grey[800],
                )
              ],
            ),
          ),
          SizedBox(height: 20,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: horizontalpadding),
            child:Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:[
              Text(
                "Welcome Home,",
                style: TextStyle(fontSize: 20, color: Colors.grey[700]),
              ),
              const Text(
                "Yug Gujarati",
                style: TextStyle(fontSize: 40),
              ),
            ],
          )
          ),
          const SizedBox(height: 25),
          Padding(padding: EdgeInsets.symmetric(horizontal: horizontalpadding),
          child: Divider(color: Colors.grey[400] , thickness: 1,),
          ),
          const SizedBox(height:25),
            Padding(
            padding: EdgeInsets.symmetric(horizontal: horizontalpadding),
            child: Text(
              "Smart Devices",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: Colors.grey[800],
              ),
            ),
            ),
            Expanded(
              child: GridView.builder(
                itemCount: mySmartDevices.length,
                padding: const EdgeInsets.all(25),
                gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1/1.3,
                ), 
                itemBuilder: ((context, index) {
                 return SmartDevicesBox(
                  smartDeviceName: mySmartDevices[index][0],
                  iconpath: mySmartDevices[index][1],
                  powerOn: mySmartDevices[index][2],
                  onChanged: (value) => powerSwitchChanged(value,index),
                 );
                }
              ),
            )
            )
          ],
        ),
      )
   );
  }
} 