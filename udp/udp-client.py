from socket import *

serverName = 'hostname'  # Replace 'hostname' with the actual server's hostname or IP address
serverPort = 12000
clientSocket = socket(AF_INET, SOCK_DGRAM)

# Use input() to get user input in Python 3
message = input('Input lowercase sentence:')

# Use sendto() with bytes to send the message
clientSocket.sendto(message.encode(), (serverName, serverPort))

# Receive the response and print it
modifiedMessage, serverAddress = clientSocket.recvfrom(2048)
print(modifiedMessage.decode())  # Decode bytes to string for printing

clientSocket.close()
