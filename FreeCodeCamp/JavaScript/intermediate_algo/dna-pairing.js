function pairElement(str) {
  let pairedArr = [];

  function pairCheck(letter){
    switch(letter){
      case 'A':
        return 'T'
      break;
      case 'T':
        return 'A'
      break;
      case 'G':
        return 'C'
      break;
      case 'C':
        return 'G'
      break;
    }
  }

  for (let letter of str){
    pairedArr.push([letter, pairCheck(letter)])
  }
  return pairedArr;
}

console.log(pairElement("GCG"));