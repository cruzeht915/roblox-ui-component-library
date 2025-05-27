# Roblox UI Component Library (Luau + Roact)

This project is a modular and reusable **UI component library** for Roblox built in Luau using the **Roact** framework. The architecture centers around a shared `BaseComponent` class that powers standardized behaviors and typing across components like **Modal**, **Toast**, and **Button**.

It follows a scalable design pattern to support consistent UI development in Roblox Studio.

---

## Features

- Reusable component base (`BaseComponent`)
- Modular UI components: `Modal`, `Toast`, `Button`
- Designed with type-safe strict Luau and structured metatable inheritance
- Extendable architecture for future UI components
- Built with Rojo and `--!strict` enforcement

---

## Components

### BaseComponent
A shared abstract base class that defines:
- `self.props`, `self.ref`, and shared lifecycle hooks
- Type-safe setup for shared patterns
- Used by all UI components via Luau structural typing

### Modal
- Center-screen popup with backdrop
- Supports nested children, header/body/footer layout
- Dismissible via close button or background tap

### Toast
- Temporary notification component
- Auto-dismiss timer and position stacking support
- Configurable style and message content

### Button
- Clickable interactive element
- Can render different visual states (default, hover, disabled)
- Accepts event handlers like `onClick`

---

## Folder Structure

```
components/
├── BaseComponent.lua         -- Abstract base component class
├── Button.lua                -- UI button
├── Modal.lua                 -- UI modal popup
├── Toast.lua                 -- Temporary toast message
└── types/                    -- Shared strict type definitions
```

---

## Development Setup

1. **Clone the repo**:
   ```bash
   git clone https://github.com/your-username/roblox-ui-components.git
   ```

2. **Install Rojo**:
   [https://rojo.space/docs](https://rojo.space/docs)

3. **Sync with Roblox Studio**:
   ```bash
   rojo serve
   ```
   Attach to your Studio place using the Rojo plugin.

4. **Use Components**:
   Require and render components from your Roact trees.

---

## Example Usage (Roact)

```lua
local Button = require(Components.Button)

Roact.createElement(Button, {
    text = "Click me!",
    onClick = function()
        print("Button clicked!")
    end,
})
```

---

## License

MIT — open source and free to use.

Created with ❤️ for Roblox developers using modern Luau patterns.