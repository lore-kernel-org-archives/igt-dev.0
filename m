Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01086C3ABA5
	for <igt-dev@archiver.kernel.org>; Tue, 29 Apr 2025 20:40:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2F0310E457;
	Tue, 29 Apr 2025 20:40:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="awK7hm0j";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7283E10E457
 for <igt-dev@lists.freedesktop.org>; Tue, 29 Apr 2025 20:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745959241; x=1777495241;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+qy+tzvh1Mww4FjqsPPKwINyiu2RoYd2Gcp0Thj3vvs=;
 b=awK7hm0j+kQ0TjdlpnOsbH2Q9Am+G6MbtNLN2I/2RxubxcUEPF5GAyXM
 XO268fpGhLKuh+nIuw8ThrjE1dnGyspmOX+CSDrhPq2Bcku7C9d9fZu38
 YCh4eKOZc4+3XDH4OymTJo4VoAabcOkUFNEDX/Nb4AoPnvqUqnlJVAxbe
 wALpSJtfW5cCZUi3ZiLzEiu2c4GurzH1VnTyJDwty9MPUrk6TQ/7SZo5H
 q3nVUnn6UkXKI4gBb6ieQZ8THeRftP3gO0EkZcyBBuQ4r2aNwCOaSRmw7
 nXmXHjFYKt6qhewbtbc/ZG1uD8kNd4WBDfbL/7218lBwhT9qH4hhx/sry A==;
X-CSE-ConnectionGUID: hhOK8ydYROSYBdBOWB7lgg==
X-CSE-MsgGUID: 1wd0QtDJSw2ohDa7+s4YKw==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="72983465"
X-IronPort-AV: E=Sophos;i="6.15,250,1739865600"; d="scan'208";a="72983465"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2025 13:40:40 -0700
X-CSE-ConnectionGUID: NG3xw0/KRsqk9aM1voUk+Q==
X-CSE-MsgGUID: DgvVTEWYSVePfUFRZ52LGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,250,1739865600"; d="scan'208";a="138739979"
Received: from intel-s2600stb.iind.intel.com (HELO
 08ca91f16b80.iind.intel.com) ([10.66.234.77])
 by fmviesa005.fm.intel.com with ESMTP; 29 Apr 2025 13:40:38 -0700
From: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jeevaka.badrappan@intel.com, sapna1.singh@intel.com, markyacoub@google.com,
 seanpaul@google.com, carlos.santa@intel.com
Subject: [PATCH 4/5] Replace glib hash table with c specific implementation
Date: Tue, 29 Apr 2025 20:39:18 +0000
Message-ID: <20250429203919.41503-5-jeevaka.badrappan@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250429203919.41503-1-jeevaka.badrappan@intel.com>
References: <20250429203919.41503-1-jeevaka.badrappan@intel.com>
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

Inorder to support igt build for Android(without glib), replaced
the glib hashtable function with generic hash table implementation.

Signed-off-by: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
---
 lib/igt_device_scan.c | 118 ++++++++++++++++++++++++++++++++----------
 1 file changed, 90 insertions(+), 28 deletions(-)

diff --git a/lib/igt_device_scan.c b/lib/igt_device_scan.c
index 3f26a1737..c121e53bb 100644
--- a/lib/igt_device_scan.c
+++ b/lib/igt_device_scan.c
@@ -28,10 +28,10 @@
 #include "igt_list.h"
 #include "intel_chipset.h"
 
+#include <string.h>
 #include <ctype.h>
 #include <dirent.h>
 #include <fcntl.h>
-#include <glib.h>
 #include <libudev.h>
 #ifdef __linux__
 #include <linux/limits.h>
@@ -217,6 +217,18 @@ static inline bool strequal(const char *a, const char *b)
 	return strcmp(a, b) == 0;
 }
 
