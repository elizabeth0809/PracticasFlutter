import 'package:flutter/material.dart';
import 'package:flutter_application_1/theme/app_theme.dart';

class ListViewScreen extends StatefulWidget {
  const ListViewScreen({Key? key}) : super(key: key);

  @override
  State<ListViewScreen> createState() => _ListViewScreenState();
}

class _ListViewScreenState extends State<ListViewScreen> {
  final List<int> imagesIds = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  final ScrollController scrollController = ScrollController();
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      /*print(
          '${scrollController.position.pixels},${scrollController.position.maxScrollExtent} ');*/
      if ((scrollController.position.pixels + 500) >=
          scrollController.position.maxScrollExtent) {
        fetchData();
      }
    });
  }

//perimite tener un tiempo de espera para cargar la iformacion
  Future fetchData() async {
    if (isLoading) return;
    isLoading = true;
    setState(() {});
    await Future.delayed(const Duration(seconds: 3));
    add5();
    isLoading = false;
    setState(() {});
    scrollController.animateTo(scrollController.position.pixels + 120,
        duration: const Duration(milliseconds: 300),
        curve: Curves.fastOutSlowIn);
  }

//esto agrega 5 imagenes al scroll con el metodo de arriba
  void add5() {
    final lastId = imagesIds.last;
    imagesIds.addAll([1, 2, 3, 4, 5].map((e) => lastId + e));
    setState(() {});
  }

//esto elimina temporalmente las imagenes miestras se va bajando
  Future<void> onRefresh() async {
    await Future.delayed(const Duration(seconds: 2));
    final lastId = imagesIds.last;
    imagesIds.clear();
    imagesIds.add(lastId + 1);
    add5();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true, //esto elimina el espacio sobrante al inicio
        removeBottom: true, //esto lo elimina al final
        child: Stack(
          children: [
            RefreshIndicator(
              onRefresh: onRefresh,
              child: ListView.builder(
                physics:
                    const BouncingScrollPhysics(), //es hace que al arrastrarlo arriba se pueda hacer
                controller: scrollController,
                itemCount: imagesIds.length, //cantidad de imagenes a mostrar
                itemBuilder: (BuildContext context, int index) {
                  return FadeInImage(
                      width: double.infinity,
                      //height: 300,
                      placeholder: const AssetImage('assets/cargando.gif'),
                      image: NetworkImage(
                          'https://picsum.photos/500/300?image=${imagesIds[index]}'));
                },
              ),
            ),
            if (isLoading) //si isLoading es True mostar el circulo cargando
              Positioned(
                  bottom: 40,
                  left: size.width * 0.5 - 30,
                  /*esto centar el circulo */
                  child: const _LoadingIcon())
          ],
        ),
      ),
    );
  }
}

class _LoadingIcon extends StatelessWidget {
  const _LoadingIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      height: 60,
      width: 60,
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.9), shape: BoxShape.circle),
      child: const CircularProgressIndicator(color: AppTheme.primary),
    );
  }
}
