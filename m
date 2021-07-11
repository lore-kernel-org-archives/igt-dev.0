Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24A516EB84
 for <igt-dev@lists.freedesktop.org>; Sun, 11 Jul 2021 06:12:23 +0000 (UTC)
From: Lucas De Marchi <lucas.demarchi@intel.com>
Date: Sat, 10 Jul 2021 23:12:02 -0700
Message-Id: <20210711061211.2879015-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v2 0/9] Start cleanup of local macros/structs
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

We have a lot of LOCAL leftovers because:

a) we needed a test before landing the kernel API, or
b) in the past we didn't copy the kernel headers, or
c) it's done everywhere, so people just copy and paste

There are still some lingering in there, but this should cover the major
part.

v2: Rebase

Lucas De Marchi (9):
  include/drm-uapi: sync kernel headers
  Remove local copies of I915 macros
  tests/i915/gem_mmap_wc: drop LOCAL_IOCTL_I915_GEM_MMAP_v2
  lib/ioctl_wrappers: drop gem_require_stolen_support()
  benchmarks/gem_exec_tracer: nuke LOCAL_IOCTL_I915_GEM_EXECBUFFER2_WR
  benchmarks/gem_busy: nuke LOCAL_IOCTL_SYNCOBJ_CREATE
  benchmarks/gem_busy: nuke LOCAL_IOCTL_SYNCOBJ_WAIT
  Nuke local versions of DRM_FORMAT and DRM_MODE
  tests/kms_sequence: nuke local drm definitions

 benchmarks/gem_busy.c             |  25 +--
 benchmarks/gem_exec_tracer.c      |   5 +-
 include/drm-uapi/amdgpu_drm.h     |  93 +++++++++--
 include/drm-uapi/drm.h            | 250 +++++++++++++++++++++++-------
 include/drm-uapi/drm_fourcc.h     |  74 ++++++++-
 include/drm-uapi/drm_mode.h       | 195 +++++++++++++++++------
 include/drm-uapi/etnaviv_drm.h    |   3 +
 include/drm-uapi/exynos_drm.h     |   2 +-
 include/drm-uapi/lima_drm.h       | 176 +++++++++++++++++++++
 include/drm-uapi/msm_drm.h        |  32 +++-
 include/drm-uapi/nouveau_drm.h    |   1 +
 include/drm-uapi/panfrost_drm.h   |   1 +
 include/drm-uapi/virtgpu_drm.h    |  39 ++++-
 include/drm-uapi/vmwgfx_drm.h     |  33 +++-
 lib/igt_fb.c                      |  68 ++++----
 lib/ioctl_wrappers.c              |  28 ----
 lib/ioctl_wrappers.h              |  45 ------
 tests/amdgpu/amd_bypass.c         |   2 +-
 tests/debugfs_test.c              |   2 +-
 tests/drm_read.c                  |   2 +-
 tests/i915/gem_eio.c              |   2 +-
 tests/i915/gem_exec_reloc.c       |   2 +-
 tests/i915/gem_mmap_wc.c          |  15 +-
 tests/i915/i915_fb_tiling.c       |   2 +-
 tests/i915/i915_getparams_basic.c |   6 +-
 tests/i915/i915_pm_backlight.c    |   2 +-
 tests/i915/i915_pm_dc.c           |   4 +-
 tests/i915/i915_pm_lpsp.c         |   2 +-
 tests/i915/i915_pm_rpm.c          |  16 +-
 tests/i915/perf_pmu.c             |   2 +-
 tests/kms_3d.c                    |   2 +-
 tests/kms_addfb_basic.c           |  68 ++++----
 tests/kms_async_flips.c           |   8 +-
 tests/kms_atomic.c                |   4 +-
 tests/kms_atomic_interruptible.c  |   6 +-
 tests/kms_atomic_transition.c     |  12 +-
 tests/kms_big_fb.c                |   4 +-
 tests/kms_big_joiner.c            |   2 +-
 tests/kms_busy.c                  |   6 +-
 tests/kms_ccs.c                   |  18 +--
 tests/kms_chamelium.c             |  26 ++--
 tests/kms_color.c                 |  20 +--
 tests/kms_color_chamelium.c       |  24 +--
 tests/kms_concurrent.c            |   4 +-
 tests/kms_content_protection.c    |   4 +-
 tests/kms_cursor_crc.c            |  12 +-
 tests/kms_cursor_edge_walk.c      |   4 +-
 tests/kms_cursor_legacy.c         |   2 +-
 tests/kms_dither.c                |   2 +-
 tests/kms_dp_dsc.c                |   2 +-
 tests/kms_dp_tiled_display.c      |   2 +-
 tests/kms_draw_crc.c              |  24 +--
 tests/kms_fbcon_fbt.c             |   2 +-
 tests/kms_fence_pin_leak.c        |   4 +-
 tests/kms_flip.c                  |   4 +-
 tests/kms_flip_event_leak.c       |   4 +-
 tests/kms_flip_scaled_crc.c       |  28 ++--
 tests/kms_flip_tiling.c           |  48 +++---
 tests/kms_frontbuffer_tracking.c  |  10 +-
 tests/kms_hdmi_inject.c           |   4 +-
 tests/kms_invalid_dotclock.c      |   2 +-
 tests/kms_lease.c                 | 109 +++----------
 tests/kms_mmap_write_crc.c        |   4 +-
 tests/kms_multipipe_modeset.c     |   2 +-
 tests/kms_panel_fitting.c         |  10 +-
 tests/kms_pipe_crc_basic.c        |   8 +-
 tests/kms_plane.c                 |  10 +-
 tests/kms_plane_alpha_blend.c     |  20 +--
 tests/kms_plane_lowres.c          |   8 +-
 tests/kms_plane_multiple.c        |  12 +-
 tests/kms_plane_scaling.c         |  20 +--
 tests/kms_prime.c                 |   4 +-
 tests/kms_properties.c            |   2 +-
 tests/kms_psr.c                   |   6 +-
 tests/kms_psr2_sf.c               |  14 +-
 tests/kms_psr2_su.c               |   4 +-
 tests/kms_pwrite_crc.c            |   4 +-
 tests/kms_rmfb.c                  |   4 +-
 tests/kms_rotation_crc.c          |  64 ++++----
 tests/kms_sequence.c              |  40 ++---
 tests/kms_setmode.c               |   2 +-
 tests/kms_universal_plane.c       |  24 +--
 tests/kms_vblank.c                |   2 +-
 tests/kms_vrr.c                   |   4 +-
 tests/nouveau_crc.c               |   4 +-
 tests/prime_mmap_kms.c            |   2 +-
 tests/prime_vgem.c                |   2 +-
 tests/testdisplay.c               |   8 +-
 tools/intel_dp_compliance.c       |   8 +-
 tools/intel_residency.c           |   4 +-
 tools/msm_dp_compliance.c         |   4 +-
 91 files changed, 1173 insertions(+), 727 deletions(-)
 create mode 100644 include/drm-uapi/lima_drm.h

-- 
2.31.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
