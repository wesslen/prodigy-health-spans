setup-venv:
	~/.pyenv/versions/3.9.9/bin/python3.9 -m venv venv-pt
	source venv-pt/bin/activate

install:
	python -m pip install prodigy-teams
	python -m pip install dev/prodigy-2.0.0.dev10-py3-none-any.whl
	python -m pip install prodigy-teams-recipes-sdk
	python -m pip install prodigy-teams-recipes
	python -m pip install -r requirements.txt
	pip install https://huggingface.co/kormilitzin/en_core_med7_lg/resolve/main/en_core_med7_lg-any-py3-none-any.whl

setup:
	dotenv run -- echo $PRODIGY_TEAMS_PAM_HOST

clean:
	rm -rf venv-pt