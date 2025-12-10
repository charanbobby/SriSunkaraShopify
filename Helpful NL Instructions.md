## Sample LLM Instructions

Generate a Shopify section in Liquid called "Hero Section" that includes:

- A heading, subheading, button, and image
- Editable settings for heading, subheading, button text, button link, and image using schema
- Semantic HTML with class names: hero-heading, hero-subheading, hero-button, and hero-image
- Wrap everything in a "<section class="hero-section">" and use a div with "class="hero-layout" for two-column layout
- Include the complete {% schema %} JSON block at the end

Generate CSS styles for the following classes:

- .hero-section: add padding, center content, max width
- .hero-layout: make it a 2-column flex layout with responsive stacking on mobile
- .hero-heading: large bold font
- .hero-subheading: slightly smaller, lighter font
- .hero-button: solid background, padding, hover effect
- .hero-image-tag: responsive image with max width

- - - Optionally convert this into Tailwind CSS
