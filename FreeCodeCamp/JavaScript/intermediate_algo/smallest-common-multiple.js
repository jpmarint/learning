function smallestCommons(arr) {
  //Helper function to find the smallest common multiple of two numbers
  function computeSCM(num1, num2){
    let a = Math.min(num1, num2);
    let b = Math.max(num1, num2);

    for(let m = b; m <= a*b; m += b){
      if(m%a == 0){
        return m;
      }
    }
  }

  let x = Math.min(...arr);
  let y = Math.max(...arr);
  
  let scm =  1;

  for(let i = x; i <= y; i++){
    scm = computeSCM(scm, i);
  }

  return scm;
}

smallestCommons([1,5]);