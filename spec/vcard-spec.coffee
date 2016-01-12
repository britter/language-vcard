describe "vCard grammar", ->
  grammar = null

  beforeEach ->
    waitsForPromise ->
      atom.packages.activatePackage("language-vcard")

    runs ->
      grammar = atom.grammars.grammarForScopeName("source.vcard")

  it "parses the grammar", ->
    expect(grammar).toBeDefined()
    expect(grammar.scopeName).toBe "source.vcard"
