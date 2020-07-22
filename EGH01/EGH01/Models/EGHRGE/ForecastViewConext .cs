﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Collections.Specialized;
using EGH01.Core;
using EGH01DB;
using EGH01DB.Types;
using EGH01DB.Primitives;
using EGH01DB.Objects;
namespace EGH01.Models.EGHRGE
{
    public class ForecastViewConext
    {
        public enum REGIM {INIT, SET, CHOICE, ERROR, RUNERROR, REPORT};
        
        public REGIM Regim                        {get; set;}
        public DateTime? Incident_date            {get; set;}
        public DateTime? Incident_date_message    {get; set;}
        public int?      Incident_type_code       {get; set;}
        public float?    Volume                   {get; set;}
        //public int?      Petrochemical_type_code  {get; set;}
       // public int?      RiskObjectId            {get; set;}
        public int?      Lat_degree               {get; set;}
        public int?      Lat_min                  {get; set;}
        public float?    Lat_sec                  {get; set;}
        public int?      Lng_degree               {get; set;}
        public int?      Lng_min                  {get; set;}
        public float?    Lng_sec                  {get; set;}
        public float?    Temperature              {get; set;}
        public PetrochemicalType                  petrochemicaltype;
        public RiskObject                         riskobject;         
        public RGEContext.ECOForecast     ecoforecast  {get; set;}
        public RGEContext.ECOForecastX   ecoforecastx {get; set;}
        public IncidentType              incidenttype; 
        public IncidentTypeList          incidenttypelist;
        public List<PetrochemicalType> petrochemicaltypelist;
        
        public const string VIEWNAME = "Forecast";
        public Menu.MenuItem menuitemgeop  = new Menu.MenuItem("Географическая точка", "Forecast.Point", true);
        public Menu.MenuItem menuitemrobj  = new Menu.MenuItem("Техногенный объект",   "Forecast.Point", true);
        public Menu.MenuItem menuitempoint = null;
        public string JSONCanv; 

        public ForecastViewConext(IDBContext db) 
        {
            this.menuitempoint = menuitemgeop;
            this.Regim = REGIM.INIT;
            if (!Helper.GetListPetrochemicalType(db, ref petrochemicaltypelist)) this.Regim = REGIM.RUNERROR;
            this.incidenttypelist = new EGH01DB.Types.IncidentTypeList(db);
            if (this.incidenttypelist == null) this.Regim = REGIM.RUNERROR;

        }
        
        public static ForecastViewConext Handler(RGEContext context, NameValueCollection parms)
        {


            ForecastViewConext viewcontext = context.GetViewContext(VIEWNAME) as ForecastViewConext;
            if  (viewcontext == null)  context.SaveViewContext(new RGEContext.ViewContextEntry(ForecastViewConext.VIEWNAME, viewcontext = new ForecastViewConext(context)));

            if (viewcontext.Regim != REGIM.INIT)
            {
                viewcontext.Regim = REGIM.CHOICE;
                string date = parms["date"];
                if (String.IsNullOrEmpty(date)) viewcontext.Regim = REGIM.ERROR;
                else
                {
                    DateTime incident_date = DateTime.MinValue;
                    if (DateTime.TryParse(date, out incident_date)) viewcontext.Incident_date = (DateTime?)incident_date;
                    else viewcontext.Regim = REGIM.ERROR;
                }

                string date_message = parms["date_message"];
                if (String.IsNullOrEmpty(date_message)) viewcontext.Regim = REGIM.ERROR;
                else
                {
                    DateTime incident_date_message = DateTime.MinValue;
                    if (DateTime.TryParse(date_message, out incident_date_message)) viewcontext.Incident_date_message = (DateTime?)incident_date_message;
                    else viewcontext.Regim = REGIM.ERROR;
                }

                string parmpetrochemicaltype = parms["petrochemicaltype"];
                if (String.IsNullOrEmpty(parmpetrochemicaltype)) viewcontext.Regim = REGIM.ERROR;
                else
                {
                    int code = -1;
                    if (int.TryParse(parmpetrochemicaltype, out code))
                    {
                        if (viewcontext.petrochemicaltype == null || viewcontext.petrochemicaltype.code_type != code)
                        {
                            viewcontext.petrochemicaltype = new PetrochemicalType();
                            if (!PetrochemicalType.GetByCode(context, code, ref viewcontext.petrochemicaltype)) viewcontext.Regim = REGIM.ERROR;
                        }
                    }
                    else viewcontext.Regim = REGIM.ERROR;
                }

                string incidenttype = parms["incidenttype"];
                if (String.IsNullOrEmpty(incidenttype)) viewcontext.Regim = REGIM.ERROR;
                else
                {
                    int code = -1;
                    if (int.TryParse(incidenttype, out code))
                    {
                        viewcontext.Incident_type_code = (int?)code;
                        if (viewcontext.incidenttype == null || viewcontext.incidenttype.type_code != code)
                        {
                            if (!IncidentType.GetByCode(context, code, out viewcontext.incidenttype)) viewcontext.Regim = REGIM.ERROR;
                        }
                    }
                    else viewcontext.Regim = REGIM.ERROR;
                }

                string volume = parms["volume"];
                if (String.IsNullOrEmpty(volume)) viewcontext.Regim = REGIM.ERROR;
                else
                {
                    float v = 0.0f;
                    if (float.TryParse(volume, out v)) viewcontext.Volume = (float?)v;
                    else viewcontext.Regim = REGIM.ERROR;
                }

                string temperature = parms["temperature"];
                if (String.IsNullOrEmpty(temperature)) viewcontext.Regim = REGIM.ERROR;
                else
                {
                    float t = 0.0f;
                    if (float.TryParse(temperature, out t)) viewcontext.Temperature = (float?)t;
                    else viewcontext.Regim = REGIM.ERROR;
                }
                                                
                if (viewcontext.Regim == REGIM.CHOICE) viewcontext.Regim = REGIM.SET; 

            }
            else  viewcontext.Regim = REGIM.CHOICE;
            return viewcontext;
        }
    }



    //if (viewcontext.incidenttypelist == null) viewcontext.incidenttypelist = new IncidentTypeList(context);
    //if (viewcontext.incidenttypelist == null) viewcontext.Regim = REGIM.ERROR;



    //Canv canv = new Canv(12, new Canv.XY[7]
    //                            {
    //                                new Canv.XY(70,250),
    //                                new Canv.XY(80,70), 
    //                                new Canv.XY(100,50),
    //                                new Canv.XY(200,80), 
    //                                new Canv.XY(370,230),
    //                                new Canv.XY(220,360), 
    //                                new Canv.XY(70,250)
    //                            });
    //viewcontext.JSONCanv = new JavaScriptSerializer().Serialize(canv);
    //public class Canv
    //{
    //    public class XY
    //    {
    //        public int x;
    //        public int y;
    //        public XY(int x, int y) {this.x = x; this.y = y;}
    //    }
    //    public int   r;
    //    public XY[]  xy;
    //    public Canv(int r,  XY[] xy)
    //    {
    //        this.r = r;
    //        this.xy = xy;
    //    }
    //} 


}

