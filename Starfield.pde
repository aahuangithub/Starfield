
ArrayList<Particle> a = new ArrayList<Particle>();
float[] centerCoords = {400, 400};
float[] dCenter = {0, 0};
void setup()
{
	size(800, 800);
	for (int i = 0; i<50; i++)
	{
		a.add(new NormalParticle());
	}
	
	for (int i = 0; i<250; i++){
		a.add(new JumboParticle());
	}
	//noCursor();
}
void draw()
{
	translate(centerCoords[0], centerCoords[1]);

	if (centerCoords[0]>300 && centerCoords[0]<500)
		centerCoords[0] += (mouseX-centerCoords[0])*0.01;
	if (centerCoords[1]>300 && centerCoords[1]<500)
		centerCoords[1] += (mouseY-centerCoords[1])*0.01;
	background(0);
	if (frameCount>1)
	{
		for (int i = 0; i<a.size(); i++)
		{
			a.get(i).bounce();
			a.get(i).move();
			a.get(i).show();
		}

	}
	fill(255);
	rect(0, 0, 50, 50);
	translate(400-centerCoords[0], 400-centerCoords[1]);
	
	stroke(255);
	strokeWeight(2);
	line (-10, 0, 10, 0);
	line (0, -10, 0, 10);

	noStroke();

	if(frameCount<=255){
		//beginning background
		fill(0, 0, 0, 255*pow(0.8, ((float)frameCount+1)/45));
		rect(-400, -400, 800, 800);
	}
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
		this.x = Math.random()*800-400;
		this.y = Math.random()*800-400;
		this.size = 0;
		this.angle = Math.random()*TWO_PI;
		speed = (Math.random()*2-1);
	}
	public void show()
	{
		fill(255, 160, 0);
		ellipse((float)this.x, (float)this.y, (float)this.size, (float)this.size);
	}
	public void bounce(){
		if (this.x<-600 || this.x>600 || this.y<-600 || this.y>600){
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
	double x, y, speed, angle;
	OddballParticle()
	{
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