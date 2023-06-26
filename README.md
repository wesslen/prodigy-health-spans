# Getting Started

Create a new virtual environment

```
python3.9 -m venv venv
source venv/bin/activate
```

# Install dependencies

First, create a local `.env` file such that:

```
PRODIGY_KEY=xxxx-xxxx-xxxx-xxxx
```

Optionally, if you want to use the OpenAI API (e.g., to generate data), you can provide your `OPENAI_KEY` as well.

Then run:

```
python3 -m pip install --upgrade pip
python3 -m pip install https://huggingface.co/kormilitzin/en_core_med7_lg/resolve/main/en_core_med7_lg-any-py3-none-any.whl
python3 -m pip install -r requirements.txt
dotenv run -- python3 -m pip install prodigy --pre -f https://$PRODIGY_KEY@download.prodi.gy
python3 -m pip install spacy==3.4.4 --force
```

Note: `en_core_med7_lg` currently only works with spaCy < 3.5. Therefore, the last step will install spaCy 3.4.4. This isn't ideal but a short term solution.

Alternatively, you can modify `en_core_med7_lg` to make it work with spaCy 3.5 by changing its `meta.json` files (`venv/lib/python3.9/site-packages/en_core_med7_lg/meta.json` and `venv/lib/python3.9/site-packages/en_core_med7_lg/en_core_med7_lg-3.4.2.1/meta.json`) where `"spacy_version":">=3.4.2,<3.5.0",` to `" "spacy_version":">=3.4.2,<3.6.0",`. This would likely be ideal but it is a bit manual. If you do this step, you don't need to force install spaCy 3.4.4.

# Run initial project

You can then run the spaCy project commands like:

```
# Run Prodigy `ner.correct` with generated examples and `en_core_med7_lg`
python3 -m spacy project run prodigy-ner-correct
```