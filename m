Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D61710EA36
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Dec 2023 08:45:33 +0000 (UTC)
From: Riana Tauro <riana.tauro@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 2/3] lib/igt_perf: Add a helper function to check if
 events are present
Date: Fri,  8 Dec 2023 14:22:50 +0530
Message-Id: <20231208085251.3798137-3-riana.tauro@intel.com>
In-Reply-To: <20231208085251.3798137-1-riana.tauro@intel.com>
References: <20231208085251.3798137-1-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Add helpers to check if specific events are found in
the events dir.

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 lib/igt_perf.c | 34 ++++++++++++++++++++++++++++++++++
 lib/igt_perf.h |  1 +
 2 files changed, 35 insertions(+)

diff --git a/lib/igt_perf.c b/lib/igt_perf.c
index 5b7bef042..834ef7682 100644
--- a/lib/igt_perf.c
+++ b/lib/igt_perf.c
@@ -1,3 +1,4 @@
+#include <dirent.h>
 #include <errno.h>
 #include <fcntl.h>
 #include <limits.h>
@@ -137,6 +138,39 @@ int igt_perf_events_dir(const char *device)
 	return open(path, O_RDONLY);
 }
 
+bool igt_perf_event_found(const char *device, const char *str)
+{
+	struct dirent *dent;
+	bool found = false;
+	int pmu_fd;
+	char *pos;
+	DIR *dir;
+
+	pmu_fd = igt_perf_events_dir(device);
+	if (pmu_fd < 0)
+		return found;
+
+	dir = fdopendir(dup(pmu_fd));
+	igt_assert(dir);
+	rewinddir(dir);
+
+	while ((dent = readdir(dir)) != NULL) {
+		if (dent->d_type != DT_REG)
+			continue;
+
+		pos = strstr(dent->d_name, str);
+		if (pos) {
+			found = true;
+			break;
+		}
+	}
+
+	closedir(dir);
+	close(pmu_fd);
+
+	return found;
+}
+
 static int
 _perf_open(uint64_t type, uint64_t config, int group, uint64_t format)
 {
diff --git a/lib/igt_perf.h b/lib/igt_perf.h
index 776cb36bb..98cba3438 100644
--- a/lib/igt_perf.h
+++ b/lib/igt_perf.h
@@ -57,6 +57,7 @@ uint64_t igt_perf_type_id(const char *device);
 int igt_perf_events_dir(const char *device);
 int igt_perf_open(uint64_t type, uint64_t config);
 int igt_perf_open_group(uint64_t type, uint64_t config, int group);
+bool igt_perf_event_found(const char *device, const char *str);
 
 const char *i915_perf_device(int i915, char *buf, int buflen);
 uint64_t i915_perf_type_id(int i915);
-- 
2.40.0
