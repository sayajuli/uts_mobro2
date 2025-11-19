enum StatusMahasiswa {
  aktif,
  cuti,
  lulus
}

class Mahasiswa {
  final String nama;
  final String nim;
  final String kelas;
  final String prodi;
  final String univ;
  final String profilPicUrl;
  final String bannerPicUrl;
  final StatusMahasiswa statusMahasiswa;
  final List<String> hobbies;
  final List<Map<String, dynamic>> skills;
  final List<Map<String, dynamic>> contact;


  Mahasiswa({
    required this.nama,
    required this.nim,
    required this.kelas,
    required this.prodi,
    required this.univ,
    required this.profilPicUrl,
    required this.bannerPicUrl,
    required this.statusMahasiswa,
    required this.hobbies,
    required this.skills,
    required this.contact
  });
}

