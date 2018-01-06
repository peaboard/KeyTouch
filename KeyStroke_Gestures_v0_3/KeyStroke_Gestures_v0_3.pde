/* Please replace Path to nircmd with your actual system path */

/*
 * Version 0.3
 * This Version Sticks to Volume Control Using Num Keys
 * Keys 1 to 0 are used as a touch gesture interface
 * Start with any key and drag right/left to increase/lower volume
 * Replace 
 */


/* TODO:
 * The actual gesture recognition part
 * Prevent false triggers
 */

import java.io.*;

int timeNow = 0;
int timeStart = 0;

IntList keyQueue = new IntList();

boolean[] keyPress = new boolean[12];

int lastPressX = 0;
int lastPressY = 0;

int nextPressX = 0;
int nextPressY = 0;

int lastVal = 0;
int nextVal = 0;

void setup() {
  size(1200, 500);
  noStroke();
  smooth();
  background(80);
}

void draw() {

  fill(127, 65, 244);
  for (int i = 0; i < keyQueue.size(); i++)
  {
    int ii = keyQueue.get(i);
    nextPressX = (ii*100);
    nextPressY = (height-400);
    nextVal = ii;
    if ((lastPressX == 0) && (lastPressY == 0))
    {
      lastPressX = (ii*100);
      lastPressY = (height-400);
      lastVal = ii;
    }
    else
    {
      stroke(255);
      strokeWeight(4);
      line(lastPressX, lastPressY, nextPressX, nextPressY);
      noStroke();

      if(nextVal - lastVal > 0)
      {
        increaseVolume();
      }
      else if (nextVal - lastVal < 0)
      {
        lowerVolume();
      }

      lastPressX = nextPressX;
      lastPressY = nextPressY;
      lastVal = nextVal;
    }
    //rect(ii*100, (height-400), 100, 100);
  }
  keyQueue.clear();

  for (int j = 0; j < keyPress.length; j++)
  {
    if (keyPress[j] == true)
    {
      //fill(127, 65, 244);
      rect(j*100, (height-400), 100, 100);
    }
    else if (keyPress[j] == false)
    {
      fill(80);
      rect(j*100, (height-400), 100, 100);
      fill(127, 65, 244);
    }
  }

}

void keyPressed() {

  switch(key)
  {
    case '1':
      keyPress[0] = true;
      keyQueue.append(0);
      break;

    case '2':
      keyPress[1] = true;
      keyQueue.append(1);
      break;

    case '3':
      keyPress[2] = true;
      keyQueue.append(2);
      break;

    case '4':
      keyPress[3] = true;
      keyQueue.append(3);
      break;

    case '5':
      keyPress[4] = true;
      keyQueue.append(4);
      break;

    case '6':
      keyPress[5] = true;
      keyQueue.append(5);
      break;

    case '7':
      keyPress[6] = true;
      keyQueue.append(6);
      break;

    case '8':
      keyPress[7] = true;
      keyQueue.append(7);
      break;

    case '9':
      keyPress[8] = true;
      keyQueue.append(8);
      break;

    case '0':
      keyPress[9] = true;
      keyQueue.append(9);
      break;

    case '-':
      keyPress[10] = true;
      keyQueue.append(10);
      break;

    case '=':
      keyPress[11] = true;
      keyQueue.append(11);
      break;

    default:
    break;
  }

}

void keyReleased()
{
  switch(key)
  {
    case '1':
      keyPress[0] = false;
      break;

    case '2':
      keyPress[1] = false;
      break;

    case '3':
      keyPress[2] = false;
      break;

    case '4':
      keyPress[3] = false;
      break;

    case '5':
      keyPress[4] = false;
      break;

    case '6':
      keyPress[5] = false;
      break;

    case '7':
      keyPress[6] = false;
      break;

    case '8':
      keyPress[7] = false;
      break;

    case '9':
      keyPress[8] = false;
      break;

    case '0':
      keyPress[9] = false;
      break;

    case '-':
      keyPress[10] = false;
      break;

    case '=':
      keyPress[11] = false;
      break;

    default:
    break;
  }
}

void lowerVolume()
{
  launch("G:/data1/Coding/Processing/KeyStroke_Gestures_v0_3/nircmd.exe changesysvolume -5000");
}

void increaseVolume()
{
  launch("G:/data1/Coding/Processing/KeyStroke_Gestures_v0_3/nircmd.exe changesysvolume 5000");
}