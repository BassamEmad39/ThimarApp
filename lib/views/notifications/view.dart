import 'package:flutter/material.dart';

import 'model.dart';

class NotificationsView extends StatefulWidget {
  const NotificationsView({super.key});

  @override
  State<NotificationsView> createState() => _NotificationsViewState();
}

class _NotificationsViewState extends State<NotificationsView> {

  List<NotificationModel> list =[
     NotificationModel( image: "https://img.freepik.com/free-vector/speech-bubble_53876-43870.jpg?w=740&t=st=1695723583~exp=1695724183~hmac=2a0b3484a1e9ebce27dc7019d66758e63817b2a7f092267e3f51af4dcec64ee0",
         title: "تم قبول طلبك وجاري تحضيره الآن",
         body: "هذا النص هو مثال لنص يمكن ان يستبدل في نفس المساحة،لقد تم توليد هذا النص من مولد النص العربي",
         time: "منذ ساعتان" ),
     NotificationModel( image: "https://img.freepik.com/free-vector/speech-bubble_53876-43870.jpg?w=740&t=st=1695723583~exp=1695724183~hmac=2a0b3484a1e9ebce27dc7019d66758e63817b2a7f092267e3f51af4dcec64ee0",
        title: "تم قبول طلبك وجاري تحضيره الآن",
        body: "Hello !",
        time: "منذ ساعة" )
  ];
  @override
  void initState() {

    super.initState();
    getData();
  }
  bool isLoading =true;
  getData()async{
    await Future.delayed(Duration(seconds: 3));
    isLoading=false;
    setState(() {});
    print(isLoading);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "الإشعارات",
          ),
        ),
      ),
       body: isLoading?Center(child: CircularProgressIndicator()):ListView.builder(
        padding: EdgeInsets.all(16),
        itemBuilder: (context, index) => _Item(model :list[index]),
        itemCount: list.length,



      ),


    );
  }
}





class _Item extends StatelessWidget {
  final NotificationModel model;
  const _Item({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          Container(
            height: 33,
            width: 33,
            padding: EdgeInsets.all(6),
            decoration: BoxDecoration(
                color: Theme.of(context).primaryColor.withOpacity(.13),
                borderRadius: BorderRadius.circular(9)
            ),
            child: Image.network(
              model.image,
              height: 20,
              width: 20,
              fit: BoxFit.scaleDown,
            ),
          ),
          SizedBox(width: 10,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(model.title,style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500),),
                Text(model.body,style: TextStyle(fontSize: 10,fontWeight: FontWeight.w300,color: Color(0xff989898)),),
                Text(model.time,style: TextStyle(fontSize: 10,fontWeight: FontWeight.w300),),
              ],
            ),
          )
        ],
      ),
    );
  }
}
