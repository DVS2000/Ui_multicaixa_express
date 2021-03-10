import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ui_multicaixa/src/pages/tabs/carteira_tab.dart';
import 'package:ui_multicaixa/src/pages/tabs/home_tab.dart';
import 'package:ui_multicaixa/src/pages/tabs/pagamento_tab.dart';
import 'package:ui_multicaixa/src/pages/tabs/profile_tab.dart';
import 'package:ui_multicaixa/src/utils/shared_widgets.dart';
import '../utils/consts.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController _pageController = PageController();

  int index = 0;

  void onChanged(int index) {

    if (index == 1) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarBrightness: Brightness.dark,
            statusBarIconBrightness: Brightness.dark),
      );
    } else {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarBrightness: Brightness.light,
            statusBarIconBrightness: Brightness.light),
      );
    }

    setState(() => this.index = index);
  }

  Color color() {
    if (StringGlobal.currentIndex == 0) {
      colorMain = COLOR_STANDARD;
      return COLOR_STANDARD;
    } else if (StringGlobal.currentIndex == 1) {
      colorMain = COLOR_BFA;
      return COLOR_BFA;
    } else if (StringGlobal.currentIndex == 2) {
      colorMain = COLOR_SOL;
      return COLOR_SOL;
    } else if (StringGlobal.currentIndex == 3) {
      colorMain = COLOR_BAI;
      return COLOR_BAI;
    } else if (StringGlobal.currentIndex == 4) {
      colorMain = COLOR_ATLANTICO;
      return COLOR_ATLANTICO;
    } else if (StringGlobal.currentIndex == 5) {
      colorMain = Color_KEVE;
      return Color_KEVE;
    } else {
      return Colors.green;
    }
  }

  void changeColor(int index) {
    setState(() {
      StringGlobal.currentIndex = index;
    });
  }

  @override
  void initState() {
    StringGlobal.functionTab = changeColor;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: BACKGROUND,
      resizeToAvoidBottomInset: false,
      body: PageView(
        controller: _pageController,
        onPageChanged: onChanged,
        children: <Widget>[
          HomeTab(),
          CarteiraTab(),
          PagamentoTab(),
          ProfileTab()
        ],
      ),
      bottomNavigationBar: Container(
        height: 53,
        width: double.infinity,
        color: Colors.transparent,
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3.0),
                height: 53,
                width: size.width,
                decoration: BoxDecoration(color: Colors.white, boxShadow: [
                  BoxShadow(color: Colors.grey.withOpacity(.5), blurRadius: 2)
                ]),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[

                          SharedWidget.itemMenu(
                              onTap: () => _pageController.animateToPage(0,
                                  duration: Duration(milliseconds: 250),
                                  curve: Curves.easeIn),
                              text: "Principal".toUpperCase(),
                              icon: FontAwesomeIcons.home,
                              sizeIcon: 29,
                              color: index == 0 ? color() : Colors.grey),

                          SharedWidget.itemMenu(
                              onTap: () => _pageController.animateToPage(1,
                                  duration: Duration(milliseconds: 250),
                                  curve: Curves.easeIn),
                              text: "Transferir".toUpperCase(),
                              icon: FontAwesomeIcons.moneyBill,
                              sizeIcon: 28,
                              color: index == 1 ? color() : Colors.grey),

                          SizedBox(
                            width: 30,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          SizedBox(
                            width: 30,
                          ),
                          SharedWidget.itemMenu(
                              onTap: () => _pageController.animateToPage(2,
                                  duration: Duration(milliseconds: 250),
                                  curve: Curves.easeIn),
                              text: "Pagamento".toUpperCase(),
                              icon: Icons.shopping_cart,
                              color: index == 2 ? color() : Colors.grey),

                          SharedWidget.itemMenu(
                              onTap: () => _pageController.animateToPage(3,
                                  duration: Duration(milliseconds: 250),
                                  curve: Curves.easeIn),
                              text: "Perfil".toUpperCase(),
                              icon: CupertinoIcons.person,
                              color: index == 3 ? color() : Colors.grey)
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Material(
        elevation: 2,
        borderRadius: BorderRadius.circular(100),
        child: AnimatedContainer(
          duration: Duration(milliseconds: 250),
          height: 50,
          width: 50,
          decoration: BoxDecoration(
              color: color(),
              shape: BoxShape.circle,
              gradient:
                  StringGlobal.currentIndex == 0 ? gradientStandard : null),
          child: Center(
            child: Icon(
              Icons.add,
              color: Colors.white,
              size: 35,
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
