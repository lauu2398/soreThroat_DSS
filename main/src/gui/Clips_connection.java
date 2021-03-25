/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gui;

import java.util.logging.Level;
import java.util.logging.Logger;
import net.sf.clipsrules.jni.CLIPSException;
import net.sf.clipsrules.jni.Environment;
import net.sf.clipsrules.jni.FactAddressValue;

/**
 *
 * @author laura
 */

//Constructor al que se le pasa clips y el paciente 
public class Clips_connection {
    Environment clips = new Environment();

    public Clips_connection() {
        startCLIPS();
    }

    private void startCLIPS() {
    
    
     try {
            clips.load("inferenceEngine_ThroatPath.clp");
            clips.reset();
            clips.run();
        } catch (CLIPSException ex) {
            Logger.getLogger(Clips_connection.class.getName()).log(Level.SEVERE, null, ex);
        }
     
    }
   
        
}
