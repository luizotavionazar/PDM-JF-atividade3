import 'package:flutter/material.dart';

class SegundaTela extends StatefulWidget {
  int contador;
  String name;
  SegundaTela({super.key,this.contador=0, required this.name});

  @override
  State<SegundaTela> createState() => _SegundaTelaState();
}

class _SegundaTelaState extends State<SegundaTela> {

  void voltar() {
    Navigator.pop(context, widget.contador+1);
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
                "${widget.name} have pushed the button this many times: ${widget.contador}",
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
