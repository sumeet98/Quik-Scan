import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class Tables extends StatefulWidget {
  Tables({Key key})
      : super(key: key);


  @override
  State<StatefulWidget> createState() => new _TablesState();
}

  class _TablesState extends State<Tables> {

   Widget chartContainer = Column(  
   mainAxisAlignment: MainAxisAlignment.center  
 );



  @override
  void initState() {
    super.initState();

  }


  signOut() async {
   Navigator.pushReplacementNamed(context, "/logout");
  }

  @override
  Widget build(BuildContext context) {
return Scaffold(
      appBar: AppBar(
        title: Text(
          "Tables",
          style: TextStyle(
            fontWeight: FontWeight.w800,
            color: Colors.white,
          ),
        ),
        actions: <Widget>[
            new FlatButton(
                child: new Text('Logout',
                    style: new TextStyle(fontSize: 17.0, color: Colors.white)),
                onPressed: signOut)
          ],
      ),
      backgroundColor: Colors.white,
     body: SingleChildScrollView(  
         child: Column(  
           children: <Widget>[  
             Container(  
               height: 250,  
               child:  SimpleBarChart.withSampleData()  
             ),  
             Padding(  
               padding: EdgeInsets.only(top: 10),  
               child: Text('Coupons redeemed using QR codes in millions'),  
             ),  
                 Padding( 
                   padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                 ),
              Padding(  
               padding: EdgeInsets.only(top: 10),  
               child: Text('QR codes generated per day in millions'),  
             ), 
              Container(  
               height: 250,  
               child: SimpleLineGraph.withSampleData(),  
             ),  
               ],  
             ),    
         ),  
       );    
  }
}

class SimpleBarChart extends StatelessWidget {  
 final List<charts.Series> seriesList;  
 final bool animate;  
   
 SimpleBarChart(this.seriesList, {this.animate});  
     
 factory SimpleBarChart.withSampleData() {  
   return new SimpleBarChart(  
     _createSampleData(),   
     animate: false,  
   );  
 }  
   
 @override  
 Widget build(BuildContext context) {  
   return new charts.BarChart(  
     seriesList,  
     animate: animate,  
      barRendererDecorator: new charts.BarLabelDecorator<String>(),
   );  
 }  
   
 
 static List<charts.Series<QrData, String>> _createSampleData() {  
   final data = [  
     new QrData('2016', 3.27),  
     new QrData('2017', 3.37),  
     new QrData('2018', 3.45),  
     new QrData('2019', 3.51), 
   ];  
   
   return [  
     new charts.Series<QrData, String>(  
       id: 'Qr',  
       colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,  
       domainFn: (QrData qr, _) => qr.year,  
       measureFn: (QrData qr, _) => qr.houses,  
       data: data,
      labelAccessorFn: (QrData qr, _) =>
      '${qr.houses}'  
     )  
   ];  
 }
}  

class SimpleLineGraph extends StatelessWidget {  
 final List<charts.Series> seriesList;  
 final bool animate;  
   
 SimpleLineGraph(this.seriesList, {this.animate});  
     
 factory SimpleLineGraph.withSampleData() {  
   return new SimpleLineGraph(  
     _createSampleData(),   
     animate: false,  
   );  
 }  
   
 @override  
 Widget build(BuildContext context) {  
   return new charts.LineChart(  
     seriesList,  
     animate: animate,  
      defaultRenderer: new charts.LineRendererConfig(includePoints: true),
   );  
 }  
   
 
 static List<charts.Series<QrDataLine, int>> _createSampleData() {  
   final data = [  
     new QrDataLine(5, 30),  
     new QrDataLine(85, 40),  
     new QrDataLine(160, 50),  
     new QrDataLine(240, 60), 
   ];  
   
   return [  
     new charts.Series<QrDataLine, int>(  
       id: 'Qr',  
       colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,  
       domainFn: (QrDataLine qr, _) => qr.year,  
       measureFn: (QrDataLine qr, _) => qr.codes,  
       data: data,  
     )  
   ];  
 }
} 

class QrData {  
 final String year;  
 final double houses;  
   
 QrData(this.year, this.houses);  
}

class QrDataLine {  
 final int year;  
 final double codes;  
   
 QrDataLine(this.year, this.codes);  
}

 