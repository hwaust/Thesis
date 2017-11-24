%GNUPLOT Metapost output: Sat Apr 29 15:31:26 2017


warningcheck:=0;
defaultmpt:=mpt:=6;
th:=.8;
%% Have nice sharp joins on our lines
linecap:=butt;
linejoin:=mitered;

def scalepen expr n = pickup pencircle scaled (n*th) enddef;
def ptsize expr n = mpt:=n*defaultmpt enddef;


textmag:= 1.000;
vardef makepic(expr str) =
  if picture str : str scaled textmag
  % otherwise a string
  else: str infont defaultfont scaled (defaultscale*textmag)
  fi
enddef;

def infontsize(expr str, size) =
  infont str scaled (size / fontsize str)
enddef;

%font changes
verbatimtex
\def\setfont#1#2{%.
  \font\gpfont=#1 at #2pt
\gpfont}
\setfont{cmr10}{14.00}
etex

color currentcolor; currentcolor:=black;
color fillcolor;
boolean colorlines,dashedlines;
colorlines:=true;
dashedlines:=true;

def _wc = withpen currentpen withcolor currentcolor enddef;
def _ac = addto currentpicture enddef;
def _sms = scaled mpt shifted enddef;
% drawing point-types
def gpdraw (expr n, x, y) =
  if n<0: _ac contour fullcircle _sms (x,y)
  elseif (n=1) or (n=3):
    _ac doublepath ptpath[n] _sms (x,y) _wc;
    _ac doublepath ptpath[n] rotated 90 _sms (x,y) _wc
  elseif n<6: _ac doublepath ptpath[n] _sms (x,y) _wc
  else: _ac contour ptpath[n] _sms (x,y) _wc
  fi
enddef;

% the point shapes
path ptpath[];
%diamond
ptpath0 = ptpath6 = (-1/2,0)--(0,-1/2)--(1/2,0)--(0,1/2)--cycle;
% plus sign
ptpath1 = (-1/2,0)--(1/2,0);
% square
ptpath2 = ptpath7 = (-1/2,-1/2)--(1/2,-1/2)--(1/2,1/2)--(-1/2,1/2)--cycle;
% cross
ptpath3 := (-1/2,-1/2)--(1/2,1/2);
% circle:
ptpath4 = ptpath8:= fullcircle;
% triangle
ptpath5 = ptpath9 := (0,1/2)--(-1/2,-1/2)--(1/2,-1/2)--cycle;

def linetype expr n =
  currentcolor:= if colorlines : col[n] else: black fi;
  if n = -1 :
      drawoptions(withcolor currentcolor withpen (currentpen scaled .5));
  elseif n < 1 :
    drawoptions(_wc);
  else :
    drawoptions( if dashedlines: dashed lt[n] fi _wc);
  fi
enddef;

% dash patterns
picture lt[];
lt1=dashpattern(on 2 off 2); % dashes
lt2=dashpattern(on 2 off 2 on 0.2 off 2); %dash-dot
lt3=lt1 scaled 1.414;
lt4=lt2 scaled 1.414;
lt5=lt1 scaled 2;
lt6:=lt2 scaled 2;
lt7=dashpattern(on 0.2 off 2); %dots

color col[],cyan, magenta, yellow;
cyan=blue+green; magenta=red+blue;yellow=green+red;
col[-2]:=col[-1]:=col0:=black;
col1:=.8red;
col2:=.8(.2,.2,1); %blue
col3:= .6*magenta; % (1,.66,0); %orange
col4:=.8*.85*green;
col5:=.9*magenta;
col6:=0.85*cyan;
col7:=.85*yellow;

%placing text
picture GPtext;
def put_text(expr pic, x, y, r, j) =
  GPtext:=makepic(pic);
  GPtext:=GPtext shifted
    if j = 1: (-(ulcorner GPtext + llcorner GPtext)/2)
    elseif j = 2: (-center GPtext)
    else: (-(urcorner GPtext + lrcorner GPtext)/2)
    fi
    rotated r;
  addto currentpicture also GPtext shifted (x,y)
