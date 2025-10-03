import 'package:flutter/material.dart';
import 'package:primeiro_flutter/segunda_tela.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightGreen),
      ),
      home: const MyHomePage(title: "LUIZ'S NAME FILLER"),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String _nome = 'You';

  final TextEditingController _controller = TextEditingController();

  void _trocar_nome() {
    setState(() {
      _nome= _controller.text;

      if (_nome.isEmpty) {
        _nome= 'You';
      }

      salvar();
      _controller.clear();
      _counter= 0;
    });
  }

  void secondScreen() async {
    final resultado = await Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SegundaTela(contador: _counter, name: _nome,))
    );

    if(resultado != null) {
      setState(() {
        _counter = resultado;
      });
    }
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  Future<void> salvar() async {
    final SharedPreferencesAsync prefs = SharedPreferencesAsync();
    await prefs.setString('nome', _nome);
  }

  Future<void> _lerNome() async {
    final SharedPreferencesAsync prefs = SharedPreferencesAsync();
    _nome = await prefs.getString('nome') ?? 'You';
    setState(() { }); //Para recarregar a UI quando fechar e abrir o APP
  }

  @override
  void initState() {
    _lerNome();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
                '$_nome have pushed the button this many times:',
                style: Theme.of(context).textTheme.headlineSmall
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            SizedBox(height: 20,),
            Text(
                "Your name:",
                style: Theme.of(context).textTheme.headlineMedium
            ),
            SizedBox(width: 300,
                     child: TextField(controller: _controller,),),
            SizedBox(height: 20,),
            ElevatedButton(onPressed: _trocar_nome,
                     child: Text("CONFIRM", style: Theme.of(context).textTheme.headlineSmall,)),
            SizedBox(height: 20,),
            ElevatedButton(onPressed: secondScreen,
                child: Text("SECOND SCREEN", style: Theme.of(context).textTheme.headlineSmall,)),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
