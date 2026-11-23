import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_cevir_bakalim/oyun_cevir_bakalim.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(cevirBakalimConfig.title.length, 33);
    expect(cevirBakalimConfig.tagline.length, 33);
    for (final s in cevirBakalimConfig.tutorial) {
      expect(s.text.length, 33);
    }
    expect(cevirBakalimConfig.gameId, cevirBakalimId);
    expect(cevirBakalimRules.gameId, cevirBakalimId);
  });

  test('desteler kurulur ve doğrulanır', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(cevirBakalimRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: cevirBakalimId, optionalMechanics: cevirBakalimRules.optionalMechanics);
    for (final lv in [1, 77, 1500, 33333, 99999]) {
      expect(cevirBakalimRules.build(planner.spec(lv)).validation.ok, isTrue, reason: 'bölüm $lv');
    }
  });
}
