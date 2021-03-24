/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gui;

import net.sf.clipsrules.jni.*;

/**
 *
 * @author laura
 */
public class main {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {

        // TODO code application logic here
        Environment clips;
        clips = new Environment();
        try {

            clips.load("inferenceEngine_ThroatPath.clp");
            clips.reset();
            clips.run();
        } catch (CLIPSException e) {
            e.printStackTrace();
        }
    }

}
