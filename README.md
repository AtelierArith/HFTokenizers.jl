# HFTokenizers.jl

A self-contained, pure-Julia Hugging Face **byte-level BPE** tokenizer. It
reads a `tokenizer.json` (Qwen, GPT-2, RoBERTa style) and reproduces the
Python `tokenizers` behaviour without a Python dependency.

Supported configuration:

- normalizers: NFC / NFD / NFKC / NFKD, Lowercase, Sequence, and `null`,
- pre-tokenizers: `ByteLevel` (with `use_regex`, `add_prefix_space`) and Split,
- models: `BPE` with `merges` in string or array form,
- added tokens with `lstrip` / `rstrip` / `single_word`,
- `encode` and `decode`.

## Usage

```julia
using HFTokenizers

tok = HFTokenizer("tokenizer.json")
ids = tokenize(tok, "Hello, 世界")
text = decode(tok, ids)
```

## Tests

```bash
julia --project=. -e 'using Pkg; Pkg.test()'
```

Correctness is checked against Hugging Face `tokenizers` in two layers:
committed tiny fixtures (always run) and real Qwen / GPT-2 / RoBERTa
tokenizers at pinned revisions (downloaded on first use, skipped when
offline). Regenerate the oracle with `test/generate_oracle.py` and
`test/generate_real_oracle.py`.
