Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98FBF10E034
 for <igt-dev@lists.freedesktop.org>; Thu, 25 May 2023 19:34:25 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 25 May 2023 21:34:10 +0200
Message-Id: <20230525193411.174802-2-zbigniew.kempczynski@intel.com>
In-Reply-To: <20230525193411.174802-1-zbigniew.kempczynski@intel.com>
References: <20230525193411.174802-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/2] xe/xe_query: Add engine class checker
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

Some platforms might be not equipped with some engine classes so check
before execution is reasonable choice. Add simple engine check to use
in igt_require() constructs.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 lib/xe/xe_query.c | 21 +++++++++++++++++++++
 lib/xe/xe_query.h |  1 +
 2 files changed, 22 insertions(+)

diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
index bd5eb1d189..47be8f301a 100644
--- a/lib/xe/xe_query.c
+++ b/lib/xe/xe_query.c
@@ -536,6 +536,27 @@ xe_dev_FN(xe_va_bits, va_bits, uint32_t);
  */
 xe_dev_FN(xe_dev_id, dev_id, uint16_t);
 
+/**
+ * xe_has_engine_class:
+ * @fd: xe device fd
+ * @engine_class: engine class
+ *
+ * Returns true if device @fd has hardware engine @class otherwise false.
+ */
+bool xe_has_engine_class(int fd, uint16_t engine_class)
+{
+	struct xe_device *xe_dev;
+
+	xe_dev = find_in_cache(fd);
+	igt_assert(xe_dev);
+
+	for (int i = 0; i < xe_dev->number_hw_engines; i++)
+		if (xe_dev->hw_engines[i].engine_class == engine_class)
+			return true;
+
+	return false;
+}
+
 igt_constructor
 {
 	xe_device_cache_init();
diff --git a/lib/xe/xe_query.h b/lib/xe/xe_query.h
index cc6e7cefdc..943ca558a5 100644
--- a/lib/xe/xe_query.h
+++ b/lib/xe/xe_query.h
@@ -94,6 +94,7 @@ uint32_t xe_va_bits(int fd);
 uint16_t xe_dev_id(int fd);
 bool xe_supports_faults(int fd);
 const char *xe_engine_class_string(uint32_t engine_class);
+bool xe_has_engine_class(int fd, uint16_t engine_class);
 
 struct xe_device *xe_device_get(int fd);
 void xe_device_put(int fd);
-- 
2.34.1
