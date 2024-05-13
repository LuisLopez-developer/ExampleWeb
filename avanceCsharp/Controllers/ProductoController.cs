using avanceCsharp.data;
using avanceCsharp.Models;
using Microsoft.AspNetCore.Mvc;

namespace avanceCsharp.Controllers
{
    public class ProductoController : Controller
    {
        private readonly ApplicationDbContext _context;

        public ProductoController(ApplicationDbContext context)
        {
            _context = context;
        }

        public IActionResult Index()
        {
            IEnumerable<Producto> ListarProducto = _context.Producto;

            return View(ListarProducto);
        }
    }
}
