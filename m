Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34B5210E0F3
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Sep 2023 17:50:48 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  8 Sep 2023 23:20:38 +0530
Message-Id: <20230908175039.1291593-5-swati2.sharma@intel.com>
In-Reply-To: <20230908175039.1291593-1-swati2.sharma@intel.com>
References: <20230908175039.1291593-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 4/5] tests/intel/kms_pm_dc: Use
 gem_has_lmem()
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

Instead of using i915_capabilities debugfs to know if platform
is discrete or not, use gem_has_lmem for the same.

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/intel/kms_pm_dc.c | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
index b5779eaa5..cbb419e12 100644
--- a/tests/intel/kms_pm_dc.c
+++ b/tests/intel/kms_pm_dc.c
@@ -140,15 +140,6 @@ typedef struct {
 static bool dc_state_wait_entry(int drm_fd, int dc_flag, int prev_dc_count);
 static void check_dc_counter(data_t *data, int dc_flag, uint32_t prev_dc_count);
 
-static bool is_dgfx(data_t *data)
-{
-	char buf[4096];
-
-	igt_debugfs_simple_read(data->debugfs_fd, "i915_capabilities",
-				buf, sizeof(buf));
-	return strstr(buf, "is_dgfx: yes");
-}
-
 static void setup_output(data_t *data)
 {
 	igt_display_t *display = &data->display;
@@ -661,6 +652,7 @@ static void kms_poll_state_restore(int sig)
 igt_main
 {
 	data_t data = {};
+	bool is_dgfx;
 
 	igt_fixture {
 		data.drm_fd = drm_open_driver_master(DRIVER_INTEL);
@@ -742,7 +734,8 @@ igt_main
 
 	igt_describe("This test validates display engine entry to DC9 state");
 	igt_subtest("dc9-dpms") {
-		if (!(is_dgfx(&data)))
+		is_dgfx = gem_has_lmem(data.drm_fd);
+		if (!is_dgfx)
 			igt_require_f(igt_pm_pc8_plus_residencies_enabled(data.msr_fd),
 				      "PC8+ residencies not supported\n");
 		test_dc9_dpms(&data);
-- 
2.25.1
