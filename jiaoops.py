#!/usr/bin/env python3
"""Backward-compatible wrapper for the old JiaoOps CLI name."""
from pathlib import Path
import runpy

runpy.run_path(str(Path(__file__).with_name('vpspilot.py')), run_name='__main__')
