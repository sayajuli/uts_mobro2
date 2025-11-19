import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uts_mobole2/cubits/theme_cubit.dart';

class CostumAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CostumAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xff3746F2),
      leading: BackButton(
        color: Color(0xFFF1F1F1),
      ),

      actions: [
        BlocBuilder<ThemeCubit, bool>(
          builder: (context, isDark) {
            return IconButton(
              color: Color(0xFFF1F1F1),
              icon: Icon(isDark ? Icons.light_mode : Icons.dark_mode),
              onPressed: () {
                context.read<ThemeCubit>().toggleTheme();
              },
            );
          },
        )
        ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}