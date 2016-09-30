
ArrayList<Particle> a = new ArrayList<Particle>();
int x, y;
void setup()
{
	size(800, 800);
	for (int i = 0; i<75; i++)
	{
		a.add(new NormalParticle());
	}
	
	for (int i = 0; i<150; i++){
		a.add(new JumboParticle());
	}
}
void draw()
{
	background(0);
	for (int i = 0; i<a.size(); i++)
	{
		a.get(i).bounce();
		a.get(i).move();
		
		a.get(i).show();
	}
	stroke(255);
	strokeWeight(2);
	line (390, 400, 410, 400);
	line (400, 390, 400, 410);
	noStroke();
}

interface Particle
{
	public void show();
	public void move();
	public void bounce();
}

class NormalParticle implements Particle
{
	double x, y, speed, angle, size;
	NormalParticle()
	{
		this.x = 400;
		//(Math.random()*500)+150;
		this.y = 400;
		this.size = 20;
		//(Math.random()*500)+150;
		this.angle = Math.random()*TWO_PI;
		speed = (Math.random()*2+1);
	}
	public void show()
	{
		fill(255, 160, 0);
		ellipse((float)this.x, (float)this.y, (float)this.size, (float)this.size);
	}
	public void bounce(){
		if (this.x<-200 || this.x>1000 || this.y<-200 || this.y>1000){
			//this.angle = PI-this.angle;
			this.x = 400;
			this.y = 400;
			this.speed = Math.random()*8;
			this.size = 20;
			this.angle = Math.random()*TWO_PI;
		}
		//if (this.y<0 || this.y>800)this.angle = -1*this.angle;

	}
	public void move()
	{
		float distance  = sqrt(pow((float)this.x-400, 2)+pow((float)this.y-400, 2));
		this.size = distance/8;
		this.x+=(Math.cos(this.angle)*this.speed);
		this.y+=(Math.sin(this.angle)*this.speed);
		this.speed=this.speed*1.01;
	}
}
class OddballParticle  implements Particle 	//uses an interface
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
	public void bounce()
	{

	}
	public void move()
	{
	}
}

class JumboParticle extends NormalParticle	//uses inheritance
{
	JumboParticle()
	{
		this.size = 5;
	}
	public void show()
	{
		fill(255);
		ellipse((float)this.x, (float)this.y, (float)this.size, (float)this.size);
	}
	public void move()
	{
		float distance  = sqrt(pow((float)this.x-400, 2)+pow((float)this.y-400, 2));

		this.size = distance/40;
		if (distance == 0) println(this.size);
		this.x+=(Math.cos(this.angle)*this.speed);
		this.y+=(Math.sin(this.angle)*this.speed);
		this.speed=this.speed*1.01;
	}
}

void mousePressed(){
	redraw();
}