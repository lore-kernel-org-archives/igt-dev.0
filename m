Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9724C10E73E
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Apr 2023 09:10:18 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 12 Apr 2023 14:35:57 +0530
Message-Id: <20230412090557.810996-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t] tests/kms:
 s/i915_frequency_info/i915_display_clock_info/
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

Read display specific clocks from i915_display_clock_info as
i915_frequency_info is no longer holding display specific stuff.

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/i915/kms_cdclk.c   | 2 +-
 tests/kms_invalid_mode.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/i915/kms_cdclk.c b/tests/i915/kms_cdclk.c
index 23d9d3b02e2..778f5116f70 100644
--- a/tests/i915/kms_cdclk.c
+++ b/tests/i915/kms_cdclk.c
@@ -61,7 +61,7 @@ static int get_current_cdclk_freq(int debugfs_fd)
 	char *start_loc;
 	int res;
 
-	res = igt_debugfs_simple_read(debugfs_fd, "i915_frequency_info",
+	res = igt_debugfs_simple_read(debugfs_fd, "i915_display_clock_info",
 				      buf, sizeof(buf));
 	igt_require(res > 0);
 
diff --git a/tests/kms_invalid_mode.c b/tests/kms_invalid_mode.c
index 86f529e88b1..6989150c210 100644
--- a/tests/kms_invalid_mode.c
+++ b/tests/kms_invalid_mode.c
@@ -222,7 +222,7 @@ static int i915_max_dotclock(data_t *data)
 	if (!is_i915_device(data->drm_fd))
 		return 0;
 
-	igt_debugfs_read(data->drm_fd, "i915_frequency_info", buf);
+	igt_debugfs_read(data->drm_fd, "i915_display_clock_info", buf);
 	s = strstr(buf, "Max pixel clock frequency:");
 	igt_assert(s);
 	igt_assert_eq(sscanf(s, "Max pixel clock frequency: %d kHz", &max_dotclock), 1);
-- 
2.40.0
