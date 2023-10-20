Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8733E10E584
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Oct 2023 05:57:23 +0000 (UTC)
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 20 Oct 2023 11:35:01 +0530
Message-Id: <20231020060503.870173-4-kunal1.joshi@intel.com>
In-Reply-To: <20231020060503.870173-1-kunal1.joshi@intel.com>
References: <20231020060503.870173-1-kunal1.joshi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 3/5] lib/igt_psr: added function to check
 output supports pr
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Kunal Joshi <kunal1.joshi@intel.com>,
 Arun R Murthy <arun.r.murthy@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

added function to check output supports PR

Note :- New debugfs interfaces which are used
        will be added by below patch in the driver
        https://patchwork.freedesktop.org/series/94470/

Cc: Jouni Högander <jouni.hogander@intel.com>
Cc: Animesh Manna <animesh.manna@intel.com>
Cc: Arun R Murthy <arun.r.murthy@intel.com>
Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 lib/igt_psr.c | 17 +++++++++++++++++
 lib/igt_psr.h |  1 +
 2 files changed, 18 insertions(+)

diff --git a/lib/igt_psr.c b/lib/igt_psr.c
index acacfa31f..4c912a064 100644
--- a/lib/igt_psr.c
+++ b/lib/igt_psr.c
@@ -22,6 +22,7 @@
  */
 
 #include "drmtest.h"
+#include "igt_kms.h"
 #include "igt_params.h"
 #include "igt_psr.h"
 #include "igt_sysfs.h"
@@ -373,3 +374,19 @@ enum psr_mode psr_get_mode(int debugfs_fd)
 
 	return PSR_DISABLED;
 }
+
+bool output_supports_pr(int debugfs_fd, igt_output_t *output)
+{
+	char debugfs_file[128] = {0};
+	char buf[PSR_STATUS_MAX_LEN];
+
+	if (!strstr(output->name,"DP"))
+		return false;
+
+        sprintf(debugfs_file, "%s/i915_psr_status", output->name);
+
+        igt_debugfs_simple_read(debugfs_fd, debugfs_file,
+				buf, sizeof(buf));
+
+        return strstr(buf, "Panel Replay = yes");
+}
diff --git a/lib/igt_psr.h b/lib/igt_psr.h
index 243154897..8e36fcf2f 100644
--- a/lib/igt_psr.h
+++ b/lib/igt_psr.h
@@ -55,5 +55,6 @@ bool i915_psr2_selective_fetch_check(int drm_fd);
 
 bool i915_psr2_sel_fetch_to_psr1(int drm_fd);
 void i915_psr2_sel_fetch_restore(int drm_fd);
+bool output_supports_pr(int debugfs_fd, igt_output_t *output);
 
 #endif
-- 
2.25.1
