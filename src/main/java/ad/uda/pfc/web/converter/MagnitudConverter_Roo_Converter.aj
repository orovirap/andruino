// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ad.uda.pfc.web.converter;

import ad.uda.pfc.domain.Magnitud;
import ad.uda.pfc.web.converter.MagnitudConverter;
import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.convert.Converter;
import javax.faces.convert.FacesConverter;

privileged aspect MagnitudConverter_Roo_Converter {
    
    declare parents: MagnitudConverter implements Converter;
    
    declare @type: MagnitudConverter: @FacesConverter("ad.uda.pfc.web.converter.MagnitudConverter");
    
    public Object MagnitudConverter.getAsObject(FacesContext context, UIComponent component, String value) {
        if (value == null || value.length() == 0) {
            return null;
        }
        Integer id = Integer.parseInt(value);
        return Magnitud.findMagnitud(id);
    }
    
    public String MagnitudConverter.getAsString(FacesContext context, UIComponent component, Object value) {
        return value instanceof Magnitud ? ((Magnitud) value).getId().toString() : "";
    }
    
}