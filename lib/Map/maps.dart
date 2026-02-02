// // import 'package:flutter/material.dart';
// // import 'package:flutter_map/flutter_map.dart';
// // import 'package:geolocator/geolocator.dart';
// // import 'package:latlong2/latlong.dart';

// // class TrackingMap extends StatefulWidget {
// //   const TrackingMap({super.key});

// //   @override
// //   State<TrackingMap> createState() => _TrackingMapState();
// // }

// // class _TrackingMapState extends State<TrackingMap> {
// //   final MapController _mapController = MapController();
// //   final List<LatLng> _routePoints = [];
// //   double _totalDistance = 0.0;

// //   @override
// //   void initState() {
// //     super.initState();
// //     _startTracking();
// //   }

// //   Future<void> _startTracking() async {
// //     await Geolocator.requestPermission();

// //     Geolocator.getPositionStream(
// //       locationSettings: const LocationSettings(
// //         accuracy: LocationAccuracy.high,
// //         distanceFilter: 5, // meters
// //       ),
// //     ).listen((Position position) {
// //       final LatLng newPoint = LatLng(position.latitude, position.longitude);

// //       if (_routePoints.isNotEmpty) {
// //         final Distance distance = Distance();
// //         _totalDistance += distance(
// //           _routePoints.last,
// //           newPoint,
// //         );
// //       }

// //       setState(() {
// //         _routePoints.add(newPoint);
// //       });

// //       _mapController.move(newPoint, 16);
// //     });
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: const Text("OSM Distance Tracking"),
// //       ),
// //       body: Stack(
// //         children: [
// //           FlutterMap(
// //             mapController: _mapController,
// //             options: MapOptions(
// //               initialCenter: const LatLng(11.0168, 76.9558),
// //               initialZoom: 15,
// //             ),
// //             children: [
// //               TileLayer(
// //                 urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
// //                 userAgentPackageName: 'com.example.app',
// //               ),
// //               PolylineLayer(
// //                 polylines: [
// //                   Polyline(
// //                     points: _routePoints,
// //                     strokeWidth: 4,
// //                     color: Colors.blue,
// //                   ),
// //                 ],
// //               ),
// //               MarkerLayer(
// //                 markers: _routePoints.isEmpty
// //                     ? []
// //                     : [
// //                         Marker(
// //                           point: _routePoints.last,
// //                           width: 40,
// //                           height: 40,
// //                           child: const Icon(
// //                             Icons.location_pin,
// //                             color: Colors.red,
// //                             size: 40,
// //                           ),
// //                         ),
// //                       ],
// //               ),
// //             ],
// //           ),

// //           /// Distance UI
// //           Positioned(
// //             bottom: 20,
// //             left: 20,
// //             right: 20,
// //             child: Card(
// //               elevation: 4,
// //               child: Padding(
// //                 padding: const EdgeInsets.all(12),
// //                 child: Text(
// //                   "Distance: ${(_totalDistance / 1000).toStringAsFixed(2)} km",
// //                   style: const TextStyle(
// //                     fontSize: 18,
// //                     fontWeight: FontWeight.bold,
// //                   ),
// //                   textAlign: TextAlign.center,
// //                 ),
// //               ),
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }

// // import 'package:flutter/material.dart';
// // import 'package:geolocator/geolocator.dart';
// // import 'package:google_static_maps_controller/google_static_maps_controller.dart';

// // class StaticDirectionMap extends StatefulWidget {
// //   const StaticDirectionMap({super.key});

// //   @override
// //   State<StaticDirectionMap> createState() => _StaticDirectionMapState();
// // }

// // class _StaticDirectionMapState extends State<StaticDirectionMap> {
// //   Position? _currentPosition;

// //   /// Dheeran Chinnamalai – Sankari
// //   final Location destination =
// //       const Location(11.4987, 77.9414);

// //   @override
// //   void initState() {
// //     super.initState();
// //     _getCurrentLocation();
// //   }

// //   Future<void> _getCurrentLocation() async {
// //     await Geolocator.requestPermission();

// //     _currentPosition = await Geolocator.getCurrentPosition(
// //       desiredAccuracy: LocationAccuracy.high,
// //     );

