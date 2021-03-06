// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ad.uda.pfc.domain;

import ad.uda.pfc.domain.Habitacle;
import ad.uda.pfc.domain.HabitacleDataOnDemand;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.springframework.stereotype.Component;

privileged aspect HabitacleDataOnDemand_Roo_DataOnDemand {
    
    declare @type: HabitacleDataOnDemand: @Component;
    
    private Random HabitacleDataOnDemand.rnd = new SecureRandom();
    
    private List<Habitacle> HabitacleDataOnDemand.data;
    
    public Habitacle HabitacleDataOnDemand.getNewTransientHabitacle(int index) {
        Habitacle obj = new Habitacle();
        setDescripcio(obj, index);
        return obj;
    }
    
    public void HabitacleDataOnDemand.setDescripcio(Habitacle obj, int index) {
        String descripcio = "descripcio_" + index;
        if (descripcio.length() > 250) {
            descripcio = descripcio.substring(0, 250);
        }
        obj.setDescripcio(descripcio);
    }
    
    public Habitacle HabitacleDataOnDemand.getSpecificHabitacle(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        Habitacle obj = data.get(index);
        Integer id = obj.getId();
        return Habitacle.findHabitacle(id);
    }
    
    public Habitacle HabitacleDataOnDemand.getRandomHabitacle() {
        init();
        Habitacle obj = data.get(rnd.nextInt(data.size()));
        Integer id = obj.getId();
        return Habitacle.findHabitacle(id);
    }
    
    public boolean HabitacleDataOnDemand.modifyHabitacle(Habitacle obj) {
        return false;
    }
    
    public void HabitacleDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = Habitacle.findHabitacleEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'Habitacle' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<Habitacle>();
        for (int i = 0; i < 10; i++) {
            Habitacle obj = getNewTransientHabitacle(i);
            try {
                obj.persist();
            } catch (ConstraintViolationException e) {
                StringBuilder msg = new StringBuilder();
                for (Iterator<ConstraintViolation<?>> iter = e.getConstraintViolations().iterator(); iter.hasNext();) {
                    ConstraintViolation<?> cv = iter.next();
                    msg.append("[").append(cv.getConstraintDescriptor()).append(":").append(cv.getMessage()).append("=").append(cv.getInvalidValue()).append("]");
                }
                throw new RuntimeException(msg.toString(), e);
            }
            obj.flush();
            data.add(obj);
        }
    }
    
}
