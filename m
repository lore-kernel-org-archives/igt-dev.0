Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: John.C.Harrison@Intel.com
Date: Thu, 13 Jan 2022 15:51:04 -0800
Message-Id: <20220113235118.1575410-2-John.C.Harrison@Intel.com>
In-Reply-To: <20220113235118.1575410-1-John.C.Harrison@Intel.com>
References: <20220113235118.1575410-1-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v4 i-g-t 01/15] tests/i915/i915_hangman: Add
 descriptions
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: IGT-Dev@Lists.FreeDesktop.Org
Cc: Intel-GFX@Lists.FreeDesktop.Org, Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

From: John Harrison <John.C.Harrison@Intel.com>

Added descriptions of the various sub-tests and the test as a whole.

v2: Added missing linefeed (spotted by Petri)

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
Reviewed-by: Petri Latvala <petri.latvala@intel.com>
---
 tests/i915/i915_hangman.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/tests/i915/i915_hangman.c b/tests/i915/i915_hangman.c
index 4c18c22db..b9c4d9983 100644
--- a/tests/i915/i915_hangman.c
+++ b/tests/i915/i915_hangman.c
@@ -46,6 +46,8 @@
 static int device = -1;
 static int sysfs = -1;
 
+IGT_TEST_DESCRIPTION("Tests for hang detection and recovery");
+
 static bool has_error_state(int dir)
 {
 	bool result;
@@ -315,9 +317,9 @@ static void hangcheck_unterminated(void)
 
 	gem_execbuf(device, &execbuf);
 	if (gem_wait(device, handle, &timeout_ns) != 0) {
-		/* need to manually trigger an hang to clean before failing */
+		/* need to manually trigger a hang to clean before failing */
 		igt_force_gpu_reset(device);
-		igt_assert_f(0, "unterminated batch did not trigger an hang!");
+		igt_assert_f(0, "unterminated batch did not trigger a hang!\n");
 	}
 }
 
@@ -341,9 +343,11 @@ igt_main
 		igt_require(has_error_state(sysfs));
 	}
 
+	igt_describe("Basic error capture");
 	igt_subtest("error-state-basic")
 		test_error_state_basic();
 
+	igt_describe("Per engine error capture");
 	igt_subtest_with_dynamic("error-state-capture") {
 		for_each_ctx_engine(device, ctx, e) {
 			igt_dynamic_f("%s", e->name)
@@ -351,6 +355,7 @@ igt_main
 		}
 	}
 
+	igt_describe("Per engine hang recovery (spin)");
 	igt_subtest_with_dynamic("engine-hang") {
                 int has_gpu_reset = 0;
 		struct drm_i915_getparam gp = {
@@ -369,6 +374,7 @@ igt_main
 		}
 	}
 
+	igt_describe("Per engine hang recovery (invalid CS)");
 	igt_subtest_with_dynamic("engine-error") {
 		int has_gpu_reset = 0;
 		struct drm_i915_getparam gp = {
@@ -386,6 +392,7 @@ igt_main
 		}
 	}
 
+	igt_describe("Check that executing unintialised memory causes a hang");
 	igt_subtest("hangcheck-unterminated")
 		hangcheck_unterminated();
 
-- 
2.25.1
