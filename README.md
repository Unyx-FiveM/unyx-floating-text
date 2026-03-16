<p align="center">
  <img src="https://i.postimg.cc/vHcKCsdk/logo-unyx-1-removebg-preview.png" alt="Logo" width="200">
</p>

<h1 align="center">unyx-floating-text</h1>

<p align="center">
  <img src="https://img.shields.io/badge/version-1.0.0-blue.svg" alt="Version">
  <img src="https://img.shields.io/badge/framework-Standalone-green.svg" alt="Framework">
</p>

## 📦 Description

Affiche des textes flottants en 3D dans le monde GTA V, positionnés à des coordonnées précises ou attachés au joueur.
Entièrement configurable depuis `config.lua` sans toucher au code : police, couleur, taille, contour, ombre, bordure, distance d'affichage, etc.

## ⚙️ Installation

1. Télécharger le script
2. Mettre le dossier dans `resources`
3. Ajouter dans `server.cfg`

```cfg
ensure unyx-floating-text
```

## 🛠️ Configuration

Modifier le fichier :

```
config.lua
```

### Style par défaut (`Config.Default`)

Les valeurs s'appliquent à tous les textes. Chaque entrée peut les surcharger individuellement.

| Champ | Description |
|---|---|
| `font` | Police : `0` ChaletLondon · `4` Fin · `7` WayfarerBook |
| `maxScale` | Taille max (`0.1` petit → `1.0` grand) |
| `color` | Couleur `{ r, g, b, a }` — `a = 0` invisible, `a = 255` opaque |
| `outline` | Contour noir fin — `true / false` |
| `shadow` | Ombre portée — `true / false` (configure `dropShadow`) |
| `edge` | Bordure colorée — `true / false` (configure `edgeStyle`) |
| `align` | `"center"` · `"left"` · `"right"` |
| `hideOnDistance` | `true` = disparaît à distance · `false` = toujours visible |
| `maxDistance` | Distance max en mètres (ignoré si `hideOnDistance = false`) |
| `zOffset` | Hauteur au-dessus du point |

### Ajouter un texte (`Config.Texts`)

**Position fixe dans le monde :**
```lua
{
    text    = "🏪 Magasin 24/7",
    coords  = vector3(25.0, -1340.0, 29.0),
    zOffset = 1.2,
    color   = { r = 255, g = 255, b = 255, a = 255 },
}
```

**Attaché au joueur :**
```lua
{
    text   = "👤 Mon personnage",
    onPed  = true,
    zOffset = 1.0,
}
```

## 📡 Exports

```lua
-- Ajouter un texte à des coordonnées fixes
exports['unyx-floating-text']:AddText("id", vector3(x, y, z), "Texte", { color = { r=255, g=0, b=0, a=255 } })

-- Ajouter un texte sur le joueur
exports['unyx-floating-text']:AddTextOnPed("id", "Texte", { zOffset = 1.2 })

-- Supprimer un texte
exports['unyx-floating-text']:RemoveText("id")
```

## 📋 Dépendances

Aucune. Le script est 100% standalone.

## 👤 Auteur

- Discord : yusu_sauvage

## 📜 Licence

Usage libre pour votre serveur.
Ne pas revendre ou redistribuer sans autorisation.
