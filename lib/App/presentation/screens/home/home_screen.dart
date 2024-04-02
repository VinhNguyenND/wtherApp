import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:my_weather/Data/Resource/Dto/Request/weather_request.dart';
import 'package:my_weather/di.dart';

import '../../../../Domain/Usecases/WeatherUsecase/weather_usecase.dart';
import '../../../../gen/assets.gen.dart';
import '../../../core/constants/app_colors.dart';
import 'localWeather/blocWeather/localBloc.dart';
import 'localWeather/blocWeather/localState.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomePage();
  }
}

class HomePage extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => LocalBloc(useCase: getIt<WeatherUseCase>()),),
          ],
          child: Scaffold(
              appBar: PreferredSize(
                  preferredSize: Size.fromHeight(30), child: AppBar()),
              backgroundColor: AppColors.grey,
              body: WeatherHomeBody()),
        ),
      ),
    );
  }
}

class WeatherHomeBody extends StatefulWidget {
  const WeatherHomeBody({super.key});

  @override
  State<WeatherHomeBody> createState() => _WeatherHomeBodyState();
}

class _WeatherHomeBodyState extends State<WeatherHomeBody> {
  @override
  void initState() {
    // super.initState();
    final LocalBloc localBloc = BlocProvider.of<LocalBloc>(context);
    // getLocation().then((value) =>localBloc.getLocalWeather((WeatherRequest(lat: value.latitude.toString(), lon: value.longitude.toString()))) );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          BlocBuilder<LocalBloc, LocalState>(
            builder: (context, state) {
              if (state.status == Status.loading) {
                return WeatherLocation(
                    DateTime: "12:00:00 ", Location: "ha noi", degreee: 36);
              } else if (state.status == Status.success) {
                return WeatherLocation(
                    DateTime: state.list[0].datetime.toString(),
                    Location: state.list[0].cityName.toString(),
                    degreee:
                        state.list[0].temp != null ? state.list[0].temp! : 0);
              } else {
                return WeatherLocation(
                    DateTime: "12:00:00 ", Location: "ha noi", degreee: 36);
              }
            },
          ),
          WeatherMap()
        ],
      ),
    );
  }
}

class AppBar extends StatelessWidget {
  const AppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 15.w, right: 10.w, top: 10.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Berlin, Germany",
            style: TextStyle(
                fontSize: 16.sp,
                color: AppColors.dark,
                fontWeight: FontWeight.w600,
                height: 24.h / 16.sp),
          ),
          Assets.icons.search.svg()
        ],
      ),
    );
  }
}

class WeatherLocation extends StatefulWidget {
  String DateTime;
  String Location;
  double degreee;

  WeatherLocation(
      {super.key,
      required this.DateTime,
      required this.Location,
      required this.degreee});

  @override
  State<WeatherLocation> createState() => _WeatherLocationState();
}

class _WeatherLocationState extends State<WeatherLocation> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(10.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: AppColors.blue),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.DateTime,
                    style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                  Text(
                    widget.Location,
                    style: TextStyle(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  )
                ],
              ),
              Assets.icons.sun.svg()
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          Text(
            widget.Location,
            style: TextStyle(fontSize: 14.sp, color: Colors.white),
          ),
          Text(
            widget.degreee.toString(),
            style: TextStyle(
                fontSize: 14.sp,
                color: Colors.white,
                fontWeight: FontWeight.w700),
          )
        ],
      ),
    );
  }
}

class WeatherMap extends StatefulWidget {
  const WeatherMap({super.key});

  @override
  State<WeatherMap> createState() => _WeatherMapState();
}

class _WeatherMapState extends State<WeatherMap> {
  late GoogleMapController mapController;
  late LatLng _center;
  late LocalBloc localBloc;
  Marker? _getPostion;

  @override
  void initState() {
    localBloc=  BlocProvider.of<LocalBloc>(context);
    super.initState();
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getLocation(),
        builder: (context, snap) {
          if (snap.hasData) {
            _center = snap.data!;
            return Container(
              height: 200.h,
              width: 1.sw - 30.w,
              child: GoogleMap(
                mapType: MapType.hybrid,
                zoomControlsEnabled: true,
                markers: {if (_getPostion != null) _getPostion!},
                onLongPress: tapOnMap,
                myLocationButtonEnabled: true,
                onMapCreated: _onMapCreated,
                initialCameraPosition: CameraPosition(
                  bearing: 50,
                  target: _center,
                  zoom: 0,
                ),
              ),
            );
          }
          if (snap.hasError) {
            return Text("not location");
          } else {
            return CircularProgressIndicator(
              color: Colors.red,
            );
          }
        });
  }

  void tapOnMap(LatLng latLng) {
    late double latitude, longitude;
    latitude = latLng.latitude.toDouble();
    longitude = latLng.longitude.toDouble();
    mapController.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
      target: LatLng(latitude, longitude),
      zoom: 19,
      bearing: 50,
    )));
    localBloc.getLocalWeather(WeatherRequest(lat: latitude.toString(), lon: longitude.toString()));
    setState(() {
      _getPostion = Marker(
        markerId: MarkerId(latitude.hashCode.toString()),
        icon: BitmapDescriptor.defaultMarker,
        position: LatLng(latitude, longitude),
        infoWindow: InfoWindow(
          title: "Sydney",
          snippet: "Capital of New South Wales",
        ),
      );
    });
  }
}

Future<LatLng> getLocation() async {
  Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high);
  return LatLng(position.latitude, position.longitude);
}
