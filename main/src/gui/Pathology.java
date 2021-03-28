/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gui;

import java.util.Objects;


/**
 *
 * @author laura
 */
public class Pathology implements Comparable<Pathology> {

  
    private String name;
    private Float score;
    
    public Pathology(String name, Float score){
        this.name = name; 
        this.score = score;
    }

    Pathology() {
        this.name = "pathology";
        this.score = 0f;
       // this.recomendationMap=recomendationMap;
       }

 

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Float getScore() {
        return score;
    }

    public void setScore(Float score) {
        this.score = score;
    }

    @Override
    public int compareTo(Pathology pathology) {
         if (!(score.equals(pathology.score))) {
             if(score > pathology.score) return -1; //This is opposite to logic but it is the order needed for the tree set
             else return 1;
        } else {
            return 0;
        }

    }
     @Override
    public boolean equals(Object pathology) {//Condicion que se debe cumplir para que sean dos objetos iguales
        if (pathology == null) {
            return false;
        }
        if (!(pathology instanceof Pathology)) {
            return false;
        }
        Pathology objetPathology = (Pathology) pathology;
        if (objetPathology.score.equals(this.score)) {
            return true;
        } else {
            return false;
        }
    }

    @Override
    public int hashCode() {
        int hash = 5;
        hash = 13 * hash + Objects.hashCode(this.score);
        return hash;
    }
    
}
