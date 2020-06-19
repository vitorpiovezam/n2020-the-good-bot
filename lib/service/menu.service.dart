import 'package:n2020_the_good_bot/repository/menu.repository.dart';

class MenuService {
  MenuRepository _menuRepository;

  MenuService() {
    this._menuRepository = new MenuRepository();
  }

  Future<List<MenuItem>> getMenuItems() {
    return this._menuRepository.findAll();
  }
}
