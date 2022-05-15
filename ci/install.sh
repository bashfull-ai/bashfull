#/bin/bsh
set -ex

TARGET=aarch64-unknown-linux-gnu

target=x86_64-unknown-linux-musl

# Builds for iOS are done on OSX, but require the specific target to be
# installed.
case $TARGET in
    aarch64-apple-ios)
        rustup target install aarch64-apple-ios
        ;;
    armv7-apple-ios)
        rustup target install armv7-apple-ios
        ;;
    armv7s-apple-ios)
        rustup target install armv7s-apple-ios
        ;;
    i386-apple-ios)
        rustup target install i386-apple-ios
        ;;
    x86_64-apple-ios)
        rustup target install x86_64-apple-ios
        ;;
esac

# This fetches latest stable release
# tag=$(git ls-remote --tags --refs --exit-code https://github.com/japaric/cross \
#                     | cut -d/ -f3 \
#                     | grep -E '^v[0.1.0-9.]+$' \
#                     | $sort --version-sort \
#                     | tail -n1)
                    
curl -LSfs https://japaric.github.io/trust/install.sh | sh -s -- --force --git japaric/cross --target $target