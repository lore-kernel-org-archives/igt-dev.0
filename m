Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32E676F483
 for <igt-dev@lists.freedesktop.org>; Thu,  3 Jun 2021 12:31:44 +0000 (UTC)
From: venkata.sai.patnana@intel.com
Date: Thu,  3 Jun 2021 17:50:24 +0530
Message-Id: <20210603122027.27330-21-venkata.sai.patnana@intel.com>
In-Reply-To: <20210603122027.27330-1-venkata.sai.patnana@intel.com>
References: <20210603122027.27330-1-venkata.sai.patnana@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 21/24] lib/igt_debugfs: Add suppress wakeup
 hpds enable for display
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

From: Mohammed Khajapasha <mohammed.khajapasha@intel.com>

Enable suppress wakeup hpds for display, monitors like
LG 27UL650-W, 27UK850 goes into power sleep state and
generates long duration hotplug events even the monitor
connected for display, hence enabling suppress wakeup using
debugfs.

Cc: Petri Latvala <petri.latvala@intel.com>
Cc: Imre Deak <imre.deak@intel.com>
Signed-off-by: Mohammed Khajapasha <mohammed.khajapasha@intel.com>
(cherry picked from commit 46879c55ea49ecc9cefe7051358e647964085253)
---
 lib/igt_debugfs.c | 22 ++++++++++++++++++++++
 lib/igt_debugfs.h |  1 +
 lib/igt_kms.c     |  3 +++
 3 files changed, 26 insertions(+)

diff --git a/lib/igt_debugfs.c b/lib/igt_debugfs.c
index 2f58519a2b..503ae7f905 100644
--- a/lib/igt_debugfs.c
+++ b/lib/igt_debugfs.c
@@ -675,6 +675,28 @@ void igt_require_hpd_storm_ctl(int drm_fd)
 	close(fd);
 }
 
+/**
+ * igt_suppress_wake_hpd:
+ *
+ * Enable/disable suppress wakeup hpds for power state connectors
+ * Monitors like LG 27UL650-W, 27UK850 goes into power sleep state
+ * and generates long duration hotplug events even the monitor
+ * connected for display.
+ */
+void igt_suppress_wakeup_hpd(int drm_fd, bool enable)
+{
+	int fd = igt_debugfs_open(drm_fd, "i915_suppress_wakeup_hpd", O_WRONLY);
+
+	if (fd < 0) {
+		igt_debug("couldn't open suppress wakeup hpd file\n");
+		return;
+	}
+
+	igt_assert_eq(write(fd, enable ? "1" : "0", 1), 1);
+
+	close(fd);
+}
+
 static igt_pipe_crc_t *
 pipe_crc_new(int fd, enum pipe pipe, const char *source, int flags)
 {
diff --git a/lib/igt_debugfs.h b/lib/igt_debugfs.h
index d43ba6c6c7..ac97876b85 100644
--- a/lib/igt_debugfs.h
+++ b/lib/igt_debugfs.h
@@ -115,6 +115,7 @@ void igt_hpd_storm_set_threshold(int fd, unsigned int threshold);
 void igt_hpd_storm_reset(int fd);
 bool igt_hpd_storm_detected(int fd);
 void igt_require_hpd_storm_ctl(int fd);
+void igt_suppress_wakeup_hpd(int fd, bool enable);
 
 /*
  * Drop caches
diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index b11c8c27a6..1e3505e1b0 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -2140,6 +2140,9 @@ void igt_display_require(igt_display_t *display, int drm_fd)
 	display->drm_fd = drm_fd;
 	is_i915_dev = is_i915_device(drm_fd);
 
+	/* enable suppress wakeup hpds */
+	igt_suppress_wakeup_hpd(display->drm_fd, true);
+
 	drmSetClientCap(drm_fd, DRM_CLIENT_CAP_WRITEBACK_CONNECTORS, 1);
 
 	resources = drmModeGetResources(display->drm_fd);
-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
