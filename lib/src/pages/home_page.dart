import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int contador;
  final textStyle = new TextStyle(fontSize: 20, fontWeight: FontWeight.bold);

  @override
  void initState() {
    contador = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contador'),
        centerTitle: true,
        elevation: 10.0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Contador',
              style: textStyle,
            ),
            SizedBox(height: 8),
            Text(
              '$contador',
              style: textStyle,
            ),
          ],
        ),
      ),
      /* floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          setState(() => contador++);
        },
      ), */
      floatingActionButton: _buildFloatingActionButtons(),
    );
  }

  Widget _buildFloatingActionButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SizedBox(width: 30),
        _buildActionButton(Icons.settings_backup_restore, _reiniciar),
        Expanded(child: SizedBox()),
        _buildActionButton(Icons.remove_rounded, _decrementar),
        SizedBox(width: 10),
        _buildActionButton(Icons.add, _incrementar),
      ],
    );
  }

  void _incrementar() => contador++;
  void _decrementar() => contador--;
  void _reiniciar() => contador = 0;

  Widget _buildActionButton(IconData icon, Function action) {
    return FloatingActionButton(
      child: Icon(icon),
      onPressed: () {
        setState(() => action());
      },
    );
  }
}
