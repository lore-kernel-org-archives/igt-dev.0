Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B371010E2CA
 for <igt-dev@lists.freedesktop.org>; Tue,  4 Jul 2023 09:01:17 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue,  4 Jul 2023 11:00:54 +0200
Message-Id: <20230704090104.120219-3-zbigniew.kempczynski@intel.com>
In-Reply-To: <20230704090104.120219-1-zbigniew.kempczynski@intel.com>
References: <20230704090104.120219-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 02/12] lib/xe_query: Add xe_region_class()
 helper
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

In the common code we often need to be aware of region class.
Add helper which returns it from region id.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 lib/xe/xe_query.c | 16 ++++++++++++++++
 lib/xe/xe_query.h |  1 +
 2 files changed, 17 insertions(+)

diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
index 830b7e401d..f535ad8534 100644
--- a/lib/xe/xe_query.c
+++ b/lib/xe/xe_query.c
@@ -467,6 +467,22 @@ const char *xe_region_name(uint64_t region)
 	return vrams[region_idx];
 }
 
+/**
+ * xe_region_class:
+ * @fd: xe device fd
+ * @region: region mask
+ *
+ * Returns class of memory region structure for @region mask.
+ */
+uint16_t xe_region_class(int fd, uint64_t region)
+{
+	struct drm_xe_query_mem_region *memreg;
+
+	memreg = xe_mem_region(fd, region);
+
+	return memreg->mem_class;
+}
+
 /**
  * xe_min_page_size:
  * @fd: xe device fd
diff --git a/lib/xe/xe_query.h b/lib/xe/xe_query.h
index ff328ab942..68ca5a680c 100644
--- a/lib/xe/xe_query.h
+++ b/lib/xe/xe_query.h
@@ -85,6 +85,7 @@ struct drm_xe_engine_class_instance *xe_hw_engines(int fd);
 struct drm_xe_engine_class_instance *xe_hw_engine(int fd, int idx);
 struct drm_xe_query_mem_region *xe_mem_region(int fd, uint64_t region);
 const char *xe_region_name(uint64_t region);
+uint16_t xe_region_class(int fd, uint64_t region);
 uint32_t xe_min_page_size(int fd, uint64_t region);
 struct drm_xe_query_config *xe_config(int fd);
 unsigned int xe_number_hw_engines(int fd);
-- 
2.34.1
