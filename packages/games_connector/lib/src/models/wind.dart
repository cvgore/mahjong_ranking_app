enum Wind { east, south, west, north }

extension WindText on Wind {
  String toSymbol() {
    switch (this) {
      case Wind.east:
        return "東";
      case Wind.south:
        return "南";
      case Wind.west:
        return "西";
      case Wind.north:
        return "北";
    }
  }
}
