import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app1/bloc/weather_bloc.dart';
import 'package:weather_app1/bloc/weather_repository.dart';
import 'package:google_fonts/google_fonts.dart';

class Loaded extends StatefulWidget {
  const Loaded({Key? key}) : super(key: key);

  @override
  _LoadedState createState() => _LoadedState();
}

class _LoadedState extends State<Loaded> {
  final _cityTextController = TextEditingController();
  final bloc = WeatherBloc(WeatherRepository());

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBloc, WeatherState>(
        bloc: bloc,
        builder: (context, state) {
          if (state is WeatherLoaded) {
            return Column(
              children: [
                SizedBox(height: 100),
                TextField(
                  controller: _cityTextController,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                        icon: Icon(
                          Icons.search,
                          color: Colors.grey,
                        ),
                        onPressed: () {
                          bloc.add(GetWeatherEvent(_cityTextController.text));
                        }),
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Введите город',
                    hintStyle: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 0.5),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(height: 45),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      '${state.model.cityName}',
                      style: GoogleFonts.lato(
                          fontSize: 45,
                          fontWeight: FontWeight.w500,
                          color: Colors.white70),
                    ),
                    Column(
                      children: [
                        Row(children: [
                          Image.network(
                            state.model.iconUrl,
                            scale: 1.5,
                          ),
                          Text(
                            '${state.model.weatherInfo!.description!}',
                            style: GoogleFonts.lato(
                                fontSize: 15, color: Colors.white70),
                          ),
                        ]),
                        Text(
                          '${state.model.tempInfo?.temperature}°C',
                          style: GoogleFonts.lato(
                              fontSize: 45,
                              fontWeight: FontWeight.w500,
                              color: Colors.white70),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            );
          }
          return Text("error");
        });
  }
}
