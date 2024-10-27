# lua-charset-converter

## Français

### Présentation
`lua-charset-converter` est un module Lua conçu pour convertir les jeux de caractères, y compris Windows-1252 en UTF-8, UTF-8 en Windows-1252, Unicode en UTF-8 et UTF-8 en Unicode. Ce module vise à fournir une interface facile d'utilisation pour les développeurs qui ont besoin de gérer différents encodages de caractères dans leurs applications.

### Fonctionnalités
- Convertir les chaînes encodées en Windows-1252 en UTF-8.
- Convertir les chaînes UTF-8 en encodage Windows-1252.
- Convertir les points de code Unicode en chaînes UTF-8.
- Convertir les chaînes UTF-8 en points de code Unicode.
- Vider les tables de conversion pour réinitialiser l'état. (optionnel et uniquement si vous utilisez les méthodes 'code1252ToUtf8' et 'utf8ToCode1252')

### Installation
Pour utiliser le module `lua-charset-converter`, assurez-vous d'avoir Lua installé sur votre système. Vous pouvez ensuite inclure le module dans vos scripts Lua en utilisant :

```lua
local map = require("map")
```

### Utilisation

Voici quelques exemples de comment utiliser le module :

```lua
local map = require("map")

-- Convertir Windows-1252 en UTF-8
local utf8String = map:code1252ToUtf8("\x80\x81\x82\xA2\xA3")

-- Convertir UTF-8 en Windows-1252
local win1252String = map:utf8ToCode1252("€ƒ„¢£")

-- Convertir Unicode en UTF-8
local utf8FromUnicode = map:unicodeToUtf8(0x20AC)

-- Convertir UTF-8 en Unicode
local unicodeFromUtf8 = map:utf8ToUnicode("€")
```

### Exécuter les tests

Pour s'assurer que le module fonctionne comme prévu, exécutez le jeu de tests fourni en utilisant :

```bash
lua test_map.lua
```

### Lua version

Ce module a été testé avec Lua 5.4.*, mais il devrait fonctionner avec casiment toutes les versions de Lua, y compris LuaJIT.

### Contribution

Les contributions sont les bienvenues ! Si vous avez des suggestions pour améliorer le module, n'hésitez pas à ouvrir une issue ou à proposer des pull requests.