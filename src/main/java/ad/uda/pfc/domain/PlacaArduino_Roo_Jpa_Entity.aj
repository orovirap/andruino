// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ad.uda.pfc.domain;

import ad.uda.pfc.domain.PlacaArduino;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

privileged aspect PlacaArduino_Roo_Jpa_Entity {
    
    declare @type: PlacaArduino: @Entity;
    
    declare @type: PlacaArduino: @Table(schema = "pfc_schema", name = "placa_arduino");
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Integer PlacaArduino.id;
    
    public Integer PlacaArduino.getId() {
        return this.id;
    }
    
    public void PlacaArduino.setId(Integer id) {
        this.id = id;
    }
    
}