Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	igt-dev@lists.freedesktop.org
Date: Mon, 17 Jul 2023 21:23:00 -0700
Message-Id: <20230718042300.966115-1-vinay.belgaumkar@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v3 i-g-t] i915_pm_freq_api: Add some debug to tests
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

Some subtests seem to be failing in CI, use igt_assert_eq where we
compare the requested freq, which will print the values being compared.
Also print the RP values at the beginning of the test.

v2: Print GT as well (Ashutosh)
v3: Minor commit message correction (Ashutosh)

Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 tests/i915/i915_pm_freq_api.c | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/tests/i915/i915_pm_freq_api.c b/tests/i915/i915_pm_freq_api.c
index 522abee35..a7bbd4896 100644
--- a/tests/i915/i915_pm_freq_api.c
+++ b/tests/i915/i915_pm_freq_api.c
@@ -55,6 +55,7 @@ static void test_freq_basic_api(int dirfd, int gt)
 	rpn = get_freq(dirfd, RPS_RPn_FREQ_MHZ);
 	rp0 = get_freq(dirfd, RPS_RP0_FREQ_MHZ);
 	rpe = get_freq(dirfd, RPS_RP1_FREQ_MHZ);
+	igt_debug("GT: %d, RPn: %d, RPe: %d, RP0: %d", gt, rpn, rpe, rp0);
 
 	/*
 	 * Negative bound tests
@@ -90,21 +91,18 @@ static void test_reset(int i915, int dirfd, int gt, int count)
 	int fd;
 
 	for (int i = 0; i < count; i++) {
-		igt_assert_f(set_freq(dirfd, RPS_MIN_FREQ_MHZ, rpn) > 0,
-			     "Failed after %d good cycles\n", i);
-		igt_assert_f(set_freq(dirfd, RPS_MAX_FREQ_MHZ, rpn) > 0,
-			     "Failed after %d good cycles\n", i);
+		igt_debug("Running cycle: %d", i);
+		igt_assert(set_freq(dirfd, RPS_MIN_FREQ_MHZ, rpn) > 0);
+		igt_assert(set_freq(dirfd, RPS_MAX_FREQ_MHZ, rpn) > 0);
 		usleep(ACT_FREQ_LATENCY_US);
-		igt_assert_f(get_freq(dirfd, RPS_CUR_FREQ_MHZ) == rpn,
-			     "Failed after %d good cycles\n", i);
+		igt_assert_eq(get_freq(dirfd, RPS_CUR_FREQ_MHZ), rpn);
 
 		/* Manually trigger a GT reset */
 		fd = igt_debugfs_gt_open(i915, gt, "reset", O_WRONLY);
 		igt_require(fd >= 0);
 		igt_ignore_warn(write(fd, "1\n", 2));
 
-		igt_assert_f(get_freq(dirfd, RPS_CUR_FREQ_MHZ) == rpn,
-			     "Failed after %d good cycles\n", i);
+		igt_assert_eq(get_freq(dirfd, RPS_CUR_FREQ_MHZ), rpn);
 	}
 	close(fd);
 }
@@ -116,13 +114,13 @@ static void test_suspend(int i915, int dirfd, int gt)
 	igt_assert(set_freq(dirfd, RPS_MIN_FREQ_MHZ, rpn) > 0);
 	igt_assert(set_freq(dirfd, RPS_MAX_FREQ_MHZ, rpn) > 0);
 	usleep(ACT_FREQ_LATENCY_US);
-	igt_assert(get_freq(dirfd, RPS_CUR_FREQ_MHZ) == rpn);
+	igt_assert_eq(get_freq(dirfd, RPS_CUR_FREQ_MHZ), rpn);
 
 	/* Manually trigger a suspend */
 	igt_system_suspend_autoresume(SUSPEND_STATE_S3,
 				      SUSPEND_TEST_NONE);
 
-	igt_assert(get_freq(dirfd, RPS_CUR_FREQ_MHZ) == rpn);
+	igt_assert_eq(get_freq(dirfd, RPS_CUR_FREQ_MHZ), rpn);
 }
 
 int i915 = -1;
-- 
2.38.1