// //     setState(() {});
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     if (_currentPosition == null) {
// //       return const Scaffold(
// //         body: Center(child: CircularProgressIndicator()),
// //       );
// //     }

// //     final Location origin = Location(
// //       _currentPosition!.latitude,
// //       _currentPosition!.longitude,
// //     );

// //     final StaticMapController controller = StaticMapController(
// //       googleApiKey: "YOUR_GOOGLE_API_KEY",
// //       width: 600,
// //       height: 400,
// //       zoom: 13,

// //       /// ✅ Correct Marker class
// //       markers: [
// //         Marker(
// //           locations: [origin],
// //           // color: 'green',
// //           label: 'S',
// //         ),
// //         Marker(
// //           locations: [destination],
// //           // color: 'red',
// //           label: 'D',
// //         ),
// //       ],

// //       /// ✅ Correct Path class
// //       paths: [
// //         Path(
// //           // locations: [origin, destination],
// //           // color: 'blue',
// //           weight: 5, points: [],
// //         ),
// //       ],
// //     );

// //     return Scaffold(
// //       appBar: AppBar(
// //         title: const Text("Direction to Dheeran Chinnamalai"),
// //       ),
// //       body: Column(
// //         children: [
// //           Expanded(
// //             child: Image.network(
// //               controller.url as String,
// //               fit: BoxFit.cover,
// //               width: double.infinity,
// //             ),
// //           ),
// //           Container(
// //             padding: const EdgeInsets.all(12),
// //             child: const Text(
// //               "From: Current Location\nTo: Dheeran Chinnamalai, Sankari",
// //               textAlign: TextAlign.center,
// //               style: TextStyle(fontWeight: FontWeight.bold),
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }

// // import 'package:flutter/material.dart';

// // class StaticMapExample extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     // Example coordinates (Chennai)
// //     double lat = 13.0827;
// //     double lon = 80.2707;

// //     String mapUrl =
// //         "https://staticmap.openstreetmap.de/staticmap.php"
// //         "?center=$lat,$lon"
// //         "&zoom=14"
// //         "&size=600x300"
// //         "&markers=$lat,$lon,red-pushpin";

// //     return Scaffold(
// //       appBar: AppBar(title: Text("Static Map (No API Key)")),
// //       body: Center(
// //         child: Image.network(
// //           mapUrl,
// //           fit: BoxFit.cover,
// //           loadingBuilder: (context, child, loadingProgress) {
// //             if (loadingProgress == null) return child;
// //             return CircularProgressIndicator();
// //           },
// //           errorBuilder: (context, error, stackTrace) {
// //             return Text("Map loading failed");
// //           },
// //         ),
// //       ),
// //     );
// //   }
// // }

// //  import 'package:flutter/material.dart';
// // class StaticMapExample extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     // Example coordinates (Chennai)
// //     double lat = 13.0827;
// //     double lon = 80.2707;

// //     String mapUrl =
// //         "https://staticmap.openstreetmap.de/staticmap.php"
// //         "?center=$lat,$lon"
// //         "&zoom=14"
// //         "&size=600x300"
// //         "&markers=$lat,$lon,red-pushpin";

// //     return Scaffold(
// //       appBar: AppBar(title: Text("Static Map (No API Key)")),
// //       body: Center(
// //         child: Card(
// //           elevation: 4,
// //           child: Padding(
// //             padding: const EdgeInsets.all(4.0),
// //             child: Image.network(
// //               mapUrl,
// //               fit: BoxFit.cover,
// //               loadingBuilder: (context, child, loadingProgress) {
// //                 if (loadingProgress == null) return child;
// //                 return Container(
// //                   width: 600,
// //                   height: 300,
// //                   child: Center(
// //                     child: CircularProgressIndicator(
// //                       value: loadingProgress.expectedTotalBytes != null
// //                           ? loadingProgress.cumulativeBytesLoaded /
// //                               loadingProgress.expectedTotalBytes!
// //                           : null,
// //                     ),
// //                   ),
// //                 );
// //               },
// //               errorBuilder: (context, error, stackTrace) {
// //                 return Container(
// //                   width: 600,
// //                   height: 300,
// //                   color: Colors.grey[200],
// //                   child: Column(
// //                     mainAxisAlignment: MainAxisAlignment.center,
// //                     children: [
// //                       Icon(Icons.error_outline, color: Colors.red, size: 48),
// //                       SizedBox(height: 16),
// //                       Text("Failed to load map"),
// //                       SizedBox(height: 8),
// //                       ElevatedButton(
// //                         onPressed: () {
// //                           // You could add retry logic here
// //                         },
// //                         child: Text("Retry"),
// //                       ),
// //                     ],
// //                   ),
// //                 );
// //               },
// //             ),
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }

// // import 'package:flutter/material.dart';
// // import 'package:url_launcher/url_launcher.dart';

// // class SimpleMapScreen extends StatefulWidget {
// //   const SimpleMapScreen({super.key});

// //   @override
// //   State<SimpleMapScreen> createState() => _SimpleMapScreenState();
// // }

// // class _SimpleMapScreenState extends State<SimpleMapScreen> {
// //   final String apiKey = "fa0fdc09cb7d47219d64f091d321d5aa";

// //   // Your initial coordinates from the API
// //   final double centerLat = 47.54607447032754;
// //   final double centerLon = -122.29009844646316;

// //   double _zoom = 14.0;
// //   List<MapLocation> locations = [];

// //   @override
// //   void initState() {
// //     super.initState();
// //     _initializeLocations();
// //   }

