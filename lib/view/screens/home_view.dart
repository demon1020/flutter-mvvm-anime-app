
import '../../core.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  @override
  void initState() {
    super.initState();

    final provider = Provider.of<HomeViewViewModel>(context,listen: false);
    provider.fetchMoviesListApi();
  }

  
  @override
  Widget build(BuildContext context) {
    final userPrefernece = Provider.of<UserViewModel>(context);
    final provider = Provider.of<HomeViewViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movies'),
        automaticallyImplyLeading: false,
        actions: [
          InkWell(
              onTap: (){
                userPrefernece.remove().then((value){
                  Navigator.pushNamed(context, RoutesName.login);
                });
              },
              child: const Center(child: Text('Logout'))),
          const SizedBox(width: 20,)
        ],
      ),
      body: buildHomeScreen(provider),
    );
  }

  buildHomeScreen(provider){
    switch(provider.moviesList.status){
      case Status.loading:
        return const Center(child: CircularProgressIndicator());
      case Status.error:
        return Center(child: Text(provider.moviesList.message.toString()));
      case Status.completed:
        return Container(
          margin: const EdgeInsets.all(10),
          child: ListView.builder(
              itemCount: provider.moviesList.data!.movies!.length,
              itemBuilder: (context,index){
                var item = provider.moviesList.data!.movies![index];
                return Card(
                  child: ListTile(

                    leading: Image.network(

                      item.posterurl.toString(),
                      errorBuilder: (context, error, stack){
                        return const Icon(Icons.error, color: Colors.red,);
                      },
                      height: 40,
                      width: 40,
                      fit: BoxFit.cover,
                    ),
                    title: Text(item.title.toString()),
                    subtitle: Text(item.year.toString()),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(Utils.averageRating(item.ratings!).toStringAsFixed(1)),
                        const Icon(Icons.star , color: Colors.yellow,)
                      ],
                    ),
                  ),
                );
              }),
        );
      default:
        return const Text('No Data');
    }
  }
}
