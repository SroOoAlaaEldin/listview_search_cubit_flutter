import 'package:con_bloc/cubit/cubit/myfriends_cubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fliter With Cubit',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple),
        useMaterial3: true,
      ),
      home: BlocProvider<MyfriendsCubit>(
        create: (context) => MyfriendsCubit(),
        child: MyHomePage(title: 'ListView Friends'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  String title;
  MyHomePage({super.key, required this.title});
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext build) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Text(
          'ListView',
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(right: 5, left: 5),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            TextField(
              onChanged: (value) {
                context.read<MyfriendsCubit>().FilterFriend(value);
              },
              decoration: const InputDecoration(
                suffixIcon: Icon(Icons.search),
                labelText: 'Search',
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(child: BlocBuilder<MyfriendsCubit, MyfriendsState>(
              builder: (context, state) {
                if (state is MyfriendsInitialState) {
                  return buildFriendsList(state.friends);
                } else if (state is MyfriendsFilterSearch) {
                  return buildFriendsList(state.filterFriends);
                }
                return Container();
              },
            )),
          ],
        ),
      ),
    );
  }
}

Widget buildFriendsList(List<Map<String, dynamic>> fetchFriends) {
  return ListView.builder(
      itemCount: fetchFriends.length,
      itemBuilder: (context, index) {
        final player = fetchFriends[index];
        return ListTile(
          leading: Container(
            width: 75,
            height: 75,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.purple,
            ),
            child: const Icon(Icons.person, size: 30, color: Colors.white),
          ),
          title: Text(player['name']),
          subtitle: Text(player['country']),
        );
      });
}
