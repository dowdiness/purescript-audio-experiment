module Icons where

import Prelude ((<>))
import Halogen.HTML

ns :: Namespace
ns = Namespace "http://www.w3.org/2000/svg"


iconPauseButton :: forall p r i. Array (IProp r i) -> HTML p i
iconPauseButton attrs =
  elementNS ns (ElemName "svg")
  ( attrs <> [ attr (AttrName "id") "Capa_1"
  , attr (AttrName "enable-background") "new 0 0 424.236 424.236"
  , attr (AttrName "height") "512"
  , attr (AttrName "viewBox") "0 0 424.236 424.236"
  , attr (AttrName "width") "512"
  ])
  [ elementNS ns (ElemName "path")
    [ attr (AttrName "id") "path-1_5_"
    , attr (AttrName "d") "m247.471 0h176.765v424.236h-176.765z"
    , attr (AttrName "transform") "translate(9 2)"
    ]
    [
    ], elementNS ns (ElemName "path")
    [ attr (AttrName "id") "path-1_4_"
    , attr (AttrName "d") "m0 0h176.765v424.236h-176.765z"
    , attr (AttrName "transform") "translate(2 2)"
    ]
    [
    ]
  ]

iconPlay :: forall p r i. Array (IProp r i) -> HTML p i
iconPlay attrs =
  elementNS ns (ElemName "svg")
  ( attrs <> [ attr (AttrName "version") "1.1"
  , attr (AttrName "id") "Capa_1"
  , attr (AttrName "xmlns:xlink") "http://www.w3.org/1999/xlink"
  , attr (AttrName "x") "0px"
  , attr (AttrName "y") "0px"
  , attr (AttrName "viewBox") "0 0 320.001 320.001"
  , attr (AttrName "style") "enable-background:new 0 0 320.001 320.001;"
  , attr (AttrName "xml:space") "preserve"
  ])
  [ elementNS ns (ElemName "path")
    [ attr (AttrName "d") "M295.84,146.049l-256-144c-4.96-2.784-11.008-2.72-15.904,0.128C19.008,5.057,16,10.305,16,16.001v288 c0,5.696,3.008,10.944,7.936,13.824c2.496,1.44,5.28,2.176,8.064,2.176c2.688,0,5.408-0.672,7.84-2.048l256-144 c5.024-2.848,8.16-8.16,8.16-13.952S300.864,148.897,295.84,146.049z"
    ]
    [
    ], elementNS ns (ElemName "g")
    [ ]
    [
    ], elementNS ns (ElemName "g")
    [ ]
    [
    ], elementNS ns (ElemName "g")
    [ ]
    [
    ], elementNS ns (ElemName "g")
    [ ]
    [
    ], elementNS ns (ElemName "g")
    [ ]
    [
    ], elementNS ns (ElemName "g")
    [ ]
    [
    ], elementNS ns (ElemName "g")
    [ ]
    [
    ], elementNS ns (ElemName "g")
    [ ]
    [
    ], elementNS ns (ElemName "g")
    [ ]
    [
    ], elementNS ns (ElemName "g")
    [ ]
    [
    ], elementNS ns (ElemName "g")
    [ ]
    [
    ], elementNS ns (ElemName "g")
    [ ]
    [
    ], elementNS ns (ElemName "g")
    [ ]
    [
    ], elementNS ns (ElemName "g")
    [ ]
    [
    ], elementNS ns (ElemName "g")
    [ ]
    [
    ]
  ]

iconTurnOff :: forall p r i. Array (IProp r i) -> HTML p i
iconTurnOff attrs =
  elementNS ns (ElemName "svg")
  ( attrs <> [ attr (AttrName "id") "Capa_1"
  , attr (AttrName "enable-background") "new 0 0 512 512"
  , attr (AttrName "height") "512"
  , attr (AttrName "viewBox") "0 0 512 512"
  , attr (AttrName "width") "512"
  ])
  [ elementNS ns (ElemName "g")
    [ ]
    [ elementNS ns (ElemName "path")
      [ attr (AttrName "d") "m437.02 74.98c-48.353-48.351-112.64-74.98-181.02-74.98s-132.667 26.629-181.02 74.98c-48.351 48.353-74.98 112.64-74.98 181.02s26.629 132.667 74.98 181.02c48.353 48.351 112.64 74.98 181.02 74.98s132.667-26.629 181.02-74.98c48.351-48.353 74.98-112.64 74.98-181.02s-26.629-132.667-74.98-181.02zm-181.02 407.02c-124.617 0-226-101.383-226-226s101.383-226 226-226 226 101.383 226 226-101.383 226-226 226z"
      ]
      [
      ], elementNS ns (ElemName "path")
      [ attr (AttrName "d") "m322.009 104.821c-7.591-3.321-16.435.144-19.753 7.734-3.319 7.59.144 16.434 7.734 19.753 49.212 21.518 81.01 70.069 81.01 123.692 0 74.439-60.561 135-135 135s-135-60.561-135-135c0-53.623 31.798-102.174 81.009-123.691 7.59-3.319 11.053-12.163 7.734-19.753-3.319-7.591-12.163-11.055-19.753-7.734-60.134 26.292-98.99 85.634-98.99 151.178 0 90.981 74.019 165 165 165s165-74.019 165-165c0-65.544-38.856-124.886-98.991-151.179z"
      ]
      [
      ], elementNS ns (ElemName "path")
      [ attr (AttrName "d") "m256 221c8.284 0 15-6.716 15-15v-120c0-8.284-6.716-15-15-15s-15 6.716-15 15v120c0 8.284 6.716 15 15 15z"
      ]
      [
      ]
    ]
  ]
