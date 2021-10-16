var arr = [];
var minimal;
var maximal;
var items = 50;
var counter = 0;

function setup() {
  createCanvas(800, 800);
  
  for(var i=0; i<=items; i++) {
    arr.push(i);
  }
  
  background(0);
  minimal = 0
  maximal = items-1;
  drawArray();
}

function mousePressed() {
  counter++;
  if(counter == 1) {
    randomizeArray(arr)
  } else if(counter == 2) {
    bubbleSort(arr,1);
  }
}
function sleep(ms) {
  return new Promise(resolve => setTimeout(resolve, ms));
}

async function bubbleSort(arr, refreshRate) {
  for (let i = 0; i < arr.length; i++) {
    for (let j = 0; j < arr.length -i -1; j++) {
      if(arr[j] > arr[j+1]) {
        // swap
        var tmp = arr[j];
        arr[j] = arr[j+1];
        arr[j+1] = tmp;
        
        // purplish rect
        fill(100,0,255);
        var sx = map(j, 0, arr.length-1, 0, width-width/arr.length);
        var sy = map(arr[j+1], minimal, maximal, 0,height-5);
        rect(sx, height, width/arr.length, -sy);
        await sleep(refreshRate);
        background(0);
        drawArray();
      }
    }
  }
}

function drawArray() {
  for(var i=0; i<arr.length; i++) {
    fill(255);
    var sx = map(i, 0, arr.length-1, 0, width-width/arr.length);
    var sy = map(arr[i], minimal, maximal, 0,height-5);
    rect(sx, height, width/arr.length, -sy);
  }
}
async function randomizeArray(arr) {
  for(var i=0; i<arr.length*3; i++) {
    random_x = floor(random(arr.length))
    random_y = floor(random(arr.length))
    
    var tmp = arr[random_x];
    arr[random_x] = arr[random_y];
    arr[random_y] = tmp;
    await sleep(1);
    background(0);
    drawArray();
  }

  return true;
}
// 10,5,4,3,2
// 5,10,4,3,2
// 5,4,10,3,2
// 5,4,3,10,2
// 5,4,3,2,10
// ....