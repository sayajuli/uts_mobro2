import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uts_mobole2/cubits/friend_status_cubit.dart';
import 'package:uts_mobole2/cubits/visibility_cubit.dart';
import 'package:uts_mobole2/models/profile_model.dart';

class ProfileHeader extends StatelessWidget {
  final Mahasiswa mahasiswa;
  
  const ProfileHeader({super.key, required this.mahasiswa});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    return Column(
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            // Banner
            Container(
              height: 140,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(mahasiswa.bannerPicUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            
            // Profile Picture
            Positioned(
              top: 80,
              left: 20,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: isDark ? Colors.grey[900]! : Colors.white,
                    width: 4,
                  ),
                ),
                child: CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage(mahasiswa.profilPicUrl),
                ),
              ),
            ),
          ],
        ),
        
        // Buttons Row (di luar Stack biar gak ketutup)
        SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              BlocBuilder<FriendStatusCubit, FriendStatus>(
                builder: (context, status) {
                  final isRequested = status == FriendStatus.requested;
                  return ElevatedButton.icon(
                    onPressed: () {
                      context.read<FriendStatusCubit>().toggleFriendStatus();
                      
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            isRequested 
                                ? 'Request dibatalkan' 
                                : 'Friend request terkirim!',
                          ),
                          duration: Duration(seconds: 2),
                          behavior: SnackBarBehavior.floating,
                        ),
                      );
                    },
                    icon: Icon(
                      isRequested ? Icons.check : Icons.person_add,
                      size: 16,
                    ),
                    label: Text(
                      isRequested ? "Send Request" : "Tambah Teman",
                      style: TextStyle(fontSize: 12),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isRequested 
                          ? Colors.green 
                          : Color(0xff3746F2),
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      elevation: 2,
                    ),
                  );
                },
              ),
              
              SizedBox(width: 8),
              
              BlocBuilder<VisibilityCubit, bool>(
                builder: (context, isVisible) {
                  return OutlinedButton.icon(
                    onPressed: () {
                      context.read<VisibilityCubit>().toggleVisibility();
                      
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            isVisible 
                                ? 'Informasi disembunyikan' 
                                : 'Informasi ditampilkan',
                          ),
                          duration: Duration(seconds: 2),
                          behavior: SnackBarBehavior.floating,
                        ),
                      );
                    },
                    icon: Icon(
                      isVisible ? Icons.visibility_off : Icons.visibility,
                      size: 16,
                    ),
                    label: Text(
                      isVisible ? "Sembunyikan" : "Tampilkan",
                      style: TextStyle(fontSize: 12),
                    ),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: isDark ? Colors.white : Colors.black,
                      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      side: BorderSide(
                        color: isDark ? Colors.white54 : Colors.black54,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}