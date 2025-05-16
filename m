Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D1F4C3ABD8
	for <igt-dev@archiver.kernel.org>; Fri, 16 May 2025 16:06:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04E9B10EB20;
	Fri, 16 May 2025 16:06:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f4qNZgX6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8980310EB23
 for <igt-dev@lists.freedesktop.org>; Fri, 16 May 2025 16:06:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747411613; x=1778947613;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=e48Kixh7zAnnXZlVYBv+TLLaNSffkprEDJr44O7839Y=;
 b=f4qNZgX6J2++rydXwFvFg0OPFnUEqViRrRpJe/PerGOL2Y5UgP6kh5QU
 TvZAPlV3eQQ8ZTrLhUv4Mmq+4YThxKFV6kFcHd33PCWv+7RkT3xAG6mGb
 F3N+l/CgLJLFRyQHnju4iVMvOk7CN7dE7bcEH9GQgSmZR9PRm21sveu3o
 uq1WEeNJiP/qfY/o/O4ZoxIW/EMcLv9h2gIdMj+AWizsQaa0FSOtfi2KV
 /TyV3cm7xRP+xQRSNa6hMzmP6DDb8bLlwcVqEZFx/bwZHhtVnzJ648RhM
 HSLjkORRyNM7FbaPpGWxI9a7XsqLfeqwopln/sYtWl/zbG24zS20cZPOH A==;
X-CSE-ConnectionGUID: VXm73TiGTuGr9cgfo/uCpw==
X-CSE-MsgGUID: 9BwaWGxGT9mB7kATh2Gn9g==
X-IronPort-AV: E=McAfee;i="6700,10204,11435"; a="66941202"
X-IronPort-AV: E=Sophos;i="6.15,294,1739865600"; d="scan'208";a="66941202"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2025 09:06:52 -0700
X-CSE-ConnectionGUID: 9GjloFAjQV6EGqg+DXJEXQ==
X-CSE-MsgGUID: JmMpd8C0QHqPEOkGm9q/iA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,294,1739865600"; d="scan'208";a="169772641"
Received: from unknown (HELO d368ed45d7ae.iind.intel.com) ([10.66.234.123])
 by fmviesa001.fm.intel.com with ESMTP; 16 May 2025 09:06:49 -0700
From: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: zbigniew.kempczynski@intel.com, kamil.konieczny@intel.com,
 markyacoub@google.com, seanpaul@google.com, carlos.santa@intel.com,
 sapna1.singh@intel.com,
 Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
Subject: [PATCH i-g-t v6 14/14] lib/igt_device_scan: reuse igt hash
Date: Fri, 16 May 2025 16:05:51 +0000
Message-ID: <20250516160551.58760-15-jeevaka.badrappan@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250516160551.58760-1-jeevaka.badrappan@intel.com>
References: <20250516160551.58760-1-jeevaka.badrappan@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

As glib is not available in Andriod, replace the glib hash
functions by reusing the igt hash functions.

Signed-off-by: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
---
 lib/igt_device_scan.c | 78 ++++++++++++++++++++++---------------------
 lib/meson.build       |  1 +
 2 files changed, 41 insertions(+), 38 deletions(-)

diff --git a/lib/igt_device_scan.c b/lib/igt_device_scan.c
index 45faabc45..2a9dd8395 100644
--- a/lib/igt_device_scan.c
+++ b/lib/igt_device_scan.c
@@ -26,12 +26,12 @@
 #include "igt_core.h"
 #include "igt_device_scan.h"
 #include "igt_list.h"
+#include "igt_map.h"
 #include "intel_chipset.h"
 
 #include <ctype.h>
 #include <dirent.h>
 #include <fcntl.h>
-#include <glib.h>
 #include <libudev.h>
 #ifdef __linux__
 #include <linux/limits.h>
@@ -224,8 +224,8 @@ struct igt_device {
 	/* Point to vendor spec if can be found */
 
 	/* Properties / sysattrs rewriten from udev lists */
-	GHashTable *props_ht;
-	GHashTable *attrs_ht;
+	struct igt_map *props_map;
+	struct igt_map *attrs_map;
 
 	/* Most usable variables from udev device */
 	char *subsystem;
@@ -464,6 +464,11 @@ static bool is_on_blacklist(const char *what)
 
 }
 
