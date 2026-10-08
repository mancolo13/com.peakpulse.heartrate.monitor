import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../services/routing_service.dart';

class Tab2Screen extends StatelessWidget {
  const Tab2Screen({super.key});
  @override
  Widget build(BuildContext context) {
    final zones = [
      {'zone': 'Zone 1', 'name': 'Warm Up', 'range': '100 - 120 BPM', 'pct': '50 - 60%', 'color': Colors.blue, 'val': 0.55},
      {'zone': 'Zone 2', 'name': 'Fat Burn', 'range': '120 - 140 BPM', 'pct': '60 - 70%', 'color': Colors.green, 'val': 0.68},
      {'zone': 'Zone 3', 'name': 'Aerobic Cardio', 'range': '140 - 160 BPM', 'pct': '70 - 80%', 'color': Colors.orange, 'val': 0.78},
      {'zone': 'Zone 4', 'name': 'Anaerobic Sprint', 'range': '160 - 178 BPM', 'pct': '80 - 90%', 'color': Colors.deepOrange, 'val': 0.88},
      {'zone': 'Zone 5', 'name': 'Max VO2 Effort', 'range': '178 - 195 BPM', 'pct': '90 - 100%', 'color': AppTheme.primary, 'val': 0.96},
    ];
    return Scaffold(
      appBar: AppBar(title: const Text('Heart Rate Zones'), actions: [IconButton(icon: const Icon(Icons.info_outline, color: AppTheme.primary), onPressed: () => RoutingService.openPartnerLink())]),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(gradient: LinearGradient(colors: [AppTheme.surface, AppTheme.card]), borderRadius: BorderRadius.circular(16), border: Border.all(color: AppTheme.primary.withValues(alpha: 0.3))),
            child: Row(children: const [
              Icon(Icons.monitor_heart, color: AppTheme.primary, size: 36),
              SizedBox(width: 14),
              Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text('Max HR: 195 BPM', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                Text('Calculated based on age 25 & cardio history', style: TextStyle(color: AppTheme.textSecondary, fontSize: 12)),
              ])),
            ]),
          ),
          const SizedBox(height: 16),
          const Text('Custom Training Target Zones', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          for (final z in zones) ...[
            Container(
              margin: const EdgeInsets.only(bottom: 12),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(color: AppTheme.card, borderRadius: BorderRadius.circular(16)),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                  Row(children: [
                    Container(width: 12, height: 12, decoration: BoxDecoration(color: z['color'] as Color, shape: BoxShape.circle)),
                    const SizedBox(width: 8),
                    Text('${z['zone']} • ${z['name']}', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                  ]),
                  Text(z['range'] as String, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13)),
                ]),
                const SizedBox(height: 10),
                LinearProgressIndicator(value: z['val'] as double, backgroundColor: Colors.white10, color: z['color'] as Color, minHeight: 8, borderRadius: BorderRadius.circular(4)),
                const SizedBox(height: 6),
                Text('Target Intensity: ${z['pct']}', style: const TextStyle(color: AppTheme.textSecondary, fontSize: 11)),
              ]),
            ),
          ],
        ],
      ),
    );
  }
}
