Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C4C510E03F
 for <igt-dev@lists.freedesktop.org>; Fri,  9 Sep 2022 11:47:55 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  9 Sep 2022 17:19:08 +0530
Message-Id: <20220909114911.1852-3-swati2.sharma@intel.com>
In-Reply-To: <20220909114911.1852-1-swati2.sharma@intel.com>
References: <20220909114911.1852-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v3 2/5] tests/i915/i915_pm_dc: Change
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

v2: -create separate patch for this change (imre)
v3: -create separate patch for igt description (imre)
    -move is_dgfx() func on top (imre)

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
Reviewed-by: Imre Deak <imre.deak@intel.com>
---
 tests/i915/i915_pm_dc.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/tests/i915/i915_pm_dc.c b/tests/i915/i915_pm_dc.c
index 40811ae52..bd4522275 100644
--- a/tests/i915/i915_pm_dc.c
+++ b/tests/i915/i915_pm_dc.c
@@ -69,6 +69,15 @@ typedef struct {
 static bool dc_state_wait_entry(int drm_fd, int dc_flag, int prev_dc_count);
 static void check_dc_counter(data_t *data, int dc_flag, uint32_t prev_dc_count);
 
+static bool is_dgfx(data_t *data)
+{
+	char buf[4096];
+
+	igt_debugfs_simple_read(data->debugfs_fd, "i915_capabilities",
+				buf, sizeof(buf));
+	return strstr(buf, "is_dgfx: yes");
+}
+
 static void setup_output(data_t *data)
 {
 	igt_display_t *display = &data->display;
@@ -424,15 +433,6 @@ static void check_dc9(data_t *data, int dc_target, int prev_dc)
 			data->debugfs_dump = igt_sysfs_get(data->debugfs_fd, RPM_STATUS));
 }
 
-static bool check_is_dgfx(data_t *data)
-{
-	char buf[4096];
-
-	igt_debugfs_simple_read(data->debugfs_fd, "i915_gpu_info",
-				buf, sizeof(buf));
-	return strstr(buf, "is_dgfx: yes");
-}
-
 static void setup_dc9_dpms(data_t *data, int dc_target)
 {
 	int prev_dc, sysfs_fd;
@@ -542,7 +542,7 @@ int main(int argc, char *argv[])
 
 	igt_describe("This test validates display engine entry to DC9 state");
 	igt_subtest("dc9-dpms") {
-		if (!(check_is_dgfx(&data)))
+		if (!(is_dgfx(&data)))
 			igt_require_f(igt_pm_pc8_plus_residencies_enabled(data.msr_fd),
 				      "PC8+ residencies not supported\n");
 		test_dc9_dpms(&data);
-- 
2.25.1
