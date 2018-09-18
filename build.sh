npm install -g typescript;
tsc;
git config --global user.email "travis@travis-ci.org";
git config --global user.name "Travis CI";
git checkout master;
node out/index.js;
if ! git diff-index --quiet HEAD --; then
	echo "changes detected, publishing..";
	npm version patch -m "Bumping to %s [ci skip]";
	git push https://${GIT_TOKEN}@github.com/roblox-ts/rbx-types.git;
	npm publish;
fi;