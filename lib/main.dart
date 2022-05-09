import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:mercadolibre/helpers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mercadolibre',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.yellow[600],
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0,
        toolbarHeight: 100,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Buscar en Mercado Libre',
                      hintStyle: TextStyle(
                        color: Colors.grey[600],
                      ),
                      prefixIcon: const Icon(Icons.search),
                      prefixIconConstraints: const BoxConstraints(
                        minWidth: 50,
                      ),
                      contentPadding: const EdgeInsets.all(8),
                      isCollapsed: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(
                          width: 0,
                          color: Colors.transparent,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(
                          width: 0,
                          color: Colors.transparent,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Icon(
                  Icons.shopping_cart_outlined,
                  color: Colors.grey[600],
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 5,
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.location_on_outlined,
                    color: Colors.grey[800],
                    size: 20,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Enviar a Fancy Solutions',
                    style: TextStyle(
                      color: Colors.grey[800],
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Container(
                height: 200,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Theme.of(context).primaryColor,
                      Colors.grey.withOpacity(0),
                    ],
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 10,
                  ),
                  child: HeroSlider(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 15,
                  horizontal: 15,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ...circleButtons.map((e) {
                      return Expanded(
                        child: Column(
                          children: [
                            Container(
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(100),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.grey,
                                    spreadRadius: -1,
                                    blurRadius: 1,
                                    offset: Offset(
                                      0,
                                      2,
                                    ),
                                  ),
                                ],
                              ),
                              child: Icon(
                                e['icon'],
                                size: 28,
                                color: Colors.grey[800],
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              e['text'],
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.grey[700],
                              ),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 15,
                  horizontal: 15,
                ),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(7),
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 1,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 15,
                          horizontal: 20,
                        ),
                        child: Text(
                          'Inspirado en Lo Ultimo que Viste',
                          style: TextStyle(
                            color: Colors.grey[900],
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const Divider(
                        height: 1,
                        color: Colors.grey,
                      ),
                      ...products.map((e) {
                        return Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  SizedBox(
                                    height: 130,
                                    width: 120,
                                    child: Image(
                                      height: double.infinity,
                                      width: double.infinity,
                                      image: AssetImage(
                                        e['image'],
                                      ),
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        e['title'],
                                        style: const TextStyle(
                                          fontSize: 17,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        '\$${e['price']}',
                                        style: const TextStyle(
                                          fontSize: 20,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        'Envio Gratis',
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.green[700],
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            const Divider(
                              height: 1,
                              color: Colors.grey,
                            ),
                          ],
                        );
                      }).toList(),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 15,
                          horizontal: 20,
                        ),
                        child: Row(
                          children: [
                            Text(
                              'Ver Mas',
                              style: TextStyle(
                                color: Colors.blue[500],
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const Spacer(),
                            Icon(
                              Icons.chevron_right_sharp,
                              color: Colors.blue[500],
                              size: 25,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 5,
            vertical: 12,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ...bottomBarItems.map((e) {
                return Container(
                  width: 70,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        e['icon'],
                        size: 30,
                        color: Colors.grey,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        e['text'],
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.grey[700],
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ],
          ),
        ),
      ),
    );
  }
}

class HeroSlider extends StatefulWidget {
  const HeroSlider({
    Key? key,
  }) : super(key: key);

  @override
  State<HeroSlider> createState() => _HeroSliderState();
}

class _HeroSliderState extends State<HeroSlider> {
  late PageController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = PageController(
      initialPage: 0,
      viewportFraction: 1,
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: PageView(
        physics: BouncingScrollPhysics(),
        controller: _controller,
        children: [
          ...heroImages.map((e) {
            return Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(7),
                child: Image(
                  alignment: Alignment.centerLeft,
                  height: double.infinity,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  image: AssetImage(
                    e,
                  ),
                ),
              ),
            );
          }).toList()
        ],
      ),
    );
  }
}
