import 'package:flutter/material.dart';

class MyOrdersView extends StatelessWidget {
  const MyOrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "طلباتي",
          ),
        ),
      ),
      body: ListView.builder(
          itemBuilder: (context, index) => _Item(),
          itemCount: 2,
          padding: EdgeInsets.all(16)),
    );
  }
}

class _Item extends StatelessWidget {
  const _Item({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: Colors.black.withOpacity(0.02),
            offset: Offset(0, 6),
            blurRadius: 17,
            blurStyle: BlurStyle.outer)
      ]),
      height: 100,
      child: Row(children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "طلب #4587",
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor),
              ),
              Text(
                "27,يونيو,2021",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    color: Color(0xff9c9c9c)),
              ),
              SizedBox(
                height: 13,
              ),
              Row(children: [
                ...List.generate(
                    3,
                    (index) => Container(
                          height: 25,
                          width: 25,
                          clipBehavior: Clip.antiAlias,
                          margin: EdgeInsetsDirectional.only(end: 3),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              border: Border.all(color: Colors.red),
                              color: Colors.yellow),
                          child: Image.network(
                            "https://w.forfun.com/fetch/25/25da1e601c2dd3ba7d3fafffb8244262.jpeg",
                            height: 25,
                            width: 25,
                            fit: BoxFit.fill,
                          ),
                        )),
                Container(
                    height: 25,
                    width: 25,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        color: Theme.of(context).primaryColor.withOpacity(.13)),
                    child: Center(
                      child: Text("+2",
                          style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).primaryColor)),
                    ))
              ]),
            ],
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
                padding: EdgeInsets.symmetric(horizontal: 11, vertical: 5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: Theme.of(context).primaryColor.withOpacity(.13)),
                child: Center(
                  child: Text("بإنتظار الموافقة",
                      style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor)),
                )),
            Text(
              "180ر.س",
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w900,
                  color: Theme.of(context).primaryColor),
            )
          ],
        )
      ]),
    );
  }
}
