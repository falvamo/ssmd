# 1. Semi-Structured Markdown (SSMD)

Markdown is a popular markup language for formatted text documents. Semi-structured data formats are those that allow for both structure and flexibility. Semi-Structured Markdown (SSMD) automatically adds structure to your markdown document using your document's headings. Like Markdown, SSMD supports six levels of headings, indicated by the number of hashtags preceding the heading. 

# 2. Installation

Currently the only way to install SSMD is to build it from scratch. SSMD is developed in C using `flex` so you will need both of these tools installed to build from source. Windows users will need to use WSL as the GNU compilers only run on Linux.

1. Install the GNU C and C++ compilers:
    ```bash
    sudo apt install build-essential
    ```

2. Install Flex:
    ```bash
    sudo apt install flex
    ```

3. Clone the SSMD repository:
    ```bash
    git clone [repo-url]
    ```

4. Move into the repository:
    ```bash
    cd ssmd
    ```

5. Build the executable with Make:
    ```bash
    make
    ```

# 3. Known Issues

## 3.1. Headings cannot be on the last line of the file
This is because SSMD is implemented with `flex` which unfortunately doesn't handle the end of files as we'd like it to. We're actively looking for a way to solve this. 

## 3.2. SSMD does not support alternate heading syntax
The following heading syntax is **not supported** by SSMD:
```md
Heading 1
---------
Heading 2
=========
```
The SSMD team does **not** plan on including support for this syntax in the future.