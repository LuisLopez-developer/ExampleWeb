using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace avanceCsharp.Models
{
    [Table("tb_producto")]
    public class Producto
    {
        [Key]
        [Required(ErrorMessage = "El codigo es requerido")]
        [Display(Name = "Producto")]
        public string codigo_producto { get; set; }

        public required string producto { get; set; }

        [Display(Name = "Stock")]
        public int stock_disponible { get; set; }

        public decimal costo { get; set; } = 0.00M;

        public decimal ganancia { get; set; }

        [Display(Name = "Codigo marca")]
        public string producto_codigo_marca { get; set; }

        [Display(Name = "Codigo Categoria")]
        public string producto_codigo_categoria { get; set; }



    }
}
