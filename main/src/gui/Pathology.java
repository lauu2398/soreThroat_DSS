/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gui;

/**
 *
 * @author laura
 */
public class Pathology implements Comparable<Pathology>{
    
    private String name;
    private float score;
    
    public Pathology(String name, float score){
        this.name = name; 
        this.score = score;
    }

    @Override
    public int compareTo(Pathology pathology) {
        
        
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    //sobreescribir equals por si lo necesitabos y hashcode
}


