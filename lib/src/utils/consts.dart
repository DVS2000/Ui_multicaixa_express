import 'package:flutter/cupertino.dart';

/*
 * AQUI VÃO FICAR TODAS CONSTANTES
 * QUE EU VOU PRECISAR DE FORMA GLOBAL
 * 29.04.2020
 */

/* COLORS */
const Color COLOR_CARD      = Color(0xff526585);
const Color COLOR_BAI       = Color(0xff043673);
const Color COLOR_SOL       = Color(0xffFBB018);
const Color_KEVE            = Color(0xffF18900);
const Color COLOR_BFA       = Color(0xff00346E);
const Color COLOR_STANDARD  = Color(0xff00346E);
const Color COLOR_ATLANTICO = Color(0xff0799C0);
const Color PRIMARY_COLOR   = Color(0xffC64C0E);
const Color BACKGROUND      = Color(0xffF8F9F9);
Color colorMain = Color(0xff0047CC);


/* GRADIENTS */
const LinearGradient gradientStandard = LinearGradient(
  colors: [
    Color(0xff00346E),
    Color(0xff0060AC)
  ]
);
/* FONTS */
const String FONT_LIGHT  = "light";
const String FONT_NORMAL = "normal";
const String FONT_BOLD   = "bold";
const String FONT_MULTI  = "multi";


/* IMAGES */
const String KUBINGA    = "assets/kubiga.png";
const String MERCADO    = "assets/mercado.png";
const String GARSON     = "assets/garson.jpg";
const String SOCIA      = "assets/socia.jpg";
const String LOGO       = "assets/logo.png";
const String LOGO_WHITE = "assets/logo-white.png";
const String CHIP       = "assets/chip.png";
const String ME         = "assets/me.jpg";
const String BAI        = "assets/bai.png";
const String BFA        = "assets/bfa.png";
const String BFA_FUNDO  = "assets/bfa-fundo.png";
const String KEVE       = "assets/keve.png";
const String SOL        = "assets/sol.jpg";
const String STANDARD   = "assets/standard.png";
const String VISA       = "assets/visa.png";
const String ATLANTICO  = "assets/atlantico.png";
const String GROUP      = "assets/Group.png";
const String ANISIO     = "assets/anisio.jpg";
const String MOSTRINHO  = "assets/mostrinho.jpg";
const String JOSEFA     = "assets/josefa.jpg";
const String LUKAMBA    = "assets/lukamba.jpg";
const String UNITEL     = "assets/unitel.jpg";
const String MOVICEL    = "assets/movicel.jpg";
const String ENDE       = "assets/ende.png";
const String EPAL       = "assets/epal.jpg";
const String ENERGIA    = "assets/energia.png";
const String AGUA       = "assets/agua.png";
const String INTERNET   = "assets/internet.png";
const String OUTROS     = "assets/outros.png";
const String IMG_LOGO   = "assets/logo_1.png";

String code;

const String URL_BASE_API = "https://luanda2021.herokuapp.com/api/v1/";

String idUserFrom;


class Transacoes {
  String entidade, data, valor, img;
  Transacoes({
    this.entidade,
    this.data,
    this.valor,
    this.img
  });
}

/* LISTA DAS TRANSAÇÕES */
List<Transacoes> trancoes1 = [
  Transacoes(
    entidade: "Mercado 3.0",
    data: "10 de Janeiro de 2020",
    valor: "-10.000,00 AOA",
    img: MERCADO
  ),
  Transacoes(
    entidade: "Socia",
    data: "20 de Abril de 2020",
    valor: "-5.000,00 AOA",
    img: SOCIA
  ),
  Transacoes(
    entidade: "Garçom",
    data: "31 de Março de 2020",
    valor: "-8.500,00 AOA",
    img: GARSON
  ),
  Transacoes(
    entidade: "Kubinga",
    data: "29 de Abril de 2020",
    valor: "-3.500,00 AOA",
    img: KUBINGA
  )
];

List<Transacoes> trancoes2 = [
  
  Transacoes(
    entidade: "Garçom",
    data: "Entregas",
    valor: "-8.500,00 AOA",
    img: GARSON
  ),
  Transacoes(
    entidade: "Kubinga",
    data: "Mobilidade",
    valor: "-3.500,00 AOA",
    img: KUBINGA
  ),
  Transacoes(
    entidade: "Mercado 3.0",
    data: "E-Commerce",
    valor: "-10.000,00 AOA",
    img: MERCADO
  ),
  Transacoes(
    entidade: "Socia",
    data: "E-Commerce",
    valor: "-5.000,00 AOA",
    img: SOCIA
  ),
];


class Percentagem {
  double size;
  String dayOfWeek;
  Color color;
  Percentagem({this.dayOfWeek, this.size, this.color});
}

List<Percentagem> everyWeek = [
  Percentagem(
    dayOfWeek: "Seg",
    size: 180,
    color: Color(0xff6246FF)
  ),

  Percentagem(
    dayOfWeek: "Ter",
    size: 70,
    color: Color(0xff6246FF) 
  ),

  Percentagem(
    dayOfWeek: "Qua",
    size: 130,
    color: Color(0xff9BA6B5)
  ),

  Percentagem(
    dayOfWeek: "Sui",
    size: 150,
    color: Color(0xff9BA6B5)
  ),

  Percentagem(
    dayOfWeek: "Sex",
    size: 90,
    color: Color(0xff9BA6B5)
  ),

  Percentagem(
    dayOfWeek: "Sab",
    size: 50,
    color: Color(0xff6246FF)
  ),

  Percentagem(
    dayOfWeek: "Dom",
    size: 30,
    color: Color(0xff9BA6B5)
  )
];

class Pagamento {
  String nome, produtos, img;
  Pagamento({this.nome, this.produtos, this.img});
}

List<Pagamento> pagamentos = [
  Pagamento(
    nome: "Movicel S.A",
    produtos: "Voz | Dados | SMS | Planos",
    img: MOVICEL
  ),
  Pagamento(
    nome: "Unitel S.A",
    produtos: "Voz | Dados | SMS",
    img: UNITEL
  ),
  Pagamento(
    nome: "Ende",
    produtos: "Energia",
    img: ENDE
  ),
  Pagamento(
    nome: "Epal",
    produtos: "Água",
    img: EPAL
  ),
  Pagamento(
    nome: "Kubinga",
    produtos: "Transporte",
    img: KUBINGA
  ),
];

class StringGlobal {

  static int currentIndex = 0;
  static int initPage = 0;
  static var functionTab;

}