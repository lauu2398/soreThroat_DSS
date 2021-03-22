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

    public Patient(String name, String fever, String exudate, String s_node, String cough, String fatigue,
            String swallowing, String s_spleen, String s_tonsils, float score_mono, float score_viral,
            float score_strep, float score_cancer, float score_abcess, float score_body,
            boolean fever_computed, boolean exudate_computed, boolean s_node_computed, boolean cough_computed,
            boolean fatigue_computed, boolean swallowing_computed, boolean s_spleen_computed, boolean s_tonsils_computed) {
        this.name = name;
        this.fever = fever;
        this.exudate = exudate;
        this.s_node = s_node;
        this.cough = cough;
        this.fatigue = fatigue;
        this.swallowing = swallowing;
        this.s_spleen = s_spleen;
        this.s_tonsils = s_tonsils;
        this.score_mono = score_mono;
        this.score_viral = score_viral;
        this.score_strep = score_strep;
        this.score_cancer = score_cancer;
        this.score_abcess = score_abcess;
        this.fever_computed = fever_computed;
        this.exudate_computed = exudate_computed;
        this.s_node_computed = s_node_computed;
        this.cough_computed = cough_computed;
        this.fatigue_computed = fatigue_computed;
        this.swallowing_computed = swallowing_computed;
        this.s_spleen_computed = s_spleen_computed;
        this.s_tonsils_computed = s_tonsils_computed;

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

    public float getScore_mono() {
        return score_mono;
    }

    public void setScore_mono(float score_mono) {
        this.score_mono = score_mono;
    }

    public float getScore_viral() {
        return score_viral;
    }

    public void setScore_viral(float score_viral) {
        this.score_viral = score_viral;
    }

    public float getScore_strep() {
        return score_strep;
    }

    public void setScore_strep(float score_strep) {
        this.score_strep = score_strep;
    }

    public float getScore_cancer() {
        return score_cancer;
    }

    public void setScore_cancer(float score_cancer) {
        this.score_cancer = score_cancer;
    }

    public float getScore_abcess() {
        return score_abcess;
    }

    public void setScore_abcess(float score_abcess) {
        this.score_abcess = score_abcess;
    }

    public float getScore_body() {
        return score_body;
    }

    public void setScore_body(float score_body) {
        this.score_body = score_body;
    }

    public boolean isFever_computed() {
        return fever_computed;
    }

    public void setFever_computed(boolean fever_computed) {
        this.fever_computed = fever_computed;
    }

    public boolean isExudate_computed() {
        return exudate_computed;
    }

    public void setExudate_computed(boolean exudate_computed) {
        this.exudate_computed = exudate_computed;
    }

    public boolean isS_node_computed() {
        return s_node_computed;
    }

    public void setS_node_computed(boolean s_node_computed) {
        this.s_node_computed = s_node_computed;
    }

    public boolean isCough_computed() {
        return cough_computed;
    }

    public void setCough_computed(boolean cough_computed) {
        this.cough_computed = cough_computed;
    }

    public boolean isFatigue_computed() {
        return fatigue_computed;
    }

    public void setFatigue_computed(boolean fatigue_computed) {
        this.fatigue_computed = fatigue_computed;
    }

    public boolean isSwallowing_computed() {
        return swallowing_computed;
    }

    public void setSwallowing_computed(boolean swallowing_computed) {
        this.swallowing_computed = swallowing_computed;
    }

    public boolean isS_spleen_computed() {
        return s_spleen_computed;
    }

    public void setS_spleen_computed(boolean s_spleen_computed) {
        this.s_spleen_computed = s_spleen_computed;
    }

    public boolean isS_tonsils_computed() {
        return s_tonsils_computed;
    }

    public void setS_tonsils_computed(boolean s_tonsils_computed) {
        this.s_tonsils_computed = s_tonsils_computed;
    }

}
