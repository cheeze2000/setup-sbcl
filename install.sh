export INSTALL_ROOT=/home/runner/sbcl
export SBCL_HOME=/home/runner/sbcl/lib/sbcl

sbcl_url="http://prdownloads.sourceforge.net/sbcl/sbcl-$1-x86-64-linux-binary.tar.bz2"
quicklisp_url="https://beta.quicklisp.org/quicklisp.lisp"

echo "Setting up SBCL (version: $1)"

echo "Downloading from $sbcl_url"
curl -LOs $sbcl_url

echo "Extracting archive"
tar xfj *.tar.bz2
rm *.bz2

echo "Executing install script"
cd sbcl*
sh install.sh

echo "Verifying SBCL installation"
sbcl --version

echo "Downloading from $quicklisp_url"
curl -LOs $quicklisp_url

echo "Installing Quicklisp"
sbcl --non-interactive --load quicklisp.lisp \
    --eval "(quicklisp-quickstart:install)" --eval "(ql-util:without-prompting (ql:add-to-init-file))"

echo "Configuring ASDF to find your systems"
mkdir -p ~/.config/common-lisp/source-registry.conf.d
echo "(:tree \"/home/runner/\")" > ~/.config/common-lisp/source-registry.conf.d/asdf.conf
