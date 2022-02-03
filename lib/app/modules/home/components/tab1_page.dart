part of 'package:news_getx/app/modules/home/views/home_view.dart';

class _Tab1Page extends StatefulWidget {
  @override
  _Tab1PageState createState() => _Tab1PageState();
}

class _Tab1PageState extends State<_Tab1Page>
    with AutomaticKeepAliveClientMixin {
  final _ = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (_) => Scaffold(
          body: (_.headlines.length == 0)
              ? Center(child: CircularProgressIndicator())
              : ListaNoticias(_.headlines)),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
