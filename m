Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1CD910EA02
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Jan 2023 10:14:16 +0000 (UTC)
From: Karolina Stolarek <karolina.stolarek@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 20 Jan 2023 11:14:00 +0100
Message-Id: <cover.1674208534.git.karolina.stolarek@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v7 0/9] Introduce blt_cmd_info struct
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

v7:
  - Break down the first patch in the series into three separate
    changes (Zbigniew)
  - Add requirement for "gem_uses_full_ppgtt(i915)" to
    gem_exercise_blt (Zbigniew)
  - Rename supported_tiling field in blt_cmd_info to supported_cmds
    (Zbigniew)
  - Add GET_BLT_INFO in i915_blt.c to wrap calls to
    intel_get_blt_info

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

Karolina Stolarek (9):
  lib/i915_blt: Rename blt_tiling to blt_tiling_type
  lib/i915_blt: Add T_YFMAJOR tiling type
  lib/i915_blt: Check for Tile-YF in fast_copy
  i915/lib: Add new library for blitter and tiling formats
  lib/intel_device_info: Update platform definitions with blitter
    information
  lib/i915_blt: Add helpers to check if command or tiling is supported
  lib/i915_blt: Add common functions for blt_copy_object
  tests/gem_exercise_blt: Add fast-copy test
  tests/gem_exercise_blt: Add fast-copy-emit test

 lib/i915/i915_blt.c            | 238 ++++++++++++++++++--
 lib/i915/i915_blt.h            |  53 +++--
 lib/i915/intel_tiling_info.c   |  88 ++++++++
 lib/i915/intel_tiling_info.h   |  47 ++++
 lib/intel_chipset.h            |   4 +
 lib/intel_device_info.c        |  47 ++++
 lib/meson.build                |   5 +-
 tests/i915/gem_ccs.c           | 209 +++++-------------
 tests/i915/gem_exercise_blt.c  | 389 +++++++++++++++++++++++++++++++++
 tests/i915/gem_lmem_swapping.c |  81 ++-----
 tests/meson.build              |   1 +
 11 files changed, 910 insertions(+), 252 deletions(-)
 create mode 100644 lib/i915/intel_tiling_info.c
 create mode 100644 lib/i915/intel_tiling_info.h
 create mode 100644 tests/i915/gem_exercise_blt.c

-- 
2.25.1
