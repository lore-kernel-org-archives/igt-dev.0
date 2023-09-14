Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA8A710E28F
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Sep 2023 13:55:58 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org,
	swati2.sharma@intel.com
Date: Thu, 14 Sep 2023 18:49:40 +0530
Message-Id: <20230914131942.2178847-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t 0/2] Optimize kms tesplan documentation
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

Optimizations:
- Move common stuff to TEST level
- Move documentation to beginning of the file
- Align Mega features to internal tools

Bhanuprakash Modem (2):
  tests/kms: Fix Mega Feature in testplan documentation
  tests/kms: Optimize KMS testplan documentation

 tests/chamelium/kms_chamelium_color.c  |    6 +-
 tests/intel/kms_big_fb.c               |  301 +-
 tests/intel/kms_big_joiner.c           |   41 +-
 tests/intel/kms_busy.c                 |   88 +-
 tests/intel/kms_ccs.c                  |   15 +-
 tests/intel/kms_cdclk.c                |   41 +-
 tests/intel/kms_dirtyfb.c              |   23 +-
 tests/intel/kms_draw_crc.c             |   71 +-
 tests/intel/kms_dsc.c                  |    8 +-
 tests/intel/kms_fb_coherency.c         |   21 +-
 tests/intel/kms_fbcon_fbt.c            |   21 +-
 tests/intel/kms_fence_pin_leak.c       |   18 +-
 tests/intel/kms_flip_scaled_crc.c      |   60 +-
 tests/intel/kms_flip_tiling.c          |   18 +-
 tests/intel/kms_frontbuffer_tracking.c | 3892 ++++++++++--------------
 tests/intel/kms_legacy_colorkey.c      |   17 +-
 tests/intel/kms_mmap_write_crc.c       |   20 +-
 tests/intel/kms_pipe_b_c_ivb.c         |   28 +-
 tests/intel/kms_pm_backlight.c         |   32 +-
 tests/intel/kms_pm_dc.c                |   39 +-
 tests/intel/kms_pm_lpsp.c              |   22 +-
 tests/intel/kms_psr.c                  |   94 +-
 tests/intel/kms_psr2_sf.c              |   74 +-
 tests/intel/kms_psr2_su.c              |   19 +-
 tests/intel/kms_psr_stress_test.c      |   21 +-
 tests/intel/kms_pwrite_crc.c           |   17 +-
 tests/kms_3d.c                         |   12 +-
 tests/kms_addfb_basic.c                |  353 +--
 tests/kms_async_flips.c                |   81 +-
 tests/kms_atomic.c                     |  145 +-
 tests/kms_atomic_interruptible.c       |   88 +-
 tests/kms_atomic_transition.c          |  148 +-
 tests/kms_bw.c                         |   18 +-
 tests/kms_color.c                      |  125 +-
 tests/kms_concurrent.c                 |   14 +-
 tests/kms_content_protection.c         |  120 +-
 tests/kms_cursor_crc.c                 |  129 +-
 tests/kms_cursor_edge_walk.c           |   19 +-
 tests/kms_cursor_legacy.c              |  431 ++-
 tests/kms_display_modes.c              |   34 +-
 tests/kms_dither.c                     |   27 +-
 tests/kms_dp_aux_dev.c                 |   18 +-
 tests/kms_feature_discovery.c          |   41 +-
 tests/kms_flip.c                       |  155 +-
 tests/kms_flip_event_leak.c            |   17 +-
 tests/kms_force_connector_basic.c      |   53 +-
 tests/kms_getfb.c                      |  142 +-
 tests/kms_hdmi_inject.c                |   22 +-
 tests/kms_hdr.c                        |  105 +-
 tests/kms_invalid_mode.c               |    8 +-
 tests/kms_lease.c                      |   89 +-
 tests/kms_multipipe_modeset.c          |   12 +-
 tests/kms_panel_fitting.c              |   20 +-
 tests/kms_pipe_crc_basic.c             |  117 +-
 tests/kms_plane.c                      |  115 +-
 tests/kms_plane_alpha_blend.c          |   81 +-
 tests/kms_plane_cursor.c               |   19 +-
 tests/kms_plane_lowres.c               |   46 +-
 tests/kms_plane_multiple.c             |   50 +-
 tests/kms_plane_scaling.c              |  354 +--
 tests/kms_prime.c                      |   22 +-
 tests/kms_prop_blob.c                  |   82 +-
 tests/kms_properties.c                 |   42 +-
 tests/kms_rmfb.c                       |   24 +-
 tests/kms_rotation_crc.c               |  204 +-
 tests/kms_scaling_modes.c              |   10 +-
 tests/kms_selftest.c                   |   12 +-
 tests/kms_sequence.c                   |   55 +-
 tests/kms_setmode.c                    |   41 +-
 tests/kms_sysfs_edid_timing.c          |   19 +-
 tests/kms_tiled_display.c              |    9 +-
 tests/kms_tv_load_detect.c             |   10 +-
 tests/kms_universal_plane.c            |   28 +-
 tests/kms_vblank.c                     |   96 +-
 tests/kms_vrr.c                        |   32 +-
 tests/kms_writeback.c                  |   36 +-
 76 files changed, 3615 insertions(+), 5322 deletions(-)

--
2.40.0
