import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_app_zebra_technology/injection_container.dart';
import 'package:sample_app_zebra_technology/presentation/bloc/flower_bloc.dart';
import 'package:sample_app_zebra_technology/presentation/pages/flower_details_page.dart';
import 'package:sample_app_zebra_technology/presentation/widget/loading_widget.dart';
import 'package:sample_app_zebra_technology/presentation/widget/message_display.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: Row(
          children: const [
            Icon(Icons.menu),
          ],
        ),
      ),
      body: BlocProvider(
        create: (context) => sl<FlowerBloc>()..add(GetFlowerEvent()),
        child: BlocBuilder<FlowerBloc, FlowerState>(
          builder: (context, state) {
            if (state is Loaded) {
              return ListView.builder(
                itemCount: state.flowerList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(state.flowerList[index].tag[0]),
                    trailing: const Icon(Icons.arrow_right),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) =>
                              FlowerLandingPage(flower: state.flowerList[index]),
                        ),
                      );
                    },
                  );
                },
              );
            } else if (state is Loading) {
              return const LoadingWidget();
            } else {
              return const MessageDisplay(
                message: "Error occurred!",
              );
            }
          },
        ),
      ),
    );
  }
}
