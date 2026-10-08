import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../services/routing_service.dart';

class Tab4Screen extends StatelessWidget {
  const Tab4Screen({super.key});
  @override
  Widget build(BuildContext context) {
    final days = [
      {'day': 'Mon', 'peak': 142}, {'day': 'Tue', 'peak': 158}, {'day': 'Wed', 'peak': 130},
      {'day': 'Thu', 'peak': 165}, {'day': 'Fri', 'peak': 150}, {'day': 'Sat', 'peak': 172}, {'day': 'Sun', 'peak': 135},
    ];
    return Scaffold(
      appBar: AppBar(title: const Text('Cardio Trends & History'), actions: [IconButton(icon: const Icon(Icons.file_download_outlined, color: AppTheme.primary), onPressed: () => RoutingService.openPartnerLink())]),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(color: AppTheme.card, borderRadius: BorderRadius.circular(20)),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text('Weekly Heart Rate Pulse', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                Text('Last 7 Days', style: TextStyle(color: AppTheme.primary, fontSize: 12, fontWeight: FontWeight.bold)),
              ]),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround, crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  for (final d in days) ...[
                    Column(children: [
                      Text('${d['peak']}', style: const TextStyle(fontSize: 10, color: AppTheme.textSecondary)),
                      const SizedBox(height: 4),
                      Container(width: 22, height: (d['peak'] as int) * 0.6, decoration: BoxDecoration(gradient: const LinearGradient(colors: [AppTheme.primary, AppTheme.secondary], begin: Alignment.topCenter, end: Alignment.bottomCenter), borderRadius: BorderRadius.circular(6))),
                      const SizedBox(height: 8),
                      Text(d['day'] as String, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
                    ]),
                  ],
                ],
              ),
            ]),
          ),
          const SizedBox(height: 16),
          const Text('Weekly Achievements', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          for (final a in [
            {'title': '120 Min in Peak Cardio', 'desc': 'Exceeded weekly aerobic threshold goal by 15%', 'icon': Icons.bolt, 'color': Colors.amber},
            {'title': 'Consistent Recovery', 'desc': 'Maintained 58-62 BPM resting HR across 5 days', 'icon': Icons.favorite, 'color': Colors.greenAccent},
            {'title': 'HIIT Master', 'desc': 'Completed 4 high-intensity pulse sprint sessions', 'icon': Icons.local_fire_department, 'color': Colors.deepOrangeAccent},
          ]) ...[
            Container(
              margin: const EdgeInsets.only(bottom: 12), padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(color: AppTheme.card, borderRadius: BorderRadius.circular(16)),
              child: ListTile(
                contentPadding: EdgeInsets.zero,
                leading: CircleAvatar(backgroundColor: (a['color'] as Color).withValues(alpha: 0.15), child: Icon(a['icon'] as IconData, color: a['color'] as Color)),
                title: Text(a['title'] as String, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                subtitle: Text(a['desc'] as String, style: const TextStyle(color: AppTheme.textSecondary, fontSize: 12)),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
