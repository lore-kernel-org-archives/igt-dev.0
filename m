Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D10010E5B3
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Oct 2023 13:01:13 +0000 (UTC)
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 20 Oct 2023 15:00:15 +0200
Message-ID: <20231020130016.86398-8-kamil.konieczny@linux.intel.com>
In-Reply-To: <20231020130016.86398-1-kamil.konieczny@linux.intel.com>
References: <20231020130016.86398-1-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v9 7/8] lib/drmtest: create helper for
 dropping opened paths
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

Create helper for cleaning all cached opened paths for drivers.
This may be used when we want to test multi-GPU scenarios and in
them inform user about each opened GPU card including first one.
Currently almost all tests open first card at start for
performing checks for it but that cause a lost possibilty to
inform user later about opening this first card.

Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 lib/drmtest.c | 24 +++++++++++++++++++++---
 lib/drmtest.h |  1 +
 2 files changed, 22 insertions(+), 3 deletions(-)

diff --git a/lib/drmtest.c b/lib/drmtest.c
index 2cdeb8e3b..8eeb11976 100644
--- a/lib/drmtest.c
+++ b/lib/drmtest.c
@@ -221,16 +221,17 @@ struct _opened_device_path {
 	struct igt_list_head link;
 };
 
+static IGT_LIST_HEAD(_opened_paths);
+
 /*
  * Logs path of opened device. Device path opened for the first time is logged at info level,
  * subsequent opens (if any) are logged at debug level.
  */
 static void log_opened_device_path(const char *device_path)
 {
-	static IGT_LIST_HEAD(opened_paths);
 	struct _opened_device_path *item;
 
-	igt_list_for_each_entry(item, &opened_paths, link) {
+	igt_list_for_each_entry(item, &_opened_paths, link) {
 		if (!strcmp(item->path, device_path)) {
 			igt_debug("Opened previously opened device: %s\n", device_path);
 			return;
@@ -241,10 +242,27 @@ static void log_opened_device_path(const char *device_path)
 	igt_assert(item);
 	item->path = strdup(device_path);
 	igt_assert(item->path);
-	igt_list_add(&item->link, &opened_paths);
+	igt_list_add(&item->link, &_opened_paths);
 	igt_info("Opened device: %s\n", item->path);
 }
 
+/**
+ * __drm_invalidate_opened:
+ *
+ * Invalidate cached opened paths.
+ */
+void __drm_invalidate_opened(void)
+{
+	struct _opened_device_path *item, *tmp;
+
+	if (!igt_list_empty(&_opened_paths))
+		igt_list_for_each_entry_safe(item, tmp, &_opened_paths, link) {
+			free(item->path);
+			igt_list_del(&item->link);
+			free(item);
+		}
+}
+
 static int open_device(const char *name, unsigned int chipset)
 {
 	const char *forced;
diff --git a/lib/drmtest.h b/lib/drmtest.h
index 7db2292cb..f516412a0 100644
--- a/lib/drmtest.h
+++ b/lib/drmtest.h
@@ -110,6 +110,7 @@ int drm_close_driver(int fd);
 int drm_reopen_driver(int fd);
 
 int drm_get_gpu_count(int chipset);
+void __drm_invalidate_opened(void);
 
 void igt_require_amdgpu(int fd);
 void igt_require_intel(int fd);
-- 
2.42.0
