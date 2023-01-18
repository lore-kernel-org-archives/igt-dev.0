Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDD3710E225
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Jan 2023 09:06:44 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 18 Jan 2023 10:06:33 +0100
Message-Id: <20230118090640.10659-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/7] Run gem_exercise_blt on all gens.
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

For CI only, provided with HAX to avoid full run.

Karolina Stolarek (6):
  i915/lib: Add new library for blitter and tiling formats
  lib: Update platform definitions with blitter information
  lib/i915_blt: Check for Tile-YF in fast_copy
  lib/i915_blt: Add common functions for blt_copy_object
  tests/gem_exercise_blt: Add fast-copy test
  tests/gem_exercise_blt: Add fast-copy-emit test

Zbigniew Kempczyński (1):
  HAX: Run gem_exercise_blt on all gens to verify skip correctness

 .../igt-gpu-tools/igt-gpu-tools-docs.xml      |   1 +
 lib/i915/i915_blt.c                           | 195 +++++++--
 lib/i915/i915_blt.h                           |  48 ++-
 lib/i915/intel_blt_info.c                     | 156 +++++++
 lib/i915/intel_blt_info.h                     |  93 +++++
 lib/i915/intel_tiling_info.c                  |  87 ++++
 lib/intel_chipset.h                           |   4 +
 lib/intel_device_info.c                       |  47 +++
 lib/meson.build                               |  14 +-
 tests/i915/gem_ccs.c                          | 209 +++-------
 tests/i915/gem_exercise_blt.c                 | 387 ++++++++++++++++++
 tests/i915/gem_lmem_swapping.c                |  81 +---
 tests/intel-ci/fast-feedback.testlist         | 180 +-------
 tests/meson.build                             |   1 +
 14 files changed, 1061 insertions(+), 442 deletions(-)
 create mode 100644 lib/i915/intel_blt_info.c
 create mode 100644 lib/i915/intel_blt_info.h
 create mode 100644 lib/i915/intel_tiling_info.c
 create mode 100644 tests/i915/gem_exercise_blt.c

-- 
2.34.1
