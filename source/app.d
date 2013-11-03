import std.stdio;

import elo.rating;

void main()
{ 
	writeln("elo demo");

	writefln("1500 wins against 1500 = %s",RatingSystem.GetNewRating(1500,1500,RatingSystem.Result.Win));
}
