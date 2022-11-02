Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BB1410E054
 for <igt-dev@lists.freedesktop.org>; Wed,  2 Nov 2022 12:15:18 +0000 (UTC)
From: Karolina Drobnik <karolina.drobnik@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed,  2 Nov 2022 13:15:11 +0100
Message-Id: <cover.1667391118.git.karolina.drobnik@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v4 0/3] Add support for intel_ctx_t in
 intel_bb
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

v4:
  - Capture memcmp() return value in a variable and check it after freeing
    resources in misplaced_blitter()
  - Free src and dst intel_bufs in misplaced_blitter() (as they were only
    being unmapped in the previous version)

v3:
  - Add config param to intel_bb_create_full() and
    intel_bb_create_with_allocator()
  - Move gem_require_context() check to the subtest definition
  - Remove unnecessary brackets in has_ctx_cfg()
  - Use igt_assert_f() to show an error message in find_engine()
  - Remove redundant intel_bb_emit_bbe() call in misplaced_blitter()
  - Add blitter copy instruction to misplaced_blitter() to make sure we
    found the correct engine (as it turns out, MI_FLUSH_DW executes on
    render engine with no hang or whatsoever)

v2:
  - Add a blank line, removed by mistake, in __intel_bb_create()
  - Update intel_bb_create_with_relocs_and_context() to handle
    intel_ctx_cfg_t
  - Rewrite find_engine() to return engine id, and update
    intel_bb_flush_render() and intel_bb_flush_blit() accordingly
  - Add MI_FLUSH_DW (a command that is available on blitter but not
    on render) to make sure we actually execute the batch buffer on the
    expected engine

    All above suggested by Zbigniew

Karolina Drobnik (3):
  lib/intel_batchbuffer: Extend __intel_bb_create to handle context
    config
  lib/intel_batchbuffer: Add support for custom engine layouts
  tests/api_intel_bb: Add misplaced_blitter test

 lib/igt_draw.c                  |   2 +-
 lib/intel_batchbuffer.c         | 100 +++++++++++++++++++++++++-------
 lib/intel_batchbuffer.h         |  15 +++--
 lib/media_fill.c                |   2 +-
 tests/i915/api_intel_bb.c       |  82 +++++++++++++++++++++++---
 tests/i915/gem_ppgtt.c          |   2 +-
 tests/i915/gem_pxp.c            |  16 ++---
 tests/i915/kms_fence_pin_leak.c |   2 +-
 tests/i915/perf.c               |  18 +++---
 9 files changed, 183 insertions(+), 56 deletions(-)

--
2.25.1
