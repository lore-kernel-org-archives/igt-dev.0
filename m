Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 088E989C80
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Dec 2019 03:41:13 +0000 (UTC)
From: Imre Deak <imre.deak@intel.com>
Date: Mon, 30 Dec 2019 05:40:30 +0200
Message-Id: <20191230034040.21943-1-imre.deak@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 00/10] lib: Add support and coverage for MC
 YUV formats
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

For a reasonable test coverage of the display's media decompression
functionality this patchset adds support and subtests for media
compressed YUV formats (using the Vebox engine).

Cc: Mika Kahola <mika.kahola@intel.com>

Imre Deak (9):
  lib/igt_buf: Use compression type consistently
  lib/igt_buf: Extend igt_buf to include two CCS surfaces
  lib/igt_buf: Extend igt_buf to include two color surfaces
  lib: Add engine copy support for YUV formats
  Revert "tests/kms_plane: Disable GEN12 media compression YUV tests"
  tests/kms_ccs: Add support for testing multiple formats
  tests/kms_ccs: Work around CRC mismatch when mixing SDR/HDR planes
  tests/kms_ccs: Test YUV formats too
  tests/kms_ccs: Add option to check the CCS planes

Mika Kahola (1):
  tests/kms_ccs: Add GEN12 CCS media compression format modifier

 lib/gpu_cmds.c                       |   4 +-
 lib/igt_draw.c                       |   8 +-
 lib/igt_fb.c                         |  99 ++++++++++++++++++--
 lib/igt_fb.h                         |   4 +
 lib/intel_aux_pgtable.c              | 130 +++++++++++++++++++++++----
 lib/intel_batchbuffer.c              |   8 +-
 lib/intel_batchbuffer.h              |  17 +++-
 lib/rendercopy_gen4.c                |   4 +-
 lib/rendercopy_gen6.c                |   4 +-
 lib/rendercopy_gen7.c                |   4 +-
 lib/rendercopy_gen8.c                |   4 +-
 lib/rendercopy_gen9.c                |  18 ++--
 lib/rendercopy_i830.c                |   8 +-
 lib/rendercopy_i915.c                |   8 +-
 lib/veboxcopy_gen12.c                |  64 +++++++++++--
 tests/i915/gem_concurrent_all.c      |  10 ++-
 tests/i915/gem_gpgpu_fill.c          |   4 +-
 tests/i915/gem_media_fill.c          |   4 +-
 tests/i915/gem_media_vme.c           |   6 +-
 tests/i915/gem_ppgtt.c               |   8 +-
 tests/i915/gem_read_read_speed.c     |  10 ++-
 tests/i915/gem_render_copy.c         |  43 ++++-----
 tests/i915/gem_render_copy_redux.c   |   4 +-
 tests/i915/gem_render_linear_blits.c |  24 ++---
 tests/i915/gem_render_tiled_blits.c  |   8 +-
 tests/i915/gem_ring_sync_copy.c      |   4 +-
 tests/i915/gem_stress.c              |  59 ++++++------
 tests/i915/i915_pm_sseu.c            |   7 +-
 tests/kms_big_fb.c                   |  10 ++-
 tests/kms_ccs.c                      | 120 ++++++++++++++++++++++---
 tests/kms_plane.c                    |   7 --
 tests/kms_psr.c                      |   4 +-
 tests/perf.c                         |   4 +-
 33 files changed, 540 insertions(+), 180 deletions(-)

-- 
2.23.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
