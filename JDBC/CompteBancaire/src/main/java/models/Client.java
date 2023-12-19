package models;

import java.util.ArrayList;

public class Client {

    private int id ;
    private String nom ;
    private String prenom ;

    private String telephone;

    private ArrayList<CompteBancaire> comptesClient;

    public Client(int id, String nom, String prenom, String telephone) {
        this.id = id;
        this.nom = nom;
        this.prenom = prenom;
        this.comptesClient = new ArrayList<>();
        this.telephone = telephone;
    }

    public Client( String nom, String prenom, String telephone) {
        this.nom = nom;
        this.prenom = prenom;
        this.comptesClient = new ArrayList<>();
        this.telephone = telephone;
    }

    public int getId() {
        return id;
    }

    public String getNom() {
        return nom;
    }

    public String getPrenom() {
        return prenom;
    }

    public String getTelephone() {
        return telephone;
    }

    public ArrayList<CompteBancaire> getComptesClient() {
        return comptesClient;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public void setPrenom(String prenom) {
        this.prenom = prenom;
    }

    @Override
    public String toString() {
        return "Client n°" +
                id +
                ", " + nom +
                " " + prenom +
                ", comptes " + comptesClient ;
    }
}
