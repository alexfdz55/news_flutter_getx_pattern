part of 'package:news_getx/app/modules/home/views/home_view.dart';

class _Tab2Page extends StatelessWidget {
  final _ = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<HomeController>(
        builder: (_) => Scaffold(
            body: Column(
          children: <Widget>[
            _ListaCategorias(),
            if (!_.isLoading)
              Expanded(
                  child: ListaNoticias(_.getArticulosCategoriaSeleccionada!)),
            if (_.isLoading)
              Expanded(
                  child: Center(
                child: CircularProgressIndicator(),
              ))
          ],
        )),
      ),
    );
  }
}

class _ListaCategorias extends StatelessWidget {
  final _ = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 80,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: _.categories.length,
        itemBuilder: (BuildContext context, int index) {
          final cName = _.categories[index].name;

          return Padding(
            padding: EdgeInsets.all(8),
            child: Column(
              children: <Widget>[
                _CategoryButton(_.categories[index]),
                SizedBox(height: 5),
                Text('${cName[0].toUpperCase()}${cName.substring(1)}')
              ],
            ),
          );
        },
      ),
    );
  }
}

class _CategoryButton extends StatelessWidget {
  final Category categoria;

  _CategoryButton(this.categoria);

  final _ = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _.selectedCategory = categoria.name;
      },
      child: Container(
        width: 40,
        height: 40,
        margin: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white),
        child: Icon(
          categoria.icon,
          color: (_.selectedCategory == this.categoria.name)
              ? themeDark.accentColor
              : Colors.black54,
        ),
      ),
    );
  }
}
