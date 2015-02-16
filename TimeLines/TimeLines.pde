



//IMPORT LIBRARIES
import oscP5.*;
import netP5.*; 

////  GLOBAL VARIABLES  ////

// Init //
int frmrate = 60;

// OSC //
OscP5 meOsc;

// Canvas //
int cvmar = 50; //margins
int wingap = 30; //gap between windows

// Score Timing //
float scrlngpx = 0.0;
float scrdursec = 0.0;
float secperpx = 0.0;
float pxpersec = 0.0;
float pxperframe = 0.0;
float scrnumwin = 0.0;
float durframes = 0.0;
float secperframe = 0.0;
float durstave = 0.0;
PFont font1;


BezierSet beziers;


// CLASSES //

/// Windows ///
WinSet wins;
int defaultWinHt = 200;
int defaultWinW;

/// Cursors ///
CsrSet csrs;

void setup() {
  // Init //
  size(1000, 800);
  smooth();
  frameRate(frmrate);

  font1 = loadFont("Monaco-12.vlw");
  textAlign(CENTER);


  // Canvas //
  defaultWinW = width - (cvmar*2);

  // OSC //
  // meOsc = new OscP5(this, 8675);


  // Init Score Plug //
  // meOsc.plug(this, "initscore", "/initscore");

  // CLASSES //

  /// Windows ///
  wins = new WinSet();
  //  meOsc.plug(wins, "mkins", "/mkwin");
  // meOsc.plug(wins, "fillcanvas", "/fillcanvas");

  /// Cursors ///
  csrs = new CsrSet();
  //  meOsc.plug(csrs, "mkins", "/mkcsr");
  //  meOsc.plug(csrs, "play", "/playcsr");
  //  meOsc.plug(csrs, "pause", "/pausecsr");


  beziers = new BezierSet();
  beziers.mk(0, "nicegreen", 100, 164, 300, 164, 300, 50, 500, 50 );

  initscore(180.0, 5) ;
  csrs.play(0, 1, 1.0);
}

void draw() {
  background(clr.get("TranquilBlue"));

  // Windows //
  wins.drst();
  // Cursors //
  csrs.drst();

  beziers.drst();
}

