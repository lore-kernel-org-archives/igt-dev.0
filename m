Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DE5410E649
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Oct 2022 08:54:48 +0000 (UTC)
From: Karolina Drobnik <karolina.drobnik@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 21 Oct 2022 10:54:40 +0200
Message-Id: <cover.1666337964.git.karolina.drobnik@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/3] Add support for intel_ctx_t in intel_bb
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

Currently, intel_bb assumes that context has a fixed set of engines, which
might not be the case for contexts passed from the userspace. They may use
a custom engines layout, so the legacy flags like I915_EXEC_BLT wouldn't
match the actual engine indices.

To address this issue, the series adds an additional field to intel_bb,
intel_ctx_cfg_t (intel_ctx_t configuration), that describes the engine
instances, together with an engine index lookup function, find_engine().
The function added in the second patch is used by intel_bb_flush_render()
and intel_bb_flush_blit() helpers.

The last patch in the series adds a test where we define a context with
the blitter engine at index 0 (1 in the legacy mode) to verify that
(1) intel_bb can indeed handle external contexts, and (2) intel_bb_exec gets
the correct engine id in intel_bb_flush_blit().

Karolina Drobnik (3):
  lib/intel_batchbuffer: Extend __intel_bb_create to handle context
    config
  lib/intel_batchbuffer: Add support for custom engine layouts
  tests/api_intel_bb: Add misplaced_blitter test

 lib/igt_draw.c                  |  2 +-
 lib/intel_batchbuffer.c         | 86 +++++++++++++++++++++++++--------
 lib/intel_batchbuffer.h         |  6 ++-
 lib/media_fill.c                |  2 +-
 tests/i915/api_intel_bb.c       | 36 +++++++++++++-
 tests/i915/gem_ppgtt.c          |  2 +-
 tests/i915/gem_pxp.c            | 16 +++---
 tests/i915/kms_fence_pin_leak.c |  2 +-
 tests/i915/perf.c               | 18 +++----
 9 files changed, 126 insertions(+), 44 deletions(-)

--
2.25.1
