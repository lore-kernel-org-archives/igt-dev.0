Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	igt-dev@lists.freedesktop.org
Date: Tue,  6 Jun 2023 13:35:35 -0700
Message-Id: <20230606203535.292739-1-vinay.belgaumkar@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/i915_pm_freq_api: Add a suspend
 subtest
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

Verify that SLPC API works as expected after a suspend.

Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 tests/i915/i915_pm_freq_api.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/tests/i915/i915_pm_freq_api.c b/tests/i915/i915_pm_freq_api.c
index 9005cd220..f35f1f8e0 100644
--- a/tests/i915/i915_pm_freq_api.c
+++ b/tests/i915/i915_pm_freq_api.c
@@ -18,6 +18,9 @@
  *
  * SUBTEST: freq-reset
  * Description: Test basic freq API works after a reset
+ *
+ * SUBTEST: freq-suspend
+ * Description: Test basic freq API works after a runtime suspend
  */
 
 IGT_TEST_DESCRIPTION("Test SLPC freq API");
@@ -99,6 +102,24 @@ static void test_reset(int i915, int dirfd, int gt)
 	igt_assert(get_freq(dirfd, RPS_MAX_FREQ_MHZ) == rpn);
 }
 
+static void test_suspend(int i915, int dirfd, int gt)
+{
+	uint32_t rpn = get_freq(dirfd, RPS_RPn_FREQ_MHZ);
+
+	igt_assert(set_freq(dirfd, RPS_MIN_FREQ_MHZ, rpn) > 0);
+	igt_assert(set_freq(dirfd, RPS_MAX_FREQ_MHZ, rpn) > 0);
+	usleep(ACT_FREQ_LATENCY_US);
+	igt_assert(get_freq(dirfd, RPS_MIN_FREQ_MHZ) == rpn);
+	igt_assert(get_freq(dirfd, RPS_MAX_FREQ_MHZ) == rpn);
+
+	/* Manually trigger a suspend */
+	igt_system_suspend_autoresume(SUSPEND_STATE_S3,
+				      SUSPEND_TEST_NONE);
+
+	igt_assert(get_freq(dirfd, RPS_MIN_FREQ_MHZ) == rpn);
+	igt_assert(get_freq(dirfd, RPS_MAX_FREQ_MHZ) == rpn);
+}
+
 igt_main
 {
 	int i915 = -1;
@@ -143,6 +164,15 @@ igt_main
 				test_reset(i915, dirfd, gt);
 	}
 
+	igt_describe("Test basic freq API works after suspend");
+	igt_subtest_with_dynamic_f("freq-suspend") {
+		int dirfd, gt;
+
+		for_each_sysfs_gt_dirfd(i915, dirfd, gt)
+			igt_dynamic_f("gt%u", gt)
+				test_suspend(i915, dirfd, gt);
+	}
+
 	igt_fixture {
 		int dirfd, gt;
 		/* Restore frequencies */
-- 
2.38.1
