function orbitalPeriod(arr) {
  const GM = 398600.4418;
  const earthRadius = 6367.4447;
  return arr
  .map(function(elem){
    elem.orbitalPeriod = 
    Math.round(
      2 * Math.PI * Math.sqrt(
        Math.pow(earthRadius + elem.avgAlt, 3) / GM
        )
      )
      delete elem.avgAlt;
    return elem;
  });
}

orbitalPeriod([{name : "sputnik", avgAlt : 35873.5553}]);