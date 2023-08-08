Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07DBD10E084
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Aug 2023 01:00:24 +0000 (UTC)
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon,  7 Aug 2023 18:00:00 -0700
Message-ID: <20230808010017.37819-4-ashutosh.dixit@intel.com>
In-Reply-To: <20230808010017.37819-1-ashutosh.dixit@intel.com>
References: <20230808010017.37819-1-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 03/20] lib/i915/perf: Add xe_perf_for_fd
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

Add xe_perf_for_fd which is called from intel_perf_for_fd for xe devices.

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 lib/i915/perf.c | 56 ++++++++++++++++++++++++++++++++++++++++++++++---
 lib/meson.build |  2 +-
 2 files changed, 54 insertions(+), 4 deletions(-)

diff --git a/lib/i915/perf.c b/lib/i915/perf.c
index ddadb53b61c8..5b82eeaf04b9 100644
--- a/lib/i915/perf.c
+++ b/lib/i915/perf.c
@@ -37,10 +37,11 @@
 
 #include <i915_drm.h>
 
+#include "drmtest.h"
 #include "i915_pciids.h"
-
 #include "intel_chipset.h"
 #include "perf.h"
+#include "xe/xe_query.h"
 
 #include "i915_perf_metrics_hsw.h"
 #include "i915_perf_metrics_bdw.h"
@@ -68,8 +69,6 @@
 #include "i915_perf_metrics_mtlgt2.h"
 #include "i915_perf_metrics_mtlgt3.h"
 
-#define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]))
-
 static int
 perf_ioctl(int fd, unsigned long request, void *arg)
 {
@@ -609,6 +608,54 @@ intel_sysfs_attr_id_to_name(int sysfs_dirfd, intel_sysfs_attr_id id, int gt)
 		intel_sysfs_attr_name[0][id];
 }
 
+static struct intel_perf *
+xe_perf_for_fd(int drm_fd, int gt)
+{
+	uint32_t device_id;
+	uint32_t device_revision = 0;
+	uint32_t timestamp_frequency;
+	uint64_t gt_min_freq;
+	uint64_t gt_max_freq;
+	struct intel_perf *ret;
+	int sysfs_dir_fd = open_master_sysfs_dir(drm_fd);
+	char path_min[64], path_max[64];
+
+	if (sysfs_dir_fd < 0) {
+		igt_warn("open_master_sysfs_dir failed\n");
+		return NULL;
+	}
+
+	if (IS_PONTEVECCHIO(xe_dev_id(drm_fd))) {
+		sprintf(path_min, "device/tile%d/gt%d/freq_min", gt, gt);
+		sprintf(path_max, "device/tile%d/gt%d/freq_max", gt, gt);
+	} else {
+		sprintf(path_min, "device/tile0/gt%d/freq_min", gt);
+		sprintf(path_max, "device/tile0/gt%d/freq_max", gt);
+	}
+
+	if (!read_sysfs(sysfs_dir_fd, path_min, &gt_min_freq) ||
+	    !read_sysfs(sysfs_dir_fd, path_max, &gt_max_freq)) {
+		igt_warn("Unable to read freqs from sysfs\n");
+		close(sysfs_dir_fd);
+		return NULL;
+	}
+	close(sysfs_dir_fd);
+
+	device_id = intel_get_drm_devid(drm_fd);
+	timestamp_frequency = xe_gts(drm_fd)->gts[0].oa_timestamp_freq;
+
+	ret = intel_perf_for_devinfo(device_id,
+				     device_revision,
+				     timestamp_frequency,
+				     gt_min_freq * 1000000,
+				     gt_max_freq * 1000000,
+				     NULL);
+	if (!ret)
+		igt_warn("intel_perf_for_devinfo failed\n");
+
+	return ret;
+}
+
 struct intel_perf *
 intel_perf_for_fd(int drm_fd, int gt)
 {
@@ -621,6 +668,9 @@ intel_perf_for_fd(int drm_fd, int gt)
 	struct intel_perf *ret;
 	int sysfs_dir_fd = open_master_sysfs_dir(drm_fd);
 
+	if (is_xe_device(drm_fd))
+		return xe_perf_for_fd(drm_fd, gt);
+
 	if (sysfs_dir_fd < 0)
 		return NULL;
 
diff --git a/lib/meson.build b/lib/meson.build
index ce11c0715f96..86b53f5bfae3 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -346,7 +346,7 @@ endforeach
 lib_igt_i915_perf_build = shared_library(
   'i915_perf',
   i915_perf_files,
-  dependencies: lib_igt_chipset,
+  dependencies: [lib_igt_chipset,lib_igt,pciaccess],
   include_directories : inc,
   install: true,
   soversion: '1.5')
-- 
2.41.0
