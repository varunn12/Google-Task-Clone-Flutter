import 'package:flutter/material.dart';

void main()=>runApp(new MaterialApp(
  debugShowCheckedModeBanner: false,
  home: new MyApp(),
));

class MyApp extends StatefulWidget {
 
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin{
   Animation animation;
  AnimationController animationController;
  var groups=['My Order', 'Date'];
  bool showDrawer=false;
  final _scaffoldKey=new GlobalKey<ScaffoldState>();
  

void _textModalSheet(){
  showModalBottomSheet(
    context: context,
    builder: (context)=>new Container(
      height: 150.0,
      decoration: new BoxDecoration(
        color: Colors.white,
        borderRadius: new BorderRadius.only(
          topRight: new Radius.circular(10.0),
          topLeft: new Radius.circular(10.0)
        )
      ),
      child: new Column(
        children: <Widget>[
          new TextFormField(
            maxLines: 3,
            autofocus: true,
          decoration: new InputDecoration(
            filled: true,
            fillColor: Colors.white,
            border:  InputBorder.none
          ),
          ), new Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              new IconButton(
                icon: new Icon(Icons.add_circle),
                onPressed: null,
              ), 
              new FlatButton(
                child: new Text("Save"),
                onPressed: null,
              )
            ],
          )
        ],
      ),
    )
  );
}  

void _showPrimaryModalSheet(){
showModalBottomSheet(
  context: context,
  builder: (context)=>new SingleChildScrollView(
      child: new Container(
      height: 300.0,
      decoration: new BoxDecoration(
        color: Colors.white,
        borderRadius: new BorderRadius.only(
          topLeft: new Radius.circular(10.0),
          topRight: new Radius.circular(10.0)
        )
      ),
      child: new Column(
        children: <Widget>[
           new ListView.builder(
             padding: new EdgeInsets.symmetric(
               horizontal: 10.0,
             ),
             shrinkWrap: true,
             itemCount: 2,
             itemBuilder: (context, index)=>new CheckboxListTile(
               value: false,
               title: new Text(groups[index]),
               onChanged: null,
             ),
             
    ),]
      ),
    ),
  ));
}

void _showModalSheet(){
 showModalBottomSheet(
 context: context,
  builder: (context)=> new Container(
    
    decoration: new BoxDecoration(
      
      borderRadius: new BorderRadius.only(
        topLeft: new Radius.circular(10.0),
        topRight: new Radius.circular(10.0),
      ),
      color: Colors.white,
    ),
    height: 300.0,
    child: new SingleChildScrollView(
          child: new Column(
        children: <Widget>[
          new ListTile(
            title: const Text('Varun Pandey'),
            subtitle: const Text('varunn.pandey@gmail.com'),
            leading: new CircleAvatar(
              child: Icon(Icons.verified_user),
            )),
            new Divider(
              height: 1.0,
              color: Colors.grey[200],
            ),
            new ListTile(
            title: const Text('My Tasks'),
            ),
            new ListTile(
            title: const Text('Default List'),
            ),
            new Divider(
              color: Colors.grey[400],
              height: 1.0,
            ),
            new ListTile(
              leading: Icon(
                Icons.add),
            title: const Text('Create New List'),
            ),
            new Divider(
              color: Colors.grey[400],
              height: 1.0,
            ),
            new ListTile(
            leading: Icon(Icons.feedback),
            title: const Text('Send Feedback'),
            ),
          
        ],
      ),
    )
  )
 );
}

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController=new AnimationController(
      vsync: this, duration: new Duration(milliseconds: 1500));
    animation=new CurvedAnimation(parent: animationController, curve: Curves.easeIn);
    animation.addListener((){
this.setState((){

});
    });
    animationController.forward();
  }

@override
  void dispose() {
    // TODO: implement dispose
    animationController.dispose();
    super.dispose();
  }

        @override
        Widget build(BuildContext context) {
        return new Scaffold(
          backgroundColor: Colors.white,
          key: _scaffoldKey,
          body: new CustomScrollView(
                      slivers:<Widget>[ new SliverAppBar(
  expandedHeight: 150.0,
  elevation: 0.0,
  pinned: false,
  floating: true,
  backgroundColor: Colors.white,
    flexibleSpace: new FlexibleSpaceBar(
    title: new Text("Bookmarq",
    style: new TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),),
  ),

  actions: <Widget>[
    new IconButton(
      icon: const Icon(Icons.add_circle),
      tooltip: 'Add new entry',
      onPressed: () { /* ... */ },
    ),
  ]
),
new SliverFillRemaining(child:
  new Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[new Text("There is no item here yet"),
    ])),
                       ] ),
         
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: new FloatingActionButton.extended(
          label: new Text('Add a Link'),
          elevation: 6.0,
          icon: new Icon(Icons.add),
          onPressed: (){
            _textModalSheet();
          },
        ),
         bottomNavigationBar: BottomAppBar(
           hasNotch: false,
            child: new Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(icon: Icon(Icons.menu), onPressed: () {
                 _showPrimaryModalSheet();
                },),
                IconButton(icon: Icon(Icons.search), onPressed: _showModalSheet,),
              ],
            ),
          ),
        
      
        );
        }
      
      
}