function addTogether() {
  let args = Array.from(arguments);
  if(args.some(elem => typeof elem !== 'number')){
    return undefined;
  }else if(args.length == 1){
    return x => addTogether(args[0], x);
  }else {
    return args[0] + args[1];
  }
}

addTogether(2,3);