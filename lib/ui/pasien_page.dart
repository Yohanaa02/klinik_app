import 'package:flutter/material.dart';
import '../widget/sidebar.dart';
import 'package:klinik_app/constant.dart';
import 'package:klinik_app/model/pasien.dart';
import 'package:klinik_app/model/poli.dart';
import 'package:klinik_app/ui/pasien_form_page.dart';
import 'package:klinik_app/ui/pasien_item_page.dart';
import 'package:klinik_app/ui/poli_detail_page.dart';
import 'package:klinik_app/ui/poli_form_page.dart';
import 'package:klinik_app/ui/poli_item_page.dart';
class PasienPage extends StatefulWidget {
  const PasienPage({super.key});

  @override
  State<PasienPage> createState() => _PasienPageState();
}

class _PasienPageState extends State<PasienPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Sidebar(),
        appBar: AppBar(
          title: const Text("Data Pasien"),
          backgroundColor: Palette.,
          foregroundColor: Colors.white,
          actions: [
            GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PasienFormPage()));
                },
                child: Padding(
                  padding: EdgeInsets.all(8.10),
                  child: Icon(Icons.add),
                )
            )
          ],
        ),
        body: ListView(
          children: [
            PasienItemPage(pasien : Pasien(namaPasien: "Safira")),
            PasienItemPage(pasien : Pasien(namaPasien: "Na Jaemin")),
          ],
        )
    );
  }
}