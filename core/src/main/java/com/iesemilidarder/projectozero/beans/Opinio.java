package com.iesemilidarder.projectozero.beans;

import javax.persistence.Column;
import javax.persistence.Entity;

@Entity
public class Opinio {
    @Column(name="OPI_CODI")
    private String codi;
    @Column(name="OPI_OBSERVACIO")
    private String opinio;
    @Column(name="OPI_PUNTUACIO")
    private String puntuacio;
    @Column(name="USU_NOM")
    private String user;


    // Getters

    public String getCodi() {
        return codi;
    }

    public String getOpinio() {
        return opinio;
    }

    public String getPuntuacio() {
        return puntuacio;
    }

    public String getUser() {
        return user;
    }

    // Setters

    public void setCodi(String codi) {
        this.codi = codi;
    }

    public void setOpinio(String opinio) {
        this.opinio = opinio;
    }

    public void setPuntuacio(String puntuacio) {
        this.puntuacio = puntuacio;
    }

    public void setUser(String user) {
        this.user = user;
    }
}
