Particle[] particles = new Particle[300];
Boolean boolRight = false;
Boolean boolLeft = false;
Boolean boolUp = false;
Boolean boolDown = false;

int barX = 470;
void setup()
{
	size(600,600);
	background(0);
	particles[0] = new OddballParticle(300,300);
	particles[1] = new JumboParticle();
	for(int i = 2; i < particles.length; i++){
		particles[i]= new NormalParticle();
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
	fill(255);
	rect(430,550,150,5,10);
	fill(255,0,0);
	rect(barX, 547, 20,10,10);
	fill(255);
	text("speed", 450,570);
}
class NormalParticle implements Particle
{
	int normalColor, parSize;
	double xPos, yPos, angle, parSpeed;
	NormalParticle(){
		normalColor = color((int)(Math.random()*255),(int)(Math.random()*255),(int)(Math.random()*255));
		xPos = 300;
		yPos = 300;
		angle = Math.random()*360;
		parSpeed = Math.random()*3+1;
		parSize = 2;

	}
	public void move(){
		xPos += parSpeed * Math.cos(angle) * (Math.abs(430-barX))/30;
		yPos += parSpeed * Math.sin(angle) * (Math.abs(430-barX))/30;
		if(xPos > 600 || xPos < 0 || yPos > 600 || yPos < 0){
			xPos = 300;
			yPos = 300;
			parSize = 2;
			angle = Math.random()*360;
			parSpeed = Math.random()*3+1;
			normalColor = color((int)(Math.random()*255),(int)(Math.random()*255),(int)(Math.random()*255));
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
class JumboParticle extends NormalParticle//uses inheritance
{
	public void show(){
		fill(normalColor);
		noStroke();
		ellipse((float)xPos, (float)yPos, parSize*10, parSize*10);
		if((int)(xPos%20) == 0 && parSize <= 7)
			parSize += 1;
	}
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
void mouseDragged(){
	if(mouseX >= 430 && mouseX <= 580)
	   barX = mouseX;
}


