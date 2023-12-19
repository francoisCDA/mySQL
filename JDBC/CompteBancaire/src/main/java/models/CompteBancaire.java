package models;

import java.util.ArrayList;

public class CompteBancaire {

    private int numero;
    private double solde;
    private ArrayList<Operation> operation;

    public CompteBancaire(int numero) {
        this.numero = numero;
        this.operation = new ArrayList<>();
    }
    public CompteBancaire(int numero, double solde) {
        this.numero = numero;
        this.solde = solde;
        this.operation = new ArrayList<>();
    }

    public int getNumero() {
        return numero;
    }

    public double getSolde() {
        return solde;
    }

    public ArrayList<Operation> getOperation() {
        return operation;
    }

    public void setNumero(int numero) {
        this.numero = numero;
    }

    @Override
    public String toString() {
        return "\n\tCompte n°" + numero +
                ", solde :" + solde + '.';
    }
}
