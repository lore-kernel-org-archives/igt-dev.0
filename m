Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05FF310F535
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Apr 2022 06:50:15 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 21 Apr 2022 08:50:08 +0200
Message-Id: <20220421065008.24682-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/i915/gem_lmem_swapping: Add
 parallel-random-verify-ccs subtest
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

For this subtest we need to use allocator thread so parallel subtests
need to be executed in allocator multi-process aware environment.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Ramalingam C <ramalingam.c@intel.com>
---
 tests/i915/gem_lmem_swapping.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tests/i915/gem_lmem_swapping.c b/tests/i915/gem_lmem_swapping.c
index e58a1f505f..5d93e9daae 100644
--- a/tests/i915/gem_lmem_swapping.c
+++ b/tests/i915/gem_lmem_swapping.c
@@ -576,6 +576,7 @@ static void test_evict(int i915,
 	if (flags & TEST_PARALLEL) {
 		int fd = gem_reopen_driver(i915);
 
+		intel_allocator_multiprocess_start();
 		ctx = intel_ctx_create_all_physical(fd);
 		__gem_context_set_persistence(fd, ctx->id, false);
 
@@ -586,6 +587,7 @@ static void test_evict(int i915,
 		igt_waitchildren();
 		intel_ctx_destroy(fd, ctx);
 		close(fd);
+		intel_allocator_multiprocess_stop();
 	} else {
 		__do_evict(i915, ctx, &region->region, &params, params.seed);
 	}
@@ -747,6 +749,7 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 		{ "verify-random-ccs", TEST_CCS | TEST_RANDOM },
 		{ "heavy-verify-random-ccs", TEST_CCS | TEST_RANDOM | TEST_HEAVY },
 		{ "heavy-verify-multi-ccs", TEST_CCS | TEST_RANDOM | TEST_HEAVY | TEST_ENGINES | TEST_MULTI },
+		{ "parallel-random-verify-ccs", TEST_PARALLEL | TEST_RANDOM | TEST_CCS },
 		{ }
 	};
 	const intel_ctx_t *ctx;
-- 
2.32.0
