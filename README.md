# Getting Started

Create a new virtual environment and put your Prodigy wheel in a local folder `dev` and run:

```
make setup-venv
make install
deactivate
```

> This may take several minutes due to installing the `en-core-med7-lg` which is over 600MB. 

# Install dependencies

First, create a local `.env` file such that:

```
PRODIGY_TEAMS_PAM_HOST="https://xxx.prodigy.ai/"
PRODIGY_TEAMS_BROKER_HOST="https://xxxx.prodigy.ai/"
```

Then run:

```
source venv-pt/bin/activate
dotenv run -- ptc config set-pam-host $PRODIGY_TEAMS_PAM_HOST
dotenv run -- ptc config set-broker-host $PRODIGY_TEAMS_BROKER_HOST
```

Optionally, if you want to use the OpenAI API (e.g., to generate data), you can provide your `OPENAI_KEY` as well.


Note: `en_core_med7_lg` currently only works with spaCy < 3.5. Therefore, this won't work with spaCy 3.6 without reconfiguring.

Alternatively, you can modify `en_core_med7_lg` to make it work with spaCy 3.5 by changing its `meta.json` files (`venv/lib/python3.9/site-packages/en_core_med7_lg/meta.json` and `venv/lib/python3.9/site-packages/en_core_med7_lg/en_core_med7_lg-3.4.2.1/meta.json`) where `"spacy_version":">=3.4.2,<3.5.0",` to `" "spacy_version":">=3.4.2,<3.6.0",`. This would likely be ideal but it is a bit manual.

# Create PT Project

Create your Prodigy Teams' project:

```
$ python -m spacy project run create-pt-project

============================= create-pt-project =============================
Running command: ptc projects create ner_med7_finetuned 'NER/spancat Prodigy Teams workflow with med7 model'

================================== Project ==================================

id            60f58bb3-7a24-4c13-97b1-c795bf1528a8
created       2023-07-29 15:40:42.989928+00:00
updated       2023-07-29 15:40:42.989931+00:00
org_id        9cfd2f6a-359f-4e8f-8d19-7edf236a24a9
name          ner_med7_finetuned            
description   NER/spancat Prodigy Teams workflow with med7 model
```