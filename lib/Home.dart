import 'package:api_purchasing_app/Provider/Main_Provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  Home({super.key});
  // List<String>imageIcon=[
  //   "assets/order_assigned.png",
  //   "assets/order_cancelled.png",
  //   "assets/order_delivered.png",
  //   "assets/out-of-stock 1.png",
  //   "assets/promotion_marketplace.png",
  //   "assets/promotion_notify.png",
  //   "assets/support_personnel.png",
  // ];

  @override
  Widget build(BuildContext context) {
    MainProvider provider=Provider.of(context,listen: false);
    provider.getApiListView();
    return Scaffold(
      backgroundColor:Colors.white,
      appBar: AppBar(leading: Padding(
        padding:  EdgeInsets.only(left: 10),
        child: CircleAvatar(
          backgroundColor: Colors.green,
        radius:5,
            child:Icon(Icons.arrow_back,color:Colors.white,)),
      ),
      title: Text("Notifications",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
    bottom: PreferredSize(
    preferredSize:  Size.fromHeight(4.0),
    child: Container(
    color: Colors.black12,
    height: 4.0,
    ),
      ),
      ),
      body:
          Consumer<MainProvider>(
            builder: (context,value,child) {
              return ListView.builder(
                itemCount: value.Datumlist.length,
              itemBuilder: (BuildContext context, int index) {
                  var items=value.Datumlist[index];
                return Column(
                  children: [
                    Container(
                      child: ListTile(
                        leading: Image.asset("assets/${items.image}"),
                          title: Text(items.title,style: TextStyle(
                              fontSize: 15,fontWeight: FontWeight.bold,color: Colors.black),),
                        subtitle: Text(items.body,
                          style: TextStyle(fontWeight: FontWeight.normal,fontSize: 12),),
                        ),
                    ),
                    Text(provider.formatTimestamp(items.timestamp)),
                    Divider(height: 7,
                      color: Colors.black12 ,)
                  ],
                );

              });
            }
          ),








    );
  }
}