+static int key_equals(const void *key1, const void *key2)
+{
+	return strcmp((char *)key1, (char *)key2) == 0;
+}
+
 static struct igt_device *igt_device_new(void)
 {
 	struct igt_device *dev;
@@ -472,14 +477,14 @@ static struct igt_device *igt_device_new(void)
 	if (!dev)
 		return NULL;
 
-	dev->attrs_ht = g_hash_table_new_full(g_str_hash, g_str_equal,
-					      free, free);
-	dev->props_ht = g_hash_table_new_full(g_str_hash, g_str_equal,
-					      free, free);
+	dev->attrs_map = igt_map_create(igt_map_hash_32, key_equals);
+	dev->props_map = igt_map_create(igt_map_hash_32, key_equals);
 
-	if (dev->attrs_ht && dev->props_ht)
+	if (dev->attrs_map && dev->props_map)
 		return dev;
 
+	igt_map_destroy(dev->attrs_map, NULL);
+	igt_map_destroy(dev->props_map, NULL);
 	free(dev);
 
 	return NULL;
@@ -491,7 +496,7 @@ static void igt_device_add_prop(struct igt_device *dev,
 	if (!key || !value)
 		return;
 
-	g_hash_table_insert(dev->props_ht, strdup(key), strdup(value));
+	igt_map_insert(dev->props_map, strdup(key), strdup(value));
 }
 
 static void igt_device_add_attr(struct igt_device *dev,
@@ -525,7 +530,7 @@ static void igt_device_add_attr(struct igt_device *dev,
 		v++;
 	}
 
-	g_hash_table_insert(dev->attrs_ht, strdup(key), strdup(v));
+	igt_map_insert(dev->attrs_map, strdup(key), strdup(v));
 }
 
 /* Iterate over udev properties list and rewrite it to igt_device properties
@@ -585,19 +590,30 @@ static void get_attrs_limited(struct udev_device *dev, struct igt_device *idev)
 	}
 }
 
-#define get_prop(dev, prop) ((char *) g_hash_table_lookup(dev->props_ht, prop))
-#define get_attr(dev, attr) ((char *) g_hash_table_lookup(dev->attrs_ht, attr))
+#define get_prop(dev, prop) ((char *) igt_map_search(dev->props_map, prop))
+#define get_attr(dev, attr) ((char *) igt_map_search(dev->attrs_map, attr))
 #define get_prop_subsystem(dev) get_prop(dev, "SUBSYSTEM")
 #define is_drm_subsystem(dev)  (strequal(get_prop_subsystem(dev), "drm"))
 #define is_pci_subsystem(dev)  (strequal(get_prop_subsystem(dev), "pci"))
 
-static void print_ht(GHashTable *ht);
+static inline void _print_key_value(const char *k, const char *v)
+{
+	printf("%-32s: %s\n", k, v);
+}
+
 static void dump_props_and_attrs(const struct igt_device *dev)
 {
+	struct igt_map_entry *entry;
+
 	printf("\n[properties]\n");
-	print_ht(dev->props_ht);
+	igt_map_foreach(dev->props_map, entry) {
+		_print_key_value((char *)entry->key, (char *)entry->data);
+	}
+
 	printf("\n[attributes]\n");
-	print_ht(dev->attrs_ht);
+	igt_map_foreach(dev->attrs_map, entry) {
+		_print_key_value((char *)entry->key, (char *)entry->data);
+	}
 	printf("\n");
 }
 
@@ -949,7 +965,7 @@ static struct igt_device *duplicate_device(struct igt_device *dev) {
 	return dup;
 }
 
-static gint devs_compare(const void *a, const void *b)
+static int devs_compare(const void *a, const void *b)
 {
 	struct igt_device *dev1, *dev2;
 	int ret;
@@ -1076,6 +1092,12 @@ static void scan_drm_devices(bool limit_attrs)
 	}
 }
 
+static void free_key_value(struct igt_map_entry *entry)
+{
+	free((char *)entry->key);
+	free(entry->data);
+}
+
 static void igt_device_free(struct igt_device *dev)
 {
 	free(dev->codename);
@@ -1088,8 +1110,8 @@ static void igt_device_free(struct igt_device *dev)
 	free(dev->device);
 	free(dev->driver);
 	free(dev->pci_slot_name);
-	g_hash_table_destroy(dev->attrs_ht);
-	g_hash_table_destroy(dev->props_ht);
+	igt_map_destroy(dev->attrs_map, free_key_value);
+	igt_map_destroy(dev->props_map, free_key_value);
 }
 
 void igt_devices_free(void)
@@ -1323,26 +1345,6 @@ igt_devs_print_user(struct igt_list_head *view,
 	}
 }
 
-static inline void _print_key_value(const char* k, const char *v)
-{
-	printf("%-32s: %s\n", k, v);
-}
-
-static void print_ht(GHashTable *ht)
-{
-	GList *keys = g_hash_table_get_keys(ht);
-
-	keys = g_list_sort(keys, (GCompareFunc) strcmp);
-	while (keys) {
-		char *k = (char *) keys->data;
-		char *v = g_hash_table_lookup(ht, k);
-
-		_print_key_value(k, v);
-		keys = g_list_next(keys);
-	}
-	g_list_free(keys);
-}
-
 static void
 igt_devs_print_detail(struct igt_list_head *view,
 		      const struct igt_devices_print_format *fmt)
diff --git a/lib/meson.build b/lib/meson.build
index b58976a43..b590db9d4 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -304,6 +304,7 @@ scan_dep = [
 lib_igt_device_scan_build = static_library('igt_device_scan',
 	['igt_device_scan.c',
 	'igt_list.c',
+	'igt_map.c',
 	'igt_tools_stub.c',
 	'intel_device_info.c',
 	'intel_cmds_info.c',
-- 
2.49.0

