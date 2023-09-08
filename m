Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0F8E10E04B
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Sep 2023 10:32:37 +0000 (UTC)
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  8 Sep 2023 12:31:42 +0200
Message-ID: <20230908103218.1089792-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v5 00/11] Xe: set Run type from testlist
 instead of defining it
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: tomasz.mistat@intel.com, jari.tahvanainen@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Mauro Carvalho Chehab <mchehab@kernel.org>

Right now, we're keeping testlists both at documentation and on
separate testlist files. That makes harder to maintain. It also
requires splitting wildcards on multiple fields just due to that.

In the end, only the testlist files are updated.

So, simplify the maintainance by reading the testlists and parsing
them directly.

This will also handle tests that are blacklisted for all platforms.

---

v5:
  - Restored patch descriptions modified due to previous reviews;
  - No changes at the patches.

v4:
  - XLS spreadsheet output format improved;
  - XLS logic can now split fields per their values. This is used for
    GPU excluded platform field, as this is meant to indicate that a
    test is blacklisted due to the lack of hardware support on a given
    platform;
  - When updating fields from testlists/blocklists, only store
    value when it is not empty and don't have a default value;
  - remove a broken logic of trying to automate adding a prefix to
    testlists.

v3:
  - Added a patch to handle testlist/blacklist regular expressions
    the same way as done by IGT runner

v2:
  - v2: no changes. Just rebased on the top of current TIP

