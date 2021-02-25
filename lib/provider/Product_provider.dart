import 'package:flutter/cupertino.dart';
import 'package:islamwattan/model/posts.dart';
import 'package:islamwattan/service/api.dart';

class SortBy {
  String value;
  String text;
  String sortOrder;

  SortBy(this.value, this.text, this.sortOrder);
}

enum LoadMoreStatus { INITAL, LOADING, STABLE }

class ProductProvider with ChangeNotifier {
  List<posts> _postsList;
  SortBy _sortBy;

  int pageSize = 3;

  List<posts> get allProducts => _postsList;

  double get totalRecords => _postsList.length.toDouble();

  LoadMoreStatus _loadMoreStatus = LoadMoreStatus.STABLE;

  getLoadMoreStatus() => _loadMoreStatus;

  ProductProvider() {
    resetStreams();
    _sortBy = SortBy("modified", "Latest", "desc");
  }

  void resetStreams() {
    _postsList = List<posts>();
  }
  setLoadingState(LoadMoreStatus loadMoreStatus) {
    _loadMoreStatus = loadMoreStatus;
    notifyListeners();
  }

  setSortOrder(SortBy sortBy) {
    _sortBy = sortBy;
    notifyListeners();
  }

  fetchProducts(
      pageNumber, {
        String strSearch,
        int categoryId,
        String sortBy,
        String sortOrder = "desc",
      }) async {
    List<posts> itemModel = await getposts(

        strSearch: strSearch,
        pageNumber: pageNumber,
        pageSize: this.pageSize,
        categoryId: categoryId,
        sortBy: this._sortBy.value,
        sortOrder: this._sortBy.sortOrder);
    if (itemModel.length > 0) {
      _postsList.addAll(itemModel);
    }
    setLoadingState(LoadMoreStatus.STABLE);
    notifyListeners();
  }
}