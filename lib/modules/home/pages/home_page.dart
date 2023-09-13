import 'package:aprendendo_flutter/modules/cachorro/pages/cachorro_list_page.dart';
import 'package:aprendendo_flutter/theme/my_colors.dart';
import 'package:aprendendo_flutter/utils/app_routes.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          //children: [
          //Card(
          //child: ExpansionTile(
          //title: Text('Home'),
          children: [
            UserAccountsDrawerHeader(
              accountName: Text('Chupetao'),
              accountEmail: Text('tuctuc.com'),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage("assets/images/pingu.jpg"),
              ),
            ),
            Card(
              elevation: 5,
              child: ListTile(
                title: Text('Cachorros'),
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text(
          'HomePage',
          style: TextStyle(color: Color.fromARGB(255, 38, 255, 244)),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 150,
            child: InkWell(
              onTap: () =>
                  Navigator.of(context).pushNamed(AppRoutes.CACHORRO_LIST_PAGE),
              child: const Card(
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.pets,
                        size: 50,
                      ),
                      Text('Listagem de Cachorros'),
                    ],
                  ),
                ),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text(
              "Botão",
              style: TextStyle(
                color: my_colors.textLight,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
