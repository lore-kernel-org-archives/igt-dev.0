Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9013510E71B
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Nov 2023 06:56:22 +0000 (UTC)
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 17 Nov 2023 12:33:55 +0530
Message-Id: <20231117070356.1727656-2-kunal1.joshi@intel.com>
In-Reply-To: <20231117070356.1727656-1-kunal1.joshi@intel.com>
References: <20231117070356.1727656-1-kunal1.joshi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/2] lib/igt_debugfs: added helper to
 enable/disable dark screen detection
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Kunal Joshi <kunal1.joshi@intel.com>, Nemesa Garg <nemesa.garg@intel.com>,
 Arun R Murthy <arun.r.murthy@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

added helper function for dark screen detection

v2: Fix indentation (JP)
    Reduce complexity and redundancy (JP)

v3: Close fd (JP)
    Use ternary operator (JP)

Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Cc: Nemesa Garg <nemesa.garg@intel.com>
Cc: Arun R Murthy <arun.r.murthy@intel.com>
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 lib/igt_debugfs.c | 24 ++++++++++++++++++++++++
 lib/igt_debugfs.h |  2 ++
 2 files changed, 26 insertions(+)

diff --git a/lib/igt_debugfs.c b/lib/igt_debugfs.c
index a7b54bae5..a39405710 100644
--- a/lib/igt_debugfs.c
+++ b/lib/igt_debugfs.c
@@ -743,3 +743,27 @@ void __igt_debugfs_dump(int device, const char *filename, int level)
 	igt_log(IGT_LOG_DOMAIN, level, "%s:\n%s\n", filename, contents);
 	free(contents);
 }
+
+bool igt_is_dark_screen_supported(int drm_fd, enum pipe pipe)
+{
+	char buf[256];
+	int dir;
+
+	dir = igt_debugfs_pipe_dir(drm_fd, pipe, O_DIRECTORY);
+	igt_require_fd(dir);
+	igt_debugfs_simple_read(dir, "i915_darkscreen_status", buf, sizeof(buf));
+	close(dir);
+	return (*buf == '0' || *buf == '1');
+}
+
+ssize_t igt_set_dark_screen_detection(int drm_fd, enum pipe pipe, bool enable)
+{
+	int dir;
+	int size;
+
+	dir = igt_debugfs_pipe_dir(drm_fd, pipe, O_DIRECTORY);
+	igt_require_fd(dir);
+	size = igt_sysfs_write(dir, "i915_darkscreen_status", enable ? "1" : "0", 1);
+	close(dir);
+	return size;
+}
diff --git a/lib/igt_debugfs.h b/lib/igt_debugfs.h
index 3e6194ade..68f25be59 100644
--- a/lib/igt_debugfs.h
+++ b/lib/igt_debugfs.h
@@ -77,6 +77,8 @@ void igt_hpd_storm_reset(int fd);
 bool igt_hpd_storm_detected(int fd);
 void igt_require_hpd_storm_ctl(int fd);
 bool igt_ignore_long_hpd(int fd, bool enable);
+bool igt_is_dark_screen_supported(int drm_fd, enum pipe pipe);
+ssize_t igt_set_dark_screen_detection(int drm_fd, enum pipe pipe, bool enable);
 
 /*
  * Drop caches
-- 
2.25.1
