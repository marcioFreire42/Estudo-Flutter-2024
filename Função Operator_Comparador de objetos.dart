class Investimento {
  String nome;
  int valor;

  Investimento(this.nome, this.valor);

  // A função a seguir define como dois objetos dessa classe são iguais ou diferentes.
  // Ela é chamada sempre que dois objetos dessa classe são comparados com um ==;
  // É cricial para correta comparação de iten de listas e conjuntos.
  // As vezes a comparação usua não funciona corretamente
  @override
  bool operator ==(Object other) =>
      // Recebe um único objeto, que será comparado com o atual;
      identical(this, other) ||
      other is Investimento && // Identifica se o objeto é mesmo um investimento
          runtimeType == other.runtimeType && // Compara tempo de execução;
          // Depois compara os atributos de cada um.
          nome == other.nome &&
          valor == other.valor;

  // Essa função gera um HashCode que será usado junto com o operator.
  @override
  int get hashCode => nome.hashCode ^ valor.hashCode;
}
