//make bounding box
//preset constructor 
//framerate clock

class Win {
  // CONSTRUCTOR VARIALBES //
  int ix;
  int bdr, fil, bdrclr;
  float x, y, w, h;

  // CLASS VARIABLES //
  int numsecinwin;
  float[]secmarklocs;

  // CONSTRUCTORS //
  //Constructor 1 - Standard Window(noborder, default size/color/location)
  Win(int aix, int ax, int ay, int aw, int ah) {
    ix = aix;
    x = ax;
    y = ay;
    w = aw;
    h = ah;
    fil = clr.get("TranquilBlue");
    bdr = 0;
    numsecinwin = floor(w/pxpersec);
    secmarklocs = new float[numsecinwin];
    for (int i=0; i<secmarklocs.length; i++) {
      secmarklocs[i] = pxpersec*i;
    }
  } //end constructor 1

  //  DRAW METHOD //
  void drw() {
    //Border
    if (bdr == 0) noStroke();
    else { 
      strokeWeight(bdr); 
      stroke(bdrclr);
    }
    //Fill
    fill(0);
    //Make Window
    rect(x, y, w, h);
    //Make Time Marks
    stroke(clr.get("yellow"));
    strokeWeight(1);
    for (int i=0; i<secmarklocs.length; i++) {
      line(secmarklocs[i]+x, y, secmarklocs[i]+x, y-5);
    }
    //Indication every 10 seconds
    for (int i=0; i<secmarklocs.length; i+=10) {
      fill(clr.get("yellow"));
      textFont(font1);
      textAlign(CENTER, BOTTOM);
      textSize(12);
      text(nf(i+(ix*durstave), 0, 0), secmarklocs[i]+x, y-5-2);
    }
  } //End drw
}  //End class

//// CLASS SET CLASS ////
class WinSet {
  ArrayList<Win> clst = new ArrayList<Win>();

  // Make Instance Method //
  void mkins(int ix, int x, int y, int w, int h) {
    clst.add(new Win(ix, x, y, w, h));
  } //end mk method

  // Draw Set Method //
  void drst() {
    for (int i=clst.size ()-1; i>=0; i--) {
      Win inst = clst.get(i);
      inst.drw();
    }
  } //end dr method

  // Draw Set Method //
  void fillcanvas(int numwin) {
    int sp = height - (cvmar*2); //amount of available space in pixels
    int winsz = ( height - (cvmar*2) - (wingap*(numwin-1)) )/numwin; //the win size is = (height - top&bottom margins - (numwins-1 number of gaps)) all devided by numwins
    int ix = 0; //counter
    if (clst.size() == 0) { //check to see if there are already windows
      while ( (sp)>0 ) { //while there is space left for a window 
        mkins(ix, cvmar, cvmar + (ix*(winsz+wingap)), defaultWinW, winsz);
        sp = sp - winsz - wingap;
        ix++;
      }
    }
  } //end fill canvas method
} //end class set class

