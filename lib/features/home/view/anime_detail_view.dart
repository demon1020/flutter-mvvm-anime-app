import '/core.dart';

class AnimeDetailView extends StatelessWidget {
  final Anime item;

  const AnimeDetailView({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.all(10),
          alignment: Alignment.center,
          child: Card(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.primaries[5 % 10].withOpacity(0.1),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                          ),
                        ),
                        child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                          ),
                          child: Image(
                            width: double.infinity,
                            fit: BoxFit.cover,
                            image: NetworkImage(item.image),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 10,
                        top: 10,
                        child: GestureDetector(
                          onTap: (){
                            Navigator.pop(context);
                          },
                          child: const AppChip(
                            child: Icon(
                              Icons.arrow_back,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 10,
                        bottom: 10,
                        child: AppChip(
                          place: 'Ranking : ',
                          value: item.ranking.toString(),
                        ),
                      ),
                      Positioned(
                        right: 10,
                        bottom: 10,
                        child: AppChip(
                          place: 'E : ',
                          value: item.episodes.toString(),
                        ),
                      ),
                      Positioned(
                        right: 10,
                        top: 10,
                        child: AppChip(
                          place: '',
                          value: item.type.toString(),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    item.title,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                    width: 30,
                    child: Divider(
                      thickness: 2,
                    ),
                  ),
                  AppWidget.buildWrap(item.genres),
                  const SizedBox(height: 20),
                  const Text(
                    "Synopsis",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                    width: 30,
                    child: Divider(
                      thickness: 2,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(10),
                    child: ReadMoreText(
                      item.synopsis,
                      trimLines: 2,
                      colorClickableText: Colors.pink,
                      trimMode: TrimMode.Line,
                      trimCollapsedText: 'Show more',
                      trimExpandedText: 'Show less',
                      moreStyle: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                      lessStyle: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class AppWidget {
  static Widget buildEvenRow(
      {required String placeHolder, required String value}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            placeHolder,
            // style: AppStyle.titleTextStyleMedium(),
          ),
          Text(
            value,
            // style: AppStyle.titleTextStyleMedium(),
          ),
        ],
      ),
    );
  }

  static Wrap buildWrapFromMap(Map map) {
    return Wrap(
      alignment: WrapAlignment.center,
      children: map.entries.map((entry) {
        return Card(
          color: Colors.primaries[entry.value % 10].withOpacity(0.5),
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
            padding: const EdgeInsets.all(5),
            child: Text(
              '${entry.key} : ${entry.value}',
              // style: AppStyle.bodyTextStyle(),
            ),
          ),
        );
      }).toList(),
    );
  }

  static Wrap buildWrap(dynamic item) {
    return Wrap(
      alignment: WrapAlignment.center,
      children: List.generate(
        item.length,
        (index) => Card(
          color: Colors.primaries[index % 10].withOpacity(0.5),
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
            padding: const EdgeInsets.all(5),
            child: Text(
              item[index],
              // style: AppStyle.bodyTextStyle(),
            ),
          ),
        ),
      ),
    );
  }
}
