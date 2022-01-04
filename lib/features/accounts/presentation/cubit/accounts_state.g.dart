// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'accounts_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AccountsState extends AccountsState {
  @override
  final bool isLoading;
  @override
  final List<Account> accounts;
  @override
  final ListGridSwitcherType listGridSwitchType;
  @override
  final String error;

  factory _$AccountsState([void Function(AccountsStateBuilder)? updates]) =>
      (new AccountsStateBuilder()..update(updates)).build();

  _$AccountsState._(
      {required this.isLoading,
      required this.accounts,
      required this.listGridSwitchType,
      required this.error})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        isLoading, 'AccountsState', 'isLoading');
    BuiltValueNullFieldError.checkNotNull(
        accounts, 'AccountsState', 'accounts');
    BuiltValueNullFieldError.checkNotNull(
        listGridSwitchType, 'AccountsState', 'listGridSwitchType');
    BuiltValueNullFieldError.checkNotNull(error, 'AccountsState', 'error');
  }

  @override
  AccountsState rebuild(void Function(AccountsStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AccountsStateBuilder toBuilder() => new AccountsStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AccountsState &&
        isLoading == other.isLoading &&
        accounts == other.accounts &&
        listGridSwitchType == other.listGridSwitchType &&
        error == other.error;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, isLoading.hashCode), accounts.hashCode),
            listGridSwitchType.hashCode),
        error.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AccountsState')
          ..add('isLoading', isLoading)
          ..add('accounts', accounts)
          ..add('listGridSwitchType', listGridSwitchType)
          ..add('error', error))
        .toString();
  }
}

class AccountsStateBuilder
    implements Builder<AccountsState, AccountsStateBuilder> {
  _$AccountsState? _$v;

  bool? _isLoading;
  bool? get isLoading => _$this._isLoading;
  set isLoading(bool? isLoading) => _$this._isLoading = isLoading;

  List<Account>? _accounts;
  List<Account>? get accounts => _$this._accounts;
  set accounts(List<Account>? accounts) => _$this._accounts = accounts;

  ListGridSwitcherType? _listGridSwitchType;
  ListGridSwitcherType? get listGridSwitchType => _$this._listGridSwitchType;
  set listGridSwitchType(ListGridSwitcherType? listGridSwitchType) =>
      _$this._listGridSwitchType = listGridSwitchType;

  String? _error;
  String? get error => _$this._error;
  set error(String? error) => _$this._error = error;

  AccountsStateBuilder();

  AccountsStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _isLoading = $v.isLoading;
      _accounts = $v.accounts;
      _listGridSwitchType = $v.listGridSwitchType;
      _error = $v.error;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AccountsState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AccountsState;
  }

  @override
  void update(void Function(AccountsStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$AccountsState build() {
    final _$result = _$v ??
        new _$AccountsState._(
            isLoading: BuiltValueNullFieldError.checkNotNull(
                isLoading, 'AccountsState', 'isLoading'),
            accounts: BuiltValueNullFieldError.checkNotNull(
                accounts, 'AccountsState', 'accounts'),
            listGridSwitchType: BuiltValueNullFieldError.checkNotNull(
                listGridSwitchType, 'AccountsState', 'listGridSwitchType'),
            error: BuiltValueNullFieldError.checkNotNull(
                error, 'AccountsState', 'error'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
