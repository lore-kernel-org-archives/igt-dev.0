Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E313010E1CD
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Jul 2023 23:18:02 +0000 (UTC)
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 20 Jul 2023 16:17:38 -0700
Message-ID: <20230720231756.3464641-3-ashutosh.dixit@intel.com>
In-Reply-To: <20230720231756.3464641-1-ashutosh.dixit@intel.com>
References: <20230720231756.3464641-1-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 02/20] lib/xe/xe_query: Add xe_gts interface
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

Add support to get XE gt info from xe_device.

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 lib/xe/xe_query.c | 8 ++++++++
 lib/xe/xe_query.h | 1 +
 2 files changed, 9 insertions(+)

diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
index f535ad8534dd..b8f973b0931b 100644
--- a/lib/xe/xe_query.c
+++ b/lib/xe/xe_query.c
@@ -503,6 +503,14 @@ uint32_t xe_min_page_size(int fd, uint64_t region)
  */
 xe_dev_FN(xe_config, config, struct drm_xe_query_config *);
 
+/**
+ * xe_gts:
+ * @fd: xe device fd
+ *
+ * Returns query gts of xe device @fd.
+ */
+xe_dev_FN(xe_gts, gts, struct drm_xe_query_gts *);
+
 /**
  * xe_number_hw_engine:
  * @fd: xe device fd
diff --git a/lib/xe/xe_query.h b/lib/xe/xe_query.h
index 68ca5a680c6e..8d3f0983166e 100644
--- a/lib/xe/xe_query.h
+++ b/lib/xe/xe_query.h
@@ -88,6 +88,7 @@ const char *xe_region_name(uint64_t region);
 uint16_t xe_region_class(int fd, uint64_t region);
 uint32_t xe_min_page_size(int fd, uint64_t region);
 struct drm_xe_query_config *xe_config(int fd);
+struct drm_xe_query_gts *xe_gts(int fd);
 unsigned int xe_number_hw_engines(int fd);
 bool xe_has_vram(int fd);
 uint64_t xe_vram_size(int fd, int gt);
-- 
2.41.0
