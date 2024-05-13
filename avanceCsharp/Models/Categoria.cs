using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;


namespace avanceCsharp.Models
{
    [Table("tb_categoria")]
    public class Categoria
    {
        [Key]
        public string codigo { get; set; }

        [Display(Name = "Apellido paterno")]
        public string categoria { get; set; }

}
}
