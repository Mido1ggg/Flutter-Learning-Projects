import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int counter = 0;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'ListView',
        home: Scaffold(
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.blue,
            onPressed: () {
              setState(() {});
              counter++;
              print(counter);
            },
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
                side: const BorderSide(
                  color: Colors.blueAccent,
                  width: 3,
                )),
            child: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
          appBar: AppBar(
            backgroundColor: Colors.blue,
            title: const Text("List View",
                style: TextStyle(color: Colors.white, fontSize: 40)),
            centerTitle: true,
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.separated(
              separatorBuilder: (context, index) {
                return const SizedBox(
                  height: 20,
                );
              },
              itemBuilder: (context, index) {
                return Stack(
                  children: [
                    Container(
                      width: 385,
                      height: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.blue),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.account_circle,
                            color: Colors.white,
                            size: 50,
                          ),
                        ),
                        Text(
                          "Item ${index + 1}",
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                              color: Colors.white),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Image.asset(
                            'assets/images/animal.jpeg',
                            width: 150,
                            height: 100,
                            alignment: Alignment.centerRight,
                          ),
                        )
                      ],
                    ),
                  ],
                );
              },
              itemCount: counter,
            ),
          ),
        ));
  }
}
