import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cards'),
      ),
      body: ListView(
        padding: EdgeInsets.all(10.0),
        children: <Widget>[
          _cardTipoUno(),
          SizedBox(height: 30.0),
          _cardTipoDos(),
          SizedBox(height: 30.0),
          _cardTipoDos(),
        ],
      ),
    );
  }

  Widget _cardTipoUno() {
    return Card(
      elevation: 10.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(
              Icons.photo_album,
              color: Colors.blue,
            ),
            title: Text('Título de esta card'),
            subtitle: Text(
                'Descripción de la tarjeta para mostrar que tal se ve en la app'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FlatButton(
                child: Text('Cancelar'),
                onPressed: () {},
              ),
              FlatButton(
                child: Text('Ok'),
                onPressed: () {},
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _cardTipoDos() {
    final card = Container(
      child: Column(
        children: <Widget>[
          FadeInImage(
            image: NetworkImage(
                'https://www.nationalgeographic.com/content/dam/travel/rights-exempt/2019-travel-photo-contest/epic-landscapes/2019-travel-photo-contest-epic-landscapes035.ngsversion.1555645554283.adapt.1900.1.jpg'),
            placeholder: AssetImage('assets/jar-loading.gif'),
            fadeInDuration: Duration(milliseconds: 200),
            height: 300.0,
            fit: BoxFit.fill,
          ),
          // Image(
          //   image: NetworkImage(
          //       'https://www.nationalgeographic.com/content/dam/travel/rights-exempt/2019-travel-photo-contest/epic-landscapes/2019-travel-photo-contest-epic-landscapes035.ngsversion.1555645554283.adapt.1900.1.jpg'),
          // ),
          Container(
            padding: EdgeInsets.all(10.0),
            child: Text('landscape'),
          )
        ],
      ),
    );

    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          color: Colors.white,
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10.0,
              spreadRadius: 2.0,
              offset: Offset(2.0, 10.0)
            )
          ]),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30.0),
        child: card,
      ),
    );
  }
}
