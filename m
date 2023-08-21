Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	igt-dev@lists.freedesktop.org
Date: Mon, 21 Aug 2023 15:41:06 -0700
Message-Id: <20230821224106.1412967-1-vinay.belgaumkar@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v4 i-g-t] tests/i915_pm_freq_api: Ignore zero
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
v3: Revert back to v1, the runtime util functions do not work
as expected.
v4: Add a debug print for min/max freq before test begins

Link: https://gitlab.freedesktop.org/drm/intel/issues/8736
Link: https://gitlab.freedesktop.org/drm/intel/issues/8989

Reviewed-by: Riana Tauro <riana.tauro@intel.com>
Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 tests/i915/i915_pm_freq_api.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/tests/i915/i915_pm_freq_api.c b/tests/i915/i915_pm_freq_api.c
index cf21cc936..2912287c4 100644
--- a/tests/i915/i915_pm_freq_api.c
+++ b/tests/i915/i915_pm_freq_api.c
@@ -88,6 +88,7 @@ static void test_freq_basic_api(int dirfd, int gt)
 static void test_reset(int i915, int dirfd, int gt, int count)
 {
 	uint32_t rpn = get_freq(dirfd, RPS_RPn_FREQ_MHZ);
+	uint32_t req_freq;
 	int fd;
 
 	for (int i = 0; i < count; i++) {
@@ -95,14 +96,18 @@ static void test_reset(int i915, int dirfd, int gt, int count)
 		igt_assert(set_freq(dirfd, RPS_MIN_FREQ_MHZ, rpn) > 0);
 		igt_assert(set_freq(dirfd, RPS_MAX_FREQ_MHZ, rpn) > 0);
 		usleep(ACT_FREQ_LATENCY_US);
-		igt_assert_eq(get_freq(dirfd, RPS_CUR_FREQ_MHZ), rpn);
+		req_freq = get_freq(dirfd, RPS_CUR_FREQ_MHZ);
+		if (req_freq)
+			igt_assert_eq(req_freq, rpn);
 
 		/* Manually trigger a GT reset */
 		fd = igt_debugfs_gt_open(i915, gt, "reset", O_WRONLY);
 		igt_require(fd >= 0);
 		igt_ignore_warn(write(fd, "1\n", 2));
 
-		igt_assert_eq(get_freq(dirfd, RPS_CUR_FREQ_MHZ), rpn);
+		req_freq = get_freq(dirfd, RPS_CUR_FREQ_MHZ);
+		if (req_freq)
+			igt_assert_eq(req_freq, rpn);
 	}
 	close(fd);
 }
@@ -110,17 +115,22 @@ static void test_reset(int i915, int dirfd, int gt, int count)
 static void test_suspend(int i915, int dirfd, int gt)
 {
 	uint32_t rpn = get_freq(dirfd, RPS_RPn_FREQ_MHZ);
+	uint32_t req_freq;
 
 	igt_assert(set_freq(dirfd, RPS_MIN_FREQ_MHZ, rpn) > 0);
 	igt_assert(set_freq(dirfd, RPS_MAX_FREQ_MHZ, rpn) > 0);
 	usleep(ACT_FREQ_LATENCY_US);
-	igt_assert_eq(get_freq(dirfd, RPS_CUR_FREQ_MHZ), rpn);
+	req_freq = get_freq(dirfd, RPS_CUR_FREQ_MHZ);
+	if (req_freq)
+		igt_assert_eq(req_freq, rpn);
 
 	/* Manually trigger a suspend */
 	igt_system_suspend_autoresume(SUSPEND_STATE_S3,
 				      SUSPEND_TEST_NONE);
 
-	igt_assert_eq(get_freq(dirfd, RPS_CUR_FREQ_MHZ), rpn);
+	req_freq = get_freq(dirfd, RPS_CUR_FREQ_MHZ);
+	if (req_freq)
+		igt_assert_eq(req_freq, rpn);
 }
 
 int i915 = -1;
@@ -160,6 +170,7 @@ igt_main
 		for_each_sysfs_gt_dirfd(i915, dirfd, gt) {
 			stash_min[gt] = get_freq(dirfd, RPS_MIN_FREQ_MHZ);
 			stash_max[gt] = get_freq(dirfd, RPS_MAX_FREQ_MHZ);
+			igt_debug("GT: %d, min: %d, max: %d", gt, stash_min[gt], stash_max[gt]);
 			igt_pm_ignore_slpc_efficient_freq(i915, dirfd, true);
 		}
 		igt_install_exit_handler(restore_sysfs_freq);
-- 
2.38.1
