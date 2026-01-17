Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E532CA5FE1
	for <igt-dev@archiver.kernel.org>; Sat, 17 Jan 2026 23:48:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D869010E107;
	Sat, 17 Jan 2026 23:48:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GaUPef8v";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFCDA10E034
 for <igt-dev@lists.freedesktop.org>; Sat, 17 Jan 2026 23:48:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768693714; x=1800229714;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lDtJdj/+kb7ZKGksudYy+MRDy8T4x73kzyPvzSURCXU=;
 b=GaUPef8v9rpDu1N7vBz1uqAmmA4C/MjGYo49GidYG7f8vibTk+tdJfZI
 Uc1xDb2v0k/Za+t5Rs22ALVcg0FPbUmnHnWhemDrNBDvxKMnRtopTJmVg
 XnBHOnizQG7pwVytDozzgN/JRW4+47Vf1/zWQ/xM9p3NJP7RuBt3aAAnO
 vya+i0NsBhd461/K2pAFf+8CvTsWVxhj56eMhM7aD5bVJnraW07P/0UkK
 gNckV8PAYoFVv4mLhUT78scOD/AoGBnwl+Y4tUacdBu5YjZvaHLgQXzc1
 kVH7bZAa+Yk45x+lwbrfhQ9jS2Am09WauVriefvNlmxA5fLWnfJUUDoCX Q==;
X-CSE-ConnectionGUID: Nkmj/iFPQNSH5FWxZHZpvQ==
X-CSE-MsgGUID: TwCWRTtWSqOKpHfiTKP4Xg==
X-IronPort-AV: E=McAfee;i="6800,10657,11674"; a="81073817"
X-IronPort-AV: E=Sophos;i="6.21,235,1763452800"; d="scan'208";a="81073817"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2026 15:48:33 -0800
X-CSE-ConnectionGUID: nB1IS1BFRui9Fmjnm6/3Yg==
X-CSE-MsgGUID: k/Zt2zMKSxuHyuYrLtCKQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,235,1763452800"; d="scan'208";a="205150356"
Received: from dut6304bmgfrd.fm.intel.com ([10.36.21.42])
 by fmviesa007.fm.intel.com with ESMTP; 17 Jan 2026 15:48:31 -0800
From: Xin Wang <x.wang@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: matthew.d.roper@intel.com, zbigniew.kempczynski@intel.com,
 kamil.konieczny@linux.intel.com, ravi.kumar.vodapalli@intel.com,
 Xin Wang <x.wang@intel.com>
Subject: [PATCH v12 2/4] lib/intel_device_info: make device info cache
 thread-safe
Date: Sat, 17 Jan 2026 23:48:18 +0000
Message-ID: <20260117234821.929209-3-x.wang@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260117234821.929209-1-x.wang@intel.com>
References: <20260117234821.929209-1-x.wang@intel.com>
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

Replace the per-thread single-entry cache in intel_get_device_info() with a
process-wide cache keyed by devid.

Use igt_map + pthread mutex to store a copy of struct intel_device_info per
device id, and initialize/teardown the cache via igt_constructor/igt_destructor.

Also link igt_map.c into libigt_chipset to provide the map implementation.

Signed-off-by: Xin Wang <x.wang@intel.com>
---
 lib/intel_device_info.c | 91 +++++++++++++++++++++++++++++++++++++----
 lib/meson.build         |  1 +
 2 files changed, 83 insertions(+), 9 deletions(-)

diff --git a/lib/intel_device_info.c b/lib/intel_device_info.c
index 89fa6788f..e97a8caa0 100644
--- a/lib/intel_device_info.c
+++ b/lib/intel_device_info.c
@@ -1,7 +1,10 @@
 #include "intel_chipset.h"
 #include "pciids.h"
 #include "i915_pciids_local.h"
+#include "igt_core.h"
+#include "igt_map.h"
 
