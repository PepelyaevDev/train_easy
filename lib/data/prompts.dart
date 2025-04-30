class PromptTrainParams {
  const PromptTrainParams({
    required this.age,
    required this.height,
    required this.weight,
    required this.trainingLevel,
    required this.equipment,
    required this.useFloor,
    required this.locale,
  });

  final int age;
  final double height;
  final double weight;
  final String trainingLevel;
  final List<String> equipment;
  final bool useFloor;
  final String locale;
}

abstract class PromptLines {
  //User prompts

  static String userWarmUpAndCoolDown({
    required bool isAgeOver50,
    required String injuriesAndSickness,
    required String trainLevel,
    required List<String> equipment,
    required bool useFloor,
    required String locale,
  }) =>
      'Create a complete pre- and post-workout program.'
      'The "warmUp" should include '
      'one cardio exercise (5–7 minutes) to increase heart rate and warm up the body, '
      'as well as ten dynamic exercises to warm up all muscle groups and joints. '
      'The "callDown" should include '
      'one low-intensity cardio exercise (5–7 minutes) to lower heart rate, '
      'as well as ten flexibility exercises for full-body stretching. '
      'Consider this information when creating exercises: '
      '${isAgeOver50 ? '- My age is over 50 years; ' : ''}'
      '${injuriesAndSickness.isNotEmpty ? '- Injuries and illnesses: $injuriesAndSickness; ' : ''}'
      '- Training level: $trainLevel; '
      '- Available equipment: ${equipment.isEmpty ? 'no equipment available' : equipment.join(', ')}; '
      '${useFloor ? '' : ' - I train outdoors, exercises where you have to sit or lie down on the ground are not allowed; '}'
      '- All information in the answer must be in the language: $locale. ';

  static String userMainPath(PromptTrainParams params, String workoutGoal, int numberOfWorkoutsPerWeek) => ''
      'Create a program of 3 workouts, the goal of the workouts is general physical fitness. '
      'Consider user information when creating exercises: '
      '- Age: ${params.age} years '
      '- Height: ${params.height.toStringAsFixed(1)} cm '
      '- Weight: ${params.weight.toStringAsFixed(1)} kg '
      '- Training level: ${params.trainingLevel} '
      '- Available equipment: ${params.equipment.isEmpty ? 'no equipment available' : params.equipment.join(', ')} '
      '- Ability to perform exercises sitting or lying down: ${params.useFloor ? 'yes' : 'no'}. '
      'All information in the answer must be in the language: ${params.locale}. ';

  //System prompts

  static const systemWormUpAndCallDown = '$_inputData'
      'Fields: '
      '"wormUp" (required, list of exercises for worm up)'
      '"callDown" (required, list of exercises for call down)'
      '$_exerciseFields'
      '$_specificationRulesTitle'
      '$_specificationRulesCardio'
      '$_specificationRulesMobility'
      '$_specificationRulesStretching';

  static const systemMainPath = '$_inputData'
      'Fields: '
      '"workouts" (required, list of workouts).'
      'Workout fields: '
      '"mainPath" (required, list of exercises)'
      '$_exerciseFields'
      '$_specificationRulesTitle'
      '$_specificationRulesStrength'
      '$_specificationRulesBodyweight'
      '$_specificationRulesCardio';

  static const _inputData = 'You are a professional fitness trainer. Respond strictly in JSON format. ';

  static const _exerciseFields = 'Exercise fields: '
      '"name" (required, string: exercise name); '
      '"technique" (required, string: detailed execution technique, 4 - 5 sentences); '
      '"specifications" (required, string). ';

  static const _specificationRulesTitle = '"specifications" rules: ';

  static const _specificationRulesStrength =
      'for strength with weights, use %1PM (e.g. "4 sets of 8 reps at 75% of your one-rep max"); ';
  static const _specificationRulesBodyweight =
      'for bodyweight, use dynamic ranges (e.g., "4 sets at 90% of your max reps per set"; ';
  static const _specificationRulesCardio =
      'for cardio, use duration/intensity (e.g., "10 minutes at 70% of your max heart rate"); ';
  static const _specificationRulesMobility = 'for dynamic mobility drills, use duration (e.g., "30 seconds"); ';
  static const _specificationRulesStretching = 'for static stretching, use duration (e.g., "30 seconds"); ';
}
