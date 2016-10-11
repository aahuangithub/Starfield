
ArrayList<Particle> a = new ArrayList<Particle>();
boolean parallaxLeft = true;
void setup()
{
	size(720, 500);
	for (int i = 0; i<50; i++)
		a.add(new NormalParticle());
	for (int i = 0; i<250; i++)
		a.add(new JumboParticle());
	for (int i = 0; i<15; i++)
		a.add(new OddballParticle());
}	
void draw()
{
	int ss = width/4;
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
	double x, y, speed, angle;
	color c;
	float[] anglesX = new float[3];
	float[] anglesY = new float[3];
	OddballParticle()
	{
		speed = Math.random()*8;
		this.x = Math.random()*800-400;
		this.y = Math.random()*800-400;
		this.angle = Math.random()*TWO_PI;
		this.c = color((float)Math.random()*256, (float)Math.random()*256, (float)Math.random()*256);
		for (int i = 0; i < anglesX.length;i++){
			this.anglesX[i]=(float)Math.random()*23-11;
			this.anglesY[i]=(float)Math.random()*23-11;
		}
	}
	public void show()
	{
		float distance  = sqrt(pow((float)this.x, 2)+pow((float)this.y, 2));
		fill(this.c);
		float pOffset = 0;
		if (parallaxLeft) pOffset = distance/4;
		else pOffset = distance/-4;
		triangle((float)this.x+this.anglesX[0]*distance/1500+pOffset, (float)this.y+this.anglesY[0]*distance/1500+pOffset, (float)this.x+this.anglesX[1]*distance/180, (float)this.y+this.anglesY[1]*distance/40, (float)this.x+this.anglesX[2]*distance/40, (float)this.y+this.anglesY[2]*distance/40);


	}
	public void bounce(int min)
	{
		if  (this.x<-1*min+30 || this.x>min-30 || this.y<-600 || this.y>600){
			this.x = 0;
			this.y = 0;
			this.speed = Math.random()*8;
			if(Math.random()<0.66){
				this.c=color(0,0,0,0);
			}
			else{
				this.c = color((float)Math.random()*256, (float)Math.random()*256, (float)Math.random()*256);
				for (int i = 0; i<3;i++){
					this.anglesX[i]=(float)Math.random()*23 - 11;
					this.anglesY[i]=(float)Math.random()*23 - 11;
				}
			}
		}
	}
	public void move()
	{
		this.x+=(Math.cos(this.angle)*this.speed);
		this.y+=(Math.sin(this.angle)*this.speed);
		this.speed=this.speed*1.01;
	}
}

class JumboParticle extends NormalParticle	//uses inheritance
{
	public void show()
	{
		fill(255);
		float distance  = sqrt(pow((float)this.x, 2)+pow((float)this.y, 2));
		this.size = distance/40;
		ellipse((float)this.x, (float)this.y, (float)this.size, (float)this.size);
	}
	public void move()
	{
		this.x+=(Math.cos(this.angle)*this.speed);
		this.y+=(Math.sin(this.angle)*this.speed);
		this.speed=this.speed*1.01;
	}
}
