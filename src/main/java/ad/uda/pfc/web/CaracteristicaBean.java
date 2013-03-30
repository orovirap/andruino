package ad.uda.pfc.web;

import ad.uda.pfc.domain.Caracteristica;
import org.springframework.roo.addon.jsf.managedbean.RooJsfManagedBean;
import org.springframework.roo.addon.serializable.RooSerializable;

@RooSerializable
@RooJsfManagedBean(entity = Caracteristica.class, beanName = "caracteristicaBean")
public class CaracteristicaBean {
}
