describe 'vCard grammar', ->
  grammar = null

  beforeEach ->
    waitsForPromise ->
      atom.packages.activatePackage('language-vcard')

    runs ->
      grammar = atom.grammars.grammarForScopeName('source.vcard')

  it 'parses the grammar', ->
    expect(grammar).toBeDefined()
    expect(grammar.scopeName).toBe "source.vcard"

  it 'finds BEGIN field with delimiter and value', ->
    {tokens} = grammar.tokenizeLine('BEGIN:VCARD')

    expect(tokens[0]).toEqual value: 'BEGIN', scopes: ['source.vcard', 'storage.type.vcard']
    expect(tokens[1]).toEqual value: ':', scopes: ['source.vcard', 'storage.type.vcard']
    expect(tokens[2]).toEqual value: 'VCARD', scopes: ['source.vcard', 'string.unquoted.vcard']