+#define TABLE_SIZE 100
+
+typedef struct KeyValue {
+	char *key;
+	char *value;
+	struct KeyValue *next;
+} KeyValue;
+
+typedef struct {
+	KeyValue *table[TABLE_SIZE];
+} HashTable;
+
 struct igt_device {
 	/* Filled for drm devices */
 	struct igt_device *parent;
@@ -224,8 +236,8 @@ struct igt_device {
 	/* Point to vendor spec if can be found */
 
 	/* Properties / sysattrs rewriten from udev lists */
-	GHashTable *props_ht;
-	GHashTable *attrs_ht;
+	HashTable *props_ht;
+	HashTable *attrs_ht;
 
 	/* Most usable variables from udev device */
 	char *subsystem;
@@ -261,6 +273,61 @@ static void igt_device_free(struct igt_device *dev);
 typedef char *(*devname_fn)(uint16_t, uint16_t);
 typedef enum dev_type (*devtype_fn)(uint16_t, uint16_t, const char *);
 
+static unsigned int hash(const char *key)
+{
+	unsigned int hash = 0;
+	while (*key) {
+		hash = (hash << 5) + *key++;
+	}
+	return hash % TABLE_SIZE;
+}
+
+static HashTable *create_table(void)
+{
+	HashTable *table = malloc(sizeof(HashTable));
+	for (int i = 0; i < TABLE_SIZE; i++) {
+		table->table[i] = NULL;
+	}
+	return table;
+}
+
+static void insert_table(HashTable *table, const char *key, const char *value)
+{
+	unsigned int index = hash(key);
+	KeyValue *new_pair = malloc(sizeof(KeyValue));
+	new_pair->key = strdup(key);
+	new_pair->value = strdup(value);
+	new_pair->next = table->table[index];
+	table->table[index] = new_pair;
+}
+
+static char *search_table(HashTable *table, const char *key)
+{
+	unsigned int index = hash(key);
+	KeyValue *pair = table->table[index];
+	while (pair) {
+		if (strcmp(pair->key, key) == 0) {
+			return pair->value;
+		}
+		pair = pair->next;
+	}
+	return NULL;
+}
+
+static void free_table(HashTable *table) {
+	for (int i = 0; i < TABLE_SIZE; i++) {
+		KeyValue *pair = table->table[i];
+		while (pair) {
+			KeyValue *temp = pair;
+			pair = pair->next;
+			free(temp->key);
+			free(temp->value);
+			free(temp);
+		}
+	}
+	free(table);
+}
+
 static char *devname_hex(uint16_t vendor, uint16_t device)
 {
 	char *s;
@@ -472,10 +539,8 @@ static struct igt_device *igt_device_new(void)
 	if (!dev)
 		return NULL;
 
-	dev->attrs_ht = g_hash_table_new_full(g_str_hash, g_str_equal,
-					      free, free);
-	dev->props_ht = g_hash_table_new_full(g_str_hash, g_str_equal,
-					      free, free);
+	dev->attrs_ht = create_table();
+	dev->props_ht = create_table();
 
 	if (dev->attrs_ht && dev->props_ht)
 		return dev;
@@ -491,7 +556,7 @@ static void igt_device_add_prop(struct igt_device *dev,
 	if (!key || !value)
 		return;
 
-	g_hash_table_insert(dev->props_ht, strdup(key), strdup(value));
+	insert_table(dev->props_ht, key, value);
 }
 
 static void igt_device_add_attr(struct igt_device *dev,
@@ -525,7 +590,7 @@ static void igt_device_add_attr(struct igt_device *dev,
 		v++;
 	}
 
-	g_hash_table_insert(dev->attrs_ht, strdup(key), strdup(v));
+	insert_table(dev->attrs_ht, key, v);
 }
 
 /* Iterate over udev properties list and rewrite it to igt_device properties
@@ -585,13 +650,13 @@ static void get_attrs_limited(struct udev_device *dev, struct igt_device *idev)
 	}
 }
 
-#define get_prop(dev, prop) ((char *) g_hash_table_lookup(dev->props_ht, prop))
-#define get_attr(dev, attr) ((char *) g_hash_table_lookup(dev->attrs_ht, attr))
+#define get_prop(dev, prop) ((char *) search_table(dev->props_ht, prop))
+#define get_attr(dev, attr) ((char *) search_table(dev->attrs_ht, attr))
 #define get_prop_subsystem(dev) get_prop(dev, "SUBSYSTEM")
 #define is_drm_subsystem(dev)  (strequal(get_prop_subsystem(dev), "drm"))
 #define is_pci_subsystem(dev)  (strequal(get_prop_subsystem(dev), "pci"))
 
-static void print_ht(GHashTable *ht);
+static void print_ht(HashTable *ht);
 static void dump_props_and_attrs(const struct igt_device *dev)
 {
 	printf("\n[properties]\n");
@@ -949,7 +1014,7 @@ static struct igt_device *duplicate_device(struct igt_device *dev) {
 	return dup;
 }
 
-static gint devs_compare(const void *a, const void *b)
+static int devs_compare(const void *a, const void *b)
 {
 	struct igt_device *dev1, *dev2;
 	int ret;
@@ -1088,8 +1153,8 @@ static void igt_device_free(struct igt_device *dev)
 	free(dev->device);
 	free(dev->driver);
 	free(dev->pci_slot_name);
-	g_hash_table_destroy(dev->attrs_ht);
-	g_hash_table_destroy(dev->props_ht);
+	free_table(dev->attrs_ht);
+	free_table(dev->props_ht);
 }
 
 void igt_devices_free(void)
@@ -1258,7 +1323,7 @@ igt_devs_print_user(struct igt_list_head *view,
 		if (!dev->drm_card || dev->drm_render)
 			continue;
 
-		drm_name = rindex(dev->drm_card, '/');
+		drm_name = strrchr(dev->drm_card, '/');
 		if (!drm_name || !*++drm_name)
 			continue;
 
@@ -1306,7 +1371,7 @@ igt_devs_print_user(struct igt_list_head *view,
 			if (strcmp(dev2->parent->syspath, dev->parent->syspath))
 				continue;
 
-			drm_name = rindex(dev2->drm_render, '/');
+			drm_name = strrchr(dev2->drm_render, '/');
 			if (!drm_name || !*++drm_name)
 				continue;
 
@@ -1328,19 +1393,16 @@ static inline void _print_key_value(const char* k, const char *v)
 	printf("%-32s: %s\n", k, v);
 }
 
-static void print_ht(GHashTable *ht)
+static void print_ht(HashTable *table)
 {
-	GList *keys = g_hash_table_get_keys(ht);
-
-	keys = g_list_sort(keys, (GCompareFunc) strcmp);
-	while (keys) {
-		char *k = (char *) keys->data;
-		char *v = g_hash_table_lookup(ht, k);
-
-		_print_key_value(k, v);
-		keys = g_list_next(keys);
+	for (int i = 0; i < TABLE_SIZE; i++) {
+		KeyValue *pair = table->table[i];
+		printf("Index %d:\n", i);
+		while (pair) {
+			printf("  Key: %s, Value: %s\n", pair->key, pair->value);
+			pair = pair->next;
+		}
 	}
-	g_list_free(keys);
 }
 
 static void
-- 
2.49.0

