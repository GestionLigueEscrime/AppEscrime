//------------------------------------------------------------------------------
// <auto-generated>
//     Ce code a été généré à partir d'un modèle.
//
//     Des modifications manuelles apportées à ce fichier peuvent conduire à un comportement inattendu de votre application.
//     Les modifications manuelles apportées à ce fichier sont remplacées si le code est régénéré.
// </auto-generated>
//------------------------------------------------------------------------------

namespace ClassLibrary1
{
    using System;
    using System.Collections.Generic;
    
    public partial class COMPETITION
    {
        public COMPETITION()
        {
            this.MAITREDARME = new HashSet<MAITREDARME>();
            this.MAITREDARME1 = new HashSet<MAITREDARME>();
        }
    
        public int CODECOMPET { get; set; }
        public int NUMCLUB { get; set; }
        public int CODECATEG { get; set; }
    
        public virtual CATEGORIE CATEGORIE { get; set; }
        public virtual CLUB CLUB { get; set; }
        public virtual ICollection<MAITREDARME> MAITREDARME { get; set; }
        public virtual ICollection<MAITREDARME> MAITREDARME1 { get; set; }
    }
}