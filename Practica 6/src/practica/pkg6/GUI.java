package practica.pkg6;

import gnu.io.CommPortIdentifier;
import gnu.io.SerialPort;
import java.io.OutputStream;
import java.util.Enumeration;
import javax.swing.JOptionPane;

public class GUI extends javax.swing.JFrame {
    
    private OutputStream salida = null;
    SerialPort puertoSerial;
    private final String puerto = "COM7";
    private static final int tiempo_espera = 2000; // milisegundos
    private static final int data_rate = 9600;
    
    public void inicializarConexion(){
        CommPortIdentifier puertoID = null;
        Enumeration puertoEnum = CommPortIdentifier.getPortIdentifiers();
        while (puertoEnum.hasMoreElements()){
            CommPortIdentifier actualPuertoID = (CommPortIdentifier) puertoEnum.nextElement();
            if (puerto.equals(actualPuertoID.getName())){
                puertoID = actualPuertoID;
                break;
            }
        }
        
        if (puertoID==null){
            mostrarError ("No hay conexión");
            System.exit(ERROR);
        }
        
        try {
            puertoSerial = (SerialPort) puertoID.open(this.getClass().getName(),tiempo_espera);
            puertoSerial.setSerialPortParams (data_rate, SerialPort.DATABITS_8, SerialPort.STOPBITS_1, SerialPort.PARITY_NONE);
            salida = puertoSerial.getOutputStream();
        } catch (Exception e) {
            mostrarError (e.getMessage());
            System.exit(ERROR);
        }
    }
    
    private void enviarDatos (String datos){
        try {
            salida.write(datos.getBytes());
        } catch (Exception e) {
            mostrarError ("Error");
            System.exit(ERROR);
        }
    }
   
    public void mostrarError(String mensaje){
        JOptionPane.showConfirmDialog(this, mensaje, "Error", JOptionPane.ERROR_MESSAGE);
    }
    
    public GUI() {
        initComponents();  
        inicializarConexion(); 
    }

    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        buttonGroup1 = new javax.swing.ButtonGroup();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 400, Short.MAX_VALUE)
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 300, Short.MAX_VALUE)
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    public static void main(String args[]) {
    
      
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new GUI().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.ButtonGroup buttonGroup1;
    // End of variables declaration//GEN-END:variables
}
