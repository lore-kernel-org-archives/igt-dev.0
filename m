Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B3A010E586
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Oct 2023 05:57:29 +0000 (UTC)
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 20 Oct 2023 11:35:02 +0530
Message-Id: <20231020060503.870173-5-kunal1.joshi@intel.com>
In-Reply-To: <20231020060503.870173-1-kunal1.joshi@intel.com>
References: <20231020060503.870173-1-kunal1.joshi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 4/5] lib/igt_psr: added function to check
 active dp pr
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

Added function to check if pr is active on a output.
assuming SRDENT is the state to compare when pr is active

Cc: Jouni Högander <jouni.hogander@intel.com>
Cc: Animesh Manna <animesh.manna@intel.com>
Cc: Arun R Murthy <arun.r.murthy@intel.com>
Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 lib/igt_psr.c | 23 +++++++++++++++++++++++
 lib/igt_psr.h |  2 +-
 2 files changed, 24 insertions(+), 1 deletion(-)

diff --git a/lib/igt_psr.c b/lib/igt_psr.c
index 4c912a064..683379db6 100644
--- a/lib/igt_psr.c
+++ b/lib/igt_psr.c
@@ -390,3 +390,26 @@ bool output_supports_pr(int debugfs_fd, igt_output_t *output)
 
         return strstr(buf, "Panel Replay = yes");
 }
+
+bool dp_pr_active_check(int debugfs_fd, igt_output_t *output)
+{
+        char debugfs_file[128] = {0};
+        char buf[PSR_STATUS_MAX_LEN];
+        const char *state = "SRDENT";
+        int ret;
+
+        if (!strstr(output->name,"DP"))
+                return false;
+
+        sprintf(debugfs_file, "%s/i915_sink_status", output->name);
+
+        ret = igt_debugfs_simple_read(debugfs_fd, debugfs_file,
+                                     buf, sizeof(buf));
+        if (ret < 0) {
+                igt_info("Could not read i915_edp_psr_status: %s\n",
+                         strerror(-ret));
+                return false;
+        }
+        igt_skip_on(strstr(buf, "PSR sink not reliable: yes"));
+        return strstr(buf, state);
+}
diff --git a/lib/igt_psr.h b/lib/igt_psr.h
index 8e36fcf2f..dc603ffc3 100644
--- a/lib/igt_psr.h
+++ b/lib/igt_psr.h
@@ -56,5 +56,5 @@ bool i915_psr2_selective_fetch_check(int drm_fd);
 bool i915_psr2_sel_fetch_to_psr1(int drm_fd);
 void i915_psr2_sel_fetch_restore(int drm_fd);
 bool output_supports_pr(int debugfs_fd, igt_output_t *output);
-
+bool dp_pr_active_check(int debugfs_fd, igt_output_t *output);
 #endif
-- 
2.25.1
