import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      title: 'Navigation',
      home: Scaffold(
        appBar: AppBar(
          title: Text('TapBox'),
        ),
        body: Center(child: ParentWidget()),
      ),
    ));

class ParentWidget extends StatefulWidget {
  @override
  _ParentWidgetState createState() => _ParentWidgetState();
}

class _ParentWidgetState extends State<ParentWidget> {
  bool _active = false;

  Widget build(BuildContext context) => Container(
        child: TapBoxB(
          active: _active,
          onChanged: _handleTapBoxChanged,
        ),
      );

  void _handleTapBoxChanged(bool newValue) {
    setState(() {
      _active = newValue;
    });
  }
}

class TapBoxB extends StatelessWidget {
  final bool active;
  final ValueChanged<bool> onChanged;

  TapBoxB({Key key, this.active: false, @required this.onChanged})
      : assert(onChanged != null),
        super(key: key);

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: _handleTap,
        child: Container(
          child: Center(
            child: Text(
              active ? 'Active' : 'Inactive',
              style: TextStyle(fontSize: 32.0, color: Colors.white),
            ),
          ),
          width: 200.0,
          height: 200.0,
          decoration: BoxDecoration(
            color: active ? Colors.lightGreen[700] : Colors.grey[600],
          ),
        ),
      );

  void _handleTap() {
    onChanged(!active);
  }
}
