/*
Lambda representation by example.
*/
workspace "Financial System" "Parser csv file and save on database." {

    model {
        person = person "Person" "Person who send a csv file."

        inventory = softwaresystem "Inventory System" "Inventory control using csv files." {
            db = container "Database" "Store data inventory from csv files." "Amazon Aurora" "db"
            storage = container "Storage" "Stores csv files that will be parsed." "Bucket S3" "storage"
            lambda = container "Lambda processor" "Read csv files, parser and save on database." "Python" "lambda"
        }

        person -> storage "Upload csv file in"
        storage -> lambda "Trigger"
        lambda -> db "Writes in"
    }

    views {

        container inventory "Containers" {
            include *
            autoLayout
        }
        styles {
            element "db" {
                shape Cylinder
            }
            element "storage" {
                shape Folder
            }
        }
        theme default
    }
}
