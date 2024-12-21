import 'package:flutter/material.dart';

void main() {
  print('main');
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: LifecycleDemo(),
  ));
}

class LifecycleDemo extends StatefulWidget {
  LifecycleDemo({super.key}) {
    print('constructor: Widget created');
  }

  @override
  _LifecycleDemoState createState() {
    print('createState: Widget created');
    return _LifecycleDemoState();
  }
}

class _LifecycleDemoState extends State<LifecycleDemo> {
  Color _backgroundColor = Colors.black;
  @override
  void initState() {
    super.initState();
    print('initState: Widget initialized');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('didChangeDependencies: Dependencies changed');
  }

  @override
  Widget build(BuildContext context) {
    print('build: Widget building/rebuilding');
    return Scaffold(
      appBar: AppBar(
        title:  Text('Lifecycle Demo' ,style: TextStyle(color: _backgroundColor),),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ChildWidget(),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _backgroundColor = Colors.red;
                  print('setState: Triggering rebuild');
                });
              },
              child: Text('Trigger setState'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AnotherScreen(),
                  ),
                );
              },
              child: Text('Navigate to Another Screen'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void deactivate() {
    super.deactivate();
    print('deactivate: Widget removed from the tree');
  }

  @override
  void dispose() {
    super.dispose();
    print('dispose: Widget destroyed');
  }
}

class AnotherScreen extends StatelessWidget {
  AnotherScreen({super.key}) {
    print('constructor:AnotherScreen ');
  }

  @override
  Widget build(BuildContext context) {
    print('build:AnotherScreen ');

    return Scaffold(
      appBar: AppBar(
        title: Text('Another Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Go Back'),
        ),
      ),
    );
  }
}
class ChildWidget extends StatefulWidget {

   ChildWidget({super.key}){
    print('constructor: ChildWidget created');
  }

  @override
  State<ChildWidget> createState() {
    print('createState: ChildWidget created');
    return _ChildWidgetState();
  }
}

class _ChildWidgetState extends State<ChildWidget> {
  @override
  void initState() {
    super.initState();
    print('initState: ChildWidget initialized');
  }
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('didChangeDependencies: ChildWidget dependencies changed');
  }
  @override
  void deactivate() {
    super.deactivate();
    print('deactivate: ChildWidget removed from the tree');
  }
  @override
  void dispose() {
    super.dispose();
    print('dispose: ChildWidget destroyed');
  }
  @override
  Widget build(BuildContext context) {
    print('build: ChildWidget building/rebuilding');
    return const Text('Child Widget');
  }
}