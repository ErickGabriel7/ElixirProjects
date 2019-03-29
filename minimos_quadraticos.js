//pontos de entrada:
    [50, 50],
    [50, 70],
    [50, 80],
    [70, 50],
    [90, 50],

//função calculada:
-0.46875x + 89.0625

//implementação em javascript
  //reference: http://faculty.cs.niu.edu/~hutchins/csci230/best-fit.htm
  function calculateLine(points) {
    var count = points.length;

    var sumX = 0;
    var sumY = 0;
    var sumX2 = 0;
    var sumXY = 0;

    for (i = 0; i < count; i++) {
      sumX += points[i][0];
      sumY += points[i][1];
      sumX2 += points[i][0] * points[i][0];
      sumXY += points[i][0] * points[i][1];
    }

    var xMean = sumX / count;
    var yMean = sumY / count;
    var slope = (sumXY - sumX * yMean) / (sumX2 - sumX * xMean);
    var yInt = yMean - slope * xMean;

    console.log('y = ' + slope + 'x + ' + yInt);
return [slope, yInt];

  }
