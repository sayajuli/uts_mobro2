import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uts_mobole2/cubits/menu_cubit.dart';
import 'package:uts_mobole2/cubits/visibility_cubit.dart';
import 'package:uts_mobole2/models/profile_data.dart';
import 'package:uts_mobole2/models/profile_model.dart';
import 'package:uts_mobole2/widgets/contact_item.dart';
import 'package:uts_mobole2/widgets/costum_app_bar.dart';
import 'package:uts_mobole2/widgets/hobby_item.dart';
import 'package:uts_mobole2/widgets/info_card.dart';
import 'package:uts_mobole2/widgets/menu_tabs.dart';
import 'package:uts_mobole2/widgets/profile_header.dart';
import 'package:uts_mobole2/widgets/section_card.dart';
import 'package:uts_mobole2/widgets/skill_item.dart';

class ProfilPage extends StatefulWidget {
  const ProfilPage({super.key});

  @override
  State<ProfilPage> createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  late Mahasiswa mahasiswa;
  
  @override
  void initState() {
    super.initState();
    mahasiswa = ProfileData.getMahasiswa();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CostumAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header dengan foto profil dan banner
            ProfileHeader(mahasiswa: mahasiswa),
            
            SizedBox(height: 16),
            
            // Nama dan Info di bawah foto profil
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        mahasiswa.nama,
                        style: TextStyle(
                          fontFamily: GoogleFonts.poppins().fontFamily,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          inherit: true,
                        ),
                      ),
                      Text(
                        " (He/Him)",
                        style: TextStyle(
                          fontFamily: GoogleFonts.poppins().fontFamily,
                          fontSize: 14,
                          color: Colors.grey[600],
                          inherit: true,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    mahasiswa.prodi,
                    style: TextStyle(
                      fontFamily: GoogleFonts.poppins().fontFamily,
                      fontSize: 14,
                      color: Colors.grey[700],
                      inherit: true,
                    ),
                  ),
                ],
              ),
            ),
            
            SizedBox(height: 12),
            
            // Quote
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                '"Satu pria bahagia, 19 juta lainnya menunggu lapangan kerja."',
                style: TextStyle(
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  fontSize: 12,
                  fontStyle: FontStyle.italic,
                  color: Colors.grey[600],
                  inherit: true,
                ),
              ),
            ),
            
            SizedBox(height: 16),
            
            // Tabs Menu
            MenuTabs(),
            
            SizedBox(height: 8),
            
            // Content berdasarkan menu yang dipilih
            BlocBuilder<VisibilityCubit, bool>(
              builder: (context, isVisible) {
                if (!isVisible) {
                  return Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: Column(
                      children: [
                        Icon(
                          Icons.visibility_off,
                          size: 64,
                          color: Colors.grey[400],
                        ),
                        SizedBox(height: 16),
                        Text(
                          "Informasi disembunyikan",
                          style: TextStyle(
                            fontFamily: GoogleFonts.poppins().fontFamily,
                            fontSize: 16,
                            color: Colors.grey[600],
                            inherit: true,
                          ),
                        ),
                      ],
                    ),
                  );
                }
                
                return BlocBuilder<MenuCubit, MenuType>(
                  builder: (context, currentMenu) {
                    switch (currentMenu) {
                      case MenuType.profile:
                        return _buildProfileSection();
                      case MenuType.hobbies:
                        return _buildHobbiesSection();
                      case MenuType.skills:
                        return _buildSkillsSection();
                      case MenuType.contact:
                        return _buildContactSection();
                    }
                  },
                );
              },
            ),
            
            SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
  
  Widget _buildProfileSection() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          // About Section
          SectionCard(
            title: "Tentang",
            child: Text(
              "Halo, saya Sahrul Julistiawan, saat ini saya sedang berkuliah di Universitas Teknologi Bandung. Saya mengambil program studi Teknik Inforamtika, sekarang saya sudah semester 5. Saya juga sekarang sedang membutuhkan pekerjaan.",
              style: TextStyle(
                fontFamily: GoogleFonts.poppins().fontFamily,
                fontSize: 13,
                height: 1.5,
                inherit: true,
              ),
            ),
          ),
          
          SizedBox(height: 12),
          
          // Profile Info Section
          SectionCard(
            title: "Sahrul Julistiawan",
            child: Column(
              children: [
                InfoCard(
                  icon: Icons.badge,
                  text: mahasiswa.nim,
                ),
                SizedBox(height: 8),
                InfoCard(
                  icon: Icons.book,
                  text: mahasiswa.prodi,
                ),
                SizedBox(height: 8),
                InfoCard(
                  icon: Icons.meeting_room,
                  text: mahasiswa.kelas,
                ),
                SizedBox(height: 8),
                InfoCard(
                  icon: Icons.school,
                  text: mahasiswa.univ,
                ),
                SizedBox(height: 8),
                InfoCard(
                  icon: Icons.star,
                  text: ProfileData.getStatusText(mahasiswa.statusMahasiswa),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  
  Widget _buildHobbiesSection() {
    final hobbies = ProfileData.getHobbies(mahasiswa);
    
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SectionCard(
        title: "Hobbies",
        child: ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: hobbies.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: HobbyItem(hobby: hobbies[index]),
            );
          },
        ),
      ),
    );
  }
  
  Widget _buildSkillsSection() {
    final skills = ProfileData.getSkills(mahasiswa);
    
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: skills.map((category) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: SectionCard(
              title: "${category['category']}",
              child: GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  childAspectRatio: 1,
                ),
                itemCount: category['items'].length,
                itemBuilder: (context, index) {
                  final item = category['items'][index];
                  return SkillItem(
                    name: item['name'],
                    icon: item['icon'],
                  );
                },
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
  
  Widget _buildContactSection() {
    final contacts = ProfileData.getContact(mahasiswa);
    
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SectionCard(
        title: "Sahrul Contact",
        child: ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: contacts.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: ContactItem(
                type: contacts[index]['type'],
                value: contacts[index]['value'],
                icon: contacts[index]['icon'],
              ),
            );
          },
        ),
      ),
    );
  }
}