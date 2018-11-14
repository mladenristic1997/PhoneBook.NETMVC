using GrogotApp.Models;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace GrogotApp.Controllers
{
    public class HomeController : Controller
    {

        GrototAppEntities db = new GrototAppEntities();

        public ActionResult Index()
        {
            List<Country> countriesList = db.Countries.ToList();
            ViewBag.countries = new SelectList(countriesList, "CountryId", "CountryName");
            ViewBag.genders = new SelectList(new List<SexModel>() { new SexModel(0, "musko"), new SexModel(1, "zensko") }, "SexId", "Sex");
            return View();
        }

        public JsonResult GetPeopleList()
        {
            List<PersonViewModel> peopleList = db.People.Select(x => new PersonViewModel
            {
                PersonId = x.PersonId,
                FirstName = x.FirstName,
                LastName = x.LastName,
                PhoneNumber = x.PhoneNumber,
                Email = x.Email,
                Sex = x.Sex,
                CountryId = x.CountryId,
                CityId = x.CityId,
                DOB = x.DOB
            }).ToList();

            return Json(peopleList, JsonRequestBehavior.AllowGet);
        }

        public JsonResult GetDate(int personId)
        {
            Person model = db.People.Where(x => x.PersonId == personId).SingleOrDefault();
            var date = model.DOB;
            return Json(date.ToString("yyyy-MM-dd"), JsonRequestBehavior.AllowGet);
        }

        public JsonResult GetPersonById(int personId)
        {
            Person model = db.People.Where(x => x.PersonId == personId).SingleOrDefault();
            string value = string.Empty;
            value = JsonConvert.SerializeObject(model, Formatting.Indented, new JsonSerializerSettings
            {
                ReferenceLoopHandling = ReferenceLoopHandling.Ignore
            });
            return Json(value, JsonRequestBehavior.AllowGet);
        }

        public JsonResult SaveDataInDatabase(PersonViewModel model)
        {
            bool result = false;
            try
            {
                if (model.PersonId > 0)
                {
                    Person pers = db.People.SingleOrDefault(x => x.PersonId == model.PersonId);
                    pers.FirstName = model.FirstName;
                    pers.LastName = model.LastName;
                    pers.PhoneNumber = model.PhoneNumber;
                    pers.Sex = model.Sex;
                    pers.Email = model.Email;
                    pers.CountryId = model.CountryId;
                    pers.CityId = model.CityId;
                    pers.DOB = model.DOB;
                    db.SaveChanges();
                    result = true;
                }
                else
                {
                    Person pers = new Person();
                    pers.FirstName = model.FirstName;
                    pers.LastName = model.LastName;
                    pers.PhoneNumber = model.PhoneNumber;
                    pers.Sex = model.Sex;
                    pers.Email = model.Email;
                    pers.CountryId = model.CountryId;
                    pers.CityId = model.CityId;
                    pers.DOB = model.DOB;
                    db.People.Add(pers);
                    db.SaveChanges();
                    result = true;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }

            return Json(result, JsonRequestBehavior.AllowGet);
        }

        public JsonResult DeletePersonRecord(int personId)
        {
            bool result = false;
            Person pers = db.People.SingleOrDefault(x => x.PersonId == personId);
            if (pers != null)
            {
                db.People.Remove(pers);
                db.SaveChanges();
                result = true;
            }

            return Json(result, JsonRequestBehavior.AllowGet);
        }

        public JsonResult GetCities(int countryId)
        {
            List<City> model = db.Cities.Where(x => x.CountryId == countryId).ToList();
            string value = string.Empty;
            value = JsonConvert.SerializeObject(model, Formatting.Indented, new JsonSerializerSettings
            {
                ReferenceLoopHandling = ReferenceLoopHandling.Ignore
            });
            return Json(value, JsonRequestBehavior.AllowGet);
        }

        public JsonResult GetCountry(int countryId)
        {
            Country model = db.Countries.Where(x => x.CountryId == countryId).SingleOrDefault();
            string value = string.Empty;
            value = JsonConvert.SerializeObject(model, Formatting.Indented, new JsonSerializerSettings
            {
                ReferenceLoopHandling = ReferenceLoopHandling.Ignore
            });
            return Json(value, JsonRequestBehavior.AllowGet);
        }

        public JsonResult GetCity(int cityId)
        {
            City model = db.Cities.Where(x => x.CityId == cityId).SingleOrDefault();
            string value = string.Empty;
            value = JsonConvert.SerializeObject(model, Formatting.Indented, new JsonSerializerSettings
            {
                ReferenceLoopHandling = ReferenceLoopHandling.Ignore
            });
            return Json(value, JsonRequestBehavior.AllowGet);
        }
    }
}