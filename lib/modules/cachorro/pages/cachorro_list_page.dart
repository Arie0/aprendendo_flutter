import 'package:aprendendo_flutter/modules/cachorro/models/cachorro_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CachorroListPage extends StatefulWidget {
  const CachorroListPage({super.key});

  @override
  State<CachorroListPage> createState() => _CachorroListPageState();
}

class _CachorroListPageState extends State<CachorroListPage> {
  final _formKey = GlobalKey<FormState>();
  final _nomeController = TextEditingController();
  final _descricaoController = TextEditingController();
  final _idadeController = TextEditingController();

  List<Cachorro> cachorros = [
    Cachorro(
      id: 1,
      nome: 'Pitu',
      descricao: 'Preto com manchas brancas',
      idade: 2,
    ),
    Cachorro(
      id: 2,
      nome: 'Corote',
      descricao: 'Branco',
      idade: 5,
    ),
    Cachorro(
      id: 3,
      nome: 'Jamel',
      descricao: 'Caramelo',
      idade: 6,
    ),
  ];

  List<Widget> _buildCachorros() {
    List<Widget> widgets = [];
    for (var element in cachorros) {
      widgets.add(ListTile(
        title: Text(element.nome ?? '-'),
        subtitle: Text(element.descricao ?? '-'),
      ));
    }

    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: const [
            UserAccountsDrawerHeader(
              accountName: Text("Caramelo "),
              accountEmail: Text("auau@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage("assets/images/dog.jpg"),
              ),
            ),

            // ElevatedButton(
            //   onPressed: () {},
            //   child: const Text(
            //     "Botão",
            //     style: TextStyle(
            //       color: MyColors.textLight,
            //     ),
            //   ),
            // ),
            Card(
              child: ListTile(
                title: Text('Home'),
              ),
            ),
            Card(
              child: ListTile(
                title: Text('Cachorros'),
              ),
            ),
            Card(
              child: ListTile(
                title: Text('Gatos'),
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Listagem de Cachorros",
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _nomeController.clear();
          _descricaoController.clear();
          _idadeController.clear();

          var alert = AlertDialog(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text("Novo pinguço")],
            ),
            content: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    controller: _nomeController,
                    autofocus: true,
                    decoration: InputDecoration(label: Text('Nome')),
                    keyboardType: TextInputType.text,
                    onFieldSubmitted: (_) => _save(),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Campo obrigatório';
                      } else if (value.length < 3) {
                        return 'Mínimo 3 caracteres';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _descricaoController,
                    autofocus: true,
                    decoration: InputDecoration(label: Text('Descrição')),
                    keyboardType: TextInputType.text,
                    onFieldSubmitted: (_) => _save(),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Campo obrigatório';
                      } else if (value.length < 3) {
                        return 'Mínimo 3 caracteres';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _idadeController,
                    autofocus: true,
                    decoration: InputDecoration(label: Text('Idade')),
                    keyboardType: TextInputType.number,
                    onFieldSubmitted: (_) => _save(),
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Campo obrigatório';
                      } else if (value.length < 2) {
                        return 'Mínimo 2 caracteres';
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),
          );

          showDialog(
            context: context,
            builder: (context) => alert,
          );
        },
      ),

      body: ListView.builder(
        itemCount: cachorros.length,
        itemBuilder: (ctx, index) {
          return ListTile(
            title: Text(cachorros[index].nome ?? '-'),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(cachorros[index].descricao ?? '-'),
                Text('${cachorros[index].idade} anos'),
              ],
            ),
          );
        },
      ),

      // body: ListView(
      //   children: _buildCachorros(),
      // ),

      // body: SingleChildScrollView(
      //   child: Column(
      //     children: _buildCachorros(),
      //     // children: [
      //     //   // for(int i=0; i<cachorros.length; i++)
      //     //   // ListTile(
      //     //   //   title: Text(cachorros[i].nome ?? '-'),
      //     //   //   subtitle: Text(cachorros[i].descricao ?? '-'),
      //     //   // ),

      //     // ],
      //   ),
      // ),
    );
  }

  void _save() {
    if (_formKey.currentState?.validate() ?? false) {
      var cachorro = Cachorro(
        nome: _nomeController.text,
        descricao: _descricaoController.text,
        idade: int.parse(_idadeController.text),
      );

      setState(() {
        cachorros.add(cachorro);
      });
      Navigator.of(context).pop();
    }
  }
}
