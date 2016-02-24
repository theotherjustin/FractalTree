private double fractionLength = .8; 
private int smallestBranch = 4; 
private double branchAngle = .5;   
private double s = 0.8;



public void setup() 
{   
	size(640,480);    
	noLoop(); 
} 
public void draw() 
{   
	background(255);   
	stroke(0,0,0);  
	strokeWeight(12); 
	line(320,480,320,380);   
	drawBranches(320,380,100,3*Math.PI/2,10);  

} 
public void drawBranches(int x,int y, double branchLength, double angle, double weight) 
{   
	if(weight >2){
		weight *= s;
	}
	stroke(0);
 	 if(branchLength < 18){
    stroke(0, 220, 190, (float)(50 + branchLength));
	}
	strokeWeight((float)weight);

	int endX1, endY1, endX2, endY2;
	double angle1; 
	double angle2;
	angle2 = angle - branchAngle;
	angle1 = angle + branchAngle;
	branchLength = branchLength * fractionLength;
	endX1 = (int)(branchLength*Math.cos(angle1) + x);
	endY1 = (int)(branchLength*Math.sin(angle1) + y);
	endX2 = (int)(branchLength*Math.cos(angle2) + x);
	endY2 = (int)(branchLength*Math.sin(angle2) + y);
	line(x, y, endX1, endY1);
	line(x, y, endX2, endY2);

	if (branchLength > smallestBranch){
		drawBranches(endX1, endY1,branchLength, angle1,weight);
		drawBranches(endX2, endY2, branchLength, angle2, weight);
	}
	


}

