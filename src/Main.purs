module Main where

import Prelude

import Audio.WebAudio.AudioContext (createMediaElementSource)
import Audio.WebAudio.AudioParam (getValue, setValue, setValueAtTime)
import Audio.WebAudio.BaseAudioContext (createGain, currentTime, destination, newAudioContext, resume, state, suspend)
import Audio.WebAudio.GainNode (gain)
import Audio.WebAudio.Types (AudioContext, GainNode, OscillatorNode, AudioContextState(..), connect)
import Data.Maybe (Maybe(..))
import Data.Number (fromString)
import Effect (Effect)
import Effect.Aff.Class (class MonadAff)
import Effect.Class (class MonadEffect)
import Effect.Console (logShow)
import Halogen as H
import Halogen.Aff (awaitBody, runHalogenAff)
import Halogen.HTML as HH
import Halogen.HTML.Events as HE
import Halogen.HTML.Properties as HP
import Halogen.VDom.Driver (runUI)
import Icons as Icons
import Utils (css, className, switchElem)

-- import Web.Event.Event (Event)
-- import Web.Event.Event as Event

main :: Effect Unit
main = runHalogenAff do
  body <- awaitBody
  runUI component unit body

type State =
  { volume :: Number
  , panner :: Number
  , power :: Boolean
  , playing :: Boolean
  }

data Action
  =
  -- Initialize
  SetVolume String
  | SetPanner String
  | SetPower
  | SetPlaying

component :: forall q i o m. MonadAff m => H.Component HH.HTML q i o m
component =
  H.mkComponent
    { initialState
    , render
    , eval: H.mkEval $ H.defaultEval { handleAction = handleAction }
    }

initialState :: forall i. i -> State
initialState _ = { volume: 1.0, panner: 0.0, power: true, playing: false }

render :: forall m. State -> H.ComponentHTML Action () m
render st =
  HH.div [ css "w-2/3 h-64 border-black border-4 mx-auto flex flex-col"] [
    HH.div [ css "w-full h-24 bg-blue-400 flex justify-between items-center px-8"] [
      HH.div [ css "flex flex-col items-center"] [
        HH.input
          [ HP.type_ HP.InputRange
          , HP.min 0.0, HP.max 2.0
          , HP.value "1.0"
          , HE.onValueChange $ Just <<< SetVolume
          ],
        HH.label [] [ HH.text "Vol"]
      ],
      HH.div [ css "flex flex-col items-center"] [
        HH.input
          [ HP.type_ HP.InputRange
          , HP.min (-1.0)
          , HP.max 1.0
          , HP.value "0.0"
          , HE.onValueChange $ Just <<< SetPanner ],
        HH.label [] [ HH.text "Pan"]
      ],
      HH.button [ HE.onClick \_ -> Just SetPower] [
        Icons.iconTurnOff [ className "h-8 w-8"]
      ]
    ]
    , HH.div [ css "w-full h-full bg-blue-600 flex"]
      [ HH.div [ css "w-1/3 h-full border-black border-4"] []
      , HH.div [
        css "w-1/3 h-full border-black border-4 flex flex-col items-center justify-center"] [
          HH.audio [ HP.src "outfoxing.4a5866aa.mp3", HP.ref (H.RefLabel "audio") ] [],
          HH.button [ HE.onClick \_ -> Just SetPlaying] [
            switchElem
              st.playing
              (\_ -> Icons.iconPlay [ className "h-8 w-8"])
              (\_ -> Icons.iconPauseButton [ className "h-8 w-8"])
          ]
      ]
      , HH.div [ css "w-1/3 h-full border-black border-4"] []
    ]
    , HH.div [ css "flex justify-between mx-4" ] [
        HH.span_ [HH.text $ "Volume " <> show st.volume],
        HH.span_ [HH.text $ "Panner " <> show st.panner],
        HH.span_ [HH.text $ "Playing " <> show st.playing],
        HH.span_ [HH.text $ "Power " <> show st.power]
    ]
  ]

handleAction :: forall o m. MonadAff m => Action -> H.HalogenM State Action () o m Unit
handleAction = case _ of
  -- Initialize -> do
  --   ctx <- newAudioContext
  --   element <- H.getHTMLElementRef (H.RefLabel "audio")
  --   case element of
  --     Nothing ->
  --       pure unit
  --     Just el -> do
  --       track <- createMediaElementSource ctx element
  --       g <- createGain ctx
  --       setValue 0.0 =<< gain g
  --       connect track g
  --       connect g =<< destination ctx
  --       suspend ctx

  SetVolume volume -> do
    case fromString volume of
      Nothing -> do
        pure unit
      Just vol -> do
        H.modify_ _ { volume = vol }

  SetPanner panner -> do
    case fromString panner of
      Nothing -> do
        pure unit
      Just pan -> do
        H.modify_ _ { panner = pan }

  SetPower -> do
    H.modify_ \st -> st { power = not st.power }

  SetPlaying -> do
    H.modify_ \st -> st { playing = not st.playing }
  -- MakeRequest event -> do
  --   H.liftEffect $ Event.preventDefault event
  --   username <- H.gets _.username
  --   H.modify_ _ { loading = true }
  --   response <- H.liftAff $ AX.get AXRF.string ("https://api.github.com/users/" <> username)
  --   H.modify_ _ { loading = false, result = map _.body (hush response) }
