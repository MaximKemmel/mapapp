import 'package:flutter/material.dart';
import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';
import 'package:latlong2/latlong.dart';
import 'package:mapapp/core/mapbox/mapbox.dart';
import 'package:mapapp/ui/screens/home/home_viewmodel.dart';
import 'package:mapapp/ui/theme/colors.dart';
import 'package:provider/provider.dart';
import 'package:flutter_map/flutter_map.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final markers = context.watch<HomeViewmodel>().markers;

    return Scaffold(
      backgroundColor: Colors.black87,
      body: FlutterMap(
        options: MapOptions(
          center: LatLng(41.635173, 41.60698),
          zoom: 13,
          minZoom: 5,
          maxZoom: 18,
        ),
        nonRotatedChildren: [
          TileLayer(
            urlTemplate: mapboxTemplate,
            additionalOptions: const {
              'accessToken': mapboxToken,
              'id': mapboxStyle,
            },
          ),
          MarkerClusterLayerWidget(
            options: MarkerClusterLayerOptions(
              maxClusterRadius: 20,
              size: const Size(40, 40),
              anchor: AnchorPos.align(AnchorAlign.center),
              fitBoundsOptions: const FitBoundsOptions(
                padding: EdgeInsets.all(50),
                maxZoom: 18,
              ),
              markers: markers,
              builder: (context, markers) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: clusterColor,
                  ),
                  child: Center(
                    child: Text(
                      markers.length.toString(),
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
