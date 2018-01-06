# KeyTouch

## Draw Over Your Physical Keyboard Like a Touchscreen

### Motivation 
On computers, we have a substantial array of keys in front of us. Can this be used similar to a big touchpad albeit with lower resolution. Can simple tasks like changing windows, brightness volume, etc. be done without the need to remember shortcuts, complex menus and specific keys? KeyTouch uses gestures which can be “drawn” by dragging your finger across your keyboard (think like pressing all keys across a piano with one finger).

### Implementation 

The Proof of Concept implements this concept to change volume using the top row of numeric keys. 
Swipe right anywhere on the numeric keys to increase volume. Swipe left to decrease volume. 

**Note:** The PoC currently uses [nircmd](http://www.nirsoft.net/utils/nircmd.html) to facilitate volume control. Thus for now this code will successfully run only on Windows. 
