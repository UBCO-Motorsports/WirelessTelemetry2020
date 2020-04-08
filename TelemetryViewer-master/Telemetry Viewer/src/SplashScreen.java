import javax.swing.*;
import java.awt.*;
 
public class SplashScreen {
	JFrame frame;
    JLabel image=new JLabel(new ImageIcon("UBCO Motorsports.png"));
    JLabel text=new JLabel("UBCO Telemetry Viewer V1.2");
    JProgressBar progressBar=new JProgressBar();
    JLabel message=new JLabel();//Crating a JLabel for displaying the message
    SplashScreen()
    {
        createGUI();
        addImage();
        addText();
        addProgressBar();
        addMessage(200,320,200,40);
        runningPBar();
    }
    public void createGUI(){
        frame=new JFrame();
        frame.getContentPane().setLayout(null);
        frame.setUndecorated(true);
        frame.setSize(800,600);
        frame.setLocationRelativeTo(null);
        frame.getContentPane().setBackground(Color.GRAY);
        frame.setVisible(true);
 
    }
    public void addImage(){
        image.setSize(850,220);
        frame.add(image);
        
    }
    public void addText()
    {
        text.setFont(new Font("arial",Font.BOLD,30));
        text.setBounds(200,220,600,40);
        text.setForeground(Color.BLACK);
        frame.add(text);
    }
    public void addMessage(int x1, int x2, int y1, int y2)
    {	
    	message.setBounds(x1,x2,y1,y2);//Setting the size and location of the label
        message.setForeground(Color.BLUE);//Setting foreground Color
        message.setFont(new Font("arial",Font.BOLD,15));//Setting font properties
        frame.add(message);//adding label to the frame
    }
    public void addProgressBar(){
        progressBar.setBounds(200,280,450,30);
        progressBar.setBorderPainted(true);
        progressBar.setStringPainted(true);
        progressBar.setBackground(Color.WHITE);
        progressBar.setForeground(Color.BLACK);
        progressBar.setValue(0);
        frame.add(progressBar);
    }
    public void runningPBar(){
        int i=0;//Creating an integer variable and intializing it to 0
 
        while( i<=100)
        {
            try{
                Thread.sleep(20);//Pausing execution for 50 milliseconds
                progressBar.setValue(i);//Setting value of Progress Bar
                message.setText("LOADING "+Integer.toString(i)+"%");//Setting text of the message JLabel
                i++;
                if(i==100)
                    frame.dispose();
            }catch(Exception e){
                e.printStackTrace();
            }
 
 
 
        }
    }
}