//your code here
import java.util.*;
ArrayList<Particle> a = new ArrayList<Particle>();
void setup()
{
	size(800, 800);
	for (int i = 0; i<150; i++)
	{
		a.add(new NormalParticle());
	}
	
	for (int i = 0; i<300; i++){
		a.add(new JumboParticle());
	}
}
void draw()
{
	background(255);
	for (int i = 0; i<a.size(); i++)
	{
		
		a.get(i).move();
		a.get(i).moveToRandom();
		a.get(i).show();
	}
}

interface Particle
{
	public void show();
	public void move();
	public void moveToRandom();
}

class NormalParticle implements Particle
{
	color c;
	double x, y, speed, angle;
	NormalParticle()
	{
		this.x = (Math.random()*500)+150;
		this.y = (Math.random()*500)+150;
		this.angle = Math.random()*TWO_PI;
		speed = (Math.random()*8);
	}
	public void show()
	{
		fill(255, 160, 0);
		ellipse((float)this.x, (float)this.y, 20, 20);
	}
	public void moveToRandom(){
		if (this.x<150 || this.x>650){this.angle = PI-this.angle;}
		if (this.y<150 || this.y>650){this.angle = -1*this.angle;}
	}
	public void move()
	{
		this.x+=(Math.cos(this.angle)*this.speed);
		this.y+=(Math.sin(this.angle)*this.speed);
	}
}
class OddballParticle  //implements Particle 	//uses an interface
{
	double x, y, speed, angle;
	OddballParticle()
	{
		this.x = Math.random()*150;
		this.y = Math.random()*800;
		this.angle = Math.random()*TWO_PI;
		speed = Math.random()*8;

	}
	public void show()
	{

	}
	public void move()
	{
	}
}

class JumboParticle extends NormalParticle	//uses inheritance
{
	int size = 5;
	public void show()
	{
		fill(c);
		ellipse((float)this.x, (float)this.y, this.size, this.size);
	}
}

void mousePressed(){
	redraw();
}