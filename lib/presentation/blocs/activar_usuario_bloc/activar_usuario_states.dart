final class ActivarUsuarioState {
  final String? telefono;
  final String? aceptaTerminos;
  const ActivarUsuarioState({
    this.telefono,
    this.aceptaTerminos,
  });

  ActivarUsuarioState copyWith({
    String? telefono,
    String? aceptaTerminos,
  }) {
    return ActivarUsuarioState(
      telefono: telefono ?? this.telefono,
      aceptaTerminos: aceptaTerminos ?? this.aceptaTerminos,
    );
  }
}