+#include <pthread.h>
 #include <strings.h> /* ffs() */
 
 static const struct intel_device_info intel_generic_info = {
@@ -688,6 +691,53 @@ static const struct pci_id_match intel_device_match[] = {
 
 #undef INTEL_PCI_ID_INIT
 
+static struct intel_device_cache {
+	pthread_mutex_t cache_mutex;
+	struct igt_map *map;
+} dev;
+
+static void intel_device_info_cache_init(void)
+{
+	pthread_mutex_init(&dev.cache_mutex, NULL);
+	dev.map = igt_map_create(igt_map_hash_32, igt_map_equal_32);
+}
+
+static void free_device_info(struct igt_map_entry *entry)
+{
+	free(entry->data);
+	free((void *)entry->key);
+}
+
+static void intel_device_info_cache_fini(void)
+{
+	pthread_mutex_lock(&dev.cache_mutex);
+	igt_map_destroy(dev.map, free_device_info);
+	pthread_mutex_unlock(&dev.cache_mutex);
+	pthread_mutex_destroy(&dev.cache_mutex);
+}
+
+static struct intel_device_info *intel_device_info_cache_get(uint16_t devid)
+{
+	struct intel_device_info *info;
+	uint32_t key = devid;
+
+	pthread_mutex_lock(&dev.cache_mutex);
+	info = igt_map_search(dev.map, &key);
+	pthread_mutex_unlock(&dev.cache_mutex);
+
+	return info;
+}
+
+igt_constructor
+{
+	intel_device_info_cache_init();
+}
+
+igt_destructor
+{
+	intel_device_info_cache_fini();
+}
+
 /**
  * intel_get_device_info:
  * @devid: pci device id
@@ -699,24 +749,47 @@ static const struct pci_id_match intel_device_match[] = {
  */
 const struct intel_device_info *intel_get_device_info(uint16_t devid)
 {
-	static __thread const struct intel_device_info *cache = &intel_generic_info;
-	static __thread uint16_t cached_devid;
+	struct intel_device_info *info;
+	struct intel_device_info *new_info = NULL;
+	uint32_t *new_key = NULL;
+	uint32_t key_val = devid;
 	int i;
 
-	if (cached_devid == devid)
-		goto out;
+	info = intel_device_info_cache_get(devid);
+	if (info)
+		return info;
 
-	/* XXX Presort table and bsearch! */
 	for (i = 0; intel_device_match[i].device_id != PCI_MATCH_ANY; i++) {
 		if (devid == intel_device_match[i].device_id)
 			break;
 	}
 
-	cached_devid = devid;
-	cache = (void *)intel_device_match[i].match_data;
+	new_key = malloc(sizeof(*new_key));
+	new_info = malloc(sizeof(*new_info));
+	if (!new_key || !new_info) {
+		free(new_key);
+		free(new_info);
+		return &intel_generic_info;
+	}
+
+	*new_key = devid;
+	memcpy(new_info, (const void *)intel_device_match[i].match_data, sizeof(*new_info));
+
+	/* Another thread may have inserted while we were allocating. */
+	pthread_mutex_lock(&dev.cache_mutex);
+	info = igt_map_search(dev.map, &key_val);
+	if (!info) {
+		igt_map_insert(dev.map, new_key, new_info);
+		info = new_info;
+		new_key = NULL;
+		new_info = NULL;
+	}
+	pthread_mutex_unlock(&dev.cache_mutex);
+
+	free(new_info);
+	free(new_key);
 
-out:
-	return cache;
+	return info;
 }
 
 /**
diff --git a/lib/meson.build b/lib/meson.build
index 1a569ba52..d41540799 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -317,6 +317,7 @@ igt_deps = [ lib_igt ] + lib_deps
 lin_igt_chipset_build = static_library('igt_chipset',
                                        ['intel_chipset.c',
 					'intel_device_info.c',
+					'igt_map.c',
 					'intel_cmds_info.c'],
                                        include_directories : inc)
 
-- 
2.43.0

