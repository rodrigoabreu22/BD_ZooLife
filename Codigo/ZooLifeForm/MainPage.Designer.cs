﻿namespace ZooLifeForm
{
    partial class MainPage
    {
        /// <summary>
        /// Variável de designer necessária.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Limpar os recursos que estão sendo usados.
        /// </summary>
        /// <param name="disposing">true se for necessário descartar os recursos gerenciados; caso contrário, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Código gerado pelo Windows Form Designer

        /// <summary>
        /// Método necessário para suporte ao Designer - não modifique 
        /// o conteúdo deste método com o editor de código.
        /// </summary>
        private void InitializeComponent()
        {
            this.menuStrip1 = new System.Windows.Forms.MenuStrip();
            this.escolherZooToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.opção1ToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.opção2ToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.opção3ToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.button1 = new System.Windows.Forms.Button();
            this.button2 = new System.Windows.Forms.Button();
            this.button3 = new System.Windows.Forms.Button();
            this.button_ver_bilhetes = new System.Windows.Forms.Button();
            this.menuStrip1.SuspendLayout();
            this.SuspendLayout();
            // 
            // menuStrip1
            // 
            this.menuStrip1.ImageScalingSize = new System.Drawing.Size(20, 20);
            this.menuStrip1.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.escolherZooToolStripMenuItem});
            this.menuStrip1.Location = new System.Drawing.Point(0, 0);
            this.menuStrip1.Name = "menuStrip1";
            this.menuStrip1.Size = new System.Drawing.Size(800, 28);
            this.menuStrip1.TabIndex = 1;
            this.menuStrip1.Text = "menuStrip1";
            // 
            // escolherZooToolStripMenuItem
            // 
            this.escolherZooToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.opção1ToolStripMenuItem,
            this.opção2ToolStripMenuItem,
            this.opção3ToolStripMenuItem});
            this.escolherZooToolStripMenuItem.Name = "escolherZooToolStripMenuItem";
            this.escolherZooToolStripMenuItem.Size = new System.Drawing.Size(109, 24);
            this.escolherZooToolStripMenuItem.Text = "Escolher Zoo";
            this.escolherZooToolStripMenuItem.Click += new System.EventHandler(this.escolherZooToolStripMenuItem_Click);
            // 
            // opção1ToolStripMenuItem
            // 
            this.opção1ToolStripMenuItem.Name = "opção1ToolStripMenuItem";
            this.opção1ToolStripMenuItem.Size = new System.Drawing.Size(148, 26);
            this.opção1ToolStripMenuItem.Text = "Opção 1";
            // 
            // opção2ToolStripMenuItem
            // 
            this.opção2ToolStripMenuItem.Name = "opção2ToolStripMenuItem";
            this.opção2ToolStripMenuItem.Size = new System.Drawing.Size(148, 26);
            this.opção2ToolStripMenuItem.Text = "Opção 2";
            // 
            // opção3ToolStripMenuItem
            // 
            this.opção3ToolStripMenuItem.Name = "opção3ToolStripMenuItem";
            this.opção3ToolStripMenuItem.Size = new System.Drawing.Size(148, 26);
            this.opção3ToolStripMenuItem.Text = "Opção 3";
            // 
            // button1
            // 
            this.button1.Location = new System.Drawing.Point(52, 79);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(329, 136);
            this.button1.TabIndex = 2;
            this.button1.Text = "Ver Animais";
            this.button1.UseVisualStyleBackColor = true;
            this.button1.Click += new System.EventHandler(this.button1_Click);
            // 
            // button2
            // 
            this.button2.Location = new System.Drawing.Point(405, 79);
            this.button2.Name = "button2";
            this.button2.Size = new System.Drawing.Size(329, 136);
            this.button2.TabIndex = 3;
            this.button2.Text = "Ver Funcionários";
            this.button2.UseVisualStyleBackColor = true;
            this.button2.Click += new System.EventHandler(this.button2_Click);
            // 
            // button3
            // 
            this.button3.Location = new System.Drawing.Point(52, 244);
            this.button3.Name = "button3";
            this.button3.Size = new System.Drawing.Size(329, 136);
            this.button3.TabIndex = 4;
            this.button3.Text = "Ver Recintos";
            this.button3.UseVisualStyleBackColor = true;
            this.button3.Click += new System.EventHandler(this.button3_Click);
            // 
            // button_ver_bilhetes
            // 
            this.button_ver_bilhetes.Location = new System.Drawing.Point(405, 244);
            this.button_ver_bilhetes.Name = "button_ver_bilhetes";
            this.button_ver_bilhetes.Size = new System.Drawing.Size(329, 136);
            this.button_ver_bilhetes.TabIndex = 5;
            this.button_ver_bilhetes.Text = "Ver Bilhetes";
            this.button_ver_bilhetes.UseVisualStyleBackColor = true;
            this.button_ver_bilhetes.Click += new System.EventHandler(this.button_ver_bilhetes_Click);
            // 
            // MainPage
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(800, 450);
            this.Controls.Add(this.button_ver_bilhetes);
            this.Controls.Add(this.button3);
            this.Controls.Add(this.button2);
            this.Controls.Add(this.button1);
            this.Controls.Add(this.menuStrip1);
            this.MainMenuStrip = this.menuStrip1;
            this.Name = "MainPage";
            this.Text = "ZooLife - Página Inicial";
            this.Load += new System.EventHandler(this.Form1_Load);
            this.menuStrip1.ResumeLayout(false);
            this.menuStrip1.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.MenuStrip menuStrip1;
        private System.Windows.Forms.ToolStripMenuItem escolherZooToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem opção1ToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem opção2ToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem opção3ToolStripMenuItem;
        private System.Windows.Forms.Button button1;
        private System.Windows.Forms.Button button2;
        private System.Windows.Forms.Button button3;
        private System.Windows.Forms.Button button_ver_bilhetes;
    }
}

