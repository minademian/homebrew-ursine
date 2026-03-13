FORMULA := Formula/yarn-shell-completion.rb
FORMULA_VERSION := $(shell grep -oE 'v[0-9]+\.[0-9]+\.[0-9]+' $(FORMULA) | head -1)
VERSION := $(subst v,,$(FORMULA_VERSION))
BOTTLE_FILE := yarn-shell-completion--$(VERSION).sequoia.bottle.tar.gz
REPO := minademian/homebrew-ursine
SOURCE_REPO := ursine-code/yarn-shell-completion
TAG := $(shell git describe --tags --abbrev=0 2>/dev/null || echo "v0.0.0")
BUILD_DIR := /tmp/bottle-build

.PHONY: bottle upload update-formula release clean

bottle: clean
	mkdir -p $(BUILD_DIR)/yarn-shell-completion/$(VERSION)/{.brew,etc/bash_completion.d,share/zsh/site-functions}
	curl -sL https://github.com/$(SOURCE_REPO)/archive/refs/tags/$(FORMULA_VERSION).tar.gz | tar xz -C $(BUILD_DIR)
	cp $(BUILD_DIR)/yarn-shell-completion-$(VERSION)/completions/yarn $(BUILD_DIR)/yarn-shell-completion/$(VERSION)/etc/bash_completion.d/yarn
	cp $(BUILD_DIR)/yarn-shell-completion-$(VERSION)/completions/_yarn $(BUILD_DIR)/yarn-shell-completion/$(VERSION)/share/zsh/site-functions/_yarn
	cp $(FORMULA) $(BUILD_DIR)/yarn-shell-completion/$(VERSION)/.brew/yarn-shell-completion.rb
	cd $(BUILD_DIR) && tar czf /tmp/$(BOTTLE_FILE) yarn-shell-completion
	@echo "Bottle built: /tmp/$(BOTTLE_FILE)"
	@shasum -a 256 /tmp/$(BOTTLE_FILE)

upload:
	gh release upload $(TAG) /tmp/$(BOTTLE_FILE) --repo $(REPO)
	@echo "Uploaded to release $(TAG)"

update-formula:
	$(eval SHA := $(shell shasum -a 256 /tmp/$(BOTTLE_FILE) | cut -d' ' -f1))
	sed -i '' 's|root_url ".*"|root_url "https://github.com/$(REPO)/releases/download/$(TAG)"|' $(FORMULA)
	sed -i '' 's|sha256 cellar: :any_skip_relocation, sequoia: ".*"|sha256 cellar: :any_skip_relocation, sequoia: "$(SHA)"|' $(FORMULA)
	@echo "Formula updated with sha256: $(SHA)"

release: bottle upload update-formula

clean:
	rm -rf $(BUILD_DIR)
	rm -f /tmp/$(BOTTLE_FILE)