// //   void _initializeLocations() {
// //     locations = [
// //       MapLocation(
// //         id: '1',
// //         name: 'Park Spot 1',
// //         lat: 47.54403990655936,
// //         lon: -122.29188334609739,
// //         color: '#bb3f73',
// //         icon: 'paw',
// //       ),
// //       MapLocation(
// //         id: '2',
// //         name: 'Park Spot 2',
// //         lat: 47.549609195001494,
// //         lon: -122.29282631194182,
// //         color: '#4c905a',
// //         icon: 'tree',
// //       ),
// //       MapLocation(
// //         id: '3',
// //         name: 'Park Spot 3',
// //         lat: 47.541766557545884,
// //         lon: -122.28726954893025,
// //         color: '#4c905a',
// //         icon: 'tree',
// //       ),
// //       // Add 7 more locations
// //       MapLocation(
// //         id: '4',
// //         name: 'Coffee Shop',
// //         lat: 47.5480,
// //         lon: -122.2950,
// //         color: '#FF6B6B',
// //         icon: 'coffee',
// //       ),
// //       MapLocation(
// //         id: '5',
// //         name: 'Restaurant',
// //         lat: 47.5420,
// //         lon: -122.2850,
// //         color: '#4ECDC4',
// //         icon: 'restaurant',
// //       ),
// //       MapLocation(
// //         id: '6',
// //         name: 'Shopping Mall',
// //         lat: 47.5400,
// //         lon: -122.2930,
// //         color: '#FFD166',
// //         icon: 'shop',
// //       ),
// //       MapLocation(
// //         id: '7',
// //         name: 'Hospital',
// //         lat: 47.5520,
// //         lon: -122.2820,
// //         color: '#06D6A0',
// //         icon: 'hospital',
// //       ),
// //       MapLocation(
// //         id: '8',
// //         name: 'Hotel',
// //         lat: 47.5380,
// //         lon: -122.2800,
// //         color: '#118AB2',
// //         icon: 'hotel',
// //       ),
// //       MapLocation(
// //         id: '9',
// //         name: 'Museum',
// //         lat: 47.5500,
// //         lon: -122.2880,
// //         color: '#EF476F',
// //         icon: 'museum',
// //       ),
// //       MapLocation(
// //         id: '10',
// //         name: 'Gas Station',
// //         lat: 47.5450,
// //         lon: -122.2830,
// //         color: '#7209B7',
// //         icon: 'fuel',
// //       ),
// //     ];
// //   }

// //   String _buildMapUrl() {
// //     // Build markers string
// //     String markers = '';
// //     for (var location in locations) {
// //       if (markers.isNotEmpty) markers += '|';
// //       markers += 'lonlat:${location.lon},${location.lat}';
// //       markers += ';type:awesome';
// //       markers += ';color:%23${location.color.substring(1)}';
// //       markers += ';icon:${location.icon}';
// //     }

// //     return 'https://maps.geoapify.com/v1/staticmap?'
// //         'style=osm-bright-smooth&'
// //         'width=600&'
// //         'height=400&'
// //         'center=lonlat:$centerLon,$centerLat&'
// //         'zoom=$_zoom&'
// //         'scale=2&'
// //         'marker=$markers&'
// //         'apiKey=$apiKey';
// //   }

// //   void _zoomIn() {
// //     setState(() {
// //       if (_zoom < 20) _zoom += 1;
// //     });
// //   }

// //   void _zoomOut() {
// //     setState(() {
// //       if (_zoom > 1) _zoom -= 1;
// //     });
// //   }

// //   Future<void> _openInGoogleMaps() async {
// //     final url = Uri.parse('https://www.google.com/maps/search/?api=1&query=$centerLat,$centerLon');
// //     if (await canLaunchUrl(url)) {
// //       await launchUrl(url);
// //     } else {
// //       ScaffoldMessenger.of(context).showSnackBar(
// //         const SnackBar(
// //           content: Text('Could not open Google Maps'),
// //         ),
// //       );
// //     }
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: const Text('10 Places Tracker'),
// //         actions: [
// //           IconButton(
// //             icon: const Icon(Icons.open_in_browser),
// //             onPressed: _openInGoogleMaps,
// //             tooltip: 'Open in Google Maps',
// //           ),
// //         ],
// //       ),
// //       body: Column(
// //         children: [
// //           // Map Container
// //           Container(
// //             height: 400,
// //             width: double.infinity,
// //             decoration: BoxDecoration(
// //               border: Border.all(color: Colors.grey[300]!),
// //             ),
// //             child: Stack(
// //               children: [
// //                 // Map Image
// //                 Image.network(
// //                   _buildMapUrl(),
// //                   fit: BoxFit.cover,
// //                   loadingBuilder: (context, child, loadingProgress) {
// //                     if (loadingProgress == null) return child;
// //                     return Center(
// //                       child: CircularProgressIndicator(
// //                         value: loadingProgress.expectedTotalBytes != null
// //                             ? loadingProgress.cumulativeBytesLoaded /
// //                                 loadingProgress.expectedTotalBytes!
// //                             : null,
// //                       ),
// //                     );
// //                   },
// //                   errorBuilder: (context, error, stackTrace) {
// //                     return Center(
// //                       child: Column(
// //                         mainAxisAlignment: MainAxisAlignment.center,
// //                         children: [
// //                           const Icon(Icons.error, color: Colors.red, size: 50),
// //                           const SizedBox(height: 10),
// //                           const Text('Failed to load map'),
// //                           const SizedBox(height: 10),
// //                           ElevatedButton(
// //                             onPressed: () => setState(() {}),
// //                             child: const Text('Retry'),
// //                           ),
// //                         ],
// //                       ),
// //                     );
// //                   },
// //                 ),

