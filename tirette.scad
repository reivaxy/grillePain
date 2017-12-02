// Tirette de grille pain

x = 30.5;
y = 11.3;
z = 17.6;
zm = 17.0;

e = 1.4;

petitRayon = 3;
grandRayon = 4;

manchonX = 4.1;
manchonZ = 29;

tiretteX = 1.5;
tiretteY = 8;

fleche = z - zm;
corde = x;

rayonDisque = (fleche)/2 + corde*corde/(8*fleche);


tirette();
//test();

module tirette() {
  difference() {
    union() {
      translate([0, 0, z/2])
        cubeArrondi([x, y, z/2], petitRayon);
      intersection() {
        cubeArrondi([x, y, z], petitRayon);
        translate([0, y/2, z/2])
          rotate([0, -90, 90])
            demiCubeArrondi([z, x, y], grandRayon);
      }
    }
    translate([0, 0, e*3])
      cubeArrondi([x - 2*e, y - 2*e, z], petitRayon);
    translate([0, z/2, rayonDisque + zm])
      rotate([90, 0, 0])
        cylinder(r=rayonDisque, h=z, $fn=500);
  }
  // manchon
  difference() {
    translate([-manchonX/2, -y/2, 0])
      cube([manchonX, y, manchonZ]);
    translate([-tiretteX/2, -tiretteY/2, 0])
      cube([tiretteX, tiretteY, manchonZ]);
  }
}

module test() {  
        cubeArrondi([x - 2*e, y - 2*e, z], petitRayon);

}

module demiCubeArrondi(size, radius) {
  difference() {
    cubeArrondi(size, radius);
    translate([0, -size[1]/2 -0.5, -0.5])
      cube([size[0], size[1]+1, size[2]+1]);
  }
}

module cubeArrondi(size, radius) {
  x = size[0] - radius;
  y = size[1] - radius;
  z = size[2];

  linear_extrude(height=z)
  hull()
  {
      // place 4 circles in the corners, with the given radius
      translate([(-x/2)+(radius/2), (-y/2)+(radius/2), 0])
      circle(r=radius, $fn=40);

      translate([(x/2)-(radius/2), (-y/2)+(radius/2), 0])
      circle(r=radius, $fn=40);

      translate([(-x/2)+(radius/2), (y/2)-(radius/2), 0])
      circle(r=radius, $fn=40);

      translate([(x/2)-(radius/2), (y/2)-(radius/2), 0])
      circle(r=radius, $fn=40);
  }  
}
