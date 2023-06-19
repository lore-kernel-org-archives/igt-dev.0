Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 360A310E1F0
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Jun 2023 12:05:03 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 19 Jun 2023 17:28:40 +0530
Message-Id: <20230619115858.2013195-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t 00/18] Add XE suppor for display tests
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

Bhanuprakash Modem (18):
  lib: Add tiling support for XE
  lib/igt_fb: Intel bops & ibb is mandatory for XE
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

 lib/igt_draw.c                   |   5 +-
 lib/igt_fb.c                     |  20 +--
 lib/intel_bufops.c               |  13 +-
 tests/i915/kms_big_fb.c          |  23 +---
 tests/i915/kms_ccs.c             |  42 +++---
 tests/i915/kms_draw_crc.c        |   4 -
 tests/i915/kms_fb_coherency.c    |  43 +++---
 tests/i915/kms_fbcon_fbt.c       |   2 +-
 tests/i915/kms_flip_scaled_crc.c |   6 -
 tests/i915/kms_flip_tiling.c     |   6 -
 tests/kms_addfb_basic.c          |  17 ++-
 tests/kms_async_flips.c          |  12 +-
 tests/kms_cursor_edge_walk.c     |   2 +-
 tests/kms_getfb.c                |  10 +-
 tests/kms_plane.c                |   4 -
 tests/kms_plane_lowres.c         |   3 -
 tests/kms_plane_scaling.c        |   4 -
 tests/kms_prime.c                | 230 ++++++++++++++++++++++++-------
 tests/kms_rotation_crc.c         |   8 +-
 19 files changed, 278 insertions(+), 176 deletions(-)

--
2.40.0
