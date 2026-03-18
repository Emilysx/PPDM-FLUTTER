import 'package:coffeshop/components/links.dart';
import 'package:flutter/material.dart';

class LinksPage extends StatelessWidget {
  const LinksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Links(url: "https://github.com/Emilysx", imagem: "https://cdn-icons-png.flaticon.com/256/25/25231.png")
          ],
        )

      )
    );
  }
}