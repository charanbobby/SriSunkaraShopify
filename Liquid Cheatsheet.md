## Shopify Cheat Sheet - [Liquid Cheat Sheet](https://www.shopify.com/ca/partners/shopify-cheat-sheet)

### Layout Structure

- **Layout Directory**: Contains the wrapper templates. The most important one is `theme.liquid`.
- **theme.liquid**: This is the master template file. It contains the global `<html>`, `<head>`, and `<body>` tags and wraps every page of your store.

### Native Wrappers (Content For)

Shopify uses "native wrappers" or `content_for` tags to inject dynamic content relative to the context.

- **`{{ content_for_header }}`**

  - **Location**: Must be in the `<head>` of `theme.liquid`.
  - **Purpose**: Injects Shopify's core scripts, analytics, app logic, and styles. The store will not function correctly without this.

- **`{{ content_for_layout }}`**

  - **Location**: Must be in the `<body>` of `theme.liquid`.
  - **Purpose**: Acts as the placeholder where the template for the specific page (Product, Collection, Blog, etc.) is rendered.

- **Other Common Wrappers**:
  - `{{ content_for_additional_checkout_buttons }}`: Used on the Cart page/drawer to render buttons like Apple Pay, Google Pay, PayPal.

### Best Practices for Naming

When creating sections and CSS classes, strict naming conventions prevent conflicts with apps and theme styles.

- **Feature-Based Naming**: Always prefix your classes with the feature name.
  - **Pattern**: `feature-name` + `element`
  - **Good**: `hero-container`, `hero-title`, `product-card-image`
  - **Bad**: `container`, `title`, `image` (Too generic, will likely conflict)
- **BEM (Block Element Modifier)**:
  - If possible, follow BEM: `block__element--modifier`
  - Example: `hero__heading` or `hero__button--primary`
