import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Links extends StatelessWidget {
  String url;
  String imagem;
  Links({super.key, required this.url, required this.imagem });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.2,
      height:  MediaQuery.of(context).size.height * 0.2,
      color: const Color.fromARGB(0, 225, 190, 231),
      child: Column(
        children: [
          // Atribui uma ação ao componente filho
          GestureDetector(
            // Toda vez que clicar na imagem navega para o link externo
            child: Image.network(imagem),
            onTap: () async {
              // para o flutter entender a sua url, transforme a url 
              Uri converterUrl = Uri.parse(url);
              // se a função de lauch for treu
              if(await canLaunchUrl(converterUrl)){
                // Espero a transição para o link externo
                await(launchUrl(converterUrl));
              }

            },
          )
        ],
      ),
    );
  }
}

// Links(url:"www.google.com", imagem: https.....)