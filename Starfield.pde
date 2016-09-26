//your code here
import java.util.*;
ArrayList<Particle> a = new ArrayList<Particle>();
void setup()
{
	size(800, 800);
	for (int i = 0; i<200; i++)
	{
		a.add(new NormalParticle());
	}
}
void draw()
{
	//your code here
}

interface Particle
{
	public void show();
}
class NormalParticle implements Particle
{

}
class OddballParticle //uses an interface
{
	//your code here
}
class JumboParticle //uses inheritance
{
	//your code here
}

