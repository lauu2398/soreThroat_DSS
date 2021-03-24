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


    HashMap<String, String> scorePathology = new HashMap<String, String>();
    // no me deja inicializar aqui el mapa

    @Override
    public int compareTo(Pathology pathology) {
         if (!(score.equals(pathology.score))) {
            return score.compareTo(pathology.score);
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
    //sobreescribir equals por si lo necesitabos y hashcode
}
