class Contato {
  final nomeCompleto;
  final numeroDaConta;

  Contato(this.nomeCompleto, this.numeroDaConta);

  @override
  String toString() {
    return 'Contato{nomeCompleto: $nomeCompleto, numeroDaConta: $numeroDaConta}';
  }
}
