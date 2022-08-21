class GameModel {
  GameModel(this.target,
      [this.current = sliderStart,
      this.round = roundStart,
      this.totalScore = scoreStart]);

  static const sliderStart = 50;
  static const scoreStart = 0;
  static const roundStart = 1;

  int target;
  int totalScore;
  int current;
  int round;

  bool hitTheTarget() {
    if (current == target) {
      totalScore += 1;
      return true;
    }
    return false;
  }

  void startOver() {
    round = 1;
    totalScore = 0;
  }
}
