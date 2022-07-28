import 'package:flutter/material.dart';


class buscar extends StatefulWidget {
  buscar({Key? key}) : super(key: key);

  @override
  State<buscar> createState() => _buscarState();
}

class _buscarState extends State<buscar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 30),
            width: double.infinity,
            height: 100,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
                width: 2

              )
            ),
            // color: Colors.amber,
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    child: Icon(Icons.arrow_back,size: 40,),
                    // color: Colors.amber,
                
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    child:TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Buscar',
                      ),
                    ),
                    // color: Colors.red,
                    
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    // color: Colors.green,
                    child: Icon(Icons.search,size: 40,),
                
                  ),
                ),

              ],
            ),
          ),

          Container(
            child: Row(
              children: [
                
              ],
            ),
          )
        ],
      ),
    );
  }
}