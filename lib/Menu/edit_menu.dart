import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/models/fooditem.dart';

class EditMenu extends StatefulWidget {
  final FoodItem _foodItems;
  EditMenu(this._foodItems);
  @override
  _EditMenuState createState() => _EditMenuState();
}

class _EditMenuState extends State<EditMenu> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          backgroundColor: Colors.deepOrangeAccent,
          centerTitle: true,
          title: Text("Edit Menu"),
        ),
        body: 
        
          Column(children: <Widget>[
          SizedBox(height: 20),
          _buildImage(),
          _buildBody(),
        ])
    );
  }
  
  Widget _buildImage(){
    return Container(
              height: 150,
              width: 200,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  widget._foodItems.imageName,
                  fit: BoxFit.cover,
                ),
              ),
            );
  }

  Widget _buildBody() {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
        ),
        padding: EdgeInsets.all(28),
        child: Column(
          children: <Widget>[
            TextFormField(
              initialValue: widget._foodItems.foodName,
              style: TextStyle(fontSize:18),
              decoration: InputDecoration(
                labelStyle: TextStyle(fontSize:20,fontWeight:FontWeight.bold),
                labelText: "Food Name:",
                hintText: "Enter a food name",
              ),
              keyboardType: TextInputType.text,
              onChanged: (newValue)=>setState( ()=> widget._foodItems.foodName= newValue),
            ),
            SizedBox(height: 16),
              TextFormField(
                keyboardType: TextInputType.number,
                initialValue: "RM "+ widget._foodItems.unitPrice.toStringAsFixed(2),
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.redAccent,
                ),
                decoration: InputDecoration(
                  labelStyle: TextStyle(fontSize:20,fontWeight:FontWeight.bold),
                  labelText: "Price: ",
                  hintText: "Enter price ...",
                ),
                onChanged: (newValue)=>setState( ()=> widget._foodItems.unitPrice= newValue as double),
              ),
            SizedBox(width: 10),
            SizedBox(height: 5),

            TextFormField(
              initialValue: widget._foodItems.foodDescription,
              style:TextStyle(fontSize:18),
              maxLines: 4,
              decoration: InputDecoration(
                labelText: "Food Description: ",
                labelStyle: TextStyle(fontSize:20,fontWeight:FontWeight.bold),
                hintText: "Enter food description. . .",
                contentPadding: new EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 5.0
                ),
             ),
             keyboardType: TextInputType.text,
            onChanged: (newValue)=>setState( ()=> widget._foodItems.foodDescription= newValue),

              ),
            Expanded(child: SizedBox()),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FloatingActionButton.extended(
                  heroTag: null,
                  icon: Icon(Icons.check_circle),
                  label: Text("Save"),
                  onPressed: ()=> Navigator.pop(context, widget._foodItems) ,   
                  backgroundColor: Colors.deepOrangeAccent,               
                  ),
                  
                FloatingActionButton.extended(
                  heroTag: null,
                  icon: Icon(Icons.cancel),
                  label: Text("Cancel"),
                  onPressed: ()=> Navigator.pop(context, null),   
                  backgroundColor: Colors.deepOrangeAccent,      
                  ),
              ],
            )
          ],
        ),
      ),
    );
  }

}
