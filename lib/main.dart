import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Lab02(),
    );
  }
}

class Lab02 extends StatefulWidget {
  const Lab02({super.key});

  @override
  State<Lab02> createState() => _Lab02State();
}

class _Lab02State extends State<Lab02> {
  bool _isRow = true;
  Color _backgroundColor = Colors.white;

  Icon _starIcon(int index) => _icons[index];

  final List<Icon> _icons = [
    Icon(Icons.favorite ,size: 25,color: Colors.red[400],),
    const Icon(Icons.done,size: 25,color: Colors.blue,),
    const Icon(Icons.clear,size: 25,color: Colors.red,),
    const Icon(Icons.star,size: 25,color: Colors.yellow,),
  ];

  void _changeColor(Color color) {
    setState(() {
      _backgroundColor = color;
      _isRow = true;
    });
  }

  final List<Map<String, String>> _items = [
    {
      "title": "Amman",
      "imageUrl":
          "https://lp-cms-production.imgix.net/features/2019/03/roman-ruins-amman-jordan-407d5b729ba7.jpg"
    },
    {
      "title": "Irbid",
      "imageUrl":
          "https://i.pinimg.com/originals/08/d4/9a/08d49aa63eb1d3a3cba6027fe561ffd5.jpg"
    },
    {
      "title": "Aqaba",
      "imageUrl":
          "https://upload.wikimedia.org/wikipedia/commons/thumb/6/68/Aqaba.jpg/1200px-Aqaba.jpg"
    },
    {
      "title": "Jarash",
      "imageUrl":
          "https://charlieswanderings.com/wp-content/uploads/2021/03/JERASH-JORDAN-9-1-scaled.jpg"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: _backgroundColor,
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: List.generate(_items.length, (index) {
                    if (index % 2 == 0 && index != 0) {
                      _isRow = !_isRow;
                    }
                    return Container(
                      padding: const EdgeInsets.all(10),
                      width: double.infinity,
                      height: 200,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            _items[index]['title']!,
                            style: const TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                          if (_isRow)
                            SizedBox(
                              width: 200,
                              child: Row(
                                children: [
                                  if ((index + 1) % 2 != 0)
                                    Expanded(
                                        child: Image.network(
                                      _items[index]['imageUrl']!,
                                      fit: BoxFit.fill,
                                    )),
                                    if ((index + 1) % 2 != 0)
                                    const SizedBox(width: 10,),
                                  if ((index + 1) % 2 != 0)
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: List.generate(
                                          4, (index) => _starIcon(index)),
                                    ),
                                  if ((index + 1) % 2 == 0)
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: List.generate(
                                          4, (index) => _starIcon(index)),
                                    ),
                                    if ((index + 1) % 2 == 0)
                                    const SizedBox(width: 10,),
                                  if ((index + 1) % 2 == 0)
                                    Expanded(
                                        child: Image.network(
                                      _items[index]['imageUrl']!,
                                      fit: BoxFit.fill,
                                    )),
                                ],
                              ),
                            ),
                          if (!_isRow)
                            SizedBox(
                              width: 200,
                              child: Column(
                                children: [
                                  if ((index + 1) % 2 != 0)
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: List.generate(
                                          4, (index) => _starIcon(index)),
                                    ),
                                    if ((index + 1) % 2 != 0)
                                    const SizedBox(height: 10,),
                                  if ((index + 1) % 2 != 0)
                                    Expanded(
                                      child: Image.network(
                                        _items[index]['imageUrl']!,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  if ((index + 1) % 2 == 0)
                                    Expanded(
                                      child: Image.network(
                                        _items[index]['imageUrl']!,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    if ((index + 1) % 2 == 0)
                                    const SizedBox(height: 10,),
                                  if ((index + 1) % 2 == 0)
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: List.generate(
                                          4, (index) => _starIcon(index),
                                          ),
                                    ),
                                ],
                              ),
                            ),
                        ],
                      ),
                    );
                  }),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                OptionButtons(Colors.red, _changeColor),
                OptionButtons(Colors.green, _changeColor),
                OptionButtons(Colors.blue, _changeColor),
                OptionButtons(Colors.yellow, _changeColor),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class OptionButtons extends StatelessWidget {
  final Color _color;
  final Function _function;

  OptionButtons(this._color, this._function);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _function(_color),
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: _color
        ),
        
      ),
    );
  }
}
