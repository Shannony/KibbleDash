NormalParticle partyCle = new NormalParticle(300,300,30,4,color(255));
public void setup()
{
	size(600,600);
	background(0);
}
public void draw()
{
	fill(30,30,30,100);
	rect(0,0,600,600);
	partyCle.move();
	partyCle.show();
}
class NormalParticle
{
	int normalColor;
	double xPos, yPos, angle, parSpeed;
	public NormalParticle(double x, double y, double ang, double speed,int pColor){
		normalColor = pColor;
		xPos = x;
		yPos = y;
		angle = ang;
		parSpeed = speed;

	}
	public void move(){
		xPos += parSpeed * Math.cos(angle);
		yPos += parSpeed * Math.sin(angle);
	}
	public void show(){
		fill(normalColor);
		ellipse((float)xPos, (float)yPos, 5, 5);
	}
	//your code here
}
interface Particle
{
	//your code here
}
class OddballParticle //uses an interface
{
	//your code here
}
class JumboParticle //uses inheritance
{
	//your code here
}

