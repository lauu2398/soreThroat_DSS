/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gui;

import java.util.List;
import java.util.ArrayList;
import java.util.TreeSet;

/**
 *
 * @author laura
 */
public class Patient {

    private String name;
    private String fever;
    private String exudate;
    private String s_node;
    private String cough;
    private String fatigue;
    private String swallowing;
    private String s_spleen;
    private String s_tonsils;
    
    private TreeSet<Pathology> pathologies;
  

    public Patient(String name, String fever, String exudate, String s_node, String cough, String fatigue,
            String swallowing, String s_spleen, String s_tonsils) {
        this.name = name;
        this.fever = fever;
        this.exudate = exudate;
        this.s_node = s_node;
        this.cough = cough;
        this.fatigue = fatigue;
        this.swallowing = swallowing;
        this.s_spleen = s_spleen;
        this.s_tonsils = s_tonsils;
        
        pathologies = new TreeSet<>();
    }

    public Patient(String fever, String exudate, String s_node, String cough, String fatigue, String swallowing, String s_spleen, String s_tonsils) {
        this.fever = fever;
        this.exudate = exudate;
        this.s_node = s_node;
        this.cough = cough;
        this.fatigue = fatigue;
        this.swallowing = swallowing;
        this.s_spleen = s_spleen;
        this.s_tonsils = s_tonsils;
        
        pathologies = new TreeSet<>();
    }
    
    
    
    public Patient(){
        pathologies = new TreeSet<>();
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getFever() {
        return fever;
    }

    public void setFever(String fever) {
        this.fever = fever;
    }

    public String getExudate() {
        return exudate;
    }

    public void setExudate(String exudate) {
        this.exudate = exudate;
    }

    public String getS_node() {
        return s_node;
    }

    public void setS_node(String s_node) {
        this.s_node = s_node;
    }

    public String getCough() {
        return cough;
    }

    public void setCough(String cough) {
        this.cough = cough;
    }

    public String getFatigue() {
        return fatigue;
    }

    public void setFatigue(String fatigue) {
        this.fatigue = fatigue;
    }

    public String getSwallowing() {
        return swallowing;
    }

    public void setSwallowing(String swallowing) {
        this.swallowing = swallowing;
    }

    public String getS_spleen() {
        return s_spleen;
    }

    public void setS_spleen(String s_spleen) {
        this.s_spleen = s_spleen;
    }

    public String getS_tonsils() {
        return s_tonsils;
    }

    public void setS_tonsils(String s_tonsils) {
        this.s_tonsils = s_tonsils;
    }
    
    public void addPathology(Pathology path){
        this.pathologies.add(path);
    }
    
    public TreeSet getPathologies(){
        return pathologies; 
    }
    
    public String toString(){
       return "Patient info: \n"+
                "name: "+name+
                "\nfever: "+fever+
                "\nexhudate: "+exudate+
                "\nswollen nodes: "+s_node+
                "\ncough: "+cough+
                "\nfatigue: "+fatigue+
                "\nswollen spleen: "+s_spleen+
                "\ntrouble swallowing: "+swallowing+
                "\nswollen tonsils: "+s_tonsils;
    }
}
