package ad.uda.pfc.domain;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import org.gvnix.service.roo.addon.annotations.GvNIXXmlElement;
import org.springframework.roo.addon.dbre.RooDbManaged;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooJpaActiveRecord(versionField = "", table = "magnitud", schema = "pfc_schema")
@RooDbManaged(automaticallyDelete = true)
@RooToString(excludeFields = { "caracteristicas" })
@GvNIXXmlElement(name = "magnitud", namespace = "http://domain.pfc.uda.ad/", elementList = { "id", "caracteristicas", "nom", "simbol" }, xmlTypeName = "Magnitud", exported = false)
public class Magnitud {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;
}
