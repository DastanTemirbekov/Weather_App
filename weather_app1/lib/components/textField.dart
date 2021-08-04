import 'package:flutter/material.dart';
import 'package:weather_app1/bloc/weather_bloc.dart';
import 'package:weather_app1/bloc/weather_repository.dart';

class TextField1 extends StatelessWidget {
   TextField1({ Key? key, this.cityTextController, this.search}) : super(key: key);
    final TextEditingController? cityTextController;
  //final bloc = WeatherBloc(WeatherRepository());
Function? search;
  @override
  Widget build(BuildContext context) {
    return                        TextField(
          controller: cityTextController,
          decoration: InputDecoration(
            suffixIcon: IconButton(
                icon: Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
                onPressed: () {
                  search!();
                 // bloc.add(GetWeatherEvent(cityTextController!.text));
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
        );
      
    
  }
}