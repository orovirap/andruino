// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ad.uda.pfc.web;

import ad.uda.pfc.domain.Sensor;
import ad.uda.pfc.domain.TipusSensor;
import ad.uda.pfc.web.TipusSensorBean;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import javax.annotation.PostConstruct;
import javax.el.ELContext;
import javax.el.ExpressionFactory;
import javax.faces.application.Application;
import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import javax.faces.component.html.HtmlOutputText;
import javax.faces.component.html.HtmlPanelGrid;
import javax.faces.context.FacesContext;
import javax.faces.validator.LengthValidator;
import org.primefaces.component.inputtextarea.InputTextarea;
import org.primefaces.component.message.Message;
import org.primefaces.context.RequestContext;
import org.primefaces.event.CloseEvent;

privileged aspect TipusSensorBean_Roo_ManagedBean {
    
    declare @type: TipusSensorBean: @ManagedBean(name = "tipusSensorBean");
    
    declare @type: TipusSensorBean: @SessionScoped;
    
    private String TipusSensorBean.name = "TipusSensors";
    
    private TipusSensor TipusSensorBean.tipusSensor;
    
    private List<TipusSensor> TipusSensorBean.allTipusSensors;
    
    private boolean TipusSensorBean.dataVisible = false;
    
    private List<String> TipusSensorBean.columns;
    
    private HtmlPanelGrid TipusSensorBean.createPanelGrid;
    
    private HtmlPanelGrid TipusSensorBean.editPanelGrid;
    
    private HtmlPanelGrid TipusSensorBean.viewPanelGrid;
    
    private boolean TipusSensorBean.createDialogVisible = false;
    
    private List<Sensor> TipusSensorBean.selectedSensors;
    
    @PostConstruct
    public void TipusSensorBean.init() {
        columns = new ArrayList<String>();
        columns.add("nom");
    }
    
    public String TipusSensorBean.getName() {
        return name;
    }
    
    public List<String> TipusSensorBean.getColumns() {
        return columns;
    }
    
    public List<TipusSensor> TipusSensorBean.getAllTipusSensors() {
        return allTipusSensors;
    }
    
    public void TipusSensorBean.setAllTipusSensors(List<TipusSensor> allTipusSensors) {
        this.allTipusSensors = allTipusSensors;
    }
    
    public String TipusSensorBean.findAllTipusSensors() {
        allTipusSensors = TipusSensor.findAllTipusSensors();
        dataVisible = !allTipusSensors.isEmpty();
        return null;
    }
    
    public boolean TipusSensorBean.isDataVisible() {
        return dataVisible;
    }
    
    public void TipusSensorBean.setDataVisible(boolean dataVisible) {
        this.dataVisible = dataVisible;
    }
    
    public HtmlPanelGrid TipusSensorBean.getCreatePanelGrid() {
        if (createPanelGrid == null) {
            createPanelGrid = populateCreatePanel();
        }
        return createPanelGrid;
    }
    
    public void TipusSensorBean.setCreatePanelGrid(HtmlPanelGrid createPanelGrid) {
        this.createPanelGrid = createPanelGrid;
    }
    
    public HtmlPanelGrid TipusSensorBean.getEditPanelGrid() {
        if (editPanelGrid == null) {
            editPanelGrid = populateEditPanel();
        }
        return editPanelGrid;
    }
    
    public void TipusSensorBean.setEditPanelGrid(HtmlPanelGrid editPanelGrid) {
        this.editPanelGrid = editPanelGrid;
    }
    
    public HtmlPanelGrid TipusSensorBean.getViewPanelGrid() {
        return populateViewPanel();
    }
    
    public void TipusSensorBean.setViewPanelGrid(HtmlPanelGrid viewPanelGrid) {
        this.viewPanelGrid = viewPanelGrid;
    }
    
    public HtmlPanelGrid TipusSensorBean.populateCreatePanel() {
        FacesContext facesContext = FacesContext.getCurrentInstance();
        Application application = facesContext.getApplication();
        ExpressionFactory expressionFactory = application.getExpressionFactory();
        ELContext elContext = facesContext.getELContext();
        
        HtmlPanelGrid htmlPanelGrid = (HtmlPanelGrid) application.createComponent(HtmlPanelGrid.COMPONENT_TYPE);
        
        HtmlOutputText sensorsCreateOutput = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        sensorsCreateOutput.setId("sensorsCreateOutput");
        sensorsCreateOutput.setValue("Sensors:   ");
        htmlPanelGrid.getChildren().add(sensorsCreateOutput);
        
        HtmlOutputText sensorsCreateInput = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        sensorsCreateInput.setId("sensorsCreateInput");
        sensorsCreateInput.setValue("This relationship is managed from the Sensor side");
        htmlPanelGrid.getChildren().add(sensorsCreateInput);
        
        Message sensorsCreateInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        sensorsCreateInputMessage.setId("sensorsCreateInputMessage");
        sensorsCreateInputMessage.setFor("sensorsCreateInput");
        sensorsCreateInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(sensorsCreateInputMessage);
        
        HtmlOutputText nomCreateOutput = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        nomCreateOutput.setId("nomCreateOutput");
        nomCreateOutput.setValue("Nom: * ");
        htmlPanelGrid.getChildren().add(nomCreateOutput);
        
        InputTextarea nomCreateInput = (InputTextarea) application.createComponent(InputTextarea.COMPONENT_TYPE);
        nomCreateInput.setId("nomCreateInput");
        nomCreateInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{tipusSensorBean.tipusSensor.nom}", String.class));
        LengthValidator nomCreateInputValidator = new LengthValidator();
        nomCreateInputValidator.setMaximum(250);
        nomCreateInput.addValidator(nomCreateInputValidator);
        nomCreateInput.setRequired(true);
        htmlPanelGrid.getChildren().add(nomCreateInput);
        
        Message nomCreateInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        nomCreateInputMessage.setId("nomCreateInputMessage");
        nomCreateInputMessage.setFor("nomCreateInput");
        nomCreateInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(nomCreateInputMessage);
        
        return htmlPanelGrid;
    }
    
    public HtmlPanelGrid TipusSensorBean.populateEditPanel() {
        FacesContext facesContext = FacesContext.getCurrentInstance();
        Application application = facesContext.getApplication();
        ExpressionFactory expressionFactory = application.getExpressionFactory();
        ELContext elContext = facesContext.getELContext();
        
        HtmlPanelGrid htmlPanelGrid = (HtmlPanelGrid) application.createComponent(HtmlPanelGrid.COMPONENT_TYPE);
        
        HtmlOutputText sensorsEditOutput = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        sensorsEditOutput.setId("sensorsEditOutput");
        sensorsEditOutput.setValue("Sensors:   ");
        htmlPanelGrid.getChildren().add(sensorsEditOutput);
        
        HtmlOutputText sensorsEditInput = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        sensorsEditInput.setId("sensorsEditInput");
        sensorsEditInput.setValue("This relationship is managed from the Sensor side");
        htmlPanelGrid.getChildren().add(sensorsEditInput);
        
        Message sensorsEditInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        sensorsEditInputMessage.setId("sensorsEditInputMessage");
        sensorsEditInputMessage.setFor("sensorsEditInput");
        sensorsEditInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(sensorsEditInputMessage);
        
        HtmlOutputText nomEditOutput = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        nomEditOutput.setId("nomEditOutput");
        nomEditOutput.setValue("Nom: * ");
        htmlPanelGrid.getChildren().add(nomEditOutput);
        
        InputTextarea nomEditInput = (InputTextarea) application.createComponent(InputTextarea.COMPONENT_TYPE);
        nomEditInput.setId("nomEditInput");
        nomEditInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{tipusSensorBean.tipusSensor.nom}", String.class));
        LengthValidator nomEditInputValidator = new LengthValidator();
        nomEditInputValidator.setMaximum(250);
        nomEditInput.addValidator(nomEditInputValidator);
        nomEditInput.setRequired(true);
        htmlPanelGrid.getChildren().add(nomEditInput);
        
        Message nomEditInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        nomEditInputMessage.setId("nomEditInputMessage");
        nomEditInputMessage.setFor("nomEditInput");
        nomEditInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(nomEditInputMessage);
        
        return htmlPanelGrid;
    }
    
    public HtmlPanelGrid TipusSensorBean.populateViewPanel() {
        FacesContext facesContext = FacesContext.getCurrentInstance();
        Application application = facesContext.getApplication();
        ExpressionFactory expressionFactory = application.getExpressionFactory();
        ELContext elContext = facesContext.getELContext();
        
        HtmlPanelGrid htmlPanelGrid = (HtmlPanelGrid) application.createComponent(HtmlPanelGrid.COMPONENT_TYPE);
        
        HtmlOutputText sensorsLabel = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        sensorsLabel.setId("sensorsLabel");
        sensorsLabel.setValue("Sensors:   ");
        htmlPanelGrid.getChildren().add(sensorsLabel);
        
        HtmlOutputText sensorsValue = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        sensorsValue.setId("sensorsValue");
        sensorsValue.setValue("This relationship is managed from the Sensor side");
        htmlPanelGrid.getChildren().add(sensorsValue);
        
        HtmlOutputText nomLabel = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        nomLabel.setId("nomLabel");
        nomLabel.setValue("Nom:   ");
        htmlPanelGrid.getChildren().add(nomLabel);
        
        InputTextarea nomValue = (InputTextarea) application.createComponent(InputTextarea.COMPONENT_TYPE);
        nomValue.setId("nomValue");
        nomValue.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{tipusSensorBean.tipusSensor.nom}", String.class));
        nomValue.setReadonly(true);
        nomValue.setDisabled(true);
        htmlPanelGrid.getChildren().add(nomValue);
        
        return htmlPanelGrid;
    }
    
    public TipusSensor TipusSensorBean.getTipusSensor() {
        if (tipusSensor == null) {
            tipusSensor = new TipusSensor();
        }
        return tipusSensor;
    }
    
    public void TipusSensorBean.setTipusSensor(TipusSensor tipusSensor) {
        this.tipusSensor = tipusSensor;
    }
    
    public List<Sensor> TipusSensorBean.getSelectedSensors() {
        return selectedSensors;
    }
    
    public void TipusSensorBean.setSelectedSensors(List<Sensor> selectedSensors) {
        if (selectedSensors != null) {
            tipusSensor.setSensors(new HashSet<Sensor>(selectedSensors));
        }
        this.selectedSensors = selectedSensors;
    }
    
    public String TipusSensorBean.onEdit() {
        if (tipusSensor != null && tipusSensor.getSensors() != null) {
            selectedSensors = new ArrayList<Sensor>(tipusSensor.getSensors());
        }
        return null;
    }
    
    public boolean TipusSensorBean.isCreateDialogVisible() {
        return createDialogVisible;
    }
    
    public void TipusSensorBean.setCreateDialogVisible(boolean createDialogVisible) {
        this.createDialogVisible = createDialogVisible;
    }
    
    public String TipusSensorBean.displayList() {
        createDialogVisible = false;
        findAllTipusSensors();
        return "tipusSensor";
    }
    
    public String TipusSensorBean.displayCreateDialog() {
        tipusSensor = new TipusSensor();
        createDialogVisible = true;
        return "tipusSensor";
    }
    
    public String TipusSensorBean.persist() {
        String message = "";
        if (tipusSensor.getId() != null) {
            tipusSensor.merge();
            message = "Successfully updated";
        } else {
            tipusSensor.persist();
            message = "Successfully created";
        }
        RequestContext context = RequestContext.getCurrentInstance();
        context.execute("createDialog.hide()");
        context.execute("editDialog.hide()");
        
        FacesMessage facesMessage = new FacesMessage(message);
        FacesContext.getCurrentInstance().addMessage(null, facesMessage);
        reset();
        return findAllTipusSensors();
    }
    
    public String TipusSensorBean.delete() {
        tipusSensor.remove();
        FacesMessage facesMessage = new FacesMessage("Successfully deleted");
        FacesContext.getCurrentInstance().addMessage(null, facesMessage);
        reset();
        return findAllTipusSensors();
    }
    
    public void TipusSensorBean.reset() {
        tipusSensor = null;
        selectedSensors = null;
        createDialogVisible = false;
    }
    
    public void TipusSensorBean.handleDialogClose(CloseEvent event) {
        reset();
    }
    
}