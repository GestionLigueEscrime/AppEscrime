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
    
    public partial class MAITREDARME
    {
        public MAITREDARME()
        {
            this.COMPETITION = new HashSet<COMPETITION>();
            this.COMPETITION1 = new HashSet<COMPETITION>();
            this.ARME = new HashSet<ARME>();
        }
    
        public int NUMLICENCEMAITRE { get; set; }
        public int NUMCLUB { get; set; }
        public string NOMMAITRE { get; set; }
        public string PRENOMMAITRE { get; set; }
        public Nullable<System.DateTime> DATENAISSMAITRE { get; set; }
    
        public virtual CLUB CLUB { get; set; }
        public virtual ICollection<COMPETITION> COMPETITION { get; set; }
        public virtual ICollection<COMPETITION> COMPETITION1 { get; set; }
        public virtual ICollection<ARME> ARME { get; set; }
    }
}