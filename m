Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF39810E783
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Mar 2023 10:58:32 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org,
	zbigniew.kempczynski@intel.com
Date: Tue, 14 Mar 2023 16:24:50 +0530
Message-Id: <20230314105452.2169208-4-bhanuprakash.modem@intel.com>
In-Reply-To: <20230314105452.2169208-1-bhanuprakash.modem@intel.com>
References: <20230314105452.2169208-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t 3/5] lib/xe/xe_query: Add dev_id() interface
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

Add support to query XE_QUERY_CONFIG_REV_AND_DEVICE_ID.

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 lib/xe/xe_query.c | 9 +++++++++
 lib/xe/xe_query.h | 4 ++++
 2 files changed, 13 insertions(+)

diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
index a6926057f..e27d14383 100644
--- a/lib/xe/xe_query.c
+++ b/lib/xe/xe_query.c
@@ -247,6 +247,7 @@ struct xe_device *xe_device_get(int fd)
 	xe_dev->config = xe_query_config_new(fd);
 	xe_dev->number_gt = xe_dev->config->info[XE_QUERY_CONFIG_GT_COUNT];
 	xe_dev->va_bits = xe_dev->config->info[XE_QUERY_CONFIG_VA_BITS];
+	xe_dev->dev_id = xe_dev->config->info[XE_QUERY_CONFIG_REV_AND_DEVICE_ID] & 0xffff;
 	xe_dev->gts = xe_query_gts_new(fd);
 	xe_dev->memory_regions = __memory_regions(xe_dev->gts);
 	xe_dev->hw_engines = xe_query_engines_new(fd, &xe_dev->number_hw_engines);
@@ -465,6 +466,14 @@ xe_dev_FN(xe_supports_faults, supports_faults, bool);
  */
 xe_dev_FN(xe_va_bits, va_bits, uint32_t);
 
+/**
+ * xe_dev_id:
+ * @fd: xe device fd
+ *
+ * Returns Device id of xe device @fd.
+ */
+xe_dev_FN(xe_dev_id, dev_id, uint32_t);
+
 igt_constructor
 {
 	xe_device_cache_init();
diff --git a/lib/xe/xe_query.h b/lib/xe/xe_query.h
index fe1343f61..08cee7e14 100644
--- a/lib/xe/xe_query.h
+++ b/lib/xe/xe_query.h
@@ -58,6 +58,9 @@ struct xe_device {
 
 	/** @va_bits: va length in bits */
 	uint32_t va_bits;
+
+	/** @dev_id: Device id of xe device*/
+	uint32_t dev_id;
 };
 
 #define for_each_hw_engine(__fd, __hwe) \
@@ -85,6 +88,7 @@ bool xe_has_vram(int fd);
 uint64_t xe_vram_size(int fd, int gt);
 uint32_t xe_get_default_alignment(int fd);
 uint32_t xe_va_bits(int fd);
+uint32_t xe_dev_id(int fd);
 bool xe_supports_faults(int fd);
 const char *xe_engine_class_string(uint32_t engine_class);
 
-- 
2.39.1
