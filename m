Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA57DC98304
	for <igt-dev@archiver.kernel.org>; Thu, 24 Sep 2026 03:57:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E91488A27;
	Thu, 24 Sep 2026 03:57:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NTFWAejz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02E1410E059
 for <igt-dev@lists.freedesktop.org>; Thu, 24 Sep 2026 03:55:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790222148; x=1821758148;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=a1LRUtDmhsBoerRO69zu47PNXflxcBnLjWS6MFgiEcI=;
 b=NTFWAejzPrO5m7Iqxv2F526jU8tn/qAvsWTvM5D/yGmGgW6t4xLwEYxw
 J6AKuaLPDHA8ck9GRa7AACnnH8lDweQdNJpLswZbuYIno/F1rgnIxPePO
 82Zqj3hgPvQ1jSNrnOLJJFn1+x43eRxkyv8Yulc9jBJfc9laKfALe190e
 FTHWQy9dUXBD/s8NMUnxVY/H2qGruaYVz9JBDUbKWinusikJQ1dSAco8a
 j92Ah2+AnaN29oVBhcHMrovSY0N/DBXkYgk6EFIpbp0cUT3GWgTSTrQBL
 m5Xz9Dut5rRk0jqKEasXvQQR6c9m9aR+lM4xJi1gy8fdSQSKdglp3oO1B A==;
X-CSE-ConnectionGUID: 60nw5RdITnCy9IdcNAI2Pw==
X-CSE-MsgGUID: YbsLI8EQROadWJP5crfIVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="101639488"
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; d="scan'208";a="101639488"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2026 20:55:47 -0700
X-CSE-ConnectionGUID: TY9uHK3kT2OAZ69kD1SJhw==
X-CSE-MsgGUID: R8XY0S2oRhyx9s63bV1Csw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; d="scan'208";a="270399272"
Received: from xwang-desk.fm.intel.com ([10.121.64.134])
 by fmviesa009.fm.intel.com with ESMTP; 23 Sep 2026 20:55:47 -0700
From: Xin Wang <x.wang@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Xin Wang <x.wang@intel.com>, matthew.d.roper@intel.com,
 zbigniew.kempczynski@intel.com, kamil.konieczny@linux.intel.com,
 ravi.kumar.vodapalli@intel.com, stuart.summers@intel.com
Subject: [PATCH i-g-t v13 2/4] lib/intel_device_info: make device info cache
 process-wide
Date: Wed, 23 Sep 2026 20:55:38 -0700
Message-ID: <20260924035545.710985-3-x.wang@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260924035545.710985-1-x.wang@intel.com>
References: <20260924035545.710985-1-x.wang@intel.com>
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

intel_get_device_info() caches the last looked-up entry in per-thread
variables that point into the static, read-only PCI-ID table. Such a
cache cannot carry data that is updated at runtime, e.g. the graphics
IP version reported by GMD_ID on Xe platforms.

Replace it with a process-wide cache keyed by devid which holds a
mutable copy of the matching static table entry. The cache is protected
by a statically initialized mutex, the map is created lazily on the
first lookup so it does not depend on constructor ordering, and it is
torn down via igt_destructor. If a cache entry cannot be allocated,
fall back to the static table entry.

Also link igt_map.c into libigt_chipset to provide the map implementation.

Signed-off-by: Xin Wang <x.wang@intel.com>
---
 lib/intel_device_info.c | 106 ++++++++++++++++++++++++++++++++++------
 lib/meson.build         |   1 +
 2 files changed, 92 insertions(+), 15 deletions(-)

diff --git a/lib/intel_device_info.c b/lib/intel_device_info.c
index ae316bfcab..a7ba40ed2b 100644
--- a/lib/intel_device_info.c
+++ b/lib/intel_device_info.c
@@ -1,8 +1,11 @@
 #include "intel_chipset.h"
 #include "pciids.h"
 #include "i915_pciids_local.h"
+#include "igt_core.h"
+#include "igt_map.h"
 
 #include <ctype.h>
