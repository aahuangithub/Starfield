
ArrayList<Particle> a = new ArrayList<Particle>();
boolean parallaxLeft = true;
void setup()
{
	size(600, 500);
	for (int i = 0; i<50; i++)
		a.add(new NormalParticle());
	
	for (int i = 0; i<250; i++)
		a.add(new JumboParticle());
	//noCursor();

}	
void draw()
{
	int ss = 150;
	background(0);
	if (frameCount>1)
	{
		translate(ss, 250);
		for (int i = 0; i<a.size(); i++)
		{
			a.get(i).bounce(ss);
			a.get(i).move();
			a.get(i).show();
		}
		//draws center cross
		stroke(255);
		strokeWeight(2);
		line (-10, 0, 10, 0);
		line (0, -10, 0, 10);
		noStroke();
		translate(width-2*ss, 0);
		parallaxLeft = false;

		for (int i = 0; i<a.size(); i++)
		{
			a.get(i).show();
		}
		//draws center cross
		stroke(255);
		strokeWeight(2);
		line (-10, 0, 10, 0);
		line (0, -10, 0, 10);
		noStroke();
		parallaxLeft = true;
	}

	translate(-1*width+ss, 0);
	if(frameCount<=255){
		//beginning background
		fill(0, 0, 0, 255*pow(0.8, ((float)frameCount+1)/45));
		rect(-400, -400, 1600, 800);
		fill(255, 255, 255, 255-255*pow(0.8, ((float)frameCount+1)/45));
		textAlign(CENTER);
		text("CROSS\nYOUR\nEYES", 600, 0);
	}
}

interface Particle
{
	public void show();
	public void move();
	public void bounce(int min);
}
class NormalParticle implements Particle
{
	double x, y, speed, angle, size;
	NormalParticle()
	{
		this.x = Math.random()*800-400;
		this.y = Math.random()*800-400;
		this.size = 0;
		this.angle = Math.random()*TWO_PI;
		speed = (Math.random()*2-1);
	}
	public void show()
	{
		float distance  = sqrt(pow((float)this.x, 2)+pow((float)this.y, 2));
		fill(255, 160, 0);
		if (parallaxLeft) ellipse((float)this.x-distance/4, (float)this.y, (float)this.size, (float)this.size);
		else ellipse((float)this.x+distance/4, (float)this.y, (float)this.size, (float)this.size);
	}
	public void bounce(int min){
		if (this.x<-1*min || this.x>min || this.y<-600 || this.y>600){
			this.x = 0;
			this.y = 0;
			this.speed = Math.random()-1;
			this.size = 20;
			this.angle = Math.random()*TWO_PI;
		}
	}
	public void move()
	{
		float distance  = sqrt(pow((float)this.x, 2)+pow((float)this.y, 2));
		this.size = distance/8;
		this.x+=(Math.cos(this.angle)*this.speed);
		this.y+=(Math.sin(this.angle)*this.speed);
		this.speed=this.speed*1.01;
	}
}
class OddballParticle  implements Particle 	//uses an interface
{
	double x, y, speed;
	OddballParticle()
	{
		speed = Math.random()*8;
	}
	public void show()
	{

	}
	public void bounce(int min)
	{
		this.x = Math.random();
	}
	public void move()
	{
	}
}

class JumboParticle extends NormalParticle	//uses inheritance
{
	public void show()
	{
		fill(255);
		ellipse((float)this.x, (float)this.y, (float)this.size, (float)this.size);
	}
	public void move()
	{
		float distance  = sqrt(pow((float)this.x, 2)+pow((float)this.y, 2));
		this.size = distance/40;
		this.x+=(Math.cos(this.angle)*this.speed);
		this.y+=(Math.sin(this.angle)*this.speed);
		this.speed=this.speed*1.01;
	}
}
