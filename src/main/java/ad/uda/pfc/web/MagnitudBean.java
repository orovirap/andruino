package ad.uda.pfc.web;

import ad.uda.pfc.domain.Magnitud;
import org.springframework.roo.addon.jsf.managedbean.RooJsfManagedBean;
import org.springframework.roo.addon.serializable.RooSerializable;

@RooSerializable
@RooJsfManagedBean(entity = Magnitud.class, beanName = "magnitudBean")
public class MagnitudBean {
}
