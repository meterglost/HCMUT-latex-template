# HCMUT LaTeX template

This project provides several Latex report templates which are written using mordern packages and technologies for better support of dual-language (English + Vietnamese)

## Templates

-   Graduation thesis
-   Course project report

## Features

-   Style is aligned with common standards (layout, text, ...)
-   Support colorized hyperlink
-   Support embed image, math, code with highlighting
-   Support dual-language (English + Vietnamese)
-   Support setting PDF metadatas, password-based encryption
-   Provide styled common components/pages
-   ... and many other out-of-the-box features are preconfigured

## Usage

Each template is packed up into a zip archive. Download at release page.

### For Overleaf users

-   Upload the template
-   Change Overleaf compiler option to `XeLaTex`

## Options

Each template is written as a LaTeX document class with several options for quickly customize. Check out the `README.md` and `main.tex` files in each template folder for details.

> [!NOTE]
> Due to using `kvoptions` for better compatibility with LaTeX2e
>
> -   Options need to be set through `PassOptionsToClass` or will fail to compile
> -   Value contains spaces need to be wrapped around with double braces to avoid space trimming.
>
> All these annoying will be solved after fully migrating to LaTeX3.
