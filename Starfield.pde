//your code here
import java.util.*;
ArrayList<Particle> a = new ArrayList<Particle>();
void setup()
{
	size(800, 800);
	for (int i = 0; i<500; i++)
	{
		a.add(new NormalParticle());
	}
	
	for (int i = 0; i<500; i++){
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
		this.x = (Math.random()*800);
		this.y = (Math.random()*800);
		this.angle = Math.random()*TWO_PI;
		speed = (Math.random()*8);
	}
	public void show()
	{
		fill(255, 160, 0);
		ellipse((float)this.x, (float)this.y, 20, 20);
	}
	public void moveToRandom(){
		if (this.x<0 || this.x>800){this.x = Math.random()*800;}
		if (this.y<0 || this.y>800){this.y = Math.random()*800;}
	}
	public void move()
	{
		this.x+=(Math.cos(this.angle)*this.speed);
		this.y+=(Math.sin(this.angle)*this.speed);
	}
}
class OddballParticle  //implements Particle 	//uses an interface
{
	OddballParticle()
	{

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
	public void moveToRandom(){
		if (this.x<0 || this.x>800){this.x = Math.random()*800;}
		if (this.y<0 || this.y>800){this.y = Math.random()*800;}
	}
}

void mousePressed(){
	redraw();
}