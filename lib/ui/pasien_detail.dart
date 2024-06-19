import 'package:flutter/material.dart';
import 'package:klinik_app/model/pasien.dart';
import 'package:klinik_app/service/pasien_service.dart';
import 'package:klinik_app/service/poli_service.dart';
import 'package:klinik_app/ui/pasien_form_page.dart';
import 'package:klinik_app/ui/pasien_form_update.dart';
import 'package:klinik_app/ui/poli_form_page.dart';
import 'package:klinik_app/ui/poli_form_update_page.dart';
import '../model/poli.dart';

class PasienDetailPage extends StatefulWidget {
  final Pasien pasien;

  const PasienDetailPage({super.key, required this.pasien});

  @override
  State<PasienDetailPage> createState() => _PasienDetailPageState();
}

class _PasienDetailPageState extends State<PasienDetailPage> {
  PasienService _pasienServiceNew = PasienService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Detail Pasien"),),
      body: Column(
        children: [
          SizedBox(height: 20),
          Text(
            "Nama Pasien : ${widget.pasien.nm_pasien!}",
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _tombolubah(),
              _tombolhapus()
            ],
          )
        ],
      )
    );
  }

  _tombolubah(){
    return ElevatedButton(
      onPressed: (){
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => PasienUpdateForm(pasien: widget.pasien))
        );
      },
      style: ElevatedButton.styleFrom(backgroundColor: Colors.orange, foregroundColor: Colors.white),
      child: Text("Ubah"),
    );
  }

  _tombolhapus(){
    return ElevatedButton(
      onPressed: (){
        AlertDialog alertDialog = AlertDialog(
          content: Text("Yakin ingin menghapus data ini?"),
          actions: [
            // tombol ya
            ElevatedButton(
              onPressed: () async {
                await _pasienServiceNew.deletePasien(widget.pasien.id!);
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => PasienForm()));
              },
              child: Text("YA"),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red, foregroundColor: Colors.white),
            ),

            // tombol batal
            ElevatedButton(
              onPressed: (){
                Navigator.pop(context);
              },
              child: Text("Tidak"),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.grey, foregroundColor: Colors.black),
            )
          ],
        );
        showDialog(context: context, builder: (context) => alertDialog);
      },
      style: ElevatedButton.styleFrom(backgroundColor: Colors.red, foregroundColor: Colors.white),
      child: Text("Hapus"),
    );
  }
}