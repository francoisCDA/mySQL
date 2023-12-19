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
                case "2" -> selectClient();
                case "3" -> addClient();
                default -> System.out.printf("Action inconnue");
            }

        }
        services.disconnect();
        System.out.println("Au revoir");

    }

    private void printClients() {
        ArrayList<Client> clients = services.getClients();
        clients.forEach(System.out::println);
    }

    private void selectClient() {

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
        System.out.println("\t2 < Détails Client");
        System.out.println("\t3 < Ajouter un Client");
        System.out.println("\n\t0 < Quitter");


    }

}
