Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 247E910E1D9
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Apr 2023 11:52:09 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 26 Apr 2023 17:16:40 +0530
Message-Id: <20230426114725.2244653-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V3 00/45] Add IGT display support for XE
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

TODO: Spin, BUSY & HANG related tests.

V2: - Rebase on PW 116578v5
V3: - Rebase on PW 116578v6

Bhanuprakash Modem (30):
  lib/igt_fb: Add copy engine support for XE
  lib/igt_draw: Add gpu draw routine support for XE
  tests/i915/kms_big_fb: Add XE support
  tests/i915/kms_big_joiner: Add XE support
  tests/i915/kms_cdclk: Add XE support
  tests/i915/kms_draw_crc: Add XE support
  tests/i915/kms_dsc: Add XE support
  tests/i915/kms_flip_scaled_crc: Add XE support
  tests/i915/kms_flip_tiling: Add XE support
  tests/i915/kms_mmap_write_crc: Add XE support
  tests/kms_3d: Add XE support
  tests/kms_async_flips: No XE support
  tests/kms_atomic_transition: Add XE support
  tests/color: Add XE support
  tests/kms_concurrent: Add XE support
  tests/kms_content_protection: Add XE support
  tests/kms_cursor_crc: Add XE support
  tests/kms_flip_event_leak: Add XE support
  tests/kms_getfb: Add XE support
  tests/kms_hdmi_inject: Add XE support
  tests/kms_hdr: Add XE support
  tests/kms_panel_fitting: Add XE support
  tests/kms_plane: Add XE support
  tests/kms_plane_lowers: Add XE support
  tests/kms_plane_scaling: Add XE support
  tests/kms_prime: Use Rendercopy instead of Blit
  tests/kms_prime: Add XE support
  tests/kms_rotation_crc: Add XE support
  tests/kms_setmode: Add XE support
  tests/kms_universal_plane: Add XE support

Zbigniew Kempczyński (15):
  lib/xe_ioctl: Add missing header for direct resolving
  lib/xe_query: Add region helpers and missing doc
  lib/xe_query: Remove commented out function prototype
  lib/intel_allocator: Add allocator support for Xe
  lib/drmtest: Add driver enum for i915/xe
  lib/intel_bufops: Add Xe support in bufops
  lib/intel_batchbuffer: Rename i915 -> fd as preparation step for xe
  lib/intel_batchbuffer: Add Xe support in intel-bb
  tests/xe_intel_bb: Check if intel-bb Xe support correctness
  tests/xe-fast-feedback: Add xe_intel_bb test to BAT
  lib/gpgpu_fill: Use RENDER engine flag to work on Xe
  tests/xe_gpgpu_fill: Exercise gpgpu fill on Xe
  lib/igt_fb: For xe assume vram is used on discrete
  lib/igt_draw: Pass region while building intel_buf from flink
  tests/kms_big_fb: Deduce region for xe framebuffer

 lib/drmtest.h                            |    8 +
 lib/gpgpu_fill.c                         |    4 +-
 lib/gpu_cmds.c                           |    2 +-
 lib/igt_draw.c                           |   95 +-
 lib/igt_draw.h                           |    2 +
 lib/igt_fb.c                             |   47 +-
 lib/igt_fb.h                             |    2 +
 lib/intel_allocator.c                    |   40 +-
 lib/intel_aux_pgtable.c                  |    2 +-
 lib/intel_batchbuffer.c                  |  424 ++++++--
 lib/intel_batchbuffer.h                  |   22 +-
 lib/intel_bufops.c                       |  120 ++-
 lib/intel_bufops.h                       |   24 +-
 lib/xe/xe_ioctl.h                        |    1 +
 lib/xe/xe_query.c                        |   45 +
 lib/xe/xe_query.h                        |    3 +-
 tests/chamelium/kms_chamelium_color.c    |    2 +-
 tests/i915/gem_caching.c                 |    4 +-
 tests/i915/gem_pxp.c                     |    2 +-
 tests/i915/kms_big_fb.c                  |   84 +-
 tests/i915/kms_big_joiner.c              |    2 +-
 tests/i915/kms_cdclk.c                   |    5 +-
 tests/i915/kms_draw_crc.c                |   24 +-
 tests/i915/kms_dsc.c                     |    2 +-
 tests/i915/kms_flip_scaled_crc.c         |    8 +-
 tests/i915/kms_flip_tiling.c             |    8 +-
 tests/i915/kms_mmap_write_crc.c          |    4 +-
 tests/intel-ci/xe-fast-feedback.testlist |   19 +
 tests/kms_3d.c                           |    8 +
 tests/kms_async_flips.c                  |    8 +-
 tests/kms_atomic_transition.c            |    8 +-
 tests/kms_color.c                        |   10 +-
 tests/kms_color_helper.c                 |    2 +-
 tests/kms_concurrent.c                   |    4 +-
 tests/kms_content_protection.c           |   12 +-
 tests/kms_cursor_crc.c                   |    4 +-
 tests/kms_flip_event_leak.c              |    5 +
 tests/kms_getfb.c                        |   22 +-
 tests/kms_hdmi_inject.c                  |   10 +-
 tests/kms_hdr.c                          |    8 +-
 tests/kms_panel_fitting.c                |   12 +-
 tests/kms_plane.c                        |   19 +-
 tests/kms_plane_lowres.c                 |    9 +-
 tests/kms_plane_scaling.c                |   41 +-
 tests/kms_prime.c                        |  230 ++++-
 tests/kms_rotation_crc.c                 |   23 +-
 tests/kms_setmode.c                      |    7 +
 tests/kms_universal_plane.c              |   15 +-
 tests/meson.build                        |    2 +
 tests/xe/xe_gpgpu_fill.c                 |  135 +++
 tests/xe/xe_intel_bb.c                   | 1185 ++++++++++++++++++++++
 51 files changed, 2460 insertions(+), 324 deletions(-)
 create mode 100644 tests/xe/xe_gpgpu_fill.c
 create mode 100644 tests/xe/xe_intel_bb.c

--
2.40.0
