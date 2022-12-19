Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49B9110E05F
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Dec 2022 11:49:29 +0000 (UTC)
From: Karolina Stolarek <karolina.stolarek@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 19 Dec 2022 12:49:07 +0100
Message-Id: <cover.1671446367.git.karolina.stolarek@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/4] Introduce blt_cmd_info struct
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
blt_cmd_info struct, per gen or platform. We have two groups of
predicates that internally use blt_supports_command() and
blt_cmd_supports_tiling() that check a matching blt_cmd_info
instance and say if a feature is supported or not.

In addition to this, the patchset adds a simple fast-copy test
that uses the aforementioned predicates, and refactors block-copy
test to use them as well. Two other patches are a prep work for
the fast-copy test -- extracting needed functions and updating
fill_data() to support TileYF (available only for Pre-gen12).

As this is quite a big patch series, I decided to send it early,
i.e. without doc comments. The plan is to add them in v2 (which
is bound to happen, given the scope of the series). Some of the
patches have my comments/thoughts on the solution I propose,
consulting them before the review will be very much appreciated.

Karolina Stolarek (4):
  lib: Describe supported blitter commands and tiling formats
  lib/i915_blt: Check for Tile-YF in fast_copy
  lib/i915_blt: Extract init functions for blt_copy_object
  tests/gem_exercise_blt: Add fast-copy test

 lib/i915/blt_tiling.c          | 371 +++++++++++++++++++++++++++++++++
 lib/i915/blt_tiling.h          |  64 ++++++
 lib/i915/i915_blt.c            | 150 ++++++++-----
 lib/i915/i915_blt.h            |  36 +++-
 lib/meson.build                |   1 +
 tests/i915/gem_ccs.c           |  96 +--------
 tests/i915/gem_exercise_blt.c  | 216 +++++++++++++++++++
 tests/i915/gem_lmem_swapping.c |  36 ----
 tests/meson.build              |   1 +
 9 files changed, 780 insertions(+), 191 deletions(-)
 create mode 100644 lib/i915/blt_tiling.c
 create mode 100644 lib/i915/blt_tiling.h
 create mode 100644 tests/i915/gem_exercise_blt.c

-- 
2.25.1
