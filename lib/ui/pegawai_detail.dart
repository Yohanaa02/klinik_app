import 'package:flutter/material.dart';
import 'package:klinik_app/ui/pegawai_page.dart';
import 'package:klinik_app/ui/pegawai_update_form_page.dart';
import '../model/pegawai.dart';

class PegawaiDetail extends StatefulWidget {
  final Pegawai pegawai;

  const PegawaiDetail({super.key, required this.pegawai});

  @override
  State<PegawaiDetail> createState() => _PegawaiDetailState();
}

class _PegawaiDetailState extends State<PegawaiDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Detail Pegawai")),
      body: Column(
        children: [
          SizedBox(height: 10),
          Text(
            "ID Pegawai : ${widget.pegawai.idPegawai}",
            style: TextStyle(fontSize: 15),
          ),

          SizedBox(height: 10),
          Text(
            "Nama Pegawai : ${widget.pegawai.namaPegawai}",
            style: TextStyle(fontSize: 15),
          ),

          SizedBox(height: 10),
          Text(
            "NIP : ${widget.pegawai.nip}",
            style: TextStyle(fontSize: 15),
          ),


          SizedBox(height: 10),
          Text(
            "Nomor Telepon : ${widget.pegawai.nomor_telepon}",
            style: TextStyle(fontSize: 15),
          ),

          SizedBox(height: 10),
          Text(
            "Email : ${widget.pegawai.email}",
            style: TextStyle(fontSize: 15),
          ),

          SizedBox(height: 10),
          Text(
            "Password : ${widget.pegawai.password}",
            style: TextStyle(fontSize: 15),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _tombolUbah(),
              _tombolHapus()
            ],
          )
        ],
      ),
    );
  }
  Widget _tombolUbah() {
    return ElevatedButton(
        onPressed: (){
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => PegawaiUpdateFormPage(pegawai: widget.pegawai)
              )
          );
        },
        style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
        child: const Text("Ubah"));
  }

  _tombolHapus() {
    return ElevatedButton(
        onPressed: () {
          AlertDialog alertDialog = AlertDialog(
            content: const Text("Yakin ingin menghapus data ini?"),
            actions: [
              // tombol ya
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => PegawaiPage()));
                },
                child: const Text("YA"),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              ),
              // tombol batal
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Tidak"),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              )
            ],
          );
          showDialog(context: context, builder: (context) => alertDialog);
        },
        style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
        child: const Text("Hapus"));
  }
}