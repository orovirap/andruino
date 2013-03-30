package ad.uda.pfc.web;

import ad.uda.pfc.domain.Habitacle;
import org.springframework.roo.addon.jsf.managedbean.RooJsfManagedBean;
import org.springframework.roo.addon.serializable.RooSerializable;

@RooSerializable
@RooJsfManagedBean(entity = Habitacle.class, beanName = "habitacleBean")
public class HabitacleBean {
}
