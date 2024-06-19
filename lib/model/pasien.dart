import 'package:cloud_firestore/cloud_firestore.dart';

class Pasien {
  final String? id;
  final String? nm_pasien;
  final String? nomor_rm;
  final String? nomor_telepon;
  final String? alamat;
  final String? tanggal_lahir;

  Pasien({this.id, this.nm_pasien, this.nomor_rm, this.nomor_telepon, this.alamat, this.tanggal_lahir});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nm_pasien': nm_pasien,
      'nomor_rm' : nomor_rm,
      'nomor_telepon' : nomor_telepon,
      'alamat' : alamat,
      'tanggal_lahir' : tanggal_lahir
    };
  }

  Pasien.fromDocumentSnapshot(DocumentSnapshot<Map<String, dynamic>> doc)
      : id = doc.id,
        nm_pasien = doc.data()!['nm_pasien'],
        nomor_rm = doc.data()!['nomor_rm'],
        nomor_telepon = doc.data()!['nomor_telepon'],
        alamat = doc.data()!['alamat'],
        tanggal_lahir = doc.data()!['tanggal_lahir'];
}