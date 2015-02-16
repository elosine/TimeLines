void initscore(float dur, int numstaves) {
  scrnumwin = numstaves;
  scrdursec = dur;
  durframes = dur*frmrate;
  durstave = dur/numstaves;
  secperframe = durframes/dur;
  scrlngpx = defaultWinW*numstaves;
  secperpx = dur/scrlngpx;
  pxpersec = scrlngpx/dur;
  pxperframe = scrlngpx/durframes;
 // println(pxperframe);
  wins.fillcanvas(numstaves);
  csrs.mkins(0, 0, "orange", 1.0);
  }

