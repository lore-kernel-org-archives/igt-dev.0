Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11E7510E7B0
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Mar 2023 08:38:12 +0000 (UTC)
From: Vinod Govindapillai <vinod.govindapillai@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu,  9 Mar 2023 10:37:50 +0200
Message-Id: <20230309083751.347335-2-vinod.govindapillai@intel.com>
In-Reply-To: <20230309083751.347335-1-vinod.govindapillai@intel.com>
References: <20230309083751.347335-1-vinod.govindapillai@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v3 1/2] lib/igt_debugfs: set provision to
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

v2: Some sytling issues (Kamil)

Cc: Imre Deak <imre.deak@intel.com>
Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
---
 lib/igt_debugfs.c | 26 ++++++++++++++++++++++++++
 lib/igt_debugfs.h |  1 +
 2 files changed, 27 insertions(+)

diff --git a/lib/igt_debugfs.c b/lib/igt_debugfs.c
index 6de178d6..05889bbe 100644
--- a/lib/igt_debugfs.c
+++ b/lib/igt_debugfs.c
@@ -411,6 +411,32 @@ bool igt_debugfs_search(int device, const char *filename, const char *substring)
 	return matched;
 }
 
+/**
+ * igt_ignore_long_hpd:
+ * @drm_fd: the DRM device file fd
+ * @enable: flag to control the ignore long HPD entry
+ *
+ * Set / unset ignore long HPD events from the panels. Some panels
+ * generate long HPDs even while connected to the ports causing
+ * unexpected CI execution issues. Set this to ignore such unexpected
+ * long HPDs where we dont expect to disconnect the displays.
+ */
+bool igt_ignore_long_hpd(int drm_fd, bool enable)
+{
+	int fd = igt_debugfs_open(drm_fd, "i915_ignore_long_hpd", O_WRONLY);
+	int ret;
+
+	if (fd < 0) {
+		igt_debug("couldn't open ignore long hpd file\n");
+		return false;
+	}
+
+	ret = write(fd, enable ? "1" : "0", 1);
+
+	close(fd);
+	return ret == 1;
+}
+
 static void igt_hpd_storm_exit_handler(int sig)
 {
 	int fd = drm_open_driver(DRIVER_INTEL);
diff --git a/lib/igt_debugfs.h b/lib/igt_debugfs.h
index a883e2d4..4824344a 100644
--- a/lib/igt_debugfs.h
+++ b/lib/igt_debugfs.h
@@ -72,6 +72,7 @@ void igt_hpd_storm_set_threshold(int fd, unsigned int threshold);
 void igt_hpd_storm_reset(int fd);
 bool igt_hpd_storm_detected(int fd);
 void igt_require_hpd_storm_ctl(int fd);
+bool igt_ignore_long_hpd(int fd, bool enable);
 
 /*
  * Drop caches
-- 
2.34.1
