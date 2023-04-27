Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7706410E09F
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Apr 2023 20:03:51 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 27 Apr 2023 22:02:51 +0200
Message-Id: <20230427200307.240349-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v7 00/16] Integrate intel-bb with Xe
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

Series touches intel-bb + intel-buf which are rendercopy, gpgpu fill and
media fill facilities. Exercise both paths on CI (i915 and xe) to check
there's no regression in common part.

v2: fix allocator issue
v3: address review comments (Kamil)
v4: address review comments (Christoph)
v5: - address review comments (Kamil)
    - add region awareness in bufops (Zbigniew)
v6: alter igt_draw and kms_big_fb to be region aware (Zbigniew)
v7: - separate random->reloc docs fix patch (Kamil)
    - reorganize driver (i915/xe) blocks (Kamil)
    - fix xe_bound issue for single buffer (Zbigniew)

Zbigniew Kempczyński (16):
  lib/xe_ioctl: Add missing header for direct resolving
  lib/xe_query: Add region helpers and missing doc
  lib/xe_query: Remove commented out function prototype
  lib/intel_allocator: Add allocator support for Xe
  lib/drmtest: Add driver enum for i915/xe
  lib/intel_bufops: Add Xe support in bufops
  lib/intel_batchbuffer: Rename i915 -> fd as preparation step for xe
  lib/intel_batchbuffer: Update intel-bb docs
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
 lib/igt_draw.c                           |   14 +-
 lib/igt_fb.c                             |   17 +-
 lib/intel_allocator.c                    |   40 +-
 lib/intel_aux_pgtable.c                  |    2 +-
 lib/intel_batchbuffer.c                  |  421 ++++++--
 lib/intel_batchbuffer.h                  |   22 +-
 lib/intel_bufops.c                       |  123 ++-
 lib/intel_bufops.h                       |   24 +-
 lib/xe/xe_ioctl.h                        |    1 +
 lib/xe/xe_query.c                        |   45 +
 lib/xe/xe_query.h                        |    3 +-
 tests/i915/gem_caching.c                 |    4 +-
 tests/i915/gem_pxp.c                     |    2 +-
 tests/i915/kms_big_fb.c                  |   10 +-
 tests/intel-ci/xe-fast-feedback.testlist |   19 +
 tests/meson.build                        |    2 +
 tests/xe/xe_gpgpu_fill.c                 |  135 +++
 tests/xe/xe_intel_bb.c                   | 1185 ++++++++++++++++++++++
 21 files changed, 1927 insertions(+), 156 deletions(-)
 create mode 100644 tests/xe/xe_gpgpu_fill.c
 create mode 100644 tests/xe/xe_intel_bb.c

-- 
2.34.1
