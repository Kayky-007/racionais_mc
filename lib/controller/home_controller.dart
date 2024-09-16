import 'package:racionais_mc/modal/frase_modal.dart';

class HomeController {
  bool carregarFrase = false;
  String novaFrase = '';
  String fraseAtual = '';

  Future<String> buscarFrase() async {
    // Instancia o modal e busca a frase
    FraseModal frase = await FraseModal.buscarFrase();
    return 'Frase: ${frase.frase}';
    
  }
  
}
