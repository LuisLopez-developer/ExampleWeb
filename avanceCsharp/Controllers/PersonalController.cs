using avanceCsharp.data;
using avanceCsharp.Models;
using Microsoft.AspNetCore.Mvc;

namespace avanceCsharp.Controllers
{
    public class PersonalController : Controller
    {

        private readonly ApplicationDbContext _context;

        public PersonalController(ApplicationDbContext context)
        {
            _context = context;
        }

        public IActionResult Index()
        {
            IEnumerable<Personal> ListarPersonal = _context.Personal;

            return View(ListarPersonal);
        }
    }
}
