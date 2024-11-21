from flask import Flask, request, jsonify
import joblib
import numpy as np
import pandas as pd

# Configura o servidor Flask
app = Flask(__name__)

# Carrega o modelo previamente treinado
lda_model = joblib.load("./data/lda.pkl")

def normalizar(X):
   """
   Normaliza os atributos em X

   Esta função retorna uma versao normalizada de X onde o valor da
   média de cada atributo é igual a 0 e desvio padrao é igual a 1. Trata-se de
   um importante passo de pré-processamento quando trabalha-se com
   métodos de aprendizado de máquina.
   """

   m, n = X.shape # m = qtde de objetos e n = qtde de atributos por objeto

   # Incializa as variaves de saída
   X_norm = np.random.rand(m,n) # inicializa X_norm com valores aleatórios
   mu = 0 # inicializa a média
   sigma = 1 # inicializa o desvio padrão

   mu = np.mean(X, axis=0)
   sigma = np.std(X, axis=0, ddof=1)

   for i in range(m):
       X_norm[i,:] = (X[i,:]-mu) / sigma


   return X_norm, mu, sigma

# Define a rota para leitura do arquivo lda.pkl
@app.route('/api', methods=['POST'])
def read_lda():
    # Recebe os dados de entrada no formato JSON
    data = request.get_json()

    try:
        entrada = np.array([
            data['Age'],
            data['Gender'],
            data['Ethnicity'],
            data['EducationLevel'],
            data['BMI'],
            data['Smoking'],
            data['AlcoholConsumption'],
            data['PhysicalActivity'],
            data['DietQuality'],
            data['SleepQuality'],
            data['FamilyHistoryAlzheimers'],
            data['CardiovascularDisease'],
            data['Diabetes'],
            data['Depression'],
            data['HeadInjury'],
            data['Hypertension'],
            data['SystolicBP'],
            data['DiastolicBP'],
            data['CholesterolTotal'],
            data['CholesterolLDL'],
            data['CholesterolHDL'],
            data['CholesterolTriglycerides'],
            data['MMSE'],
            data['FunctionalAssessment'],
            data['MemoryComplaints'],
            data['BehavioralProblems'],
            data['ADL'],
            data['Confusion'],
            data['Disorientation'],
            data['PersonalityChanges'],
            data['DifficultyCompletingTasks'],
            data['Forgetfulness'],
            data['Diagnosis'],
        ]).reshape(1, -1)

         # Carrega o dataset sem normalização (apenas para pegar as colunas)
        file = './data/dataset_without_normalization.csv'
        df = pd.read_csv(f'./{file}', sep=',')
        
        df = pd.concat([df, pd.DataFrame(entrada, columns=df.columns)], ignore_index=True)

        # coloca os valores dos atributos na variável X
        X = df.iloc[:,0:-1].values

        # chama a função para normalizar X
        X_norm, mu, sigma = normalizar(X)

        df.iloc[:,0:-1] = X_norm

        df.replace(np.nan, 0, inplace=True)

        # Coleta a última linha do dataframe
        entrada_usuario_normalizada = df.iloc[-1].values
        entrada_usuario_normalizada = entrada_usuario_normalizada[:-1] # remove o último valor da lista
        
        previsao = lda_model.predict([entrada_usuario_normalizada])
       
        # Retorna as informações do modelo
        return jsonify({"previsao": int(previsao[0])})

    except Exception as e:
        return jsonify({"error": f"Erro ao ler o arquivo: {str(e)}"}), 500

# Inicia o servidor
if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000, debug=True)