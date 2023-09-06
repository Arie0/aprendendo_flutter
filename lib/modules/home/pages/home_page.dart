import 'package:aprendendo_flutter/modules/cachorro/pages/cachorro_list_page.dart';
import 'package:aprendendo_flutter/utils/app_routes.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CachorroListPage(),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 66, 30, 151),
        title: const Text(
          'HomePage',
          style: TextStyle(color: Color.fromARGB(255, 241, 243, 118)),
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
        ],
      ),
    );
  }
}