// //                 // Zoom Controls
// //                 Positioned(
// //                   right: 10,
// //                   bottom: 10,
// //                   child: Column(
// //                     children: [
// //                       FloatingActionButton.small(
// //                         onPressed: _zoomIn,
// //                         child: const Icon(Icons.add),
// //                         heroTag: 'zoomIn',
// //                       ),
// //                       const SizedBox(height: 10),
// //                       FloatingActionButton.small(
// //                         onPressed: _zoomOut,
// //                         child: const Icon(Icons.remove),
// //                         heroTag: 'zoomOut',
// //                       ),
// //                     ],
// //                   ),
// //                 ),

// //                 // Location Info
// //                 Positioned(
// //                   top: 10,
// //                   left: 10,
// //                   child: Container(
// //                     padding: const EdgeInsets.all(12),
// //                     decoration: BoxDecoration(
// //                       color: Colors.white.withOpacity(0.9),
// //                       borderRadius: BorderRadius.circular(8),
// //                       boxShadow: [
// //                         BoxShadow(
// //                           color: Colors.black12,
// //                           blurRadius: 4,
// //                           offset: const Offset(0, 2),
// //                         ),
// //                       ],
// //                     ),
// //                     child: Column(
// //                       crossAxisAlignment: CrossAxisAlignment.start,
// //                       children: [
// //                         const Text(
// //                           '📍 Map Center',
// //                           style: TextStyle(
// //                             fontWeight: FontWeight.bold,
// //                             fontSize: 14,
// //                           ),
// //                         ),
// //                         const SizedBox(height: 4),
// //                         Text(
// //                           'Lat: ${centerLat.toStringAsFixed(6)}',
// //                           style: const TextStyle(fontSize: 12),
// //                         ),
// //                         Text(
// //                           'Lon: ${centerLon.toStringAsFixed(6)}',
// //                           style: const TextStyle(fontSize: 12),
// //                         ),
// //                         const SizedBox(height: 4),
// //                         Chip(
// //                           label: Text('Zoom: ${_zoom.toInt()}'),
// //                           backgroundColor: Colors.blue[100],
// //                         ),
// //                       ],
// //                     ),
// //                   ),
// //                 ),
// //               ],
// //             ),
// //           ),

// //           // Locations List
// //           Expanded(
// //             child: Column(
// //               children: [
// //                 Padding(
// //                   padding: const EdgeInsets.all(16),
// //                   child: Row(
// //                     children: [
// //                       const Text(
// //                         'Tracked Places (10)',
// //                         style: TextStyle(
// //                           fontSize: 18,
// //                           fontWeight: FontWeight.bold,
// //                         ),
// //                       ),
// //                       const Spacer(),
// //                       IconButton(
// //                         icon: const Icon(Icons.refresh),
// //                         onPressed: () => setState(() {}),
// //                         tooltip: 'Refresh Map',
// //                       ),
// //                     ],
// //                   ),
// //                 ),
// //                 Expanded(
// //                   child: ListView.builder(
// //                     padding: const EdgeInsets.symmetric(horizontal: 8),
// //                     itemCount: locations.length,
// //                     itemBuilder: (context, index) {
// //                       final location = locations[index];
// //                       return Card(
// //                         margin: const EdgeInsets.symmetric(
// //                           vertical: 4,
// //                           horizontal: 8,
// //                         ),
// //                         child: ListTile(
// //                           leading: Container(
// //                             width: 40,
// //                             height: 40,
// //                             decoration: BoxDecoration(
// //                               color: Color(
// //                                 int.parse('0xFF${location.color.substring(1)}'),
// //                               ),
// //                               borderRadius: BorderRadius.circular(20),
// //                             ),
// //                             child: Icon(
// //                               _getIcon(location.icon),
// //                               color: Colors.white,
// //                               size: 20,
// //                             ),
// //                           ),
// //                           title: Text(location.name),
// //                           subtitle: Text(
// //                             '${location.lat.toStringAsFixed(6)}, '
// //                             '${location.lon.toStringAsFixed(6)}',
// //                             style: const TextStyle(fontSize: 12),
// //                           ),
// //                           trailing: Text('#${index + 1}'),
// //                         ),
// //                       );
// //                     },
// //                   ),
// //                 ),
// //               ],
// //             ),
// //           ),
// //         ],
// //       ),
// //       floatingActionButton: FloatingActionButton(
// //         onPressed: _openInGoogleMaps,
// //         child: const Icon(Icons.map),
// //         tooltip: 'Open in Google Maps',
// //       ),
// //     );
// //   }

