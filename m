Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5822B10E1FB
 for <igt-dev@lists.freedesktop.org>; Mon,  6 Mar 2023 15:22:11 +0000 (UTC)
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon,  6 Mar 2023 20:51:50 +0530
Message-Id: <20230306152151.24200-2-kunal1.joshi@intel.com>
In-Reply-To: <20230306152151.24200-1-kunal1.joshi@intel.com>
References: <20230306152151.24200-1-kunal1.joshi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/2] RFC lib/igt_psr Added library functions
 for panel replay
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

Added helper functions for retieving panel replay
information from debugfs

Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 lib/igt_psr.c | 62 ++++++++++++++++++++++++++++++++++++++++++++++++++-
 lib/igt_psr.h |  5 +++++
 2 files changed, 66 insertions(+), 1 deletion(-)

diff --git a/lib/igt_psr.c b/lib/igt_psr.c
index a2d88031..ec39b480 100644
--- a/lib/igt_psr.c
+++ b/lib/igt_psr.c
@@ -37,6 +37,16 @@ bool psr_disabled_check(int debugfs_fd)
 	return strstr(buf, "PSR mode: disabled\n");
 }
 
+bool pr_selective_fetch_check(int debugfs_fd)
+{
+	char buf[PSR_STATUS_MAX_LEN];
+
+	igt_debugfs_simple_read(debugfs_fd, "i915_edp_psr_status", buf,
+				sizeof(buf));
+
+	return strstr(buf, "PR selective fetch: enabled");
+}
+
 bool psr2_selective_fetch_check(int debugfs_fd)
 {
 	char buf[PSR_STATUS_MAX_LEN];
@@ -47,6 +57,27 @@ bool psr2_selective_fetch_check(int debugfs_fd)
 	return strstr(buf, "PSR2 selective fetch: enabled");
 }
 
+static bool pr_active_check(int debugfs_fd, enum psr_mode mode)
+{
+	char buf[PSR_STATUS_MAX_LEN];
+	/*
+	 * Fix PR_STATE once confimred what state source will be in
+	 * when PR is active
+	 */
+	const char *state = "PR_STATE";
+	int ret;
+
+	ret = igt_debugfs_simple_read(debugfs_fd, "i915_edp_psr_status",
+				     buf, sizeof(buf));
+	if (ret < 0) {
+		igt_info("Could not read i915_edp_psr_status: %s\n",
+			 strerror(-ret));
+		return false;
+	}
+
+	return strstr(buf, state);
+}
+
 static bool psr_active_check(int debugfs_fd, enum psr_mode mode)
 {
 	char buf[PSR_STATUS_MAX_LEN];
@@ -66,6 +97,11 @@ static bool psr_active_check(int debugfs_fd, enum psr_mode mode)
 	return strstr(buf, state);
 }
 
+bool pr_wait_entry(int debugfs_fd, enum psr_mode mode)
+{
+	return igt_wait(pr_active_check(debugfs_fd, mode), 500, 20);
+}
+
 /*
  * For PSR1, we wait until PSR is active. We wait until DEEP_SLEEP for PSR2.
  */
@@ -162,6 +198,12 @@ static bool psr_set(int device, int debugfs_fd, int mode)
 		case PSR_MODE_2_SEL_FETCH:
 			debug_val = "0x4";
 			break;
+		case PR_MODE_1:
+			debug_val = "0x5";
+			break;
+		case PR_MODE_1_SEL_FETCH:
+			debug_val = "0x6";
+			break;
 		default:
 			/* Disables PSR */
 			debug_val = "0x1";
@@ -192,6 +234,20 @@ bool psr_disable(int device, int debugfs_fd)
 	return psr_set(device, debugfs_fd, -1);
 }
 
+bool pr_sink_support(int device, int debugfs_fd, enum psr_mode mode)
+{
+	char buf[PSR_STATUS_MAX_LEN];
+	int ret;
+
+	ret = igt_debugfs_simple_read(debugfs_fd, "i915_edp_psr_status", buf,
+				      sizeof(buf));
+	if (ret < 1)
+		return false;
+	else
+		return strstr(buf, "Sink support: yes [0x05]") ||
+		       strstr(buf, "Sink support: yes [0x06]");
+}
+
 bool psr_sink_support(int device, int debugfs_fd, enum psr_mode mode)
 {
 	char buf[PSR_STATUS_MAX_LEN];
@@ -350,7 +406,11 @@ enum psr_mode psr_get_mode(int debugfs_fd)
 		return PSR_DISABLED;
 	}
 
-	if (strstr(buf, "PSR2 selective fetch: enabled"))
+	if (strstr(buf, "PR selective fetch: enabled"))
+		return PR_MODE_1_SEL_FETCH;
+	else if (strstr(buf, "PR: enabled"))
+		return PR_MODE_1;
+	else if (strstr(buf, "PSR2 selective fetch: enabled"))
 		return PSR_MODE_2_SEL_FETCH;
 	else if (strstr(buf, "PSR2 enabled"))
 		return PSR_MODE_2;
diff --git a/lib/igt_psr.h b/lib/igt_psr.h
index 12ffc9d6..cbcef796 100644
--- a/lib/igt_psr.h
+++ b/lib/igt_psr.h
@@ -34,17 +34,22 @@ enum psr_mode {
 	PSR_MODE_1,
 	PSR_MODE_2,
 	PSR_MODE_2_SEL_FETCH,
+	PR_MODE_1,
+	PR_MODE_1_SEL_FETCH,
 	PSR_DISABLED,
 };
 
 bool psr_disabled_check(int debugfs_fd);
+bool pr_selective_fetch_check(int debugfs_fd);
 bool psr2_selective_fetch_check(int debugfs_fd);
+bool pr_wait_entry(int debugfs_fd, enum psr_mode mode);
 bool psr_wait_entry(int debugfs_fd, enum psr_mode mode);
 bool psr_wait_update(int debugfs_fd, enum psr_mode mode);
 bool psr_long_wait_update(int debugfs_fd, enum psr_mode mode);
 bool psr_enable(int device, int debugfs_fd, enum psr_mode);
 bool psr_disable(int device, int debugfs_fd);
 bool psr_sink_support(int device, int debugfs_fd, enum psr_mode mode);
+bool pr_sink_support(int device, int debugfs_fd, enum psr_mode mode);
 bool psr2_wait_su(int debugfs_fd, uint16_t *num_su_blocks);
 void psr_print_debugfs(int debugfs_fd);
 enum psr_mode psr_get_mode(int debugfs_fd);
-- 
2.25.1
