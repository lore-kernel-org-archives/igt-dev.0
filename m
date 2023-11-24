Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9E3E10E7CB
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Nov 2023 09:46:16 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org,
	swati2.sharma@intel.com
Date: Fri, 24 Nov 2023 15:05:57 +0530
Message-Id: <20231124093602.2358565-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t 0/5] Optimize kms tesplan documentation
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
- Avoid duplicate names on Mega feature vs Functionality

V2: Rebase

Bhanuprakash Modem (5):
  tests/kms/testplan: Move testplan documentation to beginning of the
    file
  tests/kms/testplan: Regroup testplan documentation
  tests/kms/testplan: Optimize KMS testplan documentation
  tests/kms/testplan: Fix Mega Feature in testplan documentation
  tests/kms/testplan: Avoid duplicate names on Mega feature vs
    Functionality

 tests/chamelium/kms_chamelium_audio.c  |   68 +-
 tests/chamelium/kms_chamelium_color.c  |   59 +-
 tests/chamelium/kms_chamelium_edid.c   |  181 +-
 tests/chamelium/kms_chamelium_frames.c |  181 +-
 tests/chamelium/kms_chamelium_hpd.c    |  362 +-
 tests/intel/kms_big_fb.c               |  275 +-
 tests/intel/kms_big_joiner.c           |   42 +-
 tests/intel/kms_busy.c                 |   90 +-
 tests/intel/kms_ccs.c                  |   16 +-
 tests/intel/kms_cdclk.c                |   41 +-
 tests/intel/kms_dirtyfb.c              |   24 +-
 tests/intel/kms_draw_crc.c             |   72 +-
 tests/intel/kms_dsc.c                  |    9 +-
 tests/intel/kms_fb_coherency.c         |   21 +-
 tests/intel/kms_fbcon_fbt.c            |   26 +-
 tests/intel/kms_fence_pin_leak.c       |   11 +-
 tests/intel/kms_flip_scaled_crc.c      |   71 +-
 tests/intel/kms_flip_tiling.c          |   11 +-
 tests/intel/kms_frontbuffer_tracking.c | 5746 +++++++++++-------------
 tests/intel/kms_legacy_colorkey.c      |   18 +-
 tests/intel/kms_mmap_write_crc.c       |   13 +-
 tests/intel/kms_pipe_b_c_ivb.c         |   29 +-
 tests/intel/kms_pm_backlight.c         |   33 +-
 tests/intel/kms_pm_dc.c                |   43 +-
 tests/intel/kms_pm_lpsp.c              |   20 +-
 tests/intel/kms_pm_rpm.c               |    4 +
 tests/intel/kms_psr.c                  |  155 +-
 tests/intel/kms_psr2_sf.c              |   49 +-
 tests/intel/kms_psr2_su.c              |   20 +-
 tests/intel/kms_psr_stress_test.c      |   22 +-
 tests/intel/kms_pwrite_crc.c           |   10 +-
 tests/kms_3d.c                         |    9 +-
 tests/kms_addfb_basic.c                |  356 +-
 tests/kms_async_flips.c                |   82 +-
 tests/kms_atomic.c                     |  141 +-
 tests/kms_atomic_interruptible.c       |   88 +-
 tests/kms_atomic_transition.c          |  157 +-
 tests/kms_bw.c                         |   19 +-
 tests/kms_color.c                      |  124 +-
 tests/kms_concurrent.c                 |    9 +-
 tests/kms_content_protection.c         |  120 +-
 tests/kms_cursor_crc.c                 |  131 +-
 tests/kms_cursor_edge_walk.c           |   20 +-
 tests/kms_cursor_legacy.c              |  426 +-
 tests/kms_display_modes.c              |   34 +-
 tests/kms_dither.c                     |   28 +-
 tests/kms_dp_aux_dev.c                 |   11 +-
 tests/kms_feature_discovery.c          |   43 +-
 tests/kms_flip.c                       |  229 +-
 tests/kms_flip_event_leak.c            |   10 +-
 tests/kms_force_connector_basic.c      |   52 +-
 tests/kms_getfb.c                      |  139 +-
 tests/kms_hdmi_inject.c                |   25 +-
 tests/kms_hdr.c                        |  106 +-
 tests/kms_invalid_mode.c               |    9 +-
 tests/kms_lease.c                      |   88 +-
 tests/kms_multipipe_modeset.c          |    7 +-
 tests/kms_panel_fitting.c              |   23 +-
 tests/kms_pipe_crc_basic.c             |  120 +-
 tests/kms_plane.c                      |  114 +-
 tests/kms_plane_alpha_blend.c          |   82 +-
 tests/kms_plane_cursor.c               |   20 +-
 tests/kms_plane_lowres.c               |   47 +-
 tests/kms_plane_multiple.c             |   51 +-
 tests/kms_plane_scaling.c              |  400 +-
 tests/kms_prime.c                      |   26 +-
 tests/kms_prop_blob.c                  |   84 +-
 tests/kms_properties.c                 |   43 +-
 tests/kms_rmfb.c                       |   25 +-
 tests/kms_rotation_crc.c               |  202 +-
 tests/kms_scaling_modes.c              |   13 +-
 tests/kms_selftest.c                   |   13 +-
 tests/kms_sequence.c                   |   56 +-
 tests/kms_setmode.c                    |   40 +-
 tests/kms_sysfs_edid_timing.c          |   12 +-
 tests/kms_tiled_display.c              |   10 +-
 tests/kms_tv_load_detect.c             |    7 +-
 tests/kms_universal_plane.c            |   33 +-
 tests/kms_vblank.c                     |   61 +-
 tests/kms_vrr.c                        |   33 +-
 tests/kms_writeback.c                  |   43 +-
 tests/testdisplay.c                    |   12 +-
 82 files changed, 5026 insertions(+), 6729 deletions(-)

--
2.40.0