// //   IconData _getIcon(String iconName) {
// //     switch (iconName) {
// //       case 'paw':
// //         return Icons.pets;
// //       case 'tree':
// //         return Icons.park;
// //       case 'coffee':
// //         return Icons.coffee;
// //       case 'restaurant':
// //         return Icons.restaurant;
// //       case 'shop':
// //         return Icons.shopping_cart;
// //       case 'hospital':
// //         return Icons.local_hospital;
// //       case 'hotel':
// //         return Icons.hotel;
// //       case 'museum':
// //         return Icons.museum;
// //       case 'fuel':
// //         return Icons.local_gas_station;
// //       default:
// //         return Icons.place;
// //     }
// //   }
// // }

// // class MapLocation {
// //   final String id;
// //   final String name;
// //   final double lat;
// //   final double lon;
// //   final String color;
// //   final String icon;

// //   MapLocation({
// //     required this.id,
// //     required this.name,
// //     required this.lat,
// //     required this.lon,
// //     required this.color,
// //     required this.icon,
// //   });
// // }

// // import 'dart:async';
// // import 'dart:math';
// // import 'package:flutter/material.dart';
// // import 'package:geolocator/geolocator.dart';
// // import 'package:url_launcher/url_launcher.dart';
// // import 'package:cached_network_image/cached_network_image.dart';

// // class LocationTrackerScreen extends StatefulWidget {
// //   const LocationTrackerScreen({super.key});

// //   @override
// //   State<LocationTrackerScreen> createState() => _LocationTrackerScreenState();
// // }

// // class _LocationTrackerScreenState extends State<LocationTrackerScreen> {
// //   final String apiKey = "fa0fdc09cb7d47219d64f091d321d5aa";

// //   Position? _currentPosition;
// //   bool _isLoading = true;
// //   double _zoom = 14.0;
// //   List<MapPoint> points = [];

// //   // Default location (Seattle)
// //   final double _defaultLat = 47.54607447032754;
// //   final double _defaultLon = -122.29009844646316;

// //   @override
// //   void initState() {
// //     super.initState();
// //     _initializePoints();
// //     _getLocation();
// //   }

// //   void _initializePoints() {
// //     points = [
// //       MapPoint(
// //         id: 'current',
// //         name: 'My Location',
// //         lat: _defaultLat,
// //         lon: _defaultLon,
// //         color: '#3a86ff',
// //         icon: 'location',
// //         isCurrent: true,
// //       ),
// //     ];
// //   }

// //   Future<void> _getLocation() async {
// //     try {
// //       // Check permissions
// //       LocationPermission permission = await Geolocator.checkPermission();
// //       if (permission == LocationPermission.denied) {
// //         permission = await Geolocator.requestPermission();
// //         if (permission == LocationPermission.denied) {
// //           _showMessage('Location permission denied');
// //           _useDefaultLocation();
// //           return;
// //         }
// //       }

// //       if (permission == LocationPermission.deniedForever) {
// //         _showMessage('Location permission permanently denied');
// //         _useDefaultLocation();
// //         return;
// //       }

// //       // Check if location services are enabled
// //       bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
// //       if (!serviceEnabled) {
// //         _showMessage('Please enable location services');
// //         _useDefaultLocation();
// //         return;
// //       }

// //       // Get current position
// //       Position position = await Geolocator.getCurrentPosition(
// //         desiredAccuracy: LocationAccuracy.high,
// //       );

// //       setState(() {
// //         _currentPosition = position;
// //         _isLoading = false;
// //       });

// //       // Generate 9 more points around current location
// //       _generatePointsAround(position.latitude, position.longitude);

// //     } catch (e) {
// //       print('Location error: $e');
// //       _showMessage('Error getting location: $e');
// //       _useDefaultLocation();
// //     }
// //   }

// //   void _useDefaultLocation() {
// //     setState(() {
// //       _isLoading = false;
// //     });
// //     _generatePointsAround(_defaultLat, _defaultLon);
// //   }

// //   void _generatePointsAround(double centerLat, double centerLon) {
// //     Random random = Random();
// //     List<MapPoint> newPoints = [
// //       MapPoint(
// //         id: 'current',
// //         name: 'My Location',
// //         lat: centerLat,
// //         lon: centerLon,
// //         color: '#3a86ff',
// //         icon: 'location',
// //         isCurrent: true,
// //       ),
// //     ];

// //     // Generate 9 random points around the center
// //     List<String> placeTypes = [
// //       'Coffee Shop', 'Restaurant', 'Park', 'Mall', 'Hospital',
// //       'School', 'Hotel', 'Museum', 'Gas Station'
// //     ];

// //     List<String> colors = [
// //       '#FF6B6B', '#4ECDC4', '#FFD166', '#06D6A0', '#118AB2',
// //       '#EF476F', '#7209B7', '#F3722C', '#3A86FF'
// //     ];

