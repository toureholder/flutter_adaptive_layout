flutter packages get \
&& flutter analyze --no-pub --no-current-package lib/ test/ \
&& sh script/test_coverage.sh