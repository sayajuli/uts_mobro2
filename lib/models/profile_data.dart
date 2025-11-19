import 'profile_model.dart';

class ProfileData {
  static Mahasiswa getMahasiswa() {
    return Mahasiswa(
      nama: "Sahrul Julistiawan",
      nim: "2355201145",
      kelas: "TIF K 23A",
      prodi: "Teknik Informatika",
      univ: "Universitas Teknologi Bandung",
      profilPicUrl: "assets/images/PP2.png",
      bannerPicUrl: "assets/images/Banner.png",
      statusMahasiswa: StatusMahasiswa.aktif,
      hobbies: ["Nonton Anime", "Main Game Umamusume", "Billiard"],
      skills: [
        {
          "category": "Tools",
          "items": [
            {"name": "Git", "icon": "git"},
            {"name": "Github", "icon": "github"},
            {"name": "Docker", "icon": "docker"},
          ],
        },
        {
          "category": "Programming Languages and Frameworks",
          "items": [
            {"name": "JavaScript", "icon": "js"},
            {"name": "Java", "icon": "java"},
            {"name": "PHP", "icon": "php"},
            {"name": "TypeScript", "icon": "ts"},
            {"name": "React", "icon": "react"},
            {"name": "NodeJs", "icon": "nodejs"},
            {"name": "Bootstrap", "icon": "bootstrap"},
          ],
        },
        {
          "category": "Databases",
          "items": [
            {"name": "MongoDb", "icon": "mongodb"},
            {"name": "MySQL", "icon": "mysql"},
            {"name": "PostgreeSQL", "icon": "postgree"},
          ],
        },
      ],
      contact: [
        {"type": "username", "value": "@sahruljuli_", "icon": "instagram"},
        {"type": "name", "value": "Sahrul Julistiawan", "icon": "facebook"},
        {"type": "name", "value": "Sahrul Julistiawan", "icon": "linkedin"},
        {"type": "name", "value": "sayajuli", "icon": "github"},
        {"type": "email", "value": "sahruljulistia1@gmail.com", "icon": "envelope"},
      ],
    );
  }

  static String getStatusText(StatusMahasiswa status) {
    switch (status) {
      case StatusMahasiswa.aktif:
        return "Mahasiswa Aktif";
      case StatusMahasiswa.cuti:
        return "Mahasiswa Cuti";
      case StatusMahasiswa.lulus:
        return "Mahasiswa Lulus";
    }
  }

  static List<String> getHobbies(Mahasiswa mahasiswa) {
    return mahasiswa.hobbies;
  }

  static List<Map<String, dynamic>> getSkills(Mahasiswa mahasiswa) {
    return mahasiswa.skills;
  }

  static List<Map<String, dynamic>> getContact(Mahasiswa mahasiswa) {
    return mahasiswa.contact;
  }
}
