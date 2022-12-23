import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_app_zebra_technology/injection_container.dart';
import 'package:sample_app_zebra_technology/presentation/bloc/flower_bloc.dart';
import 'package:sample_app_zebra_technology/presentation/widget/category_list_view.dart';
import 'package:sample_app_zebra_technology/presentation/widget/loading_widget.dart';
import 'package:sample_app_zebra_technology/presentation/widget/message_display.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Row(
          children: [
            const Icon(
              Icons.menu,
              color: Colors.black,
            ),
            const SizedBox(
              width: 20,
            ),
            SizedBox(
              height: 40,
              width: 200,
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  hintText: 'Search',
                ),
              ),
            ),
            const Spacer(),
            const Icon(
              Icons.shopping_cart_rounded,
              color: Colors.black,
            ),
            const SizedBox(
              width: 20,
            ),
            const Icon(
              Icons.person,
              color: Colors.black,
            ),
          ],
        ),
      ),
      body: BlocProvider(
        create: (context) => sl<FlowerBloc>()..add(GetFlowerEvent()),
        child: BlocBuilder<FlowerBloc, FlowerState>(
          builder: (context, state) {
            if (state is Loaded) {
              return CategoryFlowerListView(
                categoryFlowerList: state.flowerCategorizedList,
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
