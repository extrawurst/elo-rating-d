module elo.rating;

import std.math;

///
struct RatingSystem
{
	///
	public enum Result
	{
		Win,
		Draw,
		Loss,
	}

	// Score constants
	private enum double[3] SCORE = [1.0,0.5,0.0];

	///
	public static int GetNewRating (int rating, int opponentRating, Result _result, double _kFactor = 30.0) 
	{
		return GetNewRating (rating, opponentRating, SCORE[cast(int)_result], _kFactor);
	}

	private static int GetNewRating(int rating, int opponentRating, double score, double _kFactor) 
	{
		double expectedScore = GetExpectedScore(rating, opponentRating);
		int    newRating     = CalculateNewRating(rating, score, expectedScore, _kFactor);

		return newRating;
	}

	private static double GetExpectedScore (int rating, int opponentRating) {
		return 1.0 / (1.0 + pow(10.0, (cast(double) (opponentRating - rating) / 400.0)));
	}

	private static int CalculateNewRating(int oldRating, double score, double expectedScore, double _kFactor) {
		return oldRating + cast(int) (_kFactor * (score - expectedScore));
	}
}

unittest
{
	assert(RatingSystem.GetNewRating(1500,1500,RatingSystem.Result.Win) == 1515);
	assert(RatingSystem.GetNewRating(1500,1500,RatingSystem.Result.Loss) == 1485);
	assert(RatingSystem.GetNewRating(1500,1500,RatingSystem.Result.Draw) == 1500);
}
