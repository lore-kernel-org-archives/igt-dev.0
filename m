Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCB9C10E40B
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Sep 2023 12:46:25 +0000 (UTC)
From: Nirmoy Das <nirmoy.das@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 12 Sep 2023 14:46:12 +0200
Message-ID: <20230912124613.27850-3-nirmoy.das@intel.com>
In-Reply-To: <20230912124613.27850-1-nirmoy.das@intel.com>
References: <20230912124613.27850-1-nirmoy.das@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH igt-dii-client 2/3] tests/intel/gem_ctx_shared:
 Skip some test on MTL
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: andi.shyti@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

We do GGTT update on MTL using bcs engine, blocking that would
will fail the test so skip such subtests on bcs engine for MTL.

Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 tests/intel/gem_ctx_shared.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/tests/intel/gem_ctx_shared.c b/tests/intel/gem_ctx_shared.c
index d24ae54831..bad0324178 100644
--- a/tests/intel/gem_ctx_shared.c
+++ b/tests/intel/gem_ctx_shared.c
@@ -1105,22 +1105,26 @@ igt_main
 
 			igt_subtest_with_dynamic("Q-independent") {
 				for_each_queue(e, i915, &cfg)
-					independent(i915, &cfg, e, 0);
+					if (!(gem_has_ggtt_bind(i915) && e->class == I915_ENGINE_CLASS_COPY))
+						independent(i915, &cfg, e, 0);
 			}
 
 			igt_subtest_with_dynamic("Q-in-order") {
 				for_each_queue(e, i915, &cfg)
-					reorder(i915, &cfg, e->flags, EQUAL);
+					if (!(gem_has_ggtt_bind(i915) && e->class == I915_ENGINE_CLASS_COPY))
+						reorder(i915, &cfg, e->flags, EQUAL);
 			}
 
 			igt_subtest_with_dynamic("Q-out-order") {
 				for_each_queue(e, i915, &cfg)
-					reorder(i915, &cfg, e->flags, 0);
+					if (!(gem_has_ggtt_bind(i915) && e->class == I915_ENGINE_CLASS_COPY))
+						reorder(i915, &cfg, e->flags, 0);
 			}
 
 			igt_subtest_with_dynamic("Q-promotion") {
 				for_each_queue(e, i915, &cfg)
-					promotion(i915, &cfg, e->flags);
+					if (!(gem_has_ggtt_bind(i915) && e->class == I915_ENGINE_CLASS_COPY))
+						promotion(i915, &cfg, e->flags);
 			}
 		}
 
-- 
2.41.0
