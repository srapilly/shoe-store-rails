# Setup


```
bundle install
rails server
```
Go to http://localhost:3000 


To listen to WebSocket events 
```
rake websocket:read_events
```
The host can be changed in [websocket.yml](config/websocket.yml)


## Thoughts

### Websocket 

Websocket usage does not seems ideal for this use case from server to server
- It's only one-way communication. Another possibility would be to use [Server Sent Events](https://developer.mozilla.org/en-US/docs/Web/API/Server-sent_events)
- If we are not connected to the WS, we can lose events. This can happen in case of restart, upgrade, or just an exception in the code
- A partial solution to this problem would be to have multiple processes, but it means that we will need to load balance the WebSocket connection to avoid duplicate events

Using a pub/sub mechanism to deliver events could be a good solution, such as AWS SQS, Kafka, Apache Pulsar, ...

### Improvements to the app

Some ideas:
- End to end testing with a browser, it's a good way to also add visual and accessibility testing.
- Pre commit hook for RuboCop / formatter
- Update the data in realtime in the frontend 
- Static code analysis tools such as Brakeman to find security issues
