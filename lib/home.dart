import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:vegie/Data/model.dart';
import 'package:vegie/nav/bottomnavbar.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>  with TickerProviderStateMixin{
  bool isclicked=true;
  List data=[WorkModel('Lets go to toilet',DateTime.now()),WorkModel('Lets go to Eat',DateTime.now())];

  @override
  Widget build(BuildContext context) {
    var form = DateFormat.yMMMd('en-US');
    var dateString = form.format(DateTime.now());
    return Scaffold(
      floatingActionButton: FloatingActionButton(child: Icon(Icons.add),onPressed: (){},),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: bottomnavbar,

      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [SliverAppBar(
        centerTitle: true,
        title: Text('Work List'),
        expandedHeight: 150.0,
        pinned: false,
        snap: false,
        floating: false,
        actions: [IconButton(onPressed: (){}, icon: Icon(Icons.settings))],
        bottom: TabBar(
            labelPadding: EdgeInsets.all(0),
          tabs: [Text("Today"),Text("Month")],
          controller: TabController(length: 2, vsync: this),
          indicatorSize: TabBarIndicatorSize.label ,
        ),
      ),
          SliverToBoxAdapter(child:
            Row(children: [Text("TODAY"),SizedBox(width: 10,),Text(dateString)]),

          ),
        SliverList(delegate: SliverChildBuilderDelegate((context, index) {
      return Container(

        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),        color: Colors.blueAccent,
        ),
        margin: EdgeInsets.all(20),
        padding: EdgeInsets.all(20),
        child: Row(
          children: [Checkbox(value:isclicked ,  onChanged: (bool? value) {
            setState(() {
              isclicked = value!;
            });
          },),Column(children: [Text(data[index].work),Text(data[index].time.toString())],)],
        ),
      );
    },childCount: data.length))

      ],)
    );
  }
}
