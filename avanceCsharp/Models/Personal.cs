using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace avanceCsharp.Models
{
    [Table("tb_personal")]
    public class Personal
    {
        [Key]
        public string dni { get; set; }

        [Display(Name = "Apellido paterno")]
        public string ap_paterno { get; set; }

        [Display(Name = "Apellido materno")]
        public string ap_materno { get; set; }

        public string nombre { get; set; }

        public char genero { get; set; }


        
        [Display(Name = "Fecha de nacimiento")]
        [DisplayFormat(DataFormatString = "{0:dd/MM/yyyy}", ApplyFormatInEditMode = true)]
        public DateTime fecha_nacimiento { get; set; }

        public decimal sueldo { get; set; }
    }
}
