package display;

import services.ServicesBancaire;

import java.util.ArrayList;
import java.util.Scanner;
import enums.Statut;
import models.Client;
import models.CompteBancaire;
import models.Operation;

public class ConsoleIHM {

    private Scanner scan ;

    private ServicesBancaire services ;

    public ConsoleIHM(){
        this.scan = new Scanner(System.in);
        this.services = new ServicesBancaire();
    }


    public void exe() {
        System.out.println("Bienvenue");

        boolean run = true;
        String choix ;

        while (run) {
            mainMenu();
            System.out.print("\n\t > ");
            choix = scan.nextLine();

            switch (choix) {
                case "0" -> run = false;
                case "1" -> printClients();
                case "2" -> addClient();
                case "3" -> addCompte();
                case "4" -> crediteCompte();
                case "5" -> debitCompte();
                default -> System.out.printf("Action inconnue");
            }

        }
        services.disconnect();
        System.out.println("Au revoir");

    }

    private void addCompte() {
        System.out.println("Ajouter un compte à un client");

        System.out.print("\n\tID du client > ");
        int idClient = scan.nextInt();
        scan.nextLine();

        int nouvCompte = services.newCompte(idClient);

        System.out.printf("\n * Ajouter du compte n° %d au client n° %d * \n\n",nouvCompte,idClient);

    }

    private void crediteCompte() {
        System.out.println("Créditer un compte");

        System.out.print("\n\tNumero de compte > ");
        int numCompte = scan.nextInt();
        scan.nextLine();

        System.out.print("\n\tMontant à créditer > ");
        double credit = scan.nextFloat();
        scan.nextLine();

        if (services.deposer(numCompte,credit)) {
            System.out.println("transaction effectuée");
        } else {
            System.out.println("transaction refusée");
        }

    }

    private void debitCompte() {
        System.out.println("Débiter un compte");

        System.out.print("\n\tNumero de compte > ");
        int numCompte = scan.nextInt();
        scan.nextLine();

        System.out.print("\n\tMontant à débiter > ");
        double credit = scan.nextFloat();
        scan.nextLine();

        if (services.retirer(numCompte,credit)) {
            System.out.println("transaction effectuée");
        } else {
            System.out.println("transaction refusée");
        }

    }

    private void printClients() {
        ArrayList<Client> clients = services.getClients();
        clients.forEach(System.out::println);
    }


    private void addClient() {
        String first, last, tel;

        System.out.println("Ajouter un client:");

        System.out.print("\n => Nom du client > ");
        last = scan.nextLine();

        System.out.print("\n => Prenom du client > ");
        first = scan.nextLine();

        System.out.print("\n => Numero de telephone du client > ");
        tel = scan.nextLine();

        if (services.ajoutClient(last,first,tel)) {
            System.out.println("\n\t * Le client a été ajouté * ");
        } else {
            System.out.println("\n\t ! Problème lors de l'ajout ");
        }

    }

    private void mainMenu() {

        System.out.println("\n\tChoisir une action :");
        System.out.println("\n\t1 < Afficher les clients");
        System.out.println("\t2 < Ajouter un client");
        System.out.println("\t3 < Ajouter un Compte à un client");
        System.out.println("\t4 < Crediter un compte");
        System.out.println("\t5 < Debiter un compte");

        System.out.println("\n\t0 < Quitter");


    }

}
