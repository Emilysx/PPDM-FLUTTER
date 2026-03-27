import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialLinks extends StatelessWidget {
  const SocialLinks({super.key});

  void abrirLink(String url) async {
    final Uri uri = Uri.parse(url);

    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Não foi possível abrir $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    final largura = MediaQuery.of(context).size.width;

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        GestureDetector(
          onTap: () => abrirLink('https://www.linkedin.com/in/emilyg-oliveira'),
          child: Image.asset(
            'assets/linkedin.png',
            height: largura * 0.07,
          ),
        ),

        SizedBox(width: largura * 0.03),

        GestureDetector(
          onTap: () => abrirLink('https://www.instagram.com/emily_gabrielle27?igsh=MWJkMXF4NHBjYWFtZA%3D%3D&utm_source=qr'),
          child: Image.asset(
            'assets/instagram.png',
            height: largura * 0.07,
          ),
        ),

        SizedBox(width: largura * 0.03),

        GestureDetector(
          onTap: () => abrirLink('https://github.com/Emilysx'),
          child: Image.asset(
            'assets/github.png',
            height: largura * 0.07,
          ),
        ),

        SizedBox(width: largura * 0.03),

        GestureDetector(
          onTap: () => abrirLink('mailto: emilyg.oliveira27@gmail.com'),
          child: Image.asset(
            'assets/email.png',
            height: largura * 0.07,
          ),
        ),
      ],
    );
  }
}