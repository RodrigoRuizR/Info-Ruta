import 'package:flutter/material.dart';
import 'package:integrador/app/UI/Pages/colors/colors.dart';

class transportista extends StatelessWidget {
  const transportista({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children:<Widget> [
            Expanded(
            //flex: 1,
            child: Container(
              color: const Color.fromRGBO(56, 43, 97, 1),
              height: size.height,
              width: size.width,
              
              child: const Text(
                'Agregar Ruta',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15,color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
            
          ),
          Expanded(
            //flex: 2,
            child: Container(
              color: ColorSelect.tema,
              height: size.height,
              width: size.width,
              
              child: const Text(
                'Agregar transportista',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15,color: Colors.white, fontWeight: FontWeight.bold),
              ),              ),
              
            )
          
        ],
      ),
    );
  }
}