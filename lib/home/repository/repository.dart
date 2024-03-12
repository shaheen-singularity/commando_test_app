abstract class Repository{
  Future onUpdate(int id, String type, int value);
  Future onReset(int id);
}