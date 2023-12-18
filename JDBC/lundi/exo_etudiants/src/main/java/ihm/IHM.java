package ihm;

import Classe.Student;
import jdbc.AddEtudiant;
import jdbc.Remove;
import jdbc.Select;

import java.util.ArrayList;
import java.util.Scanner;

public class IHM {


    public static void main() {

        int choix = -1 ;

        while ( choix != 0 ) {

            System.out.println("\n\tChoisir une action :\n");
            System.out.println("\t1/ Ajouter un étudiant");
            System.out.println("\t2/ Afficher les étudiants");
            System.out.println("\t3/ Afficher une classe");
            System.out.println("\t4/ Supprimer un étudiant");
            System.out.println("\t5/ Rechercher un etudiant");

            System.out.println("\n\t 0/ Quitter");

            choix = scan.nextInt();
            scan.nextLine();

            switch (choix) {
                case 1 -> addStudent();
                case 2 -> showStudents();
                case 3 -> showClasse();
                case 4 -> delete();
                case 5 -> search();
            }

        }

        System.out.println("Au revoir");


    }




    private static Scanner scan = new Scanner(System.in);



    public static void addStudent() {

        String first, last, date;
        int numClasse;

        System.out.print("\nIndiquer le prénom de l'étudiant > ");
        first = scan.nextLine();

        System.out.print("\nIndiquer le nom de l'étudiant > ");
        last = scan.nextLine();

        System.out.print("\nIndiquer son numéro de classe > ");
        numClasse = scan.nextInt();
        scan.nextLine();

        System.out.print("\nIndiquer la date de remise de diplôme > ");
        date = scan.nextLine();
        // TODO regex pour le format date

        boolean insert = AddEtudiant.add(first,last,numClasse,date);

        if (insert) {
            System.out.println("étudiant ajouté");
        } else {
            System.out.println("echec d'ajout");
        }

    }


    public static void showStudents() {
       // ArrayList<String> etudiants = Select.allString();
       // etudiants.forEach( e -> System.out.println(e));

        ArrayList<Student> etudiants = Select.all();
        etudiants.forEach( (e) -> System.out.println(e.toString())  );

    }


    public static void showClasse() {

        System.out.print("\n\tIndiquer la classe à afficher : ");
        int choix = scan.nextInt();
        scan.nextLine();

        showClasse(choix);

    }

    public static void showClasse(int num){
        ArrayList<Student> classe = Select.classe(num);

        classe.forEach( e -> System.out.println(e.toString()));
    }


    public static void delete() {

        System.out.print("\n Indiquer l'ID de l'étudiant à éliminer (de la base de donnée) > ");
        int target = scan.nextInt();
        scan.nextLine();

        boolean cleaning = Remove.fromId(target);

    }

    public static void search(){

        System.out.print("\n Recherche : ");
        String search = scan.next();

        ArrayList<Student> ret = Select.like(search);

        ret.forEach(st -> System.out.println(st.toString()));

    }


}
