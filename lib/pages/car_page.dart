import 'dart:math';

import 'package:car_list/blocs/car_bloc.dart';
import 'package:car_list/blocs/car_events.dart';
import 'package:car_list/blocs/car_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import '../models/car_model.dart';

class CarPage extends StatefulWidget {
  const CarPage({super.key});

  @override
  State<CarPage> createState() => _CarPageState();
}

class _CarPageState extends State<CarPage> {
  late final CarBloc bloc;
  String textBrand = 'Jaguar';
  String textModel = 'JX-25';
  String textColor = 'Green';

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

  addCar(Car car) {}

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
              if (state is CarLoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is CarLoadedState) {
                final carList = state.cars;
                return Column(
                  children: [
                    Expanded(
                      child: ListView.separated(
                        itemCount: carList.length,
                        itemBuilder: (context, index) => ListTile(
                          leading: CircleAvatar(
                              child: ClipRRect(
                            child: Text(carList[index].brand.substring(0, 1)),
                          )),
                          title: Text(
                              '${carList[index].brand} ${carList[index].model} - ${carList[index].color}'),
                          trailing: IconButton(
                              onPressed: () {
                                bloc.add(RemoveCarEvent(car: carList[index]));
                              },
                              icon: const Icon(Icons.delete)),
                        ),
                        separatorBuilder: (_, __) => const Divider(
                          color: Colors.transparent,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: CircleAvatar(
                            maxRadius: 32,
                            child: IconButton(
                              iconSize: 32,
                              onPressed: () {
                                bloc.add(AddCarEvent(
                                    car: Car(
                                  brand: textBrand,
                                  model: textModel,
                                  color: textColor,
                                )));
                              },
                              icon: const Icon(
                                Icons.add,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                );
              }
              return const Center(child: Text('Error'));
            },
          ),
        ));
  }
}
