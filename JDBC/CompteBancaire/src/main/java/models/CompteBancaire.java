package models;

import dao.exceptions.ExeptCompte;

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

    public void deposer(double depot) {
        solde += depot;
    }

    public boolean retirer(double retrait) throws ExeptCompte {
        if ( retrait > solde ) throw new ExeptCompte("Solde insuffisant, retrait impossible ");
        solde -= retrait;
        return true;
    }

    @Override
    public String toString() {
        return "\n\tCompte n°" + numero +
                ", solde :" + solde + '.';
    }
}
