Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E835510EA37
 for <igt-dev@lists.freedesktop.org>; Mon, 24 Jan 2022 14:54:30 +0000 (UTC)
From: priyanka.dandamudi@intel.com
Date: Mon, 24 Jan 2022 20:12:13 +0530
Message-Id: <20220124144213.1900452-1-priyanka.dandamudi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/i915/i915_hangman : Skips test for
 RCS/CCS on DG2
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org, arjun.melkaveri@intel.com, priyanka.dandamudi@intel.com, John.C.Harrison@intel.com, matthew.d.roper@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>

Updated code to skip for RCS/CCS engines on DG2 as the
platform cant handle shared reset domain.

Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
Cc: Melkaveri, Arjun <arjun.melkaveri@intel.com>
---
 tests/i915/i915_hangman.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/tests/i915/i915_hangman.c b/tests/i915/i915_hangman.c
index 23055c27..abbdaed5 100644
--- a/tests/i915/i915_hangman.c
+++ b/tests/i915/i915_hangman.c
@@ -445,6 +445,9 @@ static void do_tests(const char *name, const char *prefix,
 	snprintf(buff, sizeof(buff), "%s-error-state-capture", prefix);
 	igt_subtest_with_dynamic(buff) {
 		for_each_ctx_engine(device, ctx, e) {
+			if (IS_DG2(intel_get_drm_devid(device)) &&
+					(e->class == I915_ENGINE_CLASS_RENDER || e->class == I915_ENGINE_CLASS_COMPUTE))
+                                continue;
 			igt_dynamic_f("%s", e->name)
 				test_error_state_capture(ctx, e);
 		}
@@ -466,7 +469,10 @@ static void do_tests(const char *name, const char *prefix,
 		igt_require(has_gpu_reset > 1);
 
 		for_each_ctx_engine(device, ctx, e) {
-			igt_dynamic_f("%s", e->name)
+			if (IS_DG2(intel_get_drm_devid(device)) &&
+					(e->class == I915_ENGINE_CLASS_RENDER || e->class == I915_ENGINE_CLASS_COMPUTE))
+				continue;
+				igt_dynamic_f("%s", e->name)
 				test_engine_hang(ctx, e, 0);
 		}
 	}
@@ -486,6 +492,9 @@ static void do_tests(const char *name, const char *prefix,
 		igt_require(has_gpu_reset > 1);
 
 		for_each_ctx_engine(device, ctx, e) {
+			if (IS_DG2(intel_get_drm_devid(device)) &&
+					(e->class == I915_ENGINE_CLASS_RENDER || e->class == I915_ENGINE_CLASS_COMPUTE))
+				continue;
 			igt_dynamic_f("%s", e->name)
 				test_engine_hang(ctx, e, IGT_SPIN_INVALID_CS);
 		}
-- 
2.25.1
