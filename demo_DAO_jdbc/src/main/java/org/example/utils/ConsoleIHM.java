package org.example.utils;

import org.example.models.Person;
import org.example.service.PersonService;

import java.util.List;
import java.util.Scanner;

public class ConsoleIHM {

    private Scanner scan;
    private PersonService personeService;

    public ConsoleIHM() {
        this.scan = new Scanner(System.in);
        this.personeService = new PersonService();
    }

    public void run(){

        String choix = "null" ;

        while (!choix.equals("0")) {

            menu();
            choix = scan.nextLine();

            switch (choix) {
                case "1" -> addPerson() ;
                case "2" -> showAll() ;
                case "3" -> delete();
                case "4" -> upd();
                case "0" -> System.out.println("Au revoir");
                default -> System.out.println("Saisie incorrecte");
            }
        }


    }

    private void menu() {
        System.out.println("\n\tChoisir une action :\n");
        System.out.println("\t1/ Ajouter une personne");
        System.out.println("\t2/ Afficher tout le monde");
        System.out.println("\t3/ Supprimer une personne id");
        System.out.println("\t4/ Mettre à jour une personne");
        System.out.println("\n\t0/ Quitter");
        System.out.print("\n\n > ");
    }

    private void addPerson() {
        String first, last;

        System.out.print("\nIndiquer un prénom > ");
        first = scan.nextLine();
        System.out.print("\nIndiquer un nom > ");
        last = scan.nextLine();

        personeService.createPerson(first,last);

    }

    private void showAll() {
       List<Person> persons = personeService.getAllPersons();

       persons.forEach(System.out::println);

    }

    private void delete() {
        int id ;

        System.out.print("\n\t ID de la cible > ");
        id = scan.nextInt();
        scan.nextLine();

        if (personeService.deletePerson(id)) {
            System.out.println("mission accomplie");
        } else {
            System.out.println("erreur");
        };

    }
    private void upd() {
    
    }
}
