import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:task_two/src/common/common_widgets/custom_floating_button.dart';
import 'package:task_two/src/common/providers/controllers.dart';


class ScaffoldWithNavbar extends ConsumerStatefulWidget {
  const ScaffoldWithNavbar(this.child, {super.key});
  final Widget child;
  @override
  ConsumerState<ScaffoldWithNavbar> createState() => _ScaffoldWithNavbarState();
}

class _ScaffoldWithNavbarState extends ConsumerState<ScaffoldWithNavbar> {
  @override
  Widget build(BuildContext context) {
    bool showFab = MediaQuery.of(context).viewInsets.bottom !=0 ;
    final positionProvider = ref.watch(bnbIndexControllerProvider);
    return Scaffold(
        body: widget.child,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Visibility(
            visible: !showFab,
            child: const CustomFloatingActionButton()
        ),

        bottomNavigationBar: SizedBox(
          height: 75.h,
          child: ClipRRect(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(20.sp), topRight:  Radius.circular(20.sp)),
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,    //if we use more than one item
              backgroundColor: Color(0xff76517B),
              currentIndex: positionProvider,
              //Colors
              selectedItemColor: Color(0xff2D0E34),
              unselectedItemColor: Colors.white,
              //Sizes
              iconSize: 30.sp,
              //styles
              selectedLabelStyle: TextStyle(fontWeight: FontWeight.w800),
              unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w800),
              onTap: (value) => _onTap(value) ,
              items: const [
                BottomNavigationBarItem(
                  label: 'Refrigerator',
                  icon: ImageIcon(AssetImage('assets/icons/refrigerator.png'),),
                ),
                BottomNavigationBarItem(
                  label: 'Recipes',
                  icon: ImageIcon(AssetImage('assets/icons/recipes.png')),
                ),
                BottomNavigationBarItem(
                  label: 'Storage Tips',
                  icon: ImageIcon(AssetImage('assets/icons/sorage_tips.png')),
                ),
                BottomNavigationBarItem(
                  label: 'My Profile',
                  icon: ImageIcon(AssetImage('assets/icons/my_profile.png')),
                ),
              ],
            ),
          ),
        )
    );
  }
  void _onTap(int index) {
    ref.read(bnbIndexControllerProvider.notifier).setPosition(index);
    switch(index){
      case 0 :
        context.go('/MyRefridgeratorPage');
        break;
      case 1 :
        context.go('/RecipesPage');
        break;
      case 2 :
        context.go('/StorageTipsPage');
        break;
      case 3 :
        context.go('/MyProfilePage');
        break;
    }
  }
}