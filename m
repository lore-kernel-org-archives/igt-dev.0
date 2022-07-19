Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69C4218A0DB
 for <igt-dev@lists.freedesktop.org>; Tue, 19 Jul 2022 11:10:45 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 19 Jul 2022 13:10:35 +0200
Message-Id: <20220719111036.26176-2-zbigniew.kempczynski@intel.com>
In-Reply-To: <20220719111036.26176-1-zbigniew.kempczynski@intel.com>
References: <20220719111036.26176-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 1/2] tests/i915/perf_pmu: Add softpin
 flag for no-reloc path
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

As Chris noticed semaphore object doesn't have EXEC_OBJECT_PINNED flag.
It is likely not a problem as we provide offsets from reloc allocator
thus there's no risk of overlapping offsets. But for purity ensure
we passed pinned flag when we're in softpin mode.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 tests/i915/perf_pmu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/i915/perf_pmu.c b/tests/i915/perf_pmu.c
index 1e385bebc7..39e9fc5fef 100644
--- a/tests/i915/perf_pmu.c
+++ b/tests/i915/perf_pmu.c
@@ -861,6 +861,7 @@ __sema_busy(int gem_fd, uint64_t ahnd, int pmu, const intel_ctx_t *ctx,
 		.handle = create_sema(gem_fd, ahnd, reloc, &obj.offset),
 		.relocation_count = !ahnd ? 2 : 0,
 		.relocs_ptr = to_user_pointer(reloc),
+		.flags = !ahnd ? 0 : EXEC_OBJECT_PINNED,
 	};
 	struct drm_i915_gem_execbuffer2 eb = {
 		.batch_start_offset = 64,
-- 
2.34.1
