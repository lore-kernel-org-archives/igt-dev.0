Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 770A210E447
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Oct 2023 17:36:23 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 24 Oct 2023 19:36:13 +0200
Message-Id: <20231024173618.127007-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v4 0/5] Add flat-ccs tests
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

On DG2 I observe data inconsistency with flat-ccs when buffers are
returning back from system to vram. For the verification first group
of subtests is run on 20% of vram, second on 110% which triggers
eviction. Issue is visible mostly on 'parallel' subtests.

v2: Add different cmdline switches to exercise eviction using different
    sizes and vram overcommitment percent 
v3: Handle mappable vram flag in blitter helper + address some minor
    nits
v4: Remove hwe (Matt) + truncate sizes to SZ_1K+ (Kamil)

Zbigniew Kempczyński (5):
  lib/intel_blt: Release an offset in the allocator on buffer destroy
  lib/intel_blt: Add visible vram flag if object needs to be mapped
  lib/igt_sizes: Add common SZ_* header
  tests/xe_evict_ccs: Add evict ccs test
  intel-ci/xe-fast-feedback: Add two xe_evict_ccs subtests for Xe run

 lib/igt.h                                |   1 +
 lib/igt_sizes.h                          |  33 ++
 lib/intel_blt.c                          |  22 +-
 lib/intel_blt.h                          |   2 +
 lib/xe/xe_query.h                        |   4 +-
 tests/intel-ci/xe-fast-feedback.testlist |   2 +
 tests/intel/gem_exec_async.c             |   2 -
 tests/intel/gem_lmem_swapping.c          |   1 -
 tests/intel/i915_query.c                 |   1 -
 tests/intel/xe_evict.c                   |   3 -
 tests/intel/xe_evict_ccs.c               | 514 +++++++++++++++++++++++
 tests/meson.build                        |   1 +
 tests/msm/msm_shrink.c                   |   2 -
 13 files changed, 574 insertions(+), 14 deletions(-)
 create mode 100644 lib/igt_sizes.h
 create mode 100644 tests/intel/xe_evict_ccs.c

-- 
2.34.1
