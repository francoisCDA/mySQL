package Classe;

import java.time.LocalDate;

public class Student {

    private int id;
    private String nom;
    private String prenom;
    private int numClasse;
    private LocalDate graduation;

    public Student(int id, String nom, String prenom, int numClasse, LocalDate graduation) {
        this.id = id;
        this.nom = nom;
        this.prenom = prenom;
        this.numClasse = numClasse;
        this.graduation = graduation;
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

    public int getNumClasse() {
        return numClasse;
    }

    public LocalDate getGraduation() {
        return graduation;
    }

    @Override
    public String toString() {
        return "etudiant " +
                "id : " + id +
                ", " + nom +
                " " + prenom +
                ", classe n°" + numClasse +
                ", diplomé le " + graduation +
                '.';
    }
}
