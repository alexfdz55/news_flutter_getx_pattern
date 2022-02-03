import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:news_getx/app/data/models/category_model.dart';

import 'package:news_getx/app/shared/global_widgets/lista_noticias.dart';
import 'package:news_getx/app/shared/theme/tema.dart';
import '../controllers/home_controller.dart';

part 'package:news_getx/app/modules/home/components/tab1_page.dart';
part 'package:news_getx/app/modules/home/components/tab2_page.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _Paginas(),
      bottomNavigationBar: _Navegacion(),
    );
  }
}

class _Navegacion extends StatelessWidget {
  final _ = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (_) => BottomNavigationBar(
        currentIndex: _.paginaActual,
        onTap: (i) => _.paginaActual = i,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline), label: 'Para ti'),
          BottomNavigationBarItem(
              icon: Icon(Icons.public), label: 'Encabezados'),
        ],
      ),
    );
  }
}

class _Paginas extends StatelessWidget {
  final _ = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _.pageController,
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        _Tab1Page(),
        _Tab2Page(),
      ],
    );
  }
}
