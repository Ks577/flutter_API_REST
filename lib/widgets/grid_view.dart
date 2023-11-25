import 'package:flutter/material.dart';
class GifView extends StatelessWidget {
  late Future<List<dynamic>> gifsList;
  GifView({Key? key, required this.gifsList}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        child: FutureBuilder(
            future: gifsList,
            builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
              if (snapshot.hasData && snapshot.data != null) {
                return GridView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: snapshot.data!.length,
                    gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                    ),
                    itemBuilder: ((context, index) {
                      return SizedBox(
                        width: 100,
                        height: 100,
                        child: Image.network(
                          snapshot.data![index]['images']['original']["url"],
                          fit: BoxFit.fitWidth,
                        ),
                      );
                    }));
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              // By default, show a loading spinner.
              return const CircularProgressIndicator();
            }),
      ),
    );
  }
}