// //     List<String> icons = [
// //       'coffee', 'restaurant', 'park', 'shop', 'hospital',
// //       'school', 'hotel', 'museum', 'fuel'
// //     ];

// //     for (int i = 0; i < 9; i++) {
// //       // Generate random offset (within ~1km)
// //       double latOffset = (random.nextDouble() - 0.5) * 0.02;
// //       double lonOffset = (random.nextDouble() - 0.5) * 0.02;

// //       newPoints.add(MapPoint(
// //         id: 'point_$i',
// //         name: placeTypes[i],
// //         lat: centerLat + latOffset,
// //         lon: centerLon + lonOffset,
// //         color: colors[i],
// //         icon: icons[i],
// //         isCurrent: false,
// //       ));
// //     }

// //     setState(() {
// //       points = newPoints;
// //     });
// //   }

// //   String _buildMapUrl() {
// //     double centerLat = _currentPosition?.latitude ?? _defaultLat;
// //     double centerLon = _currentPosition?.longitude ?? _defaultLon;

// //     // Build markers string
// //     String markers = '';
// //     for (var point in points) {
// //       if (markers.isNotEmpty) markers += '|';
// //       markers += 'lonlat:${point.lon},${point.lat}';
// //       markers += ';type:awesome';
// //       markers += ';color:%23${point.color.substring(1)}';
// //       markers += ';icon:${point.icon}';
// //       if (point.isCurrent) {
// //         markers += ';size:x-large';
// //       }
// //     }

// //     return 'https://maps.geoapify.com/v1/staticmap?'
// //         'style=osm-bright-smooth&'
// //         'width=600&'
// //         'height=400&'
// //         'center=lonlat:$centerLon,$centerLat&'
// //         'zoom=$_zoom&'
// //         'scale=2&'
// //         'marker=$markers&'
// //         'apiKey=$apiKey';
// //   }

// //   String _buildGoogleMapsUrl() {
// //     double lat = _currentPosition?.latitude ?? _defaultLat;
// //     double lon = _currentPosition?.longitude ?? _defaultLon;
// //     return 'https://www.google.com/maps/search/?api=1&query=$lat,$lon';
// //   }

// //   void _showMessage(String message) {
// //     ScaffoldMessenger.of(context).showSnackBar(
// //       SnackBar(
// //         content: Text(message),
// //         duration: const Duration(seconds: 3),
// //       ),
// //     );
// //   }

// //   void _zoomIn() {
// //     setState(() {
// //       if (_zoom < 20) _zoom += 1;
// //     });
// //   }

// //   void _zoomOut() {
// //     setState(() {
// //       if (_zoom > 1) _zoom -= 1;
// //     });
// //   }

// //   void _refreshLocation() {
// //     setState(() {
// //       _isLoading = true;
// //     });
// //     _getLocation();
// //   }

// //   Future<void> _openInBrowser() async {
// //     final url = Uri.parse(_buildGoogleMapsUrl());
// //     if (await canLaunchUrl(url)) {
// //       await launchUrl(url);
// //     } else {
// //       _showMessage('Could not open Google Maps');
// //     }
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: const Text('10 Places Tracker'),
// //         actions: [
// //           IconButton(
// //             icon: const Icon(Icons.refresh),
// //             onPressed: _refreshLocation,
// //             tooltip: 'Refresh Location',
// //           ),
// //         ],
// //       ),
// //       body: _isLoading
// //           ? const Center(
// //               child: Column(
// //                 mainAxisAlignment: MainAxisAlignment.center,
// //                 children: [
// //                   CircularProgressIndicator(),
// //                   SizedBox(height: 20),
// //                   Text('Getting your location...'),
// //                 ],
// //               ),
// //             )
// //           : Column(
// //               children: [
// //                 // Map Display
// //                 Container(
// //                   height: 400,
// //                   width: double.infinity,
// //                   decoration: BoxDecoration(
// //                     border: Border.all(color: Colors.grey[300]!),
// //                   ),
// //                   child: Stack(
// //                     children: [
// //                       // Map Image
// //                       CachedNetworkImage(
// //                         imageUrl: _buildMapUrl(),
// //                         fit: BoxFit.cover,
// //                         placeholder: (context, url) => const Center(
// //                           child: CircularProgressIndicator(),
// //                         ),
// //                         errorWidget: (context, url, error) => Center(
// //                           child: Column(
// //                             mainAxisAlignment: MainAxisAlignment.center,
// //                             children: [
// //                               const Icon(Icons.error, color: Colors.red, size: 50),
// //                               const SizedBox(height: 10),
// //                               const Text('Failed to load map'),
// //                               const SizedBox(height: 10),
// //                               ElevatedButton(
// //                                 onPressed: _refreshLocation,
// //                                 child: const Text('Retry'),
// //                               ),
// //                             ],
// //                           ),
// //                         ),
// //                       ),

