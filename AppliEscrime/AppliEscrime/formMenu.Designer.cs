namespace AppliEscrime
{
    partial class formMenu
    {
        /// <summary>
        /// Variable nécessaire au concepteur.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Nettoyage des ressources utilisées.
        /// </summary>
        /// <param name="disposing">true si les ressources managées doivent être supprimées ; sinon, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Code généré par le Concepteur Windows Form

        /// <summary>
        /// Méthode requise pour la prise en charge du concepteur - ne modifiez pas
        /// le contenu de cette méthode avec l'éditeur de code.
        /// </summary>
        private void InitializeComponent()
        {
            this.menuGeneral = new System.Windows.Forms.MenuStrip();
            this.menuItemQuitter = new System.Windows.Forms.ToolStripMenuItem();
            this.menuItemClub = new System.Windows.Forms.ToolStripMenuItem();
            this.menuItemAdherent = new System.Windows.Forms.ToolStripMenuItem();
            this.menuItemMaitreDarme = new System.Windows.Forms.ToolStripMenuItem();
            this.menuItemCompetition = new System.Windows.Forms.ToolStripMenuItem();
            this.menuGeneral.SuspendLayout();
            this.SuspendLayout();
            // 
            // menuGeneral
            // 
            this.menuGeneral.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.menuItemQuitter,
            this.menuItemClub,
            this.menuItemAdherent,
            this.menuItemMaitreDarme,
            this.menuItemCompetition});
            this.menuGeneral.Location = new System.Drawing.Point(0, 0);
            this.menuGeneral.Name = "menuGeneral";
            this.menuGeneral.Size = new System.Drawing.Size(673, 24);
            this.menuGeneral.TabIndex = 2;
            this.menuGeneral.Text = "Menu Général";
            // 
            // menuItemQuitter
            // 
            this.menuItemQuitter.Name = "menuItemQuitter";
            this.menuItemQuitter.Size = new System.Drawing.Size(56, 20);
            this.menuItemQuitter.Text = "Quitter";
            // 
            // menuItemClub
            // 
            this.menuItemClub.Name = "menuItemClub";
            this.menuItemClub.Size = new System.Drawing.Size(44, 20);
            this.menuItemClub.Text = "Club";
            // 
            // menuItemAdherent
            // 
            this.menuItemAdherent.Name = "menuItemAdherent";
            this.menuItemAdherent.Size = new System.Drawing.Size(73, 20);
            this.menuItemAdherent.Text = "Adhérents";
            // 
            // menuItemMaitreDarme
            // 
            this.menuItemMaitreDarme.Name = "menuItemMaitreDarme";
            this.menuItemMaitreDarme.Size = new System.Drawing.Size(103, 20);
            this.menuItemMaitreDarme.Text = "Maîtres d\'armes";
            // 
            // menuItemCompetition
            // 
            this.menuItemCompetition.Name = "menuItemCompetition";
            this.menuItemCompetition.Size = new System.Drawing.Size(91, 20);
            this.menuItemCompetition.Text = "Compétitions";
            // 
            // formMenu
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(673, 290);
            this.Controls.Add(this.menuGeneral);
            this.Name = "formMenu";
            this.Text = "Menu";
            this.menuGeneral.ResumeLayout(false);
            this.menuGeneral.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.MenuStrip menuGeneral;
        private System.Windows.Forms.ToolStripMenuItem menuItemQuitter;
        private System.Windows.Forms.ToolStripMenuItem menuItemClub;
        private System.Windows.Forms.ToolStripMenuItem menuItemAdherent;
        private System.Windows.Forms.ToolStripMenuItem menuItemMaitreDarme;
        private System.Windows.Forms.ToolStripMenuItem menuItemCompetition;
    }
}

