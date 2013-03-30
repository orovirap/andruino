package ad.uda.pfc.web;

import ad.uda.pfc.domain.Sensor;
import org.springframework.roo.addon.jsf.managedbean.RooJsfManagedBean;
import org.springframework.roo.addon.serializable.RooSerializable;

@RooSerializable
@RooJsfManagedBean(entity = Sensor.class, beanName = "sensorBean")
public class SensorBean {
}
