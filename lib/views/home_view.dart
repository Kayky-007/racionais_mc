import 'package:flutter/material.dart';
import 'package:racionais_mc/controller/home_controller.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  HomeController controller = HomeController();

  @override
  void initState() {
    super.initState();
    carregarFraseInicial(); 
  }

  Future<void> carregarFraseInicial() async {
    String frase = await controller.buscarFrase();
    setState(() {
      controller.fraseAtual = frase;
      controller.carregarFrase = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            children:  [
              Image(
                image: AssetImage('assets/images/racionais.jpg'),
                width: 511,
              ),
            ],
          ),
           SizedBox(height: 10),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:  [
              Text(
                'Frases Racionais MCs',
                style: TextStyle(fontSize: 30),
              ),
            ],
          ),
           SizedBox(height: 20),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () async {
                  String novaFrase = await controller.buscarFrase();
                  setState(() {
                    controller.novaFrase = novaFrase;
                    controller.fraseAtual = controller.novaFrase;
                  });
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    side:  BorderSide(
                      color: Colors.black,
                      width: 2.0,
                    ),
                  ),
                  elevation: 10,
                  child: Container(
                    width: 350,
                    height: 100,
                    padding:  EdgeInsets.all(20),
                    child:  Center(
                      child: Text(
                        'Nova frase',
                        style: TextStyle(fontSize: 20),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
           SizedBox(height: 20),

          
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               Text(
                      controller.fraseAtual.isNotEmpty
                          ? controller.fraseAtual
                          : 'Carregando frase...',
                      style: const TextStyle(fontSize: 15),
                      textAlign: TextAlign.center,
                    ),
            ],
          ),
        ],
      ),
    );
  }
}
