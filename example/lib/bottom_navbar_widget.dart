import 'package:flutter/material.dart';

import 'package:unicons/unicons.dart';

import 'app_colors.dart';

class BottomNavBarWidget extends StatefulWidget implements PreferredSizeWidget {
  final bool? comprimida;
  final int indexMenuActivo;
  final bool? enabled;
  const BottomNavBarWidget({
    Key? key,
    this.enabled,
    this.comprimida = false,
    this.indexMenuActivo = 0,
  })  : preferredSize = const Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  State<BottomNavBarWidget> createState() => _BottomNavBarWidgetState();

  @override
  final Size preferredSize;
}

class _BottomNavBarWidgetState extends State<BottomNavBarWidget> {
  int _selectedScreenIndex = 0;
  @override
  void initState() {
    _selectedScreenIndex = widget.indexMenuActivo;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final sizeCombinado = (size.height + size.width);
    double fontSize = double.parse((sizeCombinado * 0.008).toStringAsFixed(10));
    return Theme(
      data: Theme.of(context).copyWith(
        unselectedWidgetColor:
            AppColors.primaryColor, // here for unselected state
        colorScheme: const ColorScheme.light(primary: AppColors.ternaryColor),
        iconTheme: IconThemeData(size: sizeCombinado * 0.01),
        dividerColor: Colors.transparent, // if you want to remove the border
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(sizeCombinado * 0.01),
            topLeft: Radius.circular(sizeCombinado * 0.01),
          ),
          boxShadow: const [
            BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(sizeCombinado * 0.02),
            topLeft: Radius.circular(sizeCombinado * 0.02),
          ),
          child: SizedBox(
            height: size.height * 0.08,
            child: BottomNavigationBar(
              backgroundColor: Colors.white,
              currentIndex: _selectedScreenIndex,
              type: BottomNavigationBarType.fixed,
              onTap: _selectScreen,
              items: _obtenerListaItems(),
              iconSize: sizeCombinado * 0.021,
              unselectedItemColor: AppColors.primaryColor,
              selectedItemColor: AppColors.ternaryColor,
              selectedIconTheme:
                  const IconThemeData(color: AppColors.ternaryColor),
              unselectedFontSize: fontSize,
              selectedFontSize: fontSize,
              unselectedIconTheme: const IconThemeData(
                color: AppColors.primaryColor,
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _selectScreen(int index) {}

  List<BottomNavigationBarItem> _obtenerListaItems() {
    return [
      const BottomNavigationBarItem(
        //icon: Icon(Icons.home_outlined),
        icon: Icon(UniconsLine.home_alt),
        label: 'Home',
      ),
      const BottomNavigationBarItem(
        icon: Icon(UniconsLine.clock),
        label: "Movimientos",
      ),
      const BottomNavigationBarItem(
        //icon: Icon(UniconsLine.left_arrow_to_left),
        icon: Icon(Icons.sync_alt),
        label: "Transferencias",
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.attach_money),
        label: "Pagos",
      ),
      const BottomNavigationBarItem(
        //icon: Icon(Icons.menu),
        icon: Icon(UniconsLine.ellipsis_v),
        label: "Menú",
      ),
    ];
  }
}
