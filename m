Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98B4510E388
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Aug 2023 16:39:54 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 16 Aug 2023 22:01:46 +0530
Message-Id: <20230816163206.402705-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V4 00/20] Add XE suppor for display tests
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

Add IGT support to work kms tests on XE driver.

V2: - Rebase
V3: - Update testlist
V4: - Rebase

Bhanuprakash Modem (20):
  lib: Add tiling support for XE
  tests/kms_cursor_edge_walk: Fix intel specific checks
  tests/kms_getfb: Extended ccs tests to support XE
  tests/kms_addfb_basic: Add tiling support for XE
  tests/kms_plane: Add tiling support for XE
  tests/kms_plane_lowres: Add tiling support for XE
  tests/kms_plane_scaling: Add tiling support for XE
  tests/kms_rotation_crc: Add tiling support for XE
  tests/i915/kms_big_fb: Add tiling support for XE
  tests/i915/kms_draw_crc: Add tiling support for XE
  tests/i915/kms_flip_scaled_crc: Add tiling support for XE
  tests/i915/kms_flip_tiling: Add tiling support for XE
  tests/i915/kms_ccs: Add XE support
  tests/i915/kms_fb_coherancy: Add XE support
  tests/i915/kms_fbcon_fbt: Add XE support
  tests/kms_async_flips: Add XE support
  tests/kms_prime: Add XE support
  tests/intel-ci: Update Xe ffb testlist & blocklist for
    kms_frontbuffer_tracking
  tests/intel-ci: Drop tiling tests from xe blocklist
  HAX: Run tiling tests in XE fast-feedback

 lib/igt_draw.c                           |   5 +-
 lib/igt_fb.c                             |   8 +-
 lib/intel_bufops.c                       |  13 +-
 tests/i915/kms_big_fb.c                  |  23 +-
 tests/i915/kms_ccs.c                     |  42 +-
 tests/i915/kms_draw_crc.c                |   4 -
 tests/i915/kms_fb_coherency.c            |  43 +-
 tests/i915/kms_fbcon_fbt.c               |   2 +-
 tests/i915/kms_flip_scaled_crc.c         |   6 -
 tests/i915/kms_flip_tiling.c             |   6 -
 tests/intel-ci/xe-fast-feedback.testlist | 660 ++++++++++++++++-------
 tests/intel-ci/xe.blocklist.txt          |  13 +-
 tests/kms_addfb_basic.c                  |  17 +-
 tests/kms_async_flips.c                  |  12 +-
 tests/kms_cursor_edge_walk.c             |   2 +-
 tests/kms_getfb.c                        |  10 +-
 tests/kms_plane.c                        |   4 -
 tests/kms_plane_lowres.c                 |   3 -
 tests/kms_plane_scaling.c                |   4 -
 tests/kms_prime.c                        | 261 +++++++--
 tests/kms_rotation_crc.c                 |   8 +-
 21 files changed, 782 insertions(+), 364 deletions(-)

--
2.40.0
