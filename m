Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD1646E929
 for <igt-dev@lists.freedesktop.org>; Tue, 21 Sep 2021 10:00:51 +0000 (UTC)
From: Jigar Bhatt <jigar.bhatt@intel.com>
Date: Tue, 21 Sep 2021 15:25:16 +0530
Message-Id: <20210921095517.1840418-2-jigar.bhatt@intel.com>
In-Reply-To: <20210921095517.1840418-1-jigar.bhatt@intel.com>
References: <20210921095517.1840418-1-jigar.bhatt@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/2] tests/i915/i915_pm_dc: Refactoring
 pwr_dmn_info to debugfs_dump
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: jigar.bhatt@intel.com, uma.shankar@intel.com, nischal.varide@intel.com, swati2.sharma@intel.com, anshuman.gupta@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

refactoring pwr_dmn_info to debugfs_dump so other test can use it for
dumping debugfs file.[Anshuman]

Signed-off-by: Jigar Bhatt <jigar.bhatt@intel.com>
---
 tests/i915/i915_pm_dc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tests/i915/i915_pm_dc.c b/tests/i915/i915_pm_dc.c
index 9d0a15d8..04acf839 100644
--- a/tests/i915/i915_pm_dc.c
+++ b/tests/i915/i915_pm_dc.c
@@ -50,7 +50,7 @@ typedef struct {
 	int msr_fd;
 	int debugfs_fd;
 	uint32_t devid;
-	char *pwr_dmn_info;
+	char *debugfs_dump;
 	igt_display_t display;
 	struct igt_fb fb_white, fb_rgb, fb_rgr;
 	enum psr_mode op_psr_mode;
@@ -217,7 +217,7 @@ static void check_dc_counter(data_t *data, int dc_flag, uint32_t prev_dc_count)
 		(dc_flag & CHECK_DC5 ? "DC5" : "DC6"));
 	igt_assert_f(dc_state_wait_entry(data->debugfs_fd, dc_flag, prev_dc_count),
 		     "%s state is not achieved\n%s:\n%s\n", tmp, PWR_DOMAIN_INFO,
-		     data->pwr_dmn_info = igt_sysfs_get(data->debugfs_fd, PWR_DOMAIN_INFO));
+		     data->debugfs_dump = igt_sysfs_get(data->debugfs_fd, PWR_DOMAIN_INFO));
 }
 
 static void setup_videoplayback(data_t *data)
@@ -504,7 +504,7 @@ int main(int argc, char *argv[])
 	}
 
 	igt_fixture {
-		free(data.pwr_dmn_info);
+		free(data.debugfs_dump);
 		close(data.debugfs_fd);
 		close(data.msr_fd);
 		display_fini(&data);
-- 
2.25.1
