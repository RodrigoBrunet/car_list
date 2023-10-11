import 'package:car_list/blocs/car_bloc.dart';
import 'package:car_list/blocs/car_events.dart';
import 'package:car_list/blocs/car_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class CarPage extends StatefulWidget {
  const CarPage({super.key});

  @override
  State<CarPage> createState() => _CarPageState();
}

class _CarPageState extends State<CarPage> {
  late final CarBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = CarBloc();
    bloc.add(LoadCarEvent());
  }

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Car List'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24),
          child: BlocBuilder<CarBloc, CarState>(
            bloc: bloc,
            builder: (context, state) {
              if (state is CarInitalState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is CarSuccessState) {
                final carList = state.cars;
                return ListView.separated(
                  itemCount: carList.length,
                  itemBuilder: (context, index) => ListTile(
                    leading: CircleAvatar(
                        child: ClipRRect(
                      child: Text(carList[index].brand.substring(0, 1)),
                    )),
                    title:
                        Text('${carList[index].brand} ${carList[index].model}'),
                  ),
                  separatorBuilder: (_, __) => const Divider(
                    color: Colors.transparent,
                  ),
                );
              }
              return const Text('Error');
            },
          ),
        ));
  }
}
