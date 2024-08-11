from socket import *

# Replace 'servername' with the actual hostname or IP address of the server.
serverName = 'actual_server_name_or_ip'
serverPort = 12000
clientSocket = socket(AF_INET, SOCK_STREAM)
clientSocket.connect((serverName, serverPort))
sentence = input('Input lowercase sentence:')  # Use input() in Python 3
clientSocket.send(sentence.encode())  # Use encode() to convert the string to bytes
modifiedSentence = clientSocket.recv(1024)
print('From Server:', modifiedSentence.decode())  # Use decode() to convert bytes to a string
clientSocket.close()

