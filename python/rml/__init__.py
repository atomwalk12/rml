# Export the version given in project metadata
from importlib import metadata

from _rml import add_one

try:
    __version__ = metadata.version(__package__)
except metadata.PackageNotFoundError:
    # Allow local imports from the source tree without installing the package.
    # Used by the emacs test runner (via g R). It improves test compilation speed.
    __version__ = "0.0.0"
del metadata


def one_plus_one():
    return add_one(1)
