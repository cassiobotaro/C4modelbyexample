/*
Service A sending a message to the intermediary, and the intermediary subsequently forwarding that message to service B.
While accurate, the "hub and spoke" nature of the diagram tends to obscure the notion that there's coupling between the message producer and consumer.
source: https://c4model.com/
*/
workspace "Intermediary Communication" "Service A sending a message to the intermediary, and the intermediary subsequently forwarding that message to service B." {

    model {
        userManagementSystem = softwaresystem "User Management System" "Provides functionality to create users and update profile info."{
            a = container "Container A" "Provides functionality to create users." "Python"
            inter = container "Create User Topic" "Streams user creation events." "Kafka" "topic"
            b = container "Container B" "Provides functionality to bind users in permission groups." "Java"
            c = container "Container C" "Provides functionality to validate and activate user account." "Go"
        }
        
        a -> inter "Sends user creation events to"
        inter -> b "Forwards events to"
        inter -> c "Forwards events to"
    }

    views {
        
        container userManagementSystem "Containers" {
            include *
            autoLayout
        }
        styles {
            element topic {
                shape Pipe
            }
        }
        theme default
    }
}
