/*
Container diagram of CMS
*/
workspace "Content Management System" "CMS was developed to be used as an example of a talk." {

    model {
        reader = person "Reader" "Person who consumes news from the website."
        writer = person "Writer" "Person who writes news from the website."

        cms = softwaresystem "CMS" "Content Management System."{
            portal = container "News Portal" "Site that provides news and content. It has an area accessible only to editors." "Python and Django" "web"
            db = container "Database" "Store news and information about users." "Postgresql" "db"
            storage = container "Storage" "Stores images that will be used in news and portal content." "Bucket S3" "storage"
            mobile = container "Mobile Application" "Application that allows access to content and news from the portal." "Android/iOS" "mobile"
            queue = container "Background processing queue" "Receives imaging events to be consumed by the processor." "RabbitMQ" "queue"
            worker = container "Image processor" "Process images by optimizing them and generating thumbnails." "Python" "worker"
        }

        reader -> portal "Consume news and content in"
        reader -> mobile "Consume news and content in"
        writer -> portal "Write content in"
        mobile -> portal "Consume news and content in" "HTTPS/JSON"
        portal -> db "Reads from and Writes to" "Postgresql Protocol"
        portal -> storage "Reads from and Writes to" "HTTPS/JSON"
        portal -> queue "Send event for new image editing to" "AMQP"
        worker -> queue "Consume events from" "AMQP"
        worker -> storage "Write images in" "HTTPS/JSON"
        portal -> storage "Consume static content from" "HTTPS/JSON"
    }

    views {

        systemcontext cms "SystemContext" {
            include *
            autoLayout
        }

        container cms "Containers" {
            include *
            autoLayout
        }
        styles {
            element "db" {
                shape Cylinder
            }
            element "web" {
                shape WebBrowser
            }
            element "storage" {
                shape Folder
            }
            element "mobile" {
                shape MobileDevicePortrait
            }
            element "queue" {
                shape Pipe
            }
        }
        theme default
    }
}
