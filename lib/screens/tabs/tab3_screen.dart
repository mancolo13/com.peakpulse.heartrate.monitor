import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../services/routing_service.dart';

class Tab3Screen extends StatelessWidget {
  const Tab3Screen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Recovery & Health'), actions: [IconButton(icon: const Icon(Icons.share, color: AppTheme.primary), onPressed: () => RoutingService.openPartnerLink())]),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(color: AppTheme.card, borderRadius: BorderRadius.circular(20), border: Border.all(color: Colors.greenAccent.withValues(alpha: 0.3))),
            child: Row(children: [
              Stack(alignment: Alignment.center, children: const [
                SizedBox(width: 80, height: 80, child: CircularProgressIndicator(value: 0.88, strokeWidth: 8, backgroundColor: Colors.white10, color: Colors.greenAccent)),
                Text('88%', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ]),
              const SizedBox(width: 20),
              const Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text('Readiness: High', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.greenAccent)),
                SizedBox(height: 4),
                Text('Cardiovascular system is fully restored and primed for training.', style: TextStyle(color: AppTheme.textSecondary, fontSize: 12)),
              ])),
            ]),
          ),
          const SizedBox(height: 16),
          const Text('Vital Metrics', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          GridView.count(
            crossAxisCount: 2, shrinkWrap: true, physics: const NeverScrollableScrollPhysics(), crossAxisSpacing: 12, mainAxisSpacing: 12, childAspectRatio: 1.3,
            children: [
              _metricTile('Sleep Resting HR', '58 BPM', Icons.nightlight_round, Colors.indigoAccent),
              _metricTile('Cardio Stress', 'Low (14%)', Icons.bolt, Colors.amberAccent),
              _metricTile('Respiratory Rate', '14.2 rpm', Icons.air, Colors.cyanAccent),
              _metricTile('VO2 Max Estimate', '48.5 ml/kg', Icons.speed, AppTheme.primary),
            ],
          ),
        ],
      ),
    );
  }
  Widget _metricTile(String title, String val, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(color: AppTheme.card, borderRadius: BorderRadius.circular(16)),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.center, children: [
        Icon(icon, color: color, size: 24),
        const SizedBox(height: 6),
        Text(val, style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
        Text(title, style: const TextStyle(color: AppTheme.textSecondary, fontSize: 11)),
      ]),
    );
  }
}
