import Html exposing (Html, button, Attribute, div, input, text, ul, li)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput, onClick)
import String


main =
    Html.beginnerProgram { model = model
    , view = view
    , update = update
    }


type alias Model =
    { content : List String
    , current : String
    }


model : Model
model =
    { content = []
    , current = ""
    }


type Msg =
    ChangeText String
    | AddNote


update : Msg -> Model -> Model
update msg model =
    case msg of
        ChangeText note ->
            let
                newModel =
                    { current = note
                    , content = model.content
                    }
            in
                newModel
        AddNote ->
            let
                newList = model.current :: model.content
                newModel =
                    { content = newList
                    , current = model.current
                    }
            in
                newModel

drawItem : String -> Html Msg
drawItem item =
    li []
        [ text item ]


itemsList : Model -> Html Msg
itemsList model =
    let
        items =
            List.map drawItem model.content
    in
        ul []
            items


view : Model -> Html Msg
view model =
    div []
        [ input [placeholder "notes", onInput ChangeText ] []
        , button [ onClick AddNote ] [text "Add"]
        , itemsList model
        ]
