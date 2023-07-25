Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4011D10E39D
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Jul 2023 07:14:54 +0000 (UTC)
From: janga.rahul.kumar@intel.com
To: igt-dev@lists.freedesktop.org, ramadevi.gandi@intel.com,
 janga.rahul.kumar@intel.com
Date: Tue, 25 Jul 2023 12:46:21 +0530
Message-Id: <20230725071622.206601-2-janga.rahul.kumar@intel.com>
In-Reply-To: <20230725071622.206601-1-janga.rahul.kumar@intel.com>
References: <20230725071622.206601-1-janga.rahul.kumar@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/2] lib/xe: Add support to reset all GT's
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: sai.gowtham.ch@intel.com, kunal1.joshi@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Janga Rahul Kumar <janga.rahul.kumar@intel.com>

Add library support to check support for GT reset and
force reset all GT's.

Cc: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Signed-off-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
---
 lib/igt_gt.c      |  7 +++++++
 lib/xe/xe_ioctl.c | 52 +++++++++++++++++++++++++++++++++++++++++++++++
 lib/xe/xe_ioctl.h |  2 ++
 3 files changed, 61 insertions(+)

diff --git a/lib/igt_gt.c b/lib/igt_gt.c
index d4a825e66..2ce464ba6 100644
--- a/lib/igt_gt.c
+++ b/lib/igt_gt.c
@@ -45,6 +45,7 @@
 #include "intel_chipset.h"
 #include "igt_dummyload.h"
 
+#include "xe/xe_ioctl.h"
 /**
  * SECTION:igt_gt
  * @short_description: GT support library
@@ -60,6 +61,9 @@ static int reset_query_once = -1;
 
 static bool has_gpu_reset(int fd)
 {
+	if (is_xe_device(fd))
+		has_xe_gt_reset(fd);
+
 	if (reset_query_once < 0) {
 		reset_query_once = gem_gpu_reset_type(fd);
 
@@ -395,6 +399,9 @@ void igt_post_hang_ring(int fd, igt_hang_t arg)
  */
 void igt_force_gpu_reset(int drm_fd)
 {
+	if (is_xe_device(drm_fd))
+		xe_force_gt_reset_all(drm_fd);
+
 	int dir, wedged;
 
 	igt_debug("Triggering GPU reset\n");
diff --git a/lib/xe/xe_ioctl.c b/lib/xe/xe_ioctl.c
index 1f9240cd9..488aa218e 100644
--- a/lib/xe/xe_ioctl.c
+++ b/lib/xe/xe_ioctl.c
@@ -41,6 +41,7 @@
 #include "config.h"
 #include "drmtest.h"
 #include "igt_syncobj.h"
+#include "igt_sysfs.h"
 #include "ioctl_wrappers.h"
 #include "xe_ioctl.h"
 #include "xe_query.h"
@@ -455,6 +456,57 @@ int64_t xe_wait_ufence_abstime(int fd, uint64_t *addr, uint64_t value,
 	return ts.tv_sec * 1e9 + ts.tv_nsec;
 }
 
+
+/**
+ * has_xe_gt_reset:
+ * @fd: open xe drm file descriptor
+ *
+ * Check gt force reset syfs entry is available or not
+ *
+ * Returns: reset sysfs entry available
+ */
+bool has_xe_gt_reset(int fd)
+{
+	char reset_sysfs_path[100];
+	struct stat st;
+	int gt;
+	int reset_sysfs_fd = -1;
+	int sysfs_fd = -1;
+	igt_assert_eq(fstat(fd, &st), 0);
+
+	sysfs_fd = igt_sysfs_open(fd);
+	igt_assert(sysfs_fd != -1);
+
+	xe_for_each_gt(fd, gt) {
+		sprintf(reset_sysfs_path, "/sys/kernel/debug/dri/%d/gt%d/force_reset", minor(st.st_rdev), gt);
+		reset_sysfs_fd = openat(sysfs_fd, reset_sysfs_path, O_RDONLY);
+
+		if(reset_sysfs_fd == -1) {
+			close(sysfs_fd);
+			return 0;
+		}
+
+		close(reset_sysfs_fd);
+       }
+
+	close(sysfs_fd);
+	return 1;
+}
+
+/**
+ * xe_force_gt_reset_all:
+ *
+ * Forces reset of all the GT's.
+ *
+ */
+void xe_force_gt_reset_all(int xe_fd)
+{
+	int gt;
+	xe_for_each_gt(xe_fd, gt)
+		xe_force_gt_reset(xe_fd, gt);
+}
+
+
 void xe_force_gt_reset(int fd, int gt)
 {
 	char reset_string[128];
diff --git a/lib/xe/xe_ioctl.h b/lib/xe/xe_ioctl.h
index 320e0f9f6..5a528b345 100644
--- a/lib/xe/xe_ioctl.h
+++ b/lib/xe/xe_ioctl.h
@@ -87,6 +87,8 @@ int64_t xe_wait_ufence_abstime(int fd, uint64_t *addr, uint64_t value,
 			       struct drm_xe_engine_class_instance *eci,
 			       int64_t timeout);
 void xe_force_gt_reset(int fd, int gt);
+void xe_force_gt_reset_all(int fd);
+bool has_xe_gt_reset(int fd);
 void xe_vm_madvise(int fd, uint32_t vm, uint64_t addr, uint64_t size,
 		   uint32_t property, uint32_t value);
 
-- 
2.25.1
