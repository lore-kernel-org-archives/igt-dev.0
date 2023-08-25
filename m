Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B12F210E62A
 for <igt-dev@lists.freedesktop.org>; Fri, 25 Aug 2023 08:33:36 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org, karthik.b.s@intel.com,
 swati2.sharma@intel.com
Date: Fri, 25 Aug 2023 13:55:36 +0530
Message-Id: <20230825082541.905799-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V6 0/5] Fix Bigjoiner checks
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

Bigjoiner will come in the picture when the resolution > 5K or
clock > max dot-clock. Add a support to check the selected mode
clock is greater than the max dot-clock.

V6: Rebase

Bhanuprakash Modem (5):
  tests: s/i915_pipe_output_combo_valid/intel_pipe_output_combo_valid/
  lib/igt_kms: s/is_i915_device/is_intel_device
  tests/i915/kms_big_joiner: Fix Bigjoiner checks
  tests/kms_flip: Fix Bigjoiner checks
  tests/kms_setmode: Fix Bigjoiner checks

 lib/igt_kms.c                         |   8 +-
 lib/igt_kms.h                         |   2 +-
 tests/i915/kms_big_fb.c               |   2 +-
 tests/i915/kms_big_joiner.c           | 106 +++++++++++++++-----------
 tests/i915/kms_busy.c                 |   2 +-
 tests/i915/kms_ccs.c                  |   2 +-
 tests/i915/kms_cdclk.c                |   4 +-
 tests/i915/kms_draw_crc.c             |   2 +-
 tests/i915/kms_dsc.c                  |   2 +-
 tests/i915/kms_fb_coherency.c         |   2 +-
 tests/i915/kms_fence_pin_leak.c       |   2 +-
 tests/i915/kms_flip_scaled_crc.c      |   4 +-
 tests/i915/kms_flip_tiling.c          |   2 +-
 tests/i915/kms_frontbuffer_tracking.c |   2 +-
 tests/i915/kms_mmap_write_crc.c       |   2 +-
 tests/i915/kms_psr.c                  |   2 +-
 tests/i915/kms_psr2_sf.c              |   2 +-
 tests/i915/kms_psr2_su.c              |   2 +-
 tests/i915/kms_psr_stress_test.c      |   2 +-
 tests/i915/kms_pwrite_crc.c           |   2 +-
 tests/kms_async_flips.c               |   2 +-
 tests/kms_atomic.c                    |   2 +-
 tests/kms_atomic_interruptible.c      |   2 +-
 tests/kms_atomic_transition.c         |   6 +-
 tests/kms_color_helper.c              |   2 +-
 tests/kms_concurrent.c                |   2 +-
 tests/kms_content_protection.c        |   2 +-
 tests/kms_cursor_crc.c                |   2 +-
 tests/kms_cursor_edge_walk.c          |   2 +-
 tests/kms_cursor_legacy.c             |   2 +-
 tests/kms_display_modes.c             |   4 +-
 tests/kms_flip.c                      |  18 +++--
 tests/kms_flip_event_leak.c           |   2 +-
 tests/kms_invalid_mode.c              |   2 +-
 tests/kms_lease.c                     |   2 +-
 tests/kms_pipe_crc_basic.c            |   2 +-
 tests/kms_plane.c                     |   2 +-
 tests/kms_plane_alpha_blend.c         |   2 +-
 tests/kms_plane_cursor.c              |   2 +-
 tests/kms_plane_lowres.c              |   2 +-
 tests/kms_plane_multiple.c            |   2 +-
 tests/kms_plane_scaling.c             |   4 +-
 tests/kms_prime.c                     |   2 +-
 tests/kms_properties.c                |   6 +-
 tests/kms_rmfb.c                      |   2 +-
 tests/kms_rotation_crc.c              |   6 +-
 tests/kms_scaling_modes.c             |   2 +-
 tests/kms_sequence.c                  |   2 +-
 tests/kms_setmode.c                   |  22 ++++--
 tests/kms_tiled_display.c             |   2 +-
 tests/kms_universal_plane.c           |   2 +-
 tests/kms_vblank.c                    |   6 +-
 tests/kms_vrr.c                       |   2 +-
 53 files changed, 152 insertions(+), 124 deletions(-)

--
2.40.0
