# VIPM Package Building Extensions (vendored)

Copied from https://github.com/vipm-io/vipm-package-building-extensions
at commit 8289056f0cc1fb954d83ed5ff5510b94ecb5e5dd (`source/` folder only). See LICENSE.

Used by `../Post-Build Custom Action.vi`, which calls `unpack_package.vi` and
`repack_package.vi` to re-save any packaged VIs that VIPM failed to save for LabVIEW 2020.
VIPM computes the package ID after the post-build action runs, so changes made there survive.

Note: `Package/open.vi` depends on OpenG File (`Temporary Filename__ogtk.vi`), which is not in
blue-dev.vipc. The post-build action avoids it by calling unpack/repack directly.
