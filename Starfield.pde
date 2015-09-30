Particle[] particles = new Particle[300];
void setup()
{
	size(600,600);
	background(0);
	particles[0] = new OddballParticle(300,300);
	for(int i = 1; i < particles.length; i++){
		particles[i]= new NormalParticle(300,300,Math.random()*360, Math.random()*4+1, color((int)(Math.random()*255),(int)(Math.random()*255),(int)(Math.random()*255)), 3);
	}
}
void draw()
{
	fill(30,30,30,100);
	rect(0,0,600,600);
	for(int i = 0; i < particles.length; i++){
		particles[i].move();
		particles[i].show();
	}
}
class NormalParticle implements Particle
{
	int normalColor, parSize;
	double xPos, yPos, angle, parSpeed;
	NormalParticle(double x, double y, double ang, double speed,int pColor, int pSize){
		normalColor = pColor;
		xPos = x;
		yPos = y;
		angle = ang;
		parSpeed = speed;
		parSize = pSize;

	}
	public void move(){
		xPos += parSpeed * Math.cos(angle);
		yPos += parSpeed * Math.sin(angle);
		if(xPos > 600 || xPos < 0 || yPos > 600 || yPos < 0){
			xPos = 300;
			yPos = 300;
			parSize = 5;
		}
	}
	public void show(){
		fill(normalColor);
		noStroke();
		ellipse((float)xPos, (float)yPos, parSize, parSize);
		if((int)(xPos%10) == 0)
			parSize += 1;
	}
	//your code here
}
interface Particle
{
	public void show();
	public void move();
}
class OddballParticle implements Particle
{
	int xPos, yPos;
	OddballParticle(int x, int y){
		xPos = x;
		yPos = y;
	}
	public void move(){
		xPos += (int)(Math.random()*3)-1;
		yPos += (int)(Math.random()*3)-1;
	}
	public void show(){
		fill(255,0,0);
		ellipse(xPos, yPos, 10,10);
	}
}
class JumboParticle //uses inheritance
{
	//your code here
}