// //                       // Zoom Controls
// //                       Positioned(
// //                         right: 10,
// //                         bottom: 10,
// //                         child: Column(
// //                           children: [
// //                             FloatingActionButton.small(
// //                               onPressed: _zoomIn,
// //                               child: const Icon(Icons.add),
// //                               heroTag: 'zoomIn',
// //                             ),
// //                             const SizedBox(height: 10),
// //                             FloatingActionButton.small(
// //                               onPressed: _zoomOut,
// //                               child: const Icon(Icons.remove),
// //                               heroTag: 'zoomOut',
// //                             ),
// //                           ],
// //                         ),
// //                       ),

// //                       // Location Info
// //                       Positioned(
// //                         top: 10,
// //                         left: 10,
// //                         child: Container(
// //                           padding: const EdgeInsets.all(12),
// //                           decoration: BoxDecoration(
// //                             color: Colors.white.withOpacity(0.9),
// //                             borderRadius: BorderRadius.circular(8),
// //                             boxShadow: [
// //                               BoxShadow(
// //                                 color: Colors.black12,
// //                                 blurRadius: 4,
// //                                 offset: const Offset(0, 2),
// //                               ),
// //                             ],
// //                           ),
// //                           child: Column(
// //                             crossAxisAlignment: CrossAxisAlignment.start,
// //                             children: [
// //                               const Text(
// //                                 '📍 Current Location',
// //                                 style: TextStyle(
// //                                   fontWeight: FontWeight.bold,
// //                                   fontSize: 14,
// //                                 ),
// //                               ),
// //                               const SizedBox(height: 4),
// //                               Text(
// //                                 'Lat: ${(_currentPosition?.latitude ?? _defaultLat).toStringAsFixed(6)}',
// //                                 style: const TextStyle(fontSize: 12),
// //                               ),
// //                               Text(
// //                                 'Lon: ${(_currentPosition?.longitude ?? _defaultLon).toStringAsFixed(6)}',
// //                                 style: const TextStyle(fontSize: 12),
// //                               ),
// //                               if (_currentPosition != null && _currentPosition!.accuracy != null)
// //                                 Text(
// //                                   'Accuracy: ${_currentPosition!.accuracy!.toStringAsFixed(1)}m',
// //                                   style: TextStyle(
// //                                     fontSize: 12,
// //                                     color: Colors.green[700],
// //                                   ),
// //                                 ),
// //                             ],
// //                           ),
// //                         ),
// //                       ),
// //                     ],
// //                   ),
// //                 ),

// //                 // Location List
// //                 Expanded(
// //                   child: Column(
// //                     children: [
// //                       Padding(
// //                         padding: const EdgeInsets.all(16),
// //                         child: Row(
// //                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                           children: [
// //                             const Text(
// //                               'Tracked Places',
// //                               style: TextStyle(
// //                                 fontSize: 18,
// //                                 fontWeight: FontWeight.bold,
// //                               ),
// //                             ),
// //                             Chip(
// //                               label: Text('Zoom: ${_zoom.toInt()}'),
// //                               backgroundColor: Colors.blue[100],
// //                             ),
// //                           ],
// //                         ),
// //                       ),
// //                       Expanded(
// //                         child: ListView.builder(
// //                           padding: const EdgeInsets.symmetric(horizontal: 8),
// //                           itemCount: points.length,
// //                           itemBuilder: (context, index) {
// //                             final point = points[index];
// //                             return Card(
// //                               margin: const EdgeInsets.symmetric(
// //                                 vertical: 4,
// //                                 horizontal: 8,
// //                               ),
// //                               child: ListTile(
// //                                 leading: Container(
// //                                   width: 40,
// //                                   height: 40,
// //                                   decoration: BoxDecoration(
// //                                     color: Color(
// //                                       int.parse('0xFF${point.color.substring(1)}'),
// //                                     ),
// //                                     borderRadius: BorderRadius.circular(20),
// //                                   ),
// //                                   child: Icon(
// //                                     _getIcon(point.icon),
// //                                     color: Colors.white,
// //                                     size: 20,
// //                                   ),
// //                                 ),
// //                                 title: Text(
// //                                   point.name,
// //                                   style: TextStyle(
// //                                     fontWeight: point.isCurrent
// //                                         ? FontWeight.bold
// //                                         : FontWeight.normal,
// //                                   ),
// //                                 ),
// //                                 subtitle: Text(
// //                                   '${point.lat.toStringAsFixed(6)}, '
// //                                   '${point.lon.toStringAsFixed(6)}',
// //                                 ),
// //                                 trailing: point.isCurrent
// //                                     ? const Chip(
// //                                         label: Text('You'),
// //                                         backgroundColor: Colors.blue,
// //                                         labelStyle: TextStyle(color: Colors.white),
// //                                       )
// //                                     : Text('#${index + 1}'),
// //                               ),
// //                             );
// //                           },
// //                         ),
// //                       ),
// //                     ],
// //                   ),
// //                 ),
// //               ],
// //             ),
// //       floatingActionButton: Column(
// //         mainAxisAlignment: MainAxisAlignment.end,
// //         children: [
// //           FloatingActionButton(
// //             onPressed: _refreshLocation,
// //             child: const Icon(Icons.my_location),
// //             heroTag: 'location',
// //             tooltip: 'Get Current Location',
// //           ),
// //           const SizedBox(height: 10),
// //           FloatingActionButton(
// //             onPressed: _openInBrowser,
// //             child: const Icon(Icons.open_in_browser),
// //             heroTag: 'browser',
// //             tooltip: 'Open in Google Maps',
// //             backgroundColor: Colors.green,
// //           ),
// //         ],
// //       ),
// //     );
// //   }

