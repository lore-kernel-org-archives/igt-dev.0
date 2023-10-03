Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3210B10E19F
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Oct 2023 05:12:21 +0000 (UTC)
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue,  3 Oct 2023 10:49:59 +0530
Message-Id: <20231003051959.461527-3-kunal1.joshi@intel.com>
In-Reply-To: <20231003051959.461527-1-kunal1.joshi@intel.com>
References: <20231003051959.461527-1-kunal1.joshi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/2] lib/igt_psr: updated functions to check
 PR support
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Based on changes in kmd
https://patchwork.freedesktop.org/series/94470/
Updated comparision values to retrieve correct mode

Cc: Jouni Högander <jouni.hogander@intel.com>
Cc: Animesh Manna <animesh.manna@intel.com>
Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 lib/igt_psr.c | 56 +++++++++++++++++++++++++++++----------------------
 1 file changed, 32 insertions(+), 24 deletions(-)

diff --git a/lib/igt_psr.c b/lib/igt_psr.c
index 13f7c567d..c5fd8495a 100644
--- a/lib/igt_psr.c
+++ b/lib/igt_psr.c
@@ -194,29 +194,35 @@ bool psr_disable(int device, int debugfs_fd)
 
 bool psr_sink_support(int device, int debugfs_fd, enum psr_mode mode)
 {
-	char buf[PSR_STATUS_MAX_LEN];
-	int ret;
-
-	ret = igt_debugfs_simple_read(debugfs_fd, "i915_edp_psr_status", buf,
-				      sizeof(buf));
-	if (ret < 1)
-		return false;
-
-	if (mode == PSR_MODE_1)
-		return strstr(buf, "Sink_Support: yes\n") ||
-		       strstr(buf, "Sink support: yes");
-	else
-		/*
-		 * i915 requires PSR version 0x03 that is PSR2 + SU with
-		 * Y-coordinate to support PSR2
-		 *
-		 * or
-		 *
-		 * PSR version 0x4 that is PSR2 + SU w/ Y-coordinate and SU
-		 * Region Early Transport to support PSR2 (eDP 1.5)
-		 */
-		return strstr(buf, "Sink support: yes [0x03]") ||
-		       strstr(buf, "Sink support: yes [0x04]");
+	char *line;
+    char buf[PSR_STATUS_MAX_LEN];
+    int ret;
+
+    ret = igt_debugfs_simple_read(debugfs_fd, "i915_edp_psr_status", buf,
+                                  sizeof(buf));
+    if (ret < 1)
+        return false;
+
+    line = strstr(buf, "Sink support: ");
+    if (!line)
+        return false;
+
+    if (mode == PSR_MODE_1)
+        return strstr(line, "PSR = yes");
+    else if (mode == PSR_MODE_2 || mode == PSR_MODE_2_SEL_FETCH)
+        /*
+         * i915 requires PSR version 0x03 that is PSR2 + SU with
+         * Y-coordinate to support PSR2
+         *
+         * or
+         *
+         * PSR version 0x4 that is PSR2 + SU w/ Y-coordinate and SU
+         * Region Early Transport to support PSR2 (eDP 1.5)
+         */
+        return strstr(line, "PSR = yes") &&
+               (strstr(line, "[0x03]") || strstr(line, "[0x04]"));
+    else
+        return strstr(line, "Panel Replay = yes");
 }
 
 #define PSR2_SU_BLOCK_STR_LOOKUP "PSR2 SU blocks:\n0\t"
@@ -350,7 +356,9 @@ enum psr_mode psr_get_mode(int debugfs_fd)
 		return PSR_DISABLED;
 	}
 
-	if (strstr(buf, "PSR2 selective fetch: enabled"))
+	if (strstr(buf, "Panel Replay Enabled"))
+		return PR_MODE_1;
+	else if (strstr(buf, "PSR2 selective fetch: enabled"))
 		return PSR_MODE_2_SEL_FETCH;
 	else if (strstr(buf, "PSR2 enabled"))
 		return PSR_MODE_2;
-- 
2.25.1
