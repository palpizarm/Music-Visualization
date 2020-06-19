import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
import processing.awt.PSurfaceAWT;
import processing.opengl.PSurfaceJOGL;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import javax.swing.event.MenuListener;
import java.awt.MenuBar;
import java.awt.Menu;
import java.awt.MenuItem;
import java.awt.event.ItemListener;
import java.awt.event.ActionListener;


String TimeToString(int milisecond) {
  String second = nf(milisecond/1000%60,2);
  String minutes = nf(milisecond/1000/60,2);
  return (minutes + ":" + second);
}
