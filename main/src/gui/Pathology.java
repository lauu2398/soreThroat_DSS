/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gui;

import static com.sun.org.apache.xalan.internal.lib.ExsltDynamic.map;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Objects;
import static jdk.nashorn.internal.objects.NativeArray.map;
import static jdk.nashorn.internal.objects.NativeDebug.map;

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

    /*
    private float score_mono;
    private float score_viral;
    private float score_strep;
    private float score_cancer;
    private float score_abcess;
    private float score_body;
    private boolean fever_computed;
    private boolean exudate_computed;
    private boolean s_node_computed;
    private boolean cough_computed;
    private boolean fatigue_computed;
    private boolean swallowing_computed;
    private boolean s_spleen_computed;
    private boolean s_tonsils_computed;
     */
    //disease, recomendation
    // no me deja inicializar aqui el mapa

    HashMap<String, String> recomendationMap; 

    public Pathology(String name, Float score, HashMap<String, String> recomendationMap) {
        this.name = name;
        this.score = score;
        this.recomendationMap = recomendationMap;
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

    public HashMap<String, String> getRecomendationMap() {
        return recomendationMap;
    }

    public void setRecomendationMap(HashMap<String, String> recomendationMap) {
        this.recomendationMap = recomendationMap;
    }

 


    @Override
    public int compareTo(Pathology pathology) {
         if (!(score.equals(pathology.score))) {
             if(score > pathology.score) return -1;
             else return 1;
            //return score.compareTo(pathology.score);
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
