import 'package:detail_list_view/Yemekler.dart';
import 'package:detail_list_view/detailPage.dart';
import 'package:flutter/material.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  Future<List<Yemekler>> mealsBring() async {
    var mealsList = <Yemekler>[]; //Meals sınıfından List oluşturma

    var m1 = Yemekler(1, "Köfte", "kofte.png", 15.99);
    var m2 = Yemekler(2, "Ayran", "ayran.png", 2.99);
    var m3 = Yemekler(3, "Baklava", "baklava.png", 10.99);
    var m4 = Yemekler(4, "Fanta", "fanta.png", 2.99);
    var m5 = Yemekler(5, "Kadayıf", "kadayif.png", 11.99);
    var m6 = Yemekler(6, "Makarna", "makarna.png", 20.99);

    mealsList.add(m1);
    mealsList.add(m2);
    mealsList.add(m3);
    mealsList.add(m4);
    mealsList.add(m5);
    mealsList.add(m6);

    return mealsList; //
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange, //AppBar Renk Değişimi
        title: const Text("Yemekler"), //AppBar Başlık
      ),
      body: FutureBuilder<List<Yemekler>>(
          future: mealsBring(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var mealsLists = snapshot.data;

              return ListView.builder(
                itemCount: mealsLists!.length,
                itemBuilder: (context, index) {
                  var food = mealsLists[index];

                  return GestureDetector(
                    onTap: () {
                      //Card tıklama
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => detailPage(
                                    food: food,
                                  )));
                    },
                    child: Card(
                      child: Row(children: [
                        SizedBox(
                            width: 150,
                            height: 150,
                            child:
                                Image.asset("image/${food.yemek_image_name}")),
                        Column(
                          crossAxisAlignment:
                              CrossAxisAlignment.start, //sol hizalama
                          children: [
                            Text(
                              food.yemek_name,
                              style: const TextStyle(fontSize: 25),
                            ),
                            const SizedBox(
                              height: 50,
                            ),
                            Text(
                              "${food.yemek_price} \u{20BA}",
                              style: const TextStyle(
                                  fontSize: 20, color: Colors.blue),
                            ),
                          ],
                        ),
                        const Spacer(),
                        const Icon(Icons.keyboard_arrow_right),
                      ]),
                    ),
                  );
                },
              );
            } else {
              return const Center();
            }
          }),
    );
  }
}
