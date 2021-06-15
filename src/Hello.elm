module Hello exposing (main)

import Browser
import Dict exposing (Dict)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick, onInput)


main : Program () Model Msg
main =
    Browser.sandbox
        { init = init
        , view = view
        , update = update
        }


type alias Todo =
    { thing : String
    , done : Bool
    }


type alias Model =
    { newTodo : String
    , todos : Dict Int Todo
    }


init : Model
init =
    Model "" <| Dict.fromList []


type Msg
    = AddTodo
    | CheckTodo Int
    | NewText String


update : Msg -> Model -> Model
update msg model =
    case msg of
        AddTodo ->
            { model
                | todos =
                    Dict.insert
                        (Dict.size model.todos)
                        { thing = model.newTodo, done = False }
                        model.todos
                , newTodo = ""
            }

        CheckTodo todoId ->
            case Dict.get todoId model.todos of
                Just todo ->
                    let
                        updated =
                            { todo
                                | done = not todo.done
                            }
                    in
                    { model
                        | todos =
                            Dict.update
                                todoId
                                (always <| Just updated)
                                model.todos
                    }

                Nothing ->
                    model

        NewText val ->
            { model
                | newTodo = val
            }


view : Model -> Html Msg
view model =
    let
        ordered =
            List.range 0 (Dict.size model.todos)
                |> List.filterMap
                    (\todoId ->
                        Dict.get todoId model.todos
                            |> Maybe.map (Tuple.pair todoId)
                    )
    in
    div []
        [ h1 [] [ text "Todo List!" ]
        , section []
            [ input
                [ type_ "text"
                , placeholder "What are you going to do?"
                , value model.newTodo
                , onInput NewText
                ]
                []
            , input
                [ type_ "button"
                , value "Add"
                , onClick AddTodo
                ]
                []
            ]
        , section []
            [ viewTodoList ordered ]
        ]


viewTodoList : List ( Int, Todo ) -> Html Msg
viewTodoList todos =
    ul
        []
        ( List.map
            (\(i, todo) -> viewTodoItem i todo
            )
            todos
        )


viewTodoItem : Int -> Todo -> Html Msg
viewTodoItem todoId todo =
    li []
        [ p []
            [ input
                [ readonly True
                , value todo.thing
                , type_ "text"
                ]
                []
            , input
                [ type_ "checkbox"
                , checked todo.done
                , onClick (CheckTodo todoId)
                ]
                []
            ]
        ]