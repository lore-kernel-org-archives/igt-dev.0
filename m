Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B6AD10F75A
 for <igt-dev@lists.freedesktop.org>; Sun, 14 Aug 2022 18:12:06 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Sun, 14 Aug 2022 23:38:17 +0530
Message-Id: <20220814180908.2553394-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t 00/51] Add IGT support for 8K and Bigjoiner
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

Add IGT support for 8K & bigjoiner:
* Pipe-D wont support mode > 5K
* To use 8K mode on a pipe then consecutive pipe must be available & free.

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>

Bhanuprakash Modem (51):
  lib/igt_kms: Add a helper for igt test constraint
  tests/kms_async_flips: Add support for Bigjoiner
  tests/kms_atomic: Add support for Bigjoiner
  tests/kms_atomic_interruptible: Add support for Bigjoiner
  tests/kms_atomic_transition: Add support for Bigjoiner
  lib/igt_kms: Bigjoiner check in max_bpc constraint
  tests/kms_color_helper: Helper to check Bigjoiner constraint
  tests/kms_color: Add support for Bigjoiner
  tests/chamelium/kms_color_chamelium: Add support for Bigjoiner
  tests/kms_concurrent: Add support for Bigjoiner
  tests/kms_content_protection: Add support for Bigjoiner
  tests/kms_cursor_crc: Add support for Bigjoiner
  tests/kms_cursor_edge_walk: Add support for Bigjoiner
  tests/kms_cursor_legacy: Add support for Bigjoiner
  tests/kms_display_modes: Add support for Bigjoiner
  tests/kms_dp_tiled_display: Add support for Bigjoiner
  tests/kms_flip_event_leak: Add support for Bigjoiner
  tests/kms_invalid_mode: Add support for Bigjoiner
  tests/kms_lease: Add support for Bigjoiner
  tests/kms_multipipe_modeset: Find the suitable mode instead of using
    default
  tests/kms_pipe_crc_basic: Add support for Bigjoiner
  tests/kms_plane: Add support for Bigjoiner
  tests/kms_plane_alpha_blend: Add support for Bigjoiner
  tests/kms_plane_cursor: Add support for Bigjoiner
  tests/kms_plane_lowres: Add support for Bigjoiner
  tests/kms_plane_multiple: Add support for Bigjoiner
  tests/kms_plane_scaling: Add support for Bigjoiner
  tests/kms_prime: Add support for Bigjoiner
  tests/kms_properties: Add support for Bigjoiner
  tests/kms_rmfb: Add support for Bigjoiner
  tests/kms_rotation_crc: Add support for Bigjoiner
  tests/kms_scaling_modes: Add support for Bigjoiner
  tests/kms_sequence: Add support for Bigjoiner
  tests/kms_universal_plane: Add support for Bigjoiner
  tests/kms_vblank: Add support for Bigjoiner
  tests/kms_vrr: Add support for Bigjoiner
  tests/i915/kms_big_fb: Add support for Bigjoiner
  tests/i915/kms_big_joiner: Negative tests for Bigjoiner
  tests/i915/kms_busy: Add support for Bigjoiner
  tests/i915/kms_ccs: Add support for Bigjoiner
  tests/i915/kms_cdclk: Add support for Bigjoiner
  tests/i915/kms_fence_pin_leak: Add support for Bigjoiner
  tests/i915/kms_flip_scaled_crc: Add support for Bigjoiner
  tests/i915/kms_flip_tiling: Add support for Bigjoiner
  tests/i915/kms_frontbuffer_tracking: Add support for Bigjoiner
  tests/i915/kms_mmap_write_crc: Add support for Bigjoiner
  tests/i915/kms_psr2_sf: Add support for Bigjoiner
  tests/i915/kms_psr2_su: Add support for Bigjoiner
  tests/i915/kms_psr: Add support for Bigjoiner
  tests/i915/kms_psr_stress_test: Add support for Bigjoiner
  tests/i915/kms_pwrite_crc: Add support for Bigjoiner

 lib/igt_kms.c                         |  26 +++
 lib/igt_kms.h                         |   1 +
 tests/chamelium/kms_color_chamelium.c |   9 ++
 tests/i915/kms_big_fb.c               |  13 ++
 tests/i915/kms_big_joiner.c           | 118 +++++++++++---
 tests/i915/kms_busy.c                 | 104 ++++++++----
 tests/i915/kms_ccs.c                  |  17 +-
 tests/i915/kms_cdclk.c                |  93 ++++++-----
 tests/i915/kms_fence_pin_leak.c       |   9 ++
 tests/i915/kms_flip_scaled_crc.c      |  13 +-
 tests/i915/kms_flip_tiling.c          |   7 +
 tests/i915/kms_frontbuffer_tracking.c |  16 +-
 tests/i915/kms_mmap_write_crc.c       |   6 +
 tests/i915/kms_psr.c                  |   4 +
 tests/i915/kms_psr2_sf.c              |   7 +
 tests/i915/kms_psr2_su.c              |   7 +
 tests/i915/kms_psr_stress_test.c      |   7 +-
 tests/i915/kms_pwrite_crc.c           |   7 +
 tests/kms_async_flips.c               |  14 +-
 tests/kms_atomic.c                    |  28 +++-
 tests/kms_atomic_interruptible.c      |  39 +++++
 tests/kms_atomic_transition.c         | 131 ++++++++++++++--
 tests/kms_color.c                     |   9 +-
 tests/kms_color_helper.c              |  12 ++
 tests/kms_color_helper.h              |   1 +
 tests/kms_concurrent.c                |  10 +-
 tests/kms_content_protection.c        |  17 ++
 tests/kms_cursor_crc.c                |  49 ++++--
 tests/kms_cursor_edge_walk.c          |   6 +
 tests/kms_cursor_legacy.c             | 202 +++++++++++++++---------
 tests/kms_display_modes.c             | 104 +++++++-----
 tests/kms_dp_tiled_display.c          |   1 +
 tests/kms_flip_event_leak.c           |  10 ++
 tests/kms_invalid_mode.c              |   6 +
 tests/kms_lease.c                     |   6 +
 tests/kms_multipipe_modeset.c         |   9 ++
 tests/kms_pipe_crc_basic.c            |  24 +++
 tests/kms_plane.c                     |  30 ++--
 tests/kms_plane_alpha_blend.c         |   7 +
 tests/kms_plane_cursor.c              |   8 +-
 tests/kms_plane_lowres.c              |   3 +
 tests/kms_plane_multiple.c            |  11 +-
 tests/kms_plane_scaling.c             | 217 +++++++++++++++++---------
 tests/kms_prime.c                     |  11 +-
 tests/kms_properties.c                |  18 +++
 tests/kms_rmfb.c                      |  10 +-
 tests/kms_rotation_crc.c              |  25 ++-
 tests/kms_scaling_modes.c             |   8 +-
 tests/kms_sequence.c                  |   6 +
 tests/kms_universal_plane.c           |  93 +++++++++--
 tests/kms_vblank.c                    |  54 ++++++-
 tests/kms_vrr.c                       |   6 +
 52 files changed, 1279 insertions(+), 370 deletions(-)

--
2.35.1
