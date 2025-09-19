import 'package:flutter/material.dart';

class SegundaTela extends StatefulWidget {
  int contador;
  String name;
  SegundaTela({super.key,this.contador=0,this.name=''});

  @override
  State<SegundaTela> createState() => _SegundaTelaState();
}

class _SegundaTelaState extends State<SegundaTela> {
  late int _count;
  late String _name;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _count=widget.contador;
    _name=widget.name;
  }

  void voltar() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Screen App'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 20,),
            Text(
                "$_name have pushed the button this many times: $_count",
                style: Theme.of(context).textTheme.headlineMedium),
            SizedBox(height: 20,),
            ElevatedButton(
                onPressed: voltar,
                child: Text("BACK", style: Theme.of(context).textTheme.headlineSmall,)),
          ],
        ),
      ),
    );
  }
}
