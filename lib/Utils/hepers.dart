enum PriceFilter {
  all,
  free,
  paid,
}

extension ParseEnumNameF on PriceFilter {
  String filterName() {
    return this.toString().split('.').last;
  }
}

enum EventSort {
  defaultSort,
  title,
  startDate,
  endDate,
}

extension ParseEnumNameE on EventSort {
  String filterName() {
    return this.toString().split('.').last;
  }
}