import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uts_mobole2/cubits/menu_cubit.dart';

class MenuTabs extends StatelessWidget {
  const MenuTabs({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MenuCubit, MenuType>(
      builder: (context, currentMenu) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            children: [
              _buildTab(
                context,
                "Profile",
                MenuType.profile,
                currentMenu == MenuType.profile,
              ),
              SizedBox(width: 8),
              _buildTab(
                context,
                "Hobi",
                MenuType.hobbies,
                currentMenu == MenuType.hobbies,
              ),
              SizedBox(width: 8),
              _buildTab(
                context,
                "Skill",
                MenuType.skills,
                currentMenu == MenuType.skills,
              ),
              SizedBox(width: 8),
              _buildTab(
                context,
                "Kontak",
                MenuType.contact,
                currentMenu == MenuType.contact,
              ),
            ],
          ),
        );
      },
    );
  }
  
  Widget _buildTab(
    BuildContext context,
    String title,
    MenuType menuType,
    bool isSelected,
  ) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    return Expanded(
      child: GestureDetector(
        onTap: () {
          context.read<MenuCubit>().changeMenu(menuType);
        },
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: isSelected 
                ? Color(0xff3746F2) 
                : (isDark ? Colors.grey[850] : Colors.grey[200]),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: isSelected 
                  ? Colors.white 
                  : (isDark ? Colors.white70 : Colors.black87),
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              fontSize: 13,
            ),
          ),
        ),
      ),
    );
  }
}