enddef;

beginfig(0);
w:=5.000in;h:=3.000in;
a:=w/1200.0;b:=h/720.0;
scalepen 1; ptsize 1.000;linetype -2;
draw (187.1a,164.1b)--(203.7a,164.1b);
draw (1125.8a,164.1b)--(1109.2a,164.1b);
put_text( btex  0 etex, 162.4a, 164.1b, 0, 3);
draw (187.1a,248.5b)--(203.7a,248.5b);
draw (1125.8a,248.5b)--(1109.2a,248.5b);
put_text( btex  2 etex, 162.4a, 248.5b, 0, 3);
draw (187.1a,332.9b)--(203.7a,332.9b);
draw (1125.8a,332.9b)--(1109.2a,332.9b);
put_text( btex  4 etex, 162.4a, 332.9b, 0, 3);
draw (187.1a,417.3b)--(203.7a,417.3b);
draw (1125.8a,417.3b)--(1109.2a,417.3b);
put_text( btex  6 etex, 162.4a, 417.3b, 0, 3);
draw (187.1a,501.7b)--(203.7a,501.7b);
draw (1125.8a,501.7b)--(1109.2a,501.7b);
put_text( btex  8 etex, 162.4a, 501.7b, 0, 3);
draw (187.1a,586.1b)--(203.7a,586.1b);
draw (1125.8a,586.1b)--(1109.2a,586.1b);
put_text( btex  10 etex, 162.4a, 586.1b, 0, 3);
draw (187.1a,670.5b)--(203.7a,670.5b);
draw (1125.8a,670.5b)--(1109.2a,670.5b);
put_text( btex  12 etex, 162.4a, 670.5b, 0, 3);
draw (262.2a,164.1b)--(262.2a,180.7b);
draw (262.2a,670.5b)--(262.2a,653.9b);
put_text( btex  1 etex, 262.2a, 112.8b, 0, 2);
draw (412.4a,164.1b)--(412.4a,180.7b);
draw (412.4a,670.5b)--(412.4a,653.9b);
put_text( btex  3 etex, 412.4a, 112.8b, 0, 2);
draw (637.7a,164.1b)--(637.7a,180.7b);
draw (637.7a,670.5b)--(637.7a,653.9b);
put_text( btex  6 etex, 637.7a, 112.8b, 0, 2);
draw (1088.3a,164.1b)--(1088.3a,180.7b);
draw (1088.3a,670.5b)--(1088.3a,653.9b);
put_text( btex  12 etex, 1088.3a, 112.8b, 0, 2);
draw (187.1a,670.5b)--(187.1a,164.1b)--(1125.8a,164.1b)--(1125.8a,670.5b)--(187.1a,670.5b);
put_text( btex Work / Span etex scaled 1.2, 37.9a, 417.3b, -270, 2);
linetype -2;
put_text( btex Number of Threads etex scaled 1.2, 656.4a, 35.9b, 0, 2);
linetype -2;
linetype 0;
put_text( btex XM1(a) etex, 380.0a, 628.3b, 0, 3);
linetype 0;
gpdraw(0,262.2a,206.3b);
gpdraw(0,337.3a,228.0b);
gpdraw(0,412.4a,233.2b);
gpdraw(0,637.7a,282.8b);
gpdraw(0,442.4a,628.3b);
linetype 1;
put_text( btex XM3(c) etex, 380.0a, 577.0b, 0, 3);
linetype 1;
gpdraw(1,262.2a,206.3b);
gpdraw(1,337.3a,245.6b);
gpdraw(1,412.4a,283.1b);
gpdraw(1,637.7a,407.3b);
gpdraw(1,1088.3a,626.4b);
gpdraw(1,442.4a,577.0b);
linetype 2;
put_text( btex XM4(c) etex, 380.0a, 525.7b, 0, 3);
linetype 2;
gpdraw(2,262.2a,206.3b);
gpdraw(2,337.3a,244.5b);
gpdraw(2,412.4a,284.3b);
gpdraw(2,637.7a,395.6b);
gpdraw(2,1088.3a,588.8b);
gpdraw(2,442.4a,525.7b);
linetype 3;
put_text( btex XM5(b) etex, 380.0a, 474.4b, 0, 3);
linetype 3;
gpdraw(3,262.2a,206.3b);
gpdraw(3,337.3a,245.8b);
gpdraw(3,412.4a,286.9b);
gpdraw(3,637.7a,409.6b);
gpdraw(3,1088.3a,645.9b);
gpdraw(3,442.4a,474.4b);
linetype 4;
put_text( btex XM6(b) etex, 380.0a, 423.1b, 0, 3);
linetype 4;
gpdraw(4,262.2a,206.3b);
gpdraw(4,337.3a,245.3b);
gpdraw(4,412.4a,282.0b);
gpdraw(4,637.7a,396.2b);
gpdraw(4,1088.3a,592.6b);
gpdraw(4,442.4a,423.1b);
linetype 5;
currentcolor := .5white;
draw (187.1a,164.1b)--(196.6a,169.4b)--(206.1a,174.8b)--(215.5a,180.1b)--(225.0a,185.4b)
--(234.5a,190.7b)--(244.0a,196.1b)--(253.5a,201.4b)--(263.0a,206.7b)--(272.4a,212.1b)
--(281.9a,217.4b)--(291.4a,222.7b)--(300.9a,228.0b)--(310.4a,233.4b)--(319.8a,238.7b)
--(329.3a,244.0b)--(338.8a,249.4b)--(348.3a,254.7b)--(357.8a,260.0b)--(367.3a,265.3b)
--(376.7a,270.7b)--(386.2a,276.0b)--(395.7a,281.3b)--(405.2a,286.7b)--(414.7a,292.0b)
--(424.1a,297.3b)--(433.6a,302.6b)--(443.1a,308.0b)--(452.6a,313.3b)--(462.1a,318.6b)
--(471.6a,323.9b)--(481.0a,329.3b)--(490.5a,334.6b)--(500.0a,339.9b)--(509.5a,345.3b)
--(519.0a,350.6b)--(528.4a,355.9b)--(537.9a,361.2b)--(547.4a,366.6b)--(556.9a,371.9b)
--(566.4a,377.2b)--(575.9a,382.6b)--(585.3a,387.9b)--(594.8a,393.2b)--(604.3a,398.5b)
--(613.8a,403.9b)--(623.3a,409.2b)--(632.7a,414.5b)--(642.2a,419.9b)--(651.7a,425.2b)
--(661.2a,430.5b)--(670.7a,435.8b)--(680.2a,441.2b)--(689.6a,446.5b)--(699.1a,451.8b)
--(708.6a,457.2b)--(718.1a,462.5b)--(727.6a,467.8b)--(737.0a,473.1b)--(746.5a,478.5b)
--(756.0a,483.8b)--(765.5a,489.1b)--(775.0a,494.5b)--(784.5a,499.8b)--(793.9a,505.1b)
--(803.4a,510.4b)--(812.9a,515.8b)--(822.4a,521.1b)--(831.9a,526.4b)--(841.3a,531.8b)
--(850.8a,537.1b)--(860.3a,542.4b)--(869.8a,547.7b)--(879.3a,553.1b)--(888.8a,558.4b)
--(898.2a,563.7b)--(907.7a,569.0b)--(917.2a,574.4b)--(926.7a,579.7b)--(936.2a,585.0b)
--(945.6a,590.4b)--(955.1a,595.7b)--(964.6a,601.0b)--(974.1a,606.3b)--(983.6a,611.7b)
--(993.1a,617.0b)--(1002.5a,622.3b)--(1012.0a,627.7b)--(1021.5a,633.0b)--(1031.0a,638.3b)
--(1040.5a,643.6b)--(1049.9a,649.0b)--(1059.4a,654.3b)--(1068.9a,659.6b)--(1078.4a,665.0b)
--(1087.9a,670.3b)--(1088.3a,670.5b);
linetype -2;
scalepen 1.5;
draw (187.1a,670.5b)--(187.1a,164.1b)--(1125.8a,164.1b)--(1125.8a,670.5b)--(187.1a,670.5b);
scalepen 1;
endfig;

