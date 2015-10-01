Particle[] particles = new Particle[300];
Boolean right = false;
Boolean left = false;
void setup()
{
	size(600,600);
	background(0);
	particles[0] = new OddballParticle(300,300);
	for(int i = 1; i < particles.length; i++){
		particles[i]= new NormalParticle(300,300,Math.random()*360, Math.random()*3+1, color((int)(Math.random()*255),(int)(Math.random()*255),(int)(Math.random()*255)), 2);
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
			parSize = 2;
		}
	}
	public void show(){
		fill(normalColor);
		noStroke();
		ellipse((float)xPos, (float)yPos, parSize, parSize);
		if((int)(xPos%20) == 0 && parSize <= 7)
			parSize += 1;
	}
	public void right(){
		xPos -= parSpeed;
	}
	public void left(){
		xPos += parSpeed;
	}
}
interface Particle
{
	public void show();
	public void move();
	public void right();
	public void left();
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
	public void right(){

	}
	public void left(){

	}
}
class JumboParticle //uses inheritance
{
	//your code here
}
void MousePressed(){
	if(keyCode == 39){
		right = true
	}
}

