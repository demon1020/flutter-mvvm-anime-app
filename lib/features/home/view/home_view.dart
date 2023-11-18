import '/core.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();

    final provider = Provider.of<HomeViewViewModel>(context, listen: false);
    provider.fetchAnimeListApi();
  }

  @override
  Widget build(BuildContext context) {
    final userPreference = Provider.of<UserViewModel>(context);
    final provider = Provider.of<HomeViewViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Anime'),
        automaticallyImplyLeading: false,
        actions: [
          InkWell(
              onTap: () {
                userPreference.remove().then((value) {
                  Navigator.pushNamed(context, RoutesName.login);
                });
              },
              child: const Center(child: Text('Logout'))),
          const SizedBox(
            width: 20,
          )
        ],
      ),
      body: buildHomeScreen(provider),
    );
  }

  buildHomeScreen(HomeViewViewModel provider) {
    switch (provider.animeList.status) {
      case Status.loading:
        return const HomeViewSkeleton();
      case Status.error:
        return Center(child: Text(provider.animeList.message.toString()));
      case Status.completed:
        return buildAnimeListView(provider.animeList.data!);
      default:
        return const Text('No Data');
    }
  }

  Widget buildAnimeListView(AnimeListModel animeList) {
    return Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: StaggeredGrid.count(
            crossAxisCount: 2,
            mainAxisSpacing: 4,
            crossAxisSpacing: 4,
            children:
                List.generate(animeList.data.length, (index) {
              var item = animeList.data[index];
              return InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => AnimeDetailView(
                        item: item,
                      ),
                    ),
                  );
                },
                child: Card(
                  child: Container(
                    height: 310,
                    // alignment: Alignment.bottomCenter,
                    decoration: BoxDecoration(
                      color: Colors.primaries[index % 10].withOpacity(0.1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Stack(
                          children: [
                            Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Colors.primaries[index % 10]
                                    .withOpacity(0.1),
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
                                  height: 250,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                  image: NetworkImage(item.image),
                                ),
                              ),
                            ),

                            Positioned(
                              left: 5,
                              bottom: 5,
                              child: AppChip(
                                place: 'Ranking : ',
                                value: item.ranking.toString(),
                              ),
                            ),
                            Positioned(
                              right: 5,
                              bottom: 5,
                              child: AppChip(
                                place: 'E : ',
                                value: item.episodes.toString(),
                              ),
                            ),
                            Positioned(
                              right: 5,
                              top: 5,
                              child: AppChip(
                                place: '',
                                value: item.type.toString(),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          height: 60,
                          width: double.infinity,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color:
                                Colors.primaries[index % 10].withOpacity(0.1),
                            borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10)),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            item.title,
                            textAlign: TextAlign.center,
                            style:
                                const TextStyle(fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
      );
  }
}

