Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AFCE10E662
 for <igt-dev@lists.freedesktop.org>; Tue,  6 Sep 2022 13:11:30 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue,  6 Sep 2022 18:42:43 +0530
Message-Id: <20220906131245.4757-2-swati2.sharma@intel.com>
In-Reply-To: <20220906131245.4757-1-swati2.sharma@intel.com>
References: <20220906131245.4757-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 1/3] tests/i915/i915_pm_dc: Change
 debugfs for reading platform info
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

With error capture being part of i915_gpu_info, with 4024 buffer size
we will never be able to parse "is_dgfx" string. Instead use
i915_capabilities which is meant for platform info only.

Also, changed func name from check_is_dgfx() to is_dgfx().

v2: create separate patch for this change (imre)

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/i915/i915_pm_dc.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/tests/i915/i915_pm_dc.c b/tests/i915/i915_pm_dc.c
index f664a2a2c..d90d64cca 100644
--- a/tests/i915/i915_pm_dc.c
+++ b/tests/i915/i915_pm_dc.c
@@ -44,6 +44,8 @@
 #define KMS_HELPER "/sys/module/drm_kms_helper/parameters/"
 #define KMS_POLL_DISABLE 0
 
+IGT_TEST_DESCRIPTION("These tests validate Display Power DC states");
+
 bool kms_poll_saved_state;
 
 typedef struct {
@@ -422,11 +424,11 @@ static void check_dc9(data_t *data, int dc_target, int prev_dc)
 			data->debugfs_dump = igt_sysfs_get(data->debugfs_fd, RPM_STATUS));
 }
 
-static bool check_is_dgfx(data_t *data)
+static bool is_dgfx(data_t *data)
 {
 	char buf[4096];
 
-	igt_debugfs_simple_read(data->debugfs_fd, "i915_gpu_info",
+	igt_debugfs_simple_read(data->debugfs_fd, "i915_capabilities",
 				buf, sizeof(buf));
 	return strstr(buf, "is_dgfx: yes");
 }
@@ -473,7 +475,6 @@ static void kms_poll_state_restore(int sig)
 	}
 }
 
-IGT_TEST_DESCRIPTION("These tests validate Display Power DC states");
 int main(int argc, char *argv[])
 {
 	data_t data = {};
@@ -541,7 +542,7 @@ int main(int argc, char *argv[])
 
 	igt_describe("This test validates display engine entry to DC9 state");
 	igt_subtest("dc9-dpms") {
-		if (!(check_is_dgfx(&data)))
+		if (!(is_dgfx(&data)))
 			igt_require_f(igt_pm_pc8_plus_residencies_enabled(data.msr_fd),
 				      "PC8+ residencies not supported\n");
 		test_dc9_dpms(&data);
-- 
2.25.1
