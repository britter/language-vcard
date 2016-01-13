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

  it 'parses simple key value pairs', ->
    {tokens} = grammar.tokenizeLine('BEGIN:VCARD')

    expect(tokens[0]).toEqual value: 'BEGIN', scopes: ['source.vcard', 'meta.tag.any.vcard', 'entity.name.tag.vcard']
    expect(tokens[1]).toEqual value: ':', scopes: ['source.vcard', 'meta.tag.any.vcard', 'punctuation.separator.key-value.vcard']
    expect(tokens[2]).toEqual value: 'VCARD', scopes: ['source.vcard']
