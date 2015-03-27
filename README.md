elo-rating-d
============
[![Build Status](https://api.travis-ci.org/Extrawurst/elo-rating-d.svg)](https://travis-ci.org/Extrawurst/elo-rating-d)

Simple implementation of the famous [ELO Rating formular](https://en.wikipedia.org/wiki/Elo_rating_system) written in the [D programming language](http://dlang.org/).

Tested with dmd >=2.063.2.
This project is a [dub package](http://code.dlang.org/packages/elo-rating-d)

usage:
============

add the elo-rating-d package to your dub dependancies and run ratings like this:

```
import elo.rating;

int MyRating = 1000;
int OpponentRating = 1000;

auto MyNewRating = RatingSystem.GetNewRating(MyRating,OpponentRating,RatingSystem.Result.Win);
```

Optionally you can specify the kFactor to be used as a 4th parameter. It is 30 by default.
