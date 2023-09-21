Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2410510E568
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Sep 2023 07:04:05 +0000 (UTC)
From: Lukasz Laguna <lukasz.laguna@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 21 Sep 2023 09:02:54 +0200
Message-Id: <20230921070254.30384-1-lukasz.laguna@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] lib/xe_query: add media GT presence checker
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

Add helper checking if platform is equipped with media GT.

Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
---
 lib/xe/xe_query.c | 20 ++++++++++++++++++++
 lib/xe/xe_query.h |  1 +
 2 files changed, 21 insertions(+)

diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
index c356abe1e..ea76e90be 100644
--- a/lib/xe/xe_query.c
+++ b/lib/xe/xe_query.c
@@ -712,6 +712,26 @@ bool xe_has_engine_class(int fd, uint16_t engine_class)
 	return false;
 }
 
+/**
+ * xe_has_media_gt:
+ * @fd: xe device fd
+ *
+ * Returns true if device @fd has media GT otherwise false.
+ */
+bool xe_has_media_gt(int fd)
+{
+	struct xe_device *xe_dev;
+
+	xe_dev = find_in_cache(fd);
+	igt_assert(xe_dev);
+
+	for (int i = 0; i < xe_dev->number_gt; i++)
+		if (xe_dev->gts->gts[i].type == XE_QUERY_GT_TYPE_MEDIA)
+			return true;
+
+	return false;
+}
+
 igt_constructor
 {
 	xe_device_cache_init();
diff --git a/lib/xe/xe_query.h b/lib/xe/xe_query.h
index 20dbfa12c..e632b6925 100644
--- a/lib/xe/xe_query.h
+++ b/lib/xe/xe_query.h
@@ -104,6 +104,7 @@ uint16_t xe_dev_id(int fd);
 bool xe_supports_faults(int fd);
 const char *xe_engine_class_string(uint32_t engine_class);
 bool xe_has_engine_class(int fd, uint16_t engine_class);
+bool xe_has_media_gt(int fd);
 
 struct xe_device *xe_device_get(int fd);
 void xe_device_put(int fd);
-- 
2.40.0
