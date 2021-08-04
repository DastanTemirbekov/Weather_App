import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app1/bloc/weather_bloc.dart';
import 'package:weather_app1/bloc/weather_repository.dart';
import 'package:weather_app1/components/loading.dart';
import 'package:weather_app1/components/textField.dart';

class WeatherApp extends StatefulWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  _WeatherAppState createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  final _cityTextController = TextEditingController();
  final bloc = WeatherBloc(WeatherRepository());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather App'),
        centerTitle: true,
        backgroundColor: Colors.cyan,
      ),
      body: Center(
        child: Stack(children: [
          Image.asset(
            'assets/images/hand.jpg',
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: BlocBuilder<WeatherBloc, WeatherState>(
              bloc: bloc,
              builder: (context, state) {
                if (state is WeatherInitial) {
                  return Column(
                    children: [
                      SizedBox(height: 100),
//TextField1(cityTextController: _cityTextController,),
                      TextField1(
                        search: () {
                          bloc.add(GetWeatherEvent(_cityTextController.text));
                        },
                        cityTextController: _cityTextController,
                      ),
                    ],
                  );
                } else if (state is WeatherLoading) {
                  return Loading();
                } else if (state is WeatherLoaded) {
                  return Column(
                    children: [
                      SizedBox(height: 100),
                      TextField1(
                        search: () {
                          bloc.add(GetWeatherEvent(_cityTextController.text));
                        },
                        cityTextController: _cityTextController,
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
                } else if (state is WeatherError) {
                  return Column(children: [
                    SizedBox(height: 100),
                    TextField1(
                      search: () {
                        bloc.add(GetWeatherEvent(_cityTextController.text));
                      },
                      cityTextController: _cityTextController,
                    ),
                    SizedBox(height: 45),
                    Text(state.message)
                  ]);
                }
                return Text("error");
              },
            ),
          ),
        ]),
      ),
    );
  }
}
