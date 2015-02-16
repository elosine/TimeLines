class Csr {
  // CONSTRUCTOR VARIALBES //
  int ix;
  int stavenum, wt;
  String cl;
  float spdpxperfr;
  float currtime = 0.0;
  int dir = 1;

  // CLASS VARIABLES //
  boolean go = false;
  float x;
  float y1, y2;
  float stavebegin;
  float stavew;

  // CONSTRUCTORS //
  //Constructor 1 
  Csr(int aix, int astavenum, String acl, int awt, float aspdpxperfr) {
    ix = aix;
    stavenum = astavenum;
    cl = acl;
    wt = awt;
    spdpxperfr = aspdpxperfr;

    Win w = wins.clst.get(stavenum);
    x = w.x;
    stavebegin = w.x;
    y1 = w.y;
    y2 = w.y+w.h;
    stavew = w.w;
  } //end constructor 1

  //  DRAW METHOD //
  void drw() {

    /// Boundary Conditions ///
    if (x>stavew+cvmar) {
      stavenum = (stavenum+1)%int(scrnumwin);
      Win w1 = wins.clst.get(stavenum);
      x = w1.x;
      stavebegin = w1.x;
      y1 = w1.y;
      y2 = w1.y+w1.h;
      stavew = w1.w;
    }

    if (x < stavebegin) {
      if (stavenum==0) {
        stavenum=int(scrnumwin)-1;
      }
      else {
        stavenum = stavenum-1;
      }
      Win w2 = wins.clst.get(stavenum);
      x = w2.w;
      stavebegin = w2.x;
      y1 = w2.y;
      y2 = w2.y+w2.h;
      stavew = w2.w;
    }
   // println(stavenum);
    //Calculate Time
    currtime = (durstave*stavenum) + map(x, stavebegin, stavebegin+stavew, 0.0, durstave);
    // println(currtime);
    /// Draw ///
    //Stroke
    strokeWeight(wt); 
    stroke(clr.get(cl));
    //Draw Cursor
    line(x, y1, x, y2);
    strokeWeight(1);
    noFill();
    // rect(x-5, y1-20, 10, 20);
    //Timer
    fill(clr.get(cl));
    textFont(font1);
      textAlign(CENTER, BOTTOM);
      textSize(12);
    text(nf(currtime, 0, 1), x, y2+13);

    /// Animate ///
    if (go) {
      x = x+(spdpxperfr*dir);
    }
  } //End drw
}  //End class

//// CLASS SET CLASS ////
class CsrSet {
  ArrayList<Csr> clst = new ArrayList<Csr>();

  // Make Instance Method //
  void mkins(int ix, int stave, String cl, float spd) {
    //println(cl);
    Win w1 = wins.clst.get(stave);
    clst.add(new Csr(ix, stave, cl, 3, spd*pxperframe));
  } //end mk method

  // Draw Set Method //
  void drst() {
    for (int i=clst.size()-1; i>=0; i--) {
      Csr inst = clst.get(i);
      inst.drw();
    }
  } //end dr method

  // Cursor Go //
  void play(int ix, int dir, float spd) {
    for (int i=clst.size()-1; i>=0; i--) {
      Csr inst = clst.get(i);
      if (inst.ix == ix) {
        inst.go = true;
        inst.dir = dir;
        inst.spdpxperfr = spd*pxperframe;
      }
    }
  } //end play method

  // Cursor Pause //
  void pause(int ix) {
    for (int i=clst.size()-1; i>=0; i--) {
      Csr inst = clst.get(i);
      if (inst.ix == ix) {
        inst.go = false;
      }
    }
  } //end pause method
} //end class set class

