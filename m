Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1FE310E759
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Jan 2023 14:29:08 +0000 (UTC)
From: Karolina Stolarek <karolina.stolarek@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 18 Jan 2023 15:28:53 +0100
Message-Id: <cover.1674051046.git.karolina.stolarek@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v6 0/6] Introduce blt_cmd_info struct
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
fast-copy where two blit copies are done in separate batches, and
fast-copy-emit which uses emit_blt_fast_copy() and manually
crafts two copies in one batch.

v6:
  - Rename the library to intel_tiling_info, and keep only struct
    definitions there
  - Move predicates to i915_blt.c, as this is going to be the main
    user of the library
  - Regenerate patch "lib/i915_blt: Add common functions for
    blt_copy_object", as i915_blt.(ch) significantly changed after
    rewriting the first patch

v5:
  - Rebase, fix conflict in gem_ccs.c

v4:
  - Move the inclusion of igt_core.h to intel_blt_info.c
    (Kamil/Petri)
  - Rename __MAX_TILING and __MAX_CMD so they are blitter-specific 
    (Kamil)
  - Use BIT() macro from intel_chipset.h (Zbigniew)
  - Check for empty blt_tiling_info in tiling_info(), and warn
    about it
  - Change blt_cmd_info declarations in intel_blt_info. Add a
    separate file for their definitions (intel_tiling_info.c).
    Update lib/mason.build to reflect that change (Zbigniew)
  - Remove definitions for ATS-M, as we can reuse dg2's (Zbigniew)
  - Add EXEC_OBJECT_WRITE flag for dest in fast-copy-emit subtest
    (Zbigniew)

v3:
  - Rewrite blt_tiling_type to be contiguous (Zbigniew, Kamil) 
  - Add BLT_BIT macro to create bit flags during .supported_tiling
    field initialization (Zbigniew)
  - Undo accidental line deletion in intel_chipset.c (Kamil)
  - Add __TILING_MAX to blt_tiling_type (Zbigniew)
  - Use asprintf when creating strings of subtest and PNG files
    names (Zbigniew)
  - Delete a duplicate WRITE_PNG call in fast_copy test (Zbigniew)
  - Update documentation
  - Update year in copyright headers

Karolina Stolarek (6):
  i915/lib: Add new library for blitter and tiling formats
  lib: Update platform definitions with blitter information
  lib/i915_blt: Check for Tile-YF in fast_copy
  lib/i915_blt: Add common functions for blt_copy_object
  tests/gem_exercise_blt: Add fast-copy test
  tests/gem_exercise_blt: Add fast-copy-emit test

 .../igt-gpu-tools/igt-gpu-tools-docs.xml      |   1 +
 lib/i915/i915_blt.c                           | 341 +++++++++++++--
 lib/i915/i915_blt.h                           |  66 ++-
 lib/i915/intel_tiling_info.c                  |  87 ++++
 lib/i915/intel_tiling_info.h                  |  71 ++++
 lib/intel_chipset.h                           |   4 +
 lib/intel_device_info.c                       |  47 +++
 lib/meson.build                               |   5 +-
 tests/i915/gem_ccs.c                          | 209 +++-------
 tests/i915/gem_exercise_blt.c                 | 387 ++++++++++++++++++
 tests/i915/gem_lmem_swapping.c                |  81 +---
 tests/meson.build                             |   1 +
 12 files changed, 1036 insertions(+), 264 deletions(-)
 create mode 100644 lib/i915/intel_tiling_info.c
 create mode 100644 lib/i915/intel_tiling_info.h
 create mode 100644 tests/i915/gem_exercise_blt.c

-- 
2.25.1
