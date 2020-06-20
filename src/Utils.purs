module Utils where

import Prelude

import Control.Monad.Except (runExcept)
import Data.Either (either)
import Data.Maybe (Maybe(..))
import Halogen.HTML as HH
import Halogen.HTML.Properties as HP
import Halogen.HTML.Properties (IProp)
import Halogen.HTML.Events as HE
import Web.Event.Event (Event, EventType(..))
import Web.Event.Event as EE
import Web.HTML.Event.EventTypes as ET
import Foreign (F, Foreign, readNumber, unsafeToForeign)
import Foreign.Index (readProp)

-- | I get annoyed writing `class_ $ ClassName "..."` over and over again. This small utility saves
-- | a few characters all over our HTML.
css :: forall r i. String -> HH.IProp ( class :: String | r ) i
css = HP.class_ <<< HH.ClassName

className :: forall r i. String -> IProp i r
className = HH.attr (HH.AttrName "class")

-- | We must provide a `String` to the "href" attribute, but we represent routes with the much
-- | better `Route` type. This utility is a drop-in replacement for `href` that uses `Route`.
-- safeHref :: forall r i. Route -> HH.IProp ( href :: String | r) i
-- safeHref = HP.href <<< append "#" <<< print routeCodec

-- | Sometimes we need to deal with elements which may or may not exist. This function lets us
-- | provide rendering for the element if it exists, and renders an empty node otherwise.
maybeElem :: forall p i a. Maybe a -> (a -> HH.HTML p i) -> HH.HTML p i
maybeElem (Just x) f = f x
maybeElem _ _ = HH.text ""

-- | Sometimes we need to deal with elements which may or may not exist. This function lets us
-- | provide rendering for the element if it exists, and renders an empty node otherwise.
switchElem :: forall p i. Boolean -> (Unit -> HH.HTML p i) -> (Unit -> HH.HTML p i) -> HH.HTML p i
switchElem cond f f2 = if cond then f unit else f2 unit

-- | PureScript is a strict language. If we want to conditionally display an element, then we
-- | should hide the evaluation behind a function, which won't be evaluated right away, in order
-- | to minimize the work performed each render.
whenElem :: forall p i. Boolean -> (Unit -> HH.HTML p i) -> HH.HTML p i
whenElem cond f = if cond then f unit else HH.text ""

-- | Attaches an event handler which will produce an input when the value of an
-- | input field changes.
onNumberChange :: forall r i. (Number -> Maybe i) -> IProp (value :: Number, onChange :: Event | r) i
onNumberChange = addForeignPropHandler ET.change "value" readNumber

-- | Attaches event handler to event `key` with getting `prop` field as an
-- | argument of `handler`.
addForeignPropHandler :: forall r i value. EventType -> String -> (Foreign -> F value) -> (value -> Maybe i) -> IProp r i
addForeignPropHandler key prop reader f =
  HE.handler key $ EE.currentTarget >=> \e -> either (const Nothing) f $ runExcept $ go e
  where
  go a = reader <=< readProp prop $ unsafeToForeign a
