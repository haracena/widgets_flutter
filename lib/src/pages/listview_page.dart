import 'package:flutter/material.dart';
import 'dart:async';

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  ScrollController _scrollCtrl = ScrollController();

  List<int> _listaNumeros = [];
  int _ulitmoItem = 0;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _agregarImgs();
    _scrollCtrl.addListener(() {
      if (_scrollCtrl.position.pixels == _scrollCtrl.position.maxScrollExtent) {
        //_agregarImgs();
        fetchData();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollCtrl.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('List Builder'),
        ),
        body: Stack(
          children: <Widget>[_crearLista(), _crearLoading()],
        ));
  }

  Widget _crearLista() {
    return RefreshIndicator(
      onRefresh: _obtenerPagina,
      child: ListView.builder(
        controller: _scrollCtrl,
        itemCount: _listaNumeros.length,
        itemBuilder: (BuildContext context, int index) {
          final imagen = _listaNumeros[index];

          return FadeInImage(
            image:
                NetworkImage('https://picsum.photos/500/300/?image=${imagen}'),
            placeholder: AssetImage('assets/jar-loading.gif'),
          );
        },
      ),
    );
  }

  Future _obtenerPagina() async {
    final duration = Duration(seconds: 2);
    Timer(duration, () {
      _listaNumeros.clear();
      _ulitmoItem++;
      _agregarImgs();
    });

    return Future.delayed(duration);
  } 

  // agrega 10 imgs nuevas
  void _agregarImgs() {
    for (var i = 0; i < 10; i++) {
      _ulitmoItem++;
      _listaNumeros.add(_ulitmoItem);
    }

    setState(() {});
  }

  Future fetchData() async {
    _isLoading = true;
    setState(() {});

    final duration = Duration(seconds: 2);
    return Timer(duration, respuestaHTTP);
  }

  void respuestaHTTP() {
    _isLoading = false;
    _scrollCtrl.animateTo(_scrollCtrl.position.pixels + 100,
        curve: Curves.fastOutSlowIn, duration: Duration(milliseconds: 400));
    _agregarImgs();
  }

  Widget _crearLoading() {
    if (_isLoading) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(bottom: 15.0),
                child: CircularProgressIndicator(),
              )
            ],
          ),
        ],
      );
    } else {
      return Container();
    }
  }
}
