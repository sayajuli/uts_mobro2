import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SkillItem extends StatelessWidget {
  final String name;
  final String icon;
  
  const SkillItem({
    super.key,
    required this.name,
    required this.icon,
  });
  
  IconData _getIcon(String iconName) {
    switch (iconName.toLowerCase()) {
      case 'git':
        return FontAwesomeIcons.git;
      case 'github':
        return FontAwesomeIcons.github;
      case 'docker':
        return FontAwesomeIcons.docker;
      case 'js':
        return FontAwesomeIcons.js;
      case 'java' :
        return FontAwesomeIcons.java;
      case 'php' :
        return FontAwesomeIcons.php;
      case 'ts' :
        return FontAwesomeIcons.js;
      case 'react' :
        return FontAwesomeIcons.react;
      case 'nodejs' :
        return FontAwesomeIcons.nodeJs;
      case 'bootstrap' :
        return FontAwesomeIcons.bootstrap;
      case 'mongodb' :
        return FontAwesomeIcons.database;
      case 'mysql' :
        return FontAwesomeIcons.database;
      case 'postgreeSQL' :
        return FontAwesomeIcons.database;
      default:
        return FontAwesomeIcons.code;
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    return Card(
      elevation: 0,
      color: isDark ? Colors.grey[850] : Colors.grey[100],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
          color: isDark ? Colors.grey[800]! : Colors.grey[300]!,
          width: 1,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _getIcon(icon) is IconData && _getIcon(icon) == Icons.code
                ? Icon(
                    Icons.code,
                    size: 28,
                    color: Color(0xff3746F2),
                  )
                : FaIcon(
                    _getIcon(icon) as IconData,
                    size: 28,
                    color: Color(0xff3746F2),
                  ),
            SizedBox(height: 8),
            Text(
              name,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}