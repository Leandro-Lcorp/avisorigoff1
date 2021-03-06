#!/bin/bash
# 1º Bibliotecas utilizadas
import requests
import time
# 2º Inportar a API da Flexpool, miner/stats
while True:
    apileo = requests.get('https://api.flexpool.io/v2/miner/stats?coin=eth&address=0xd2dcC2Ffc1C517da18B3349705d7427cF9e2792c')
    api = apileo.json()
    # print(api) # Nessa linha, lista os dados da variável api
# 3º Tratar os dados da API
    hashrateleo = api['result']['reportedHashrate']
    print('Rashrate da RIG Leo:', hashrateleo) # print original
    #time.sleep(10) # Nessa linha, espera 10 segundos para enviar a mensagem
# 4º Se Hashrate Reportado menor que 1, enviar mensagem para o Telegram utilizando o bot para um grupo específico
    if hashrateleo > 1:
        def send_message(token, chat_id, msg):
            try:
                data = {"chat_id": chat_id, "text": msg}
                url = "https://api.telegram.org/bot{}/sendMessage".format(token)
                requests.post(url, data)
            except Exception as e:
                print("Erro no sendMessage:", e)
        # Token único utilizado para manipular o bot
        # Exemplo: '1413778757:AAFxmr611LssAHbZn1uqV_NKFsbwK3TT-wc'
        token = '5189715859:AAExD4_fei_n-AU0dWp3_7pGqnfPJMYz9t8'
        # Id do chat que será enviado as mensagens
        chat_id = -747623956
        # print("Id do chat:", chat_id) # print original
        print("Olá, sou o Bot de mensagens da sua RIG")
        print('Rashrate da RIG:', hashrateleo)
        # Exemplo de mensagem
        msg = "."
        print("Aviso:", msg) # print original
        # Enviar a mensagem
        send_message(token, chat_id, msg)
        time.sleep(10)