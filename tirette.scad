// Tirette de grille pain

x = 30.5;
y = 11.3;
z = 17.6;
zm = 17.0;

e = 1.4;

manchonX = 4.1;
manchonZ = 29;

tirette();

module tirette() {


}
  

module rectArrondi(size, radius)  {
  x = 10;
  y = 20;
  z = 30;
  radius = 2;
  linear_extrude(height=z)
  hull()
  {
      // place 4 circles in the corners, with the given radius
      translate([(-x/2)+(radius/2), (-y/2)+(radius/2), 0])
      circle(r=radius);

      translate([(x/2)-(radius/2), (-y/2)+(radius/2), 0])
      circle(r=radius);

      translate([(-x/2)+(radius/2), (y/2)-(radius/2), 0])
      circle(r=radius);

      translate([(x/2)-(radius/2), (y/2)-(radius/2), 0])
      circle(r=radius);
  }  
}
