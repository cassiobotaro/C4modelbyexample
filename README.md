# 🗃️ C4 Model by example

## Table of Content

| Description |File | Image |
|:---| :---: | :---: |
| Omit the intermediary, and instead use notation to signify that the interaction between service A and B happens via an intermediary. | [omit.dsl](omit.dsl)  | [omit.png](omit.png)|
| Publish-Subscriber using topic and explicit intermediary. | [pubsub.dsl](pubsub.dsl) | [pubsub,png](pubsub.png) |

## How to run

You can copy and paste file content into [structurizr website](https://structurizr.com/dsl) or run locally using docker through the command `docker run --rm -it -p 8080:8080 -v "$PWD/<filename>":/usr/local/structurizr/workspace.dsl structurizr/lite`.

You should replace `filename` with the corresponding filename.

For this task, I write the function below:

```sh
# structurizr
function structurizr() {
    readonly file=${1:?"The file must be specified."}
    docker run --rm -it \
        -p 8080:8080 \
        -v "$PWD/$file":/usr/local/structurizr/workspace.dsl \
            structurizr/lite
}
```

Call function through the command `structurizr <filename.dsl>`.

E.g. `structurizr show.dsl`
