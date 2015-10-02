Particle[] particles = new Particle[300];
Boolean boolRight = false;
Boolean boolLeft = false;
Boolean boolUp = false;
Boolean boolDown = false;
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
		if(boolRight)
			particles[i].right();
		if(boolLeft)
			particles[i].left();
		if(boolDown)
			particles[i].down();
		if(boolUp)
			particles[i].up();
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
	public void up(){
		yPos += parSpeed;
	}
	public void down(){
		yPos -= parSpeed;
	}
}
interface Particle
{
	public void show();
	public void move();
	public void right();
	public void left();
	public void up();
	public void down();
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
	public void up(){

	}
	public void down(){

	}
}
class JumboParticle //uses inheritance
{
	//your code here
}
void keyPressed(){
	if(keyCode == 40){
		boolDown = true;
		boolLeft = false;
		boolUp = false;
		boolRight = false;
	}
	if(keyCode == 38){
		boolUp = true;
		boolRight = false;
		boolLeft = false;
		boolDown = false;
	}
	if(keyCode == 39){
		boolRight = true;
		boolLeft = false;
		boolDown = false;
		boolUp = false;
	}
	if(keyCode == 37){
		boolLeft = true;
		boolRight = false;
		boolDown = false;
		boolUp = false;
	}
}
void keyReleased(){
	if(keyCode == 39){
		boolRight = false;
	}
	if(keyCode == 37){
		boolLeft = false;
	}
	if(keyCode == 38){
		boolUp = false;
	}
	if(keyCode == 40){
		boolDown = false;
	}
}


