Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73C2F10E635
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Dec 2022 11:14:05 +0000 (UTC)
From: Karolina Stolarek <karolina.stolarek@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 23 Dec 2022 12:13:45 +0100
Message-Id: <cover.1671793169.git.karolina.stolarek@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 0/6] Introduce blt_cmd_info struct
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

This patch series introduces a new way of checking if a specific
tiling format and/or blitter copy command is supported on
the current platform. Instead of using functions with hardcoded
devices, now we store information about available features in
blt_cmd_info struct, each of the instances connected to the
intel_device_info definitions.

Two patches that follow the introduction of blt_cmd_info and 
intel_device_info modification are a prep work for the fast
copy test -- extracting needed functions and updating
fill_data() to support TileYF (available only for Pre-gen12).

In addition to this, the patchset adds two fast copy tests: basic
fast-copy where two blit copies are done in separate batches and
fast-copy-emit which uses emit_blt_fast_copy() and manually
crafts two copies in one batch.

v2 of this series is significantly different from v1, especially
when it comes to intel_blt_info (formerly blt_tiling) library
implementation. It has been slimed down, and the API it exposes
now only deals with blt_cmd_info, not i915. So, for example, if
one wishes to query for support for fast copy for i915, they
should use blt_has_fast_copy(i915), exposed by i915_blt library.
The full list of changes can be found below.

v2:
  - Add documentation
  - Rename blt_tiling to intel_blt_info to better capture the
    nature of the library (Zbigniew)
  - Rename "can" predicates for blitter commands to use "has"
    (Kamil)
  - Add a fast copy test with two copies in the same batch buffer
  - Add blt_ prefixes to functions extracted from gem_ccs to
    avoid name clash (Zbigniew/Kamil)
  - Also move set_object_ext() out from gem_ccs so it can be
    shared with other tests
  - Significantly rewrite intel_blt_info library -- now it only
    exposes blt_cmd_supports_tiling and blt_supports_command
    and blt_cmd_info definitions that can be used by other
    blitter libraries like i915_blt.
  - Split introduction of intel_blt_info and usage of the struct
    into two commits
  - Add functions checking fast and block copy support to
    i915_blt library
  - Add reference to blt_cmd_info to intel_device_info definitions
    (Zbigniew)
  - Update commit messages (Kamil)

Karolina Stolarek (6):
  i915/lib: Add new library for blitter and tiling formats
  lib: Update platform definitions with blitter information
  lib/i915_blt: Check for Tile-YF in fast_copy
  lib/i915_blt: Add common functions for blt_copy_object
  tests/gem_exercise_blt: Add fast-copy test
  tests/gem_exercise_blt: Add fast-copy-emit test

 .../igt-gpu-tools/igt-gpu-tools-docs.xml      |   1 +
 lib/i915/i915_blt.c                           | 192 +++++++--
 lib/i915/i915_blt.h                           |  48 ++-
 lib/i915/intel_blt_info.c                     | 241 +++++++++++
 lib/i915/intel_blt_info.h                     |  98 +++++
 lib/intel_chipset.c                           |   1 -
 lib/intel_chipset.h                           |   4 +
 lib/intel_device_info.c                       |  47 +++
 lib/meson.build                               |   1 +
 tests/i915/gem_ccs.c                          | 211 +++-------
 tests/i915/gem_exercise_blt.c                 | 394 ++++++++++++++++++
 tests/i915/gem_lmem_swapping.c                |  81 +---
 tests/meson.build                             |   1 +
 13 files changed, 1055 insertions(+), 265 deletions(-)
 create mode 100644 lib/i915/intel_blt_info.c
 create mode 100644 lib/i915/intel_blt_info.h
 create mode 100644 tests/i915/gem_exercise_blt.c

-- 
2.25.1
