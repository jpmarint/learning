function truthCheck(collection, pre) {
  return collection.every(elem => elem.hasOwnProperty(pre) && Boolean(elem[pre]));
}

truthCheck([{name: "Quincy", role: "Founder", isBot: false}, {name: "Naomi", role: "", isBot: false}, {name: "Camperbot", role: "Bot", isBot: true}], "isBot");