// //   IconData _getIcon(String iconName) {
// //     switch (iconName) {
// //       case 'location':
// //         return Icons.location_on;
// //       case 'coffee':
// //         return Icons.coffee;
// //       case 'restaurant':
// //         return Icons.restaurant;
// //       case 'park':
// //         return Icons.park;
// //       case 'shop':
// //         return Icons.shopping_cart;
// //       case 'hospital':
// //         return Icons.local_hospital;
// //       case 'school':
// //         return Icons.school;
// //       case 'hotel':
// //         return Icons.hotel;
// //       case 'museum':
// //         return Icons.museum;
// //       case 'fuel':
// //         return Icons.local_gas_station;
// //       default:
// //         return Icons.place;
// //     }
// //   }
// // }

// // class MapPoint {
// //   final String id;
// //   final String name;
// //   final double lat;
// //   final double lon;
// //   final String color;
// //   final String icon;
// //   final bool isCurrent;

// //   MapPoint({
// //     required this.id,
// //     required this.name,
// //     required this.lat,
// //     required this.lon,
// //     required this.color,
// //     required this.icon,
// //     required this.isCurrent,
// //   });
// // }

// // import 'package:flutter/material.dart';
// // import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';

// // class OSMMapPage extends StatefulWidget {
// //   const OSMMapPage({Key? key}) : super(key: key);

// //   @override
// //   State<OSMMapPage> createState() => _OSMMapPageState();
// // }

// // class _OSMMapPageState extends State<OSMMapPage> {
// //   late MapController controller;

// //   @override
// //   void initState() {
// //     super.initState();
// //     controller = MapController(
// //       initPosition: GeoPoint(
// //         latitude: 11.6643,
// //         longitude: 78.1460, // Salem
// //       ),
// //     );
// //   }

// //   @override
// //   void dispose() {
// //     controller.dispose();
// //     super.dispose();
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(title: const Text("OSM Map")),
// //       body: OSMFlutter(
// //         controller: controller,
// //         osmOption: OSMOption(
// //           zoomOption: ZoomOption(
// //             initZoom: 14,
// //             minZoomLevel: 3,
// //             maxZoomLevel: 19,
// //           ),
// //           userTrackingOption: UserTrackingOption(
// //             enableTracking: true,
// //             unFollowUser: false,
// //           ),
// //           showDefaultInfoWindow: true,
// //         ),
// //       ),
// //       floatingActionButton: FloatingActionButton(
// //         child: const Icon(Icons.location_on),
// //         onPressed: () async {
// //           await controller.currentLocation();
// //         },
// //       ),
// //     );
// //   }
// // }

// import 'package:flutter/material.dart';
// import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';

// class OSMMapPage extends StatefulWidget {
//   const OSMMapPage({Key? key}) : super(key: key);

//   @override
//   State<OSMMapPage> createState() => _OSMMapPageState();
// }

// class _OSMMapPageState extends State<OSMMapPage> {
//   late MapController controller;

//   final GeoPoint startPoint = GeoPoint(
//     latitude: 11.4777,
//     longitude: 77.8739,
//   );

//   final GeoPoint endPoint = GeoPoint(
//     latitude: 11.0811,
//     longitude: 76.9886,
//   );

//   @override
//   void initState() {
//     super.initState();

//     controller = MapController(
//       initPosition: startPoint,
//     );

//     WidgetsBinding.instance.addPostFrameCallback((_) async {
//       // Move to start
//       await controller.goToLocation(startPoint);
//       await controller.setZoom(zoomLevel: 10);

//       // Start marker
//       await controller.addMarker(
//         startPoint,
//         markerIcon: const MarkerIcon(
//           icon: Icon(Icons.location_on, color: Colors.green, size: 48),
//         ),
//       );

//       // End marker
//       await controller.addMarker(
//         endPoint,
//         markerIcon: const MarkerIcon(
//           icon: Icon(Icons.flag, color: Colors.red, size: 48),
//         ),
//       );

//       // Draw route
//       await controller.drawRoad(
//         startPoint,
//         endPoint,
//         roadType: RoadType.car,
//       );
//     });
//   }

//   @override
//   void dispose() {
//     controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Route Tracking")),
//       body: OSMFlutter(
//         controller: controller,
//         osmOption: OSMOption(
//           zoomOption: const ZoomOption(
//             initZoom: 10,
//             minZoomLevel: 3,
//             maxZoomLevel: 19,
//           ),
//         ),
//       ),
//     );
//   }
// }
