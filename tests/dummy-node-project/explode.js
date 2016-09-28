function tick() {
  tock();
}

function tock() {
  throw new Error('boom!');
}

tick();
