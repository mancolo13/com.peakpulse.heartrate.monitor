import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../services/routing_service.dart';

class Tab1Screen extends StatefulWidget {
  const Tab1Screen({super.key});
  @override
  State<Tab1Screen> createState() => _Tab1ScreenState();
}
class _Tab1ScreenState extends State<Tab1Screen> {
  int _bpm = 74;
  bool _active = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PeakPulse • Live Monitor'),
        actions: [IconButton(icon: const Icon(Icons.shield_outlined, color: AppTheme.primary), onPressed: () => RoutingService.openPartnerLink())],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 20),
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [AppTheme.card, AppTheme.surface], begin: Alignment.topLeft, end: Alignment.bottomRight),
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: AppTheme.primary.withValues(alpha: 0.3)),
              ),
              child: Column(
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        width: 170, height: 170,
                        decoration: BoxDecoration(shape: BoxShape.circle, color: AppTheme.primary.withValues(alpha: 0.1), border: Border.all(color: AppTheme.primary.withValues(alpha: 0.4), width: 3)),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.favorite, color: AppTheme.primary, size: 36),
                          const SizedBox(height: 4),
                          Text('$_bpm', style: const TextStyle(fontSize: 46, fontWeight: FontWeight.w900, color: AppTheme.textPrimary)),
                          const Text('BPM', style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: AppTheme.primary)),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(color: AppTheme.primary.withValues(alpha: 0.15), borderRadius: BorderRadius.circular(20)),
                    child: const Text('Zone 1 • Resting Heart Rate', style: TextStyle(color: AppTheme.primary, fontWeight: FontWeight.bold)),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton.icon(
                    onPressed: () => setState(() { _active = !_active; if (_active) _bpm = 72 + (_bpm % 8); }),
                    icon: Icon(_active ? Icons.pause : Icons.play_arrow_rounded),
                    label: Text(_active ? 'Measuring Pulse...' : 'Quick Measure'),
                    style: ElevatedButton.styleFrom(backgroundColor: AppTheme.primary, foregroundColor: Colors.white, padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 14), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(color: AppTheme.card, borderRadius: BorderRadius.circular(16)),
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: const [
                      Text('HRV Index', style: TextStyle(color: AppTheme.textSecondary, fontSize: 13)),
                      SizedBox(height: 6),
                      Text('64 ms', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: AppTheme.textPrimary)),
                      Text('Optimal range', style: TextStyle(color: Colors.greenAccent, fontSize: 12)),
                    ]),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(color: AppTheme.card, borderRadius: BorderRadius.circular(16)),
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: const [
                      Text('Cardio Load', style: TextStyle(color: AppTheme.textSecondary, fontSize: 13)),
                      SizedBox(height: 6),
                      Text('Moderate', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: AppTheme.textPrimary)),
                      Text('Ready to train', style: TextStyle(color: AppTheme.primary, fontSize: 12)),
                    ]),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(color: AppTheme.card, borderRadius: BorderRadius.circular(16)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Today's Readings", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 12),
                  for (final item in [
                    {'time': '08:30 AM', 'type': 'Morning Resting', 'bpm': '68 BPM', 'badge': 'Normal'},
                    {'time': '12:15 PM', 'type': 'Post-Lunch Walk', 'bpm': '94 BPM', 'badge': 'Fat Burn'},
                    {'time': '05:40 PM', 'type': 'HIIT Cardio Session', 'bpm': '148 BPM', 'badge': 'Peak Zone'},
                  ]) ...[
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: CircleAvatar(backgroundColor: AppTheme.primary.withValues(alpha: 0.15), child: const Icon(Icons.favorite_border, color: AppTheme.primary, size: 20)),
                      title: Text(item['type']!, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                      subtitle: Text(item['time']!, style: const TextStyle(color: AppTheme.textSecondary, fontSize: 12)),
                      trailing: Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.end, children: [
                        Text(item['bpm']!, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                        Text(item['badge']!, style: const TextStyle(color: AppTheme.primary, fontSize: 11)),
                      ]),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
