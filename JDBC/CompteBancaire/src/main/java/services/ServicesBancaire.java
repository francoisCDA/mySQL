package services;

import dao.ClientDAO;
import dao.CompteBancaireDAO;
import dao.OperationDAO;
import dao.exceptions.ExeptCompte;
import enums.Statut;
import models.Client;
import models.CompteBancaire;
import models.Operation;
import services.exceptions.ExeptFirstCompte;
import util.ConnectBDD;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;


public class ServicesBancaire {

    private Connection connection;
    private ClientDAO clientDAO;
    private CompteBancaireDAO compteBancaireDAO;

    private OperationDAO operationDAO;

    public ServicesBancaire(){
        try {
            connection = new ConnectBDD().getConnection();
            clientDAO = new ClientDAO(connection);
            compteBancaireDAO = new CompteBancaireDAO(connection);
            operationDAO = new OperationDAO(connection);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public boolean ajoutClient(String nom, String prenom, String tel) {

        Client newClient = new Client(nom,prenom,tel);

        try {
            if (clientDAO.add(newClient)) {
                if (compteBancaireDAO.getNewCompteById(newClient.getId()) > 0) {
                    return true;
                } else {
                    throw new ExeptFirstCompte("erreur lors de la création du premier compte");
                }
            };

        } catch (SQLException | ExeptFirstCompte e) {
            throw new RuntimeException(e);
        }

        return false;
    }

    public int newCompte(int idClient){

        Client client = getClient(idClient);

        if (client != null) {
            try {
                int nouvNum = compteBancaireDAO.getNewCompteById(idClient);
                return nouvNum ;
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }

        return 0;
    }

    public boolean deposer(int numCompte, double montant ) {
        try {
            CompteBancaire compte = compteBancaireDAO.get(numCompte);

            if (compte != null ) {
                compte.deposer(montant);

                if (compteBancaireDAO.updateSolde(compte)) {
                    Operation op = new Operation(compte.getNumero(),montant,Statut.DEPOT);
                    return operationDAO.add(op);
                };
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return false;
    }



    public boolean retirer(int numCompte, double montant) {

        CompteBancaire compte = null;
        try {
            compte = compteBancaireDAO.get(numCompte);

            if (compte != null ) {
                if (compte.retirer(montant)) {
                    if (compteBancaireDAO.updateSolde(compte)) {
                        Operation op = new Operation(compte.getNumero(),montant,Statut.DEPOT);
                        return operationDAO.add(op);
                    }
                }
            }

        } catch (SQLException | ExeptCompte e) {
            throw new RuntimeException(e);
        }

        return false;
    }

    public Client getClient(int id) {

        try {
            return clientDAO.get(id);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

    public ArrayList<CompteBancaire> getComptes(int id_client) {

        return null;
    }

    public ArrayList<Operation> getOperations(int num_compte) {

        return null;
    }


    public ArrayList<Client> getClients() {

        try {
            return new ArrayList<>(clientDAO.get());
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void disconnect() {
        try {
            connection.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }











}
