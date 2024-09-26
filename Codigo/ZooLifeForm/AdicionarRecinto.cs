﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace ZooLifeForm
{
    public partial class AdicionarRecinto : Form
    {
        private String selectedZoo;
        private String selectedEstado;
        private String selectedTipo;
        private Form previousForm;
        private SqlConnection cn;
        private SqlCommand cmd;
        private SqlDataReader reader;
        private string connectionString;

        public AdicionarRecinto(Form previousForm, string connectionString)
        {
            this.previousForm = previousForm;
            this.connectionString = connectionString;
            InitializeComponent();
            NovoRecinto_Load();
        }

        private void AdicionarRecinto_Closing(object sender, FormClosingEventArgs e)
        {
            this.previousForm.Show();
        }

        private bool verifySGBDConnection()
        {
            if (cn == null)
                cn = getSGBDConnection();

            if (cn.State != ConnectionState.Open)
                cn.Open();

            return cn.State == ConnectionState.Open;
        }

        private SqlConnection getSGBDConnection()
        {
            return new SqlConnection(connectionString);
        }

        private void PopulateZooComboBox()
        {
            if (!verifySGBDConnection())
            {
                MessageBox.Show("Failed to connect to database. Zoo names cannot be loaded.");
                return;
            }

            comboBox_jz.Items.Clear(); // Clear any existing items

            string query = "SELECT Nome FROM ZOO.JARDIM_ZOOLOGICO"; // Assuming a table named 'Zoos' with a column 'ZooName'
            cmd = new SqlCommand(query, cn);

            try
            {
                using (reader = cmd.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        string zooName = reader.GetString(0); // Assuming the first column (index 0) contains zoo names
                        comboBox_jz.Items.Add(zooName);
                    }
                }
            }
            catch (SqlException ex)
            {
                MessageBox.Show("Error retrieving zoo names: " + ex.Message);
            }
        }

        private void PopulateEstadoComboBox()
        {
            comboBox_estado.Items.Add("aberto");
            comboBox_estado.Items.Add("fechado");
        }

        private void PopulateTipoCombo()
        {
            comboBox_tipo.Items.Add("Recinto de Restauração");
            comboBox_tipo.Items.Add("Habitat");
            comboBox_tipo.Items.Add("Bilheteira");
            comboBox_tipo.Items.Add("Outro");
        }


        private void NovoRecinto_Load()
        {
            // Call the method to populate the zoo combo box
            PopulateZooComboBox();
            PopulateEstadoComboBox();
            PopulateTipoCombo();
        }

        private void ConfimarAdicionarRecinto()
        {
            if (InserirRecinto())
            {
                this.previousForm.Show();
                this.Close();

            }
        }

        private Boolean InserirRecinto()
        {
            string recinto_nome = textBox_nome.Text;
            string recinto_jz = this.selectedZoo;
            string recinto_estado = this.selectedEstado;
            string recinto_tipo = this.selectedTipo;
            string query;
            string table = "Recinto";
            bool isRestauracao = false;

            switch (recinto_tipo)
            {
                case "Recinto de Restauração":
                    isRestauracao = true;
                    table = "Restauracao";

                    break;

                case "Habitat":
                    table = "Habitat";
                    break;

                case "Bilheteira":
                    table = "Bilheteira";
                    break;

                case "Outro":
                    break;
            }
            query = "EXEC ZOO.sp_adicionar"+ table +" @nome_jz, @nome, @estado";

            if (isRestauracao)
            {
                query += ", @max_capacidade";
            }
            SqlCommand cmd = new SqlCommand(query, cn);
            cmd.Parameters.AddWithValue("@nome_jz", recinto_jz);
            cmd.Parameters.AddWithValue("@nome", recinto_nome);
            cmd.Parameters.AddWithValue("@estado", recinto_estado);

            if (isRestauracao )
            {
                string max_capacidade = textBox_max_capacidade.Text;
                cmd.Parameters.AddWithValue("@max_capacidade", max_capacidade);
            }

            try
            {
                cmd.ExecuteNonQuery();
                MessageBox.Show("Recinto inserido com sucesso!");
                return true;
            }
            catch (SqlException ex)
            {
                MessageBox.Show("Error inserting recinto: " + ex.Message);
                return false;
            }

        }

        private void button_adicionar_Click(object sender, EventArgs e)
        {
            if (validateForm())
            {
                ConfimarAdicionarRecinto();
            }
            else
            {
                MessageBox.Show("Erro. Insira os dados corretamente no formulário.");
            }
        }

        private bool validateForm()
        {
            Boolean nomeValido = textBox_nome.Text.Length > 0;
            Boolean jzValido = comboBox_jz.SelectedItem != null;
            Boolean estadoValido = comboBox_estado.SelectedItem != null;
            Boolean tipoValido = comboBox_tipo.SelectedItem != null;
            Boolean max_capacidadeValido = true;

            if (comboBox_tipo.SelectedItem.ToString() == "Recinto de Restauração")
            {
                max_capacidadeValido = textBox_max_capacidade.Text.Length > 0;
            }

            return (nomeValido &&  jzValido && estadoValido && tipoValido && max_capacidadeValido);
        }

        private void comboBox_jz_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.selectedZoo = comboBox_jz.SelectedItem.ToString();
        }

        private void comboBox_estado_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.selectedEstado = comboBox_estado.SelectedItem.ToString();
        }

        private void comboBox_tipo_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.selectedTipo = comboBox_tipo.SelectedItem.ToString();

            if (this.selectedTipo == "Recinto de Restauração")
            {
                label_max_capacidade.Visible = true;
                textBox_max_capacidade.Visible = true;
            }
            else
            {
                label_max_capacidade.Visible = false;
                textBox_max_capacidade.Visible = false;
            }
        }

        private void button_cancelar_Click(object sender, EventArgs e)
        {
            this.previousForm.Show();
            this.Close();
        }

        private void AdicionarRecinto_Load(object sender, EventArgs e)
        {

        }
    }
}
