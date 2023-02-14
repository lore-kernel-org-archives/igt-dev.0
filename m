Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44EDE10E853
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Feb 2023 09:57:42 +0000 (UTC)
From: Vinod Govindapillai <vinod.govindapillai@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 14 Feb 2023 11:57:23 +0200
Message-Id: <20230214095724.77881-2-vinod.govindapillai@intel.com>
In-Reply-To: <20230214095724.77881-1-vinod.govindapillai@intel.com>
References: <20230214095724.77881-1-vinod.govindapillai@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 1/2] lib/igt_debugfs: set provision to
 ignore long HPDs
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

Add provision to ignore long HPDs as some displays generate
long HPDs even while connected. For some CI systems with
such displays it might be usefull to ignore such spurious
HPDs while executing testcases.

Cc: Imre Deak <imre.deak@intel.com>
Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
---
 lib/igt_debugfs.c | 22 ++++++++++++++++++++++
 lib/igt_debugfs.h |  1 +
 2 files changed, 23 insertions(+)

diff --git a/lib/igt_debugfs.c b/lib/igt_debugfs.c
index 6de178d6..8d2d3144 100644
--- a/lib/igt_debugfs.c
+++ b/lib/igt_debugfs.c
@@ -411,6 +411,28 @@ bool igt_debugfs_search(int device, const char *filename, const char *substring)
 	return matched;
 }
 
+/**
+ * igt_ignore_long_hpd:
+ *
+ * Set / unset ignore long HPD events from the panels. Some panels
+ * generate long HPDs even while connected to the ports causing
+ * unexpected CI execution issues. Set this to ignore such unexpected
+ * long HPDs where we dont expect to disconnect the displays.
+ */
+void igt_ignore_long_hpd(int drm_fd, bool enable)
+{
+	int fd = igt_debugfs_open(drm_fd, "i915_ignore_long_hpd", O_WRONLY);
+
+	if (fd < 0) {
+		igt_debug("couldn't open ignore long hpd file\n");
+		return;
+	}
+
+	igt_assert_eq(write(fd, enable ? "1" : "0", 1), 1);
+
+	close(fd);
+}
+
 static void igt_hpd_storm_exit_handler(int sig)
 {
 	int fd = drm_open_driver(DRIVER_INTEL);
diff --git a/lib/igt_debugfs.h b/lib/igt_debugfs.h
index a883e2d4..fe23a5ef 100644
--- a/lib/igt_debugfs.h
+++ b/lib/igt_debugfs.h
@@ -72,6 +72,7 @@ void igt_hpd_storm_set_threshold(int fd, unsigned int threshold);
 void igt_hpd_storm_reset(int fd);
 bool igt_hpd_storm_detected(int fd);
 void igt_require_hpd_storm_ctl(int fd);
+void igt_ignore_long_hpd(int fd, bool enable);
 
 /*
  * Drop caches
-- 
2.34.1
