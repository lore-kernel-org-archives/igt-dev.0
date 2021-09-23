Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21BD96ED16
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Sep 2021 10:24:21 +0000 (UTC)
From: Jigar Bhatt <jigar.bhatt@intel.com>
Date: Thu, 23 Sep 2021 15:48:56 +0530
Message-Id: <20210923101857.1868172-2-jigar.bhatt@intel.com>
In-Reply-To: <20210923101857.1868172-1-jigar.bhatt@intel.com>
References: <20210923101857.1868172-1-jigar.bhatt@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v3 1/2] tests/i915/i915_pm_dc: Refactoring
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
Cc: jigar.bhatt@intel.com, anshuman.gupta@intel.com, nischal.varide@intel.com, uma.shankar@intel.com, swati2.sharma@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

Refactoring pwr_dmn_info to debugfs_dump so other test can use it for
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
