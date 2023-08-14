Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	igt-dev@lists.freedesktop.org
Date: Mon, 14 Aug 2023 11:13:16 -0700
Message-Id: <20230814181316.408017-1-vinay.belgaumkar@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v2 i-g-t] tests/i915_pm_freq_api: Ignore zero
 register value
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

Register read for requested_freq can return 0 when system is
in runtime_pm. Make allowance for this case.

v2: Explicit check for runtime_pm status (Riana)

Link: https://gitlab.freedesktop.org/drm/intel/issues/8736
Link: https://gitlab.freedesktop.org/drm/intel/issues/8989

Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 tests/i915/i915_pm_freq_api.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/tests/i915/i915_pm_freq_api.c b/tests/i915/i915_pm_freq_api.c
index cf21cc936..6713ad213 100644
--- a/tests/i915/i915_pm_freq_api.c
+++ b/tests/i915/i915_pm_freq_api.c
@@ -95,14 +95,16 @@ static void test_reset(int i915, int dirfd, int gt, int count)
 		igt_assert(set_freq(dirfd, RPS_MIN_FREQ_MHZ, rpn) > 0);
 		igt_assert(set_freq(dirfd, RPS_MAX_FREQ_MHZ, rpn) > 0);
 		usleep(ACT_FREQ_LATENCY_US);
-		igt_assert_eq(get_freq(dirfd, RPS_CUR_FREQ_MHZ), rpn);
+		if (igt_get_runtime_pm_status() == IGT_RUNTIME_PM_STATUS_ACTIVE)
+			igt_assert_eq(get_freq(dirfd, RPS_CUR_FREQ_MHZ), rpn);
 
 		/* Manually trigger a GT reset */
 		fd = igt_debugfs_gt_open(i915, gt, "reset", O_WRONLY);
 		igt_require(fd >= 0);
 		igt_ignore_warn(write(fd, "1\n", 2));
 
-		igt_assert_eq(get_freq(dirfd, RPS_CUR_FREQ_MHZ), rpn);
+		if (igt_get_runtime_pm_status() == IGT_RUNTIME_PM_STATUS_ACTIVE)
+			igt_assert_eq(get_freq(dirfd, RPS_CUR_FREQ_MHZ), rpn);
 	}
 	close(fd);
 }
@@ -114,13 +116,15 @@ static void test_suspend(int i915, int dirfd, int gt)
 	igt_assert(set_freq(dirfd, RPS_MIN_FREQ_MHZ, rpn) > 0);
 	igt_assert(set_freq(dirfd, RPS_MAX_FREQ_MHZ, rpn) > 0);
 	usleep(ACT_FREQ_LATENCY_US);
-	igt_assert_eq(get_freq(dirfd, RPS_CUR_FREQ_MHZ), rpn);
+	if (igt_get_runtime_pm_status() == IGT_RUNTIME_PM_STATUS_ACTIVE)
+		igt_assert_eq(get_freq(dirfd, RPS_CUR_FREQ_MHZ), rpn);
 
 	/* Manually trigger a suspend */
 	igt_system_suspend_autoresume(SUSPEND_STATE_S3,
 				      SUSPEND_TEST_NONE);
 
-	igt_assert_eq(get_freq(dirfd, RPS_CUR_FREQ_MHZ), rpn);
+	if (igt_get_runtime_pm_status() == IGT_RUNTIME_PM_STATUS_ACTIVE)
+		igt_assert_eq(get_freq(dirfd, RPS_CUR_FREQ_MHZ), rpn);
 }
 
 int i915 = -1;
-- 
2.38.1
