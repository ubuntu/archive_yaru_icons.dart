import 'package:animated_vector/animated_vector.dart';
import 'package:animated_vector_annotations/animated_vector_annotations.dart';
import 'package:flutter/widgets.dart';

part 'yaru_animated_icons.g.dart';

// ignore_for_file: constant_identifier_names
abstract final class YaruAnimatedIcons {
  @ShapeshifterAsset('assets/shapeshifter/compass.shapeshifter')
  static const AnimatedVectorData compass = _$compass;

  @ShapeshifterAsset('assets/shapeshifter/compass_filled.shapeshifter')
  static const AnimatedVectorData compass_filled = _$compass_filled;

  @ShapeshifterAsset('assets/shapeshifter/heart.shapeshifter')
  static const AnimatedVectorData heart = _$heart;

  @ShapeshifterAsset('assets/shapeshifter/heart_filled.shapeshifter')
  static const AnimatedVectorData heart_filled = _$heart_filled;

  @ShapeshifterAsset('assets/shapeshifter/no_network.shapeshifter')
  static const AnimatedVectorData no_network = _$no_network;

  @ShapeshifterAsset('assets/shapeshifter/ok.shapeshifter')
  static const AnimatedVectorData ok = _$ok;

  @ShapeshifterAsset('assets/shapeshifter/ok_filled.shapeshifter')
  static const AnimatedVectorData ok_filled = _$ok_filled;

  @ShapeshifterAsset('assets/shapeshifter/star.shapeshifter')
  static const AnimatedVectorData star = _$star;

  @ShapeshifterAsset('assets/shapeshifter/star_filled.shapeshifter')
  static const AnimatedVectorData star_filled = _$star_filled;

  @ShapeshifterAsset('assets/shapeshifter/star_half_filled.shapeshifter')
  static const AnimatedVectorData star_half_filled = _$star_half_filled;

  @ShapeshifterAsset('assets/shapeshifter/thumb_up.shapeshifter')
  static const AnimatedVectorData thumb_up = _$thumb_up;

  @ShapeshifterAsset('assets/shapeshifter/thumb_up_filled.shapeshifter')
  static const AnimatedVectorData thumb_up_filled = _$thumb_up_filled;

  static const all = {
    'compass': compass,
    'compass_filled': compass_filled,
    'heart': heart,
    'heart_filled': heart_filled,
    'no_network': no_network,
    'ok': ok,
    'ok_filled': ok_filled,
    'star': star,
    'star_filled': star_filled,
    'star_half_filled': star_half_filled,
    'thumb_up': thumb_up,
    'thumb_up_filled': thumb_up_filled,
  };
}
