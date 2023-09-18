Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0DFA10E0E4
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Sep 2023 16:48:22 +0000 (UTC)
From: Nirmoy Das <nirmoy.das@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 18 Sep 2023 18:47:45 +0200
Message-ID: <20230918164747.30171-3-nirmoy.das@intel.com>
In-Reply-To: <20230918164747.30171-1-nirmoy.das@intel.com>
References: <20230918164747.30171-1-nirmoy.das@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/4] tests/intel/gem_ctx_shared: Skip some
 test on MTL
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: andi.shyti@intel.com, oak.zeng@intel.com, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

We do GGTT update on MTL using bcs engine, blocking that would
fail the test so skip such subtests on bcs engine for MTL.

Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/intel/gem_ctx_shared.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/tests/intel/gem_ctx_shared.c b/tests/intel/gem_ctx_shared.c
index d24ae5483..fd429306e 100644
--- a/tests/intel/gem_ctx_shared.c
+++ b/tests/intel/gem_ctx_shared.c
@@ -1047,6 +1047,12 @@ static void smoketest(int i915, const intel_ctx_cfg_t *cfg,
 		for_each_if(gem_class_can_store_dword(i915, (e)->class)) \
 			igt_dynamic_f("%s", e->name)
 
+#define for_each_nonblocking_ggtt_binder_queue(e, i915, cfg) \
+	for_each_ctx_cfg_engine(i915, cfg, e) \
+		for_each_if(gem_class_can_store_dword(i915, (e)->class) && \
+			    !gem_engine_can_block_ggtt_binder(i915, e)) \
+			igt_dynamic_f("%s", e->name)
+
 igt_main
 {
 	const struct intel_execution_engine2 *e;
@@ -1104,22 +1110,22 @@ igt_main
 			}
 
 			igt_subtest_with_dynamic("Q-independent") {
-				for_each_queue(e, i915, &cfg)
+				for_each_nonblocking_ggtt_binder_queue(e, i915, &cfg)
 					independent(i915, &cfg, e, 0);
 			}
 
 			igt_subtest_with_dynamic("Q-in-order") {
-				for_each_queue(e, i915, &cfg)
+				for_each_nonblocking_ggtt_binder_queue(e, i915, &cfg)
 					reorder(i915, &cfg, e->flags, EQUAL);
 			}
 
 			igt_subtest_with_dynamic("Q-out-order") {
-				for_each_queue(e, i915, &cfg)
+				for_each_nonblocking_ggtt_binder_queue(e, i915, &cfg)
 					reorder(i915, &cfg, e->flags, 0);
 			}
 
 			igt_subtest_with_dynamic("Q-promotion") {
-				for_each_queue(e, i915, &cfg)
+				for_each_nonblocking_ggtt_binder_queue(e, i915, &cfg)
 					promotion(i915, &cfg, e->flags);
 			}
 		}
-- 
2.41.0
