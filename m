Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F4CC10E4DA
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Jun 2023 07:00:40 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 22 Jun 2023 12:24:02 +0530
Message-Id: <20230622065422.2235134-4-bhanuprakash.modem@intel.com>
In-Reply-To: <20230622065422.2235134-1-bhanuprakash.modem@intel.com>
References: <20230622065422.2235134-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [V3 i-g-t 03/23] lib/xe/xe_query: Add xe_config()
 interface
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

Add support to get XE configuration from xe_device.

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 lib/xe/xe_query.c | 8 ++++++++
 lib/xe/xe_query.h | 1 +
 2 files changed, 9 insertions(+)

diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
index 47be8f301..48fb5afba 100644
--- a/lib/xe/xe_query.c
+++ b/lib/xe/xe_query.c
@@ -479,6 +479,14 @@ uint32_t xe_min_page_size(int fd, uint64_t region)
 	return xe_mem_region(fd, region)->min_page_size;
 }
 
+/**
+ * xe_config:
+ * @fd: xe device fd
+ *
+ * Returns xe configuration of xe device @fd.
+ */
+xe_dev_FN(xe_config, config, struct drm_xe_query_config *);
+
 /**
  * xe_number_hw_engine:
  * @fd: xe device fd
diff --git a/lib/xe/xe_query.h b/lib/xe/xe_query.h
index 943ca558a..3cbf32668 100644
--- a/lib/xe/xe_query.h
+++ b/lib/xe/xe_query.h
@@ -86,6 +86,7 @@ struct drm_xe_engine_class_instance *xe_hw_engine(int fd, int idx);
 struct drm_xe_query_mem_region *xe_mem_region(int fd, uint64_t region);
 const char *xe_region_name(uint64_t region);
 uint32_t xe_min_page_size(int fd, uint64_t region);
+struct drm_xe_query_config *xe_config(int fd);
 unsigned int xe_number_hw_engines(int fd);
 bool xe_has_vram(int fd);
 uint64_t xe_vram_size(int fd, int gt);
-- 
2.40.0
