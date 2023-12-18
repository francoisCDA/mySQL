package ihm;

import Classe.Student;
import jdbc.AddEtudiant;
import jdbc.Remove;
import jdbc.Select;

import java.util.ArrayList;
import java.util.Scanner;

public class IHM {

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

    public static void showClasse(int num){
        ArrayList<Student> classe = Select.classe(num);

        classe.forEach( e -> System.out.println(e.toString()));
    }

    public static void delete(int id) {

        System.out.print("\n Indiquer l'ID de l'étudiant à éliminer (de la base de donnée) > ");
        int target = scan.nextInt();
        scan.nextLine();

        boolean cleaning = Remove.fromId(id);

    }


}