Mauro Carvalho Chehab (11):
  test_list.py: add support for reading testlist regular expressions
  xe_test_config.json: add testlists and blocklists
  kms_test_config.json: add testlists and blocklists
  tests: Intel Xe: drop Run type field
  tests: Intel KMS: drop Run type field
  scripts/test_list.py: move "FULL" testlist to config file
  scripts/test_list.py: don't be greedy while matching data from
    testlists
  scripts/test_list.py: fix gen_testlist logic
  scripts/test_list.py: add support for expanding fields on spreadsheet
  scripts/doc_to_xls.py: expand GPU excluded platform
  scripts/doc_to_xls.py: improve XLS output format

 scripts/doc_to_xls.py                  |  22 ++-
 scripts/test_list.py                   | 119 +++++++++++++-
 tests/chamelium/kms_chamelium_audio.c  |   4 -
 tests/chamelium/kms_chamelium_color.c  |   3 -
 tests/chamelium/kms_chamelium_edid.c   |  10 --
 tests/chamelium/kms_chamelium_frames.c |  10 --
 tests/chamelium/kms_chamelium_hpd.c    |  25 ---
 tests/intel/kms_big_fb.c               |  12 --
 tests/intel/kms_big_joiner.c           |   3 -
 tests/intel/kms_busy.c                 |   5 -
 tests/intel/kms_ccs.c                  |   3 -
 tests/intel/kms_cdclk.c                |   3 -
 tests/intel/kms_draw_crc.c             |   3 -
 tests/intel/kms_dsc.c                  |   1 -
 tests/intel/kms_fb_coherency.c         |   1 -
 tests/intel/kms_fbcon_fbt.c            |   4 -
 tests/intel/kms_fence_pin_leak.c       |   1 -
 tests/intel/kms_flip_scaled_crc.c      |  19 ---
 tests/intel/kms_flip_tiling.c          |   1 -
 tests/intel/kms_frontbuffer_tracking.c | 206 -------------------------
 tests/intel/kms_legacy_colorkey.c      |   2 -
 tests/intel/kms_mmap_write_crc.c       |   1 -
 tests/intel/kms_pipe_b_c_ivb.c         |   5 -
 tests/intel/kms_psr.c                  |  19 ---
 tests/intel/kms_psr2_sf.c              |   8 -
 tests/intel/kms_psr2_su.c              |   2 -
 tests/intel/kms_psr_stress_test.c      |   2 -
 tests/intel/kms_pwrite_crc.c           |   1 -
 tests/intel/kms_test_config.json       |  15 +-
 tests/intel/xe_ccs.c                   |   1 -
 tests/intel/xe_compute.c               |   1 -
 tests/intel/xe_create.c                |   2 -
 tests/intel/xe_debugfs.c               |   1 -
 tests/intel/xe_dma_buf_sync.c          |   4 -
 tests/intel/xe_evict.c                 |  10 --
 tests/intel/xe_exec_balancer.c         |  11 --
 tests/intel/xe_exec_basic.c            |   6 -
 tests/intel/xe_exec_compute_mode.c     |   4 -
 tests/intel/xe_exec_fault_mode.c       |   8 -
 tests/intel/xe_exec_reset.c            |  23 ---
 tests/intel/xe_exec_store.c            |   2 -
 tests/intel/xe_exec_threads.c          |   2 -
 tests/intel/xe_exercise_blt.c          |   1 -
 tests/intel/xe_gpgpu_fill.c            |   1 -
 tests/intel/xe_guc_pc.c                |   9 --
 tests/intel/xe_huc_copy.c              |   1 -
 tests/intel/xe_intel_bb.c              |  13 --
 tests/intel/xe_live_ktest.c            |   1 -
 tests/intel/xe_media_fill.c            |   1 -
 tests/intel/xe_mmap.c                  |   1 -
 tests/intel/xe_mmio.c                  |   1 -
 tests/intel/xe_module_load.c           |   6 -
 tests/intel/xe_noexec_ping_pong.c      |   1 -
 tests/intel/xe_pm.c                    |   2 -
 tests/intel/xe_pm_residency.c          |   4 -
 tests/intel/xe_prime_self_import.c     |   8 -
 tests/intel/xe_query.c                 |   1 -
 tests/intel/xe_spin_batch.c            |   4 -
 tests/intel/xe_sysfs_defaults.c        |   1 -
 tests/intel/xe_sysfs_scheduler.c       |   1 -
 tests/intel/xe_sysfs_tile.c            |   1 -
 tests/intel/xe_test_config.json        |   7 +
 tests/intel/xe_uevent.c                |   1 -
 tests/intel/xe_vm.c                    |  22 ---
 tests/intel/xe_waitfence.c             |   1 -
 tests/kms_3d.c                         |   1 -
 tests/kms_addfb_basic.c                |  27 ----
 tests/kms_async_flips.c                |   6 -
 tests/kms_atomic.c                     |   8 -
 tests/kms_atomic_interruptible.c       |   5 -
 tests/kms_atomic_transition.c          |   7 -
 tests/kms_bw.c                         |   1 -
 tests/kms_color.c                      |   7 -
 tests/kms_concurrent.c                 |   1 -
 tests/kms_content_protection.c         |   7 -
 tests/kms_cursor_crc.c                 |   4 -
 tests/kms_cursor_edge_walk.c           |   1 -
 tests/kms_cursor_legacy.c              |  16 --
 tests/kms_display_modes.c              |   2 -
 tests/kms_dither.c                     |   2 -
 tests/kms_dp_aux_dev.c                 |   1 -
 tests/kms_flip.c                       |  26 ----
 tests/kms_flip_event_leak.c            |   1 -
 tests/kms_force_connector_basic.c      |   4 -
 tests/kms_getfb.c                      |   7 -
 tests/kms_hdmi_inject.c                |   2 -
 tests/kms_hdr.c                        |   8 -
 tests/kms_invalid_mode.c               |   1 -
 tests/kms_lease.c                      |  21 ---
 tests/kms_multipipe_modeset.c          |   1 -
 tests/kms_panel_fitting.c              |   2 -
 tests/kms_pipe_crc_basic.c             |   9 --
 tests/kms_plane.c                      |   6 -
 tests/kms_plane_alpha_blend.c          |   4 -
 tests/kms_plane_cursor.c               |   3 -
 tests/kms_plane_lowres.c               |   2 -
 tests/kms_plane_multiple.c             |   2 -
 tests/kms_plane_scaling.c              |  21 ---
 tests/kms_prime.c                      |   3 -
 tests/kms_prop_blob.c                  |   4 -
 tests/kms_properties.c                 |   2 -
 tests/kms_rmfb.c                       |   2 -
 tests/kms_rotation_crc.c               |  10 --
 tests/kms_scaling_modes.c              |   1 -
 tests/kms_selftest.c                   |   1 -
 tests/kms_sequence.c                   |   2 -
 tests/kms_setmode.c                    |   6 -
 tests/kms_sysfs_edid_timing.c          |   1 -
 tests/kms_tiled_display.c              |   2 -
 tests/kms_tv_load_detect.c             |   1 -
 tests/kms_universal_plane.c            |   4 -
 tests/kms_vblank.c                     |   9 --
 tests/kms_vrr.c                        |   5 -
 tests/kms_writeback.c                  |   4 -
 tests/testdisplay.c                    |   1 -
 115 files changed, 152 insertions(+), 796 deletions(-)

-- 
2.41.0
