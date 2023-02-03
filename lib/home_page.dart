import 'package:bloc_sample_list/repositories/user_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/user_bloc.dart';
import 'bloc/user_event.dart';
import 'bloc/user_state.dart';
import 'model/user_model.dart';
class HomePage extends StatelessWidget {
  const HomePage({super.key, required String title});

  @override
  Widget build(BuildContext context) {
    //By using multiblocprovider you can add multiple blocs in your class
    //In build method we inject the userRepository
    return MultiBlocProvider(
      providers: [
        BlocProvider<UserBloc>(
          create: (BuildContext context) => UserBloc(UserRepository()),
        ),
      ],
      child: Scaffold(
          appBar: AppBar(title: const Text('The BloC App')),
          body: blocBody()),
    );
  }

  Widget blocBody() {
    return BlocProvider(
      //when the bloc is created it goes to event triggered and emit the state
      create: (context) => UserBloc(
        UserRepository(),
      )..add(LoadUserEvent()),
      child: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          if (state is UserLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is UserErrorState) {
            return const Center(child:  Text("Error"));
          }
          if (state is UserLoadedState) {
            List<UserModel> userList = state.users;
            return ListView.builder(
                itemCount: userList.length,
                itemBuilder: (_, index) {
                  return Padding(
                    padding:
                    const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                    child: Card(
                      // color: Theme.of(context).primaryColor,
                        child: ListTile(
                            title: Text(
                              '${userList[index].firstName}  ${userList[index].lastName}',
                              style: const TextStyle(color: Colors.black),
                            ),

                            subtitle: Text(
                              '${userList[index].email}',
                              style: const TextStyle(color: Colors.black),
                            ),

                            leading: CircleAvatar(
                              backgroundImage: NetworkImage(
                                  userList[index].avatar.toString()),
                            ))),
                  );
                });
          }

          return Container();
        },
      ),
    );
  }
}