beginfig(1);
w:=5.000in;h:=3.000in;
a:=w/1200.0;b:=h/720.0;
scalepen 1; ptsize 1.000;linetype -2;
draw (162.4a,164.1b)--(179.0a,164.1b);
draw (1125.8a,164.1b)--(1109.2a,164.1b);
put_text( btex  0 etex, 137.7a, 164.1b, 0, 3);
draw (162.4a,308.8b)--(179.0a,308.8b);
draw (1125.8a,308.8b)--(1109.2a,308.8b);
put_text( btex  2 etex, 137.7a, 308.8b, 0, 3);
draw (162.4a,453.5b)--(179.0a,453.5b);
draw (1125.8a,453.5b)--(1109.2a,453.5b);
put_text( btex  4 etex, 137.7a, 453.5b, 0, 3);
draw (162.4a,598.2b)--(179.0a,598.2b);
draw (1125.8a,598.2b)--(1109.2a,598.2b);
put_text( btex  6 etex, 137.7a, 598.2b, 0, 3);
draw (239.5a,164.1b)--(239.5a,180.7b);
draw (239.5a,670.5b)--(239.5a,653.9b);
put_text( btex  1 etex, 239.5a, 112.8b, 0, 2);
draw (393.6a,164.1b)--(393.6a,180.7b);
draw (393.6a,670.5b)--(393.6a,653.9b);
put_text( btex  3 etex, 393.6a, 112.8b, 0, 2);
draw (624.8a,164.1b)--(624.8a,180.7b);
draw (624.8a,670.5b)--(624.8a,653.9b);
put_text( btex  6 etex, 624.8a, 112.8b, 0, 2);
draw (1087.3a,164.1b)--(1087.3a,180.7b);
draw (1087.3a,670.5b)--(1087.3a,653.9b);
put_text( btex  12 etex, 1087.3a, 112.8b, 0, 2);
draw (162.4a,670.5b)--(162.4a,164.1b)--(1125.8a,164.1b)--(1125.8a,670.5b)--(162.4a,670.5b);
put_text( btex Increase of Work etex scaled 1.2, 37.9a, 417.3b, -270, 2);
linetype -2;
put_text( btex Number of Threads etex scaled 1.2, 644.1a, 35.9b, 0, 2);
linetype -2;
linetype 0;
put_text( btex XM1(a) etex, 355.3a, 628.3b, 0, 3);
linetype 0;
gpdraw(0,239.5a,236.4b);
gpdraw(0,316.5a,247.5b);
gpdraw(0,393.6a,249.8b);
gpdraw(0,624.8a,245.0b);
gpdraw(0,417.7a,628.3b);
linetype 1;
put_text( btex XM3(c) etex, 355.3a, 577.0b, 0, 3);
linetype 1;
gpdraw(1,239.5a,236.4b);
gpdraw(1,316.5a,248.1b);
gpdraw(1,393.6a,256.1b);
gpdraw(1,624.8a,297.6b);
gpdraw(1,1087.3a,428.8b);
gpdraw(1,417.7a,577.0b);
linetype 2;
put_text( btex XM4(c) etex, 355.3a, 525.7b, 0, 3);
linetype 2;
gpdraw(2,239.5a,236.4b);
gpdraw(2,316.5a,251.1b);
gpdraw(2,393.6a,256.4b);
gpdraw(2,624.8a,257.9b);
gpdraw(2,1087.3a,311.6b);
gpdraw(2,417.7a,525.7b);
linetype 3;
put_text( btex XM5(b) etex, 355.3a, 474.4b, 0, 3);
linetype 3;
gpdraw(3,239.5a,236.4b);
gpdraw(3,316.5a,263.1b);
gpdraw(3,393.6a,287.2b);
gpdraw(3,624.8a,394.4b);
gpdraw(3,1087.3a,633.9b);
gpdraw(3,417.7a,474.4b);
linetype 4;
put_text( btex XM6(b) etex, 355.3a, 423.1b, 0, 3);
linetype 4;
gpdraw(4,239.5a,236.4b);
gpdraw(4,316.5a,244.9b);
gpdraw(4,393.6a,248.3b);
gpdraw(4,624.8a,254.7b);
gpdraw(4,1087.3a,313.0b);
gpdraw(4,417.7a,423.1b);
linetype 5;
currentcolor := .5white;
draw (162.4a,236.4b)--(172.1a,236.4b)--(181.9a,236.4b)--(191.6a,236.4b)--(201.3a,236.4b)
--(211.1a,236.4b)--(220.8a,236.4b)--(230.5a,236.4b)--(240.3a,236.4b)--(250.0a,236.4b)
--(259.7a,236.4b)--(269.4a,236.4b)--(279.2a,236.4b)--(288.9a,236.4b)--(298.6a,236.4b)
--(308.4a,236.4b)--(318.1a,236.4b)--(327.8a,236.4b)--(337.6a,236.4b)--(347.3a,236.4b)
--(357.0a,236.4b)--(366.8a,236.4b)--(376.5a,236.4b)--(386.2a,236.4b)--(396.0a,236.4b)
--(405.7a,236.4b)--(415.4a,236.4b)--(425.1a,236.4b)--(434.9a,236.4b)--(444.6a,236.4b)
--(454.3a,236.4b)--(464.1a,236.4b)--(473.8a,236.4b)--(483.5a,236.4b)--(493.3a,236.4b)
--(503.0a,236.4b)--(512.7a,236.4b)--(522.5a,236.4b)--(532.2a,236.4b)--(541.9a,236.4b)
--(551.7a,236.4b)--(561.4a,236.4b)--(571.1a,236.4b)--(580.8a,236.4b)--(590.6a,236.4b)
--(600.3a,236.4b)--(610.0a,236.4b)--(619.8a,236.4b)--(629.5a,236.4b)--(639.2a,236.4b)
--(649.0a,236.4b)--(658.7a,236.4b)--(668.4a,236.4b)--(678.2a,236.4b)--(687.9a,236.4b)
--(697.6a,236.4b)--(707.4a,236.4b)--(717.1a,236.4b)--(726.8a,236.4b)--(736.5a,236.4b)
--(746.3a,236.4b)--(756.0a,236.4b)--(765.7a,236.4b)--(775.5a,236.4b)--(785.2a,236.4b)
--(794.9a,236.4b)--(804.7a,236.4b)--(814.4a,236.4b)--(824.1a,236.4b)--(833.9a,236.4b)
--(843.6a,236.4b)--(853.3a,236.4b)--(863.1a,236.4b)--(872.8a,236.4b)--(882.5a,236.4b)
--(892.2a,236.4b)--(902.0a,236.4b)--(911.7a,236.4b)--(921.4a,236.4b)--(931.2a,236.4b)
--(940.9a,236.4b)--(950.6a,236.4b)--(960.4a,236.4b)--(970.1a,236.4b)--(979.8a,236.4b)
--(989.6a,236.4b)--(999.3a,236.4b)--(1009.0a,236.4b)--(1018.8a,236.4b)--(1028.5a,236.4b)
--(1038.2a,236.4b)--(1047.9a,236.4b)--(1057.7a,236.4b)--(1067.4a,236.4b)--(1077.1a,236.4b)
--(1086.9a,236.4b)--(1096.6a,236.4b)--(1106.3a,236.4b)--(1116.1a,236.4b)--(1125.8a,236.4b);
linetype -2;
scalepen 1.5;
draw (162.4a,670.5b)--(162.4a,164.1b)--(1125.8a,164.1b)--(1125.8a,670.5b)--(162.4a,670.5b);
scalepen 1;
endfig;
end.
