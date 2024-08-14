import 'package:flutter/material.dart';
import 'package:flutter_lagu_daerah_app/models/province.dart';
import 'package:flutter_lagu_daerah_app/pages/detail_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text(
      //     'Lagu Daerah',
      //     style: TextStyle(color: Colors.white),
      //   ),
      //   centerTitle: true,
      //   elevation: 2,
      //   backgroundColor: Colors.blueAccent,
      // ),
      appBar: AppBar(
        title: const Text(
          'Lagu Daerah',
          style: TextStyle(color: Colors.black),
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
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Jumlah kolom dalam grid
          crossAxisSpacing: 8.0, // Spasi horizontal antara item grid
          mainAxisSpacing: 8.0, // Spasi vertikal antara item grid
          childAspectRatio: 3 / 2, // Rasio lebar/tinggi dari tiap item
        ),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return DetailPage(
                  province: laguDaerahList[index],
                );
              }));
            },
            child: Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Image.network(
                      laguDaerahList[index].photo,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          laguDaerahList[index].laguDaerah,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '${laguDaerahList[index].nama} - ${laguDaerahList[index].ibuKota}',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        itemCount: laguDaerahList.length,
      ),
    );
  }
}
