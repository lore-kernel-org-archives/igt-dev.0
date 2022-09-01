Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADB7A10E60E
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Sep 2022 06:37:33 +0000 (UTC)
Received: from maurocar by linux.intel.com with local (Exim 4.95)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1oTdpQ-0016Rc-Q3
 for igt-dev@lists.freedesktop.org; Thu, 01 Sep 2022 08:37:28 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu,  1 Sep 2022 08:36:08 +0200
Message-Id: <20220901063722.261828-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 00/74] Ensure that file descriptors will be
 closed on exit
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

From: Mauro Carvalho Chehab <mchehab@kernel.org>

GCC is usually smart enough to close devices on exit, but that doesn't work
with the logic inside igt_skip(), as it uses longjmp, causing the code to
go out of scope. Such scoped variables must be tracked in an outer scope to
the skipping subtest.

Change the logic on IGT tests in order to avoid keeping device opened at
the end of the test.

Chris Wilson (74):
  lib: Introduce typed cleanups
  i915/gem_basic: Close device before exit
  i915/gem_flink_basic: Close device before exit
  i915/gem_linear_blits: Close device before exit
  i915/gem_blits: Close device before exit
  i915/gem_close: Close device before exit
  i915/gem_create: Close device before exit
  i915/gem_ctx_engines: Close device before exit
  i915/gem_ctx_shared: Close device before exit
  i915/gem_exec_alignment: Close device before exit
  i915/gem_render_copy: Close device before exit
  i915/gem_render_copy_redux: Close device before exit
  i915/gem_media_fill: Close device before exit
  i915/gem_userptr_blits: Close device before exit
  i915/gem_workarounds: Close device before exit
  i915/gem_unref_active_buffers: Close device before exit
  i915/gem_exec_endless: Close device before exit
  i915/gem_request_retire: Close device before exit
  i915/gem_unfence_active_buffers: Close device before exit
  i915/i915_pciid: Close device before exit
  kms_cursor_legacy: Close device before exit
  kms_flip: Close device before exit
  kms_pipe_crc_basic: Close device before exit
  kms_psr: Close device before exit
  kms_flip: Close device before exit
  kms_force_connector_basic: Close device before exit
  dumb_buffer: Close device before exit
  kms_atomic: Close device before exit
  kms_atomic_interruptible: Close device before exit
  kms_atomic_transition: Close device before exit
  i915/kms_big_fb: Close device before exit
  i915/kms_ccs: Close device before exit
  kms_color: Close device before exit
  kms_cursor_crc: Close device before exit
  i915/kms_big_joiner: Close device before exit
  i915/kms_cdclk: Close device before exit
  i915/kms_fence_pin_leak: Close device before exit
  i915/kms_flip_scaled_crc: Close device before exit
  i915/kms_flip_tiling: Close device before exit
  i915/kms_mmap_write_crc: Close device before exit
  i915/kms_pipe_b_c_ivb: Close device before exit
  i915/kms_psr2_sf: Close device before exit
  i915/kms_psr2_su: Close device before exit
  i915/kms_pwrite_crc: Close device before exit
  kms_flip_event_leak: Close device before exit
  kms_hdr: Close device before exit
  kms_invalid_mode: Close device before exit
  kms_lease: Close device before exit
  kms_panel_fitting: Close device before exit
  kms_plane: Close device before exit
  kms_plane_alpha_blend: Close device before exit
  kms_plane_cursor: Close device before exit
  kms_plane_multiple: Close device before exit
  kms_plane_scaling: Close device before exit
  kms_properties: Close device before exit
  kms_rotation_crc: Close device before exit
  kms_sequence: Close device before exit
  kms_universal_plane: Close device before exit
  kms_vblank: Close device before exit
  syncobj_wait: Close device before exit
  syncobj_basic: Close device before exit
  syncobj_timeline: Close device before exit
  drm_import_export: Close device before exit
  kms_dp_aux_dev: Close device before exit
  kms_hdmi_inject: Close device before exit
  kms_3d: Close device before exit
  kms_scaling_modes: Close device before exit
  kms_dither: Close device before exit
  drm_read: Close device before exit
  kms_cursor_edge_walk: Close device before exit
  kms_plane_lowres: Close device before exit
  kms_content_protection: Close device before exit
  feature_discovery: Close device before exit
  i915/i915_pm_dc: Close device before exit

 lib/igt_core.c                          |   6 ++
 lib/igt_core.h                          |   2 +
 lib/igt_types.c                         |  17 +++
 lib/igt_types.h                         |  47 ++++++++
 lib/meson.build                         |   1 +
 lib/tests/bad_subtest_type.c            |  19 ++++
 lib/tests/igt_types.c                   | 136 ++++++++++++++++++++++++
 lib/tests/meson.build                   |   2 +
 tests/drm_import_export.c               |   5 +
 tests/drm_read.c                        |   4 +-
 tests/dumb_buffer.c                     |   4 +
 tests/feature_discovery.c               |   5 +-
 tests/i915/gem_basic.c                  |   8 +-
 tests/i915/gem_blits.c                  |   1 +
 tests/i915/gem_close.c                  |   3 +-
 tests/i915/gem_create.c                 |   3 +-
 tests/i915/gem_ctx_engines.c            |   3 +-
 tests/i915/gem_ctx_shared.c             |   3 +-
 tests/i915/gem_exec_alignment.c         |   3 +-
 tests/i915/gem_exec_endless.c           |   3 +-
 tests/i915/gem_flink_basic.c            |  11 +-
 tests/i915/gem_linear_blits.c           |   3 +-
 tests/i915/gem_media_fill.c             |   1 +
 tests/i915/gem_render_copy.c            |   1 +
 tests/i915/gem_render_copy_redux.c      |   4 +
 tests/i915/gem_request_retire.c         |   5 +-
 tests/i915/gem_unfence_active_buffers.c |   1 +
 tests/i915/gem_unref_active_buffers.c   |   1 +
 tests/i915/gem_userptr_blits.c          |   4 +-
 tests/i915/gem_workarounds.c            |   3 +-
 tests/i915/i915_pciid.c                 |   2 +
 tests/i915/i915_pm_dc.c                 |   1 +
 tests/i915/kms_big_fb.c                 |   1 +
 tests/i915/kms_big_joiner.c             |   1 +
 tests/i915/kms_busy.c                   |   1 +
 tests/i915/kms_ccs.c                    |   4 +-
 tests/i915/kms_cdclk.c                  |   1 +
 tests/i915/kms_fence_pin_leak.c         |   1 +
 tests/i915/kms_flip_scaled_crc.c        |   1 +
 tests/i915/kms_flip_tiling.c            |   1 +
 tests/i915/kms_mmap_write_crc.c         |   1 +
 tests/i915/kms_pipe_b_c_ivb.c           |   1 +
 tests/i915/kms_psr.c                    |   1 +
 tests/i915/kms_psr2_sf.c                |   1 +
 tests/i915/kms_psr2_su.c                |   1 +
 tests/i915/kms_pwrite_crc.c             |   1 +
 tests/kms_3d.c                          |   1 +
 tests/kms_atomic.c                      |   1 +
 tests/kms_atomic_interruptible.c        |   1 +
 tests/kms_atomic_transition.c           |   1 +
 tests/kms_color.c                       |   1 +
 tests/kms_content_protection.c          |   1 +
 tests/kms_cursor_crc.c                  |   1 +
 tests/kms_cursor_edge_walk.c            |   4 +-
 tests/kms_cursor_legacy.c               |   1 +
 tests/kms_dither.c                      |   1 +
 tests/kms_dp_aux_dev.c                  |   1 +
 tests/kms_flip.c                        |   3 +
 tests/kms_flip_event_leak.c             |   1 +
 tests/kms_force_connector_basic.c       |   7 +-
 tests/kms_hdmi_inject.c                 |   1 +
 tests/kms_hdr.c                         |   1 +
 tests/kms_invalid_mode.c                |   1 +
 tests/kms_lease.c                       |   4 +
 tests/kms_panel_fitting.c               |   4 +-
 tests/kms_pipe_crc_basic.c              |   1 +
 tests/kms_plane.c                       |   1 +
 tests/kms_plane_alpha_blend.c           |   1 +
 tests/kms_plane_cursor.c                |   1 +
 tests/kms_plane_lowres.c                |   4 +-
 tests/kms_plane_multiple.c              |   1 +
 tests/kms_plane_scaling.c               |   4 +-
 tests/kms_properties.c                  |   1 +
 tests/kms_rotation_crc.c                |   1 +
 tests/kms_scaling_modes.c               |   4 +-
 tests/kms_sequence.c                    |   4 +
 tests/kms_universal_plane.c             |   1 +
 tests/kms_vblank.c                      |   4 +
 tests/syncobj_basic.c                   |   4 +
 tests/syncobj_timeline.c                |   4 +
 tests/syncobj_wait.c                    |   4 +
 81 files changed, 378 insertions(+), 27 deletions(-)
 create mode 100644 lib/igt_types.c
 create mode 100644 lib/igt_types.h
 create mode 100644 lib/tests/bad_subtest_type.c
 create mode 100644 lib/tests/igt_types.c

-- 
2.37.2