+#include <pthread.h>
 #include <strings.h> /* ffs() */
 
 static const struct intel_device_info intel_generic_info = {
@@ -716,6 +719,59 @@ static const struct pci_id_match intel_device_match[] = {
 
 #undef INTEL_PCI_ID_INIT
 
+/*
+ * Process-wide cache of per-devid copies of the static PCI-ID table entries.
+ * Entries can be updated at runtime, e.g. by xe_device_get() with the graphics
+ * IP version reported by GMD_ID. The cache is keyed by PCI device ID, so all
+ * devices sharing a device ID share one entry.
+ *
+ * The map is created lazily on first lookup, so lookups do not depend on
+ * constructor ordering.
+ */
+static struct {
+	pthread_mutex_t mutex;
+	struct igt_map *map;
+} devinfo_cache = {
+	.mutex = PTHREAD_MUTEX_INITIALIZER,
+};
+
+static void free_device_info(struct igt_map_entry *entry)
+{
+	free(entry->data);
+	free((void *)entry->key);
+}
+
+igt_destructor
+{
+	pthread_mutex_lock(&devinfo_cache.mutex);
+	igt_map_destroy(devinfo_cache.map, free_device_info);
+	devinfo_cache.map = NULL;
+	pthread_mutex_unlock(&devinfo_cache.mutex);
+}
+
+/* Caller must hold devinfo_cache.mutex. */
+static struct intel_device_info *devinfo_cache_search(uint16_t devid)
+{
+	uint32_t key = devid;
+
+	if (!devinfo_cache.map)
+		return NULL;
+
+	return igt_map_search(devinfo_cache.map, &key);
+}
+
+static const struct intel_device_info *devinfo_table_lookup(uint16_t devid)
+{
+	int i;
+
+	for (i = 0; intel_device_match[i].device_id != PCI_MATCH_ANY; i++) {
+		if (devid == intel_device_match[i].device_id)
+			break;
+	}
+
+	return (const struct intel_device_info *)intel_device_match[i].match_data;
+}
+
 /**
  * intel_get_device_info:
  * @devid: pci device id
@@ -727,24 +783,44 @@ static const struct pci_id_match intel_device_match[] = {
  */
 const struct intel_device_info *intel_get_device_info(uint16_t devid)
 {
-	static __thread const struct intel_device_info *cache = &intel_generic_info;
-	static __thread uint16_t cached_devid;
-	int i;
-
-	if (cached_devid == devid)
-		goto out;
-
-	/* XXX Presort table and bsearch! */
-	for (i = 0; intel_device_match[i].device_id != PCI_MATCH_ANY; i++) {
-		if (devid == intel_device_match[i].device_id)
-			break;
+	const struct intel_device_info *table_info;
+	struct intel_device_info *info, *new_info;
+	uint32_t *new_key;
+
+	pthread_mutex_lock(&devinfo_cache.mutex);
+	info = devinfo_cache_search(devid);
+	pthread_mutex_unlock(&devinfo_cache.mutex);
+	if (info)
+		return info;
+
+	table_info = devinfo_table_lookup(devid);
+
+	new_key = malloc(sizeof(*new_key));
+	new_info = malloc(sizeof(*new_info));
+	if (new_key && new_info) {
+		*new_key = devid;
+		*new_info = *table_info;
+
+		pthread_mutex_lock(&devinfo_cache.mutex);
+		if (!devinfo_cache.map)
+			devinfo_cache.map = igt_map_create(igt_map_hash_32,
+							   igt_map_equal_32);
+		/* Another thread may have inserted while we were allocating. */
+		info = devinfo_cache_search(devid);
+		if (!info && devinfo_cache.map &&
+		    igt_map_insert(devinfo_cache.map, new_key, new_info)) {
+			info = new_info;
+			new_key = NULL;
+			new_info = NULL;
+		}
+		pthread_mutex_unlock(&devinfo_cache.mutex);
 	}
 
-	cached_devid = devid;
-	cache = (void *)intel_device_match[i].match_data;
+	free(new_info);
+	free(new_key);
 
-out:
-	return cache;
+	/* Without a cache entry, fall back to the static table entry. */
+	return info ?: table_info;
 }
 
 static bool char_eq(char c1, char c2)
diff --git a/lib/meson.build b/lib/meson.build
index 2ac6327587..7d1502ef48 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -397,6 +397,7 @@ igt_deps = [ lib_igt ] + lib_deps
 lin_igt_chipset_build = static_library('igt_chipset',
                                        ['intel_chipset.c',
 					'intel_device_info.c',
+					'igt_map.c',
 					'intel_cmds_info.c'],
                                        include_directories : inc)
 
-- 
2.43.0

