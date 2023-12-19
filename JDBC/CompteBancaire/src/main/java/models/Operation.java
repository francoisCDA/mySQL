package models;

import enums.Statut;

public class Operation {

    private int numero;

    private double montant;

    private Statut statut;

    public Operation(int numero, double montant, Statut statut) {
        this.numero = numero;
        this.montant = montant;
        this.statut = statut;
    }

    public int getNumero() {
        return numero;
    }

    public double getMontant() {
        return montant;
    }

    public Statut getStatut() {
        return statut;
    }

    @Override
    public String toString() {
        return "Operation " +  statut  +
                "sur compte " + numero +
                " d'un montant de " + montant +
                '.';
    }
}
