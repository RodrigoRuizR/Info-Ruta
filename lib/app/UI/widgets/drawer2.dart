import 'package:flutter/material.dart';
import 'package:integrador/app/UI/Pages/colors/colors.dart';

class DrawerWidget extends StatelessWidget {
  final Map<String, dynamic> data;
  const DrawerWidget(this.data, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: ColorSelect.tema,
      child: ListView(
        children: <Widget>[
          Container(
            color: ColorSelect.tema,
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).padding.top, bottom: 24),
            child: Column(
              children: [
                const Image(
                  image: AssetImage('assets/img/icon_ufood_white.png'),
                  height: 150,
                ),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  data['user']['name'] + '  ' + data['user']['lastname'],
                  style: const TextStyle(fontSize: 15, color: Colors.white),
                ),
                Text(
                  data['user']['email'],
                  style: const TextStyle(fontSize: 13, color: Colors.white),
                ),
                Container(
                  padding: EdgeInsets.only(left: 40),
                  child: ListTile(
                    leading: const Icon(
                      Icons.credit_card,
                      color: Colors.white,
                    ),
                    title: Text(
                      'Creditos: \$ ' + data['user']['credits'].toString(),
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
              Navigator.pushReplacementNamed(context, 'homeRestaurant',
                  arguments: {
                    'user': data['user'],
                    'order': data['order'],
                  });
            },
          ),
          ListTile(
            leading: const Icon(Icons.shopping_cart_sharp),
            title: const Text('Carrito de compras'),
            onTap: () {
              Navigator.pushReplacementNamed(context, 'shopping', arguments: {
                'user': data['user'],
                'order': data['order'],
              });
            },
          ),
          ListTile(
            leading: const Icon(Icons.history),
            title: const Text('Historial de compras'),
            onTap: () {
              Navigator.pushReplacementNamed(context, 'shoppingHistory',
                  arguments: {
                    'user': data['user'],
                    'order': data['order'],
                  });
            },
          ),
          const ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('Cuenta'),
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Cerrar sesion'),
            onTap: () {
              Navigator.pushReplacementNamed(context, 'login');
            },
          ),
        ],
      ),
    );
  }
}