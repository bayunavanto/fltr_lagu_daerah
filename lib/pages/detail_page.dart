import 'package:flutter/material.dart';
import 'package:flutter_lagu_daerah_app/models/province.dart';

class DetailPage extends StatefulWidget {
  final Province province;
  const DetailPage({super.key, required this.province});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(widget.province.nama),
      //   elevation: 2,
      //   centerTitle: true,
      // ),
      appBar: AppBar(
        title: Text(
          widget.province.nama,
        ),
        centerTitle: true,
        elevation: 2,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                  'https://img.freepik.com/free-vector/classic-vintage-floral-texture-background_1017-32274.jpg?t=st=1723601909~exp=1723605509~hmac=69a3d085b1829ba6eaf4b57f86f3165522fe0dde6622f7d13ac30dc793c55818&w=826'), // Ganti dengan URL gambar yang kamu inginkan
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text(
            widget.province.laguDaerah,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            '${widget.province.nama} - ${widget.province.ibuKota}',
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 12,
          ),
          Image.network(
            widget.province.photo,
            height: 300,
          ),
          const SizedBox(
            height: 12,
          ),
          Container(
            decoration: const BoxDecoration(
                color: Color.fromARGB(255, 240, 230, 230),
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: Text(
              widget.province.lirikLaguDaerah,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 14),
            ),
          )
        ],
      ),
    );
  }
}
