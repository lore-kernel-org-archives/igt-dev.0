Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 524AAD5C0C9
	for <igt-dev@archiver.kernel.org>; Wed, 17 Dec 2025 04:35:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DA9110EAF7;
	Wed, 17 Dec 2025 04:35:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Fcs+9bjI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7CE810EAE1
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Dec 2025 04:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765946113; x=1797482113;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mO9PG9Pvdyj4reKiMgRhpI3EeaHwdkOyGqkC0XLB9pY=;
 b=Fcs+9bjIEz/R7balSQ+PTVO0NNWclmJkrDS+fihbl0zf7oD/ulFSnnJU
 BjgmEShkGnZh+VJTmeKQ3XpLpJBjlrnIi/HTSlpe0tBNaU9p+eAhkLX5z
 QUXCkBKs2nbgUPPGYvCDhz955jBviI3gSuWlRz62DUZsHK1OfCKNu+zPJ
 y/dhZt6EeRxSWUkpTZK87O8Ck9H8fqrPQWjHJFJZ+0Y38FE1Ssrw20SJU
 rUWM+chxXSaSKcnRV7T8h50j7nYlr9B2q4AOm58UXb7zxC+FeCZIPNBQm
 vvu451aoey0GIY3Sg97rFf2Z9MTfrfLyZ25vpChDrMF4baKSYNNc5RXKd w==;
X-CSE-ConnectionGUID: KG55dYrATe+fPQcxY85qMw==
X-CSE-MsgGUID: WNr6ixc4SJiXVCrcwze0IQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11644"; a="85291437"
X-IronPort-AV: E=Sophos;i="6.21,154,1763452800"; d="scan'208";a="85291437"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2025 20:35:13 -0800
X-CSE-ConnectionGUID: GH4maJ8tS8S5V4vOewLXIg==
X-CSE-MsgGUID: 4XNczq35R2mxpz9OQ4pE+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,154,1763452800"; d="scan'208";a="198196638"
Received: from dut6304bmgfrd.fm.intel.com ([10.36.21.42])
 by orviesa007.jf.intel.com with ESMTP; 16 Dec 2025 20:35:11 -0800
From: Xin Wang <x.wang@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: alex.zuo@intel.com, shuicheng.lin@intel.com, stuart.summers@intel.com,
 kamil.konieczny@intel.com, matthew.d.roper@intel.com,
 ravi.kumar.vodapalli@intel.com, Xin Wang <x.wang@intel.com>
Subject: [PATCH v9 2/2] lib/intel_device_info: Query runtime xe device
 graphics versions
Date: Wed, 17 Dec 2025 04:34:50 +0000
Message-ID: <20251217043450.241761-3-x.wang@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251217043450.241761-1-x.wang@intel.com>
References: <20251217043450.241761-1-x.wang@intel.com>
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

For platforms with graphics_ver >= 20, query the runtime xe device ver
instead of relying solely on hardcoded values from the PCI device table.
This enables accurate IP minor version (graphics_rel) detection for
platforms like Xe2 where different steppings have different IP versions.

Implementation details:
- Use weak symbol linkage for xe_ipver_cache_lookup() to handle static
  library compilation (libigt_chipset.a, libigt_device_scan.a) without
  xe_query.c dependencies which are used for i915 tools (i915_perf and
  intel_gpu_top)
- Provide a weak stub that returns NULL when xe_query is not linked
- For Gen20+ platforms, prefer runtime xe device versions over static data
- Fall back to PCI table if xe device info is unavailable
- Reset cache on query failure to allow retry

Remove hardcoded graphics_rel from static table entries for xe devices
as they will be populated at runtime from GMD_ID.

This unifies device info handling between i915 and xe drivers, enabling:
- Platform-specific workarounds based on accurate IP versions
- Consistent device info API across both drivers

Signed-off-by: Xin Wang <x.wang@intel.com>
---
 lib/intel_device_info.c | 26 +++++++++++++++++++++++---
 1 file changed, 23 insertions(+), 3 deletions(-)

diff --git a/lib/intel_device_info.c b/lib/intel_device_info.c
index 20147479a..3bc20ab68 100644
--- a/lib/intel_device_info.c
+++ b/lib/intel_device_info.c
@@ -3,6 +3,16 @@
 #include "i915_pciids_local.h"
 
 #include <strings.h> /* ffs() */
+#include <stddef.h>
+#include <string.h>
+
+/* Weak symbol stub - will be overridden if xe_query.c is linked */
+struct xe_device_ipver *xe_ipver_cache_lookup(uint32_t devid) __attribute__((weak));
+
+struct xe_device_ipver *xe_ipver_cache_lookup(uint32_t devid)
+{
+	return NULL;
+}
 
 static const struct intel_device_info intel_generic_info = {
 	.graphics_ver = 0,
@@ -505,7 +515,6 @@ static const struct intel_device_info intel_pontevecchio_info = {
 
 static const struct intel_device_info intel_lunarlake_info = {
 	.graphics_ver = 20,
-	.graphics_rel = 4,
 	.display_ver = 20,
 	.has_4tile = true,
 	.has_flatccs = true,
@@ -517,7 +526,6 @@ static const struct intel_device_info intel_lunarlake_info = {
 
 static const struct intel_device_info intel_battlemage_info = {
 	.graphics_ver = 20,
-	.graphics_rel = 1,
 	.display_ver = 14,
 	.has_4tile = true,
 	.has_flatccs = true,
@@ -529,7 +537,6 @@ static const struct intel_device_info intel_battlemage_info = {
 
 static const struct intel_device_info intel_pantherlake_info = {
 	.graphics_ver = 30,
-	.graphics_rel = 0,
 	.display_ver = 30,
 	.has_4tile = true,
 	.has_flatccs = true,
@@ -700,6 +707,8 @@ const struct intel_device_info *intel_get_device_info(uint16_t devid)
 {
 	static __thread const struct intel_device_info *cache = &intel_generic_info;
 	static __thread uint16_t cached_devid;
+	static __thread struct intel_device_info xe_dev_info;
+	struct xe_device_ipver *ipver;
 	int i;
 
 	if (cached_devid == devid)
@@ -714,6 +723,17 @@ const struct intel_device_info *intel_get_device_info(uint16_t devid)
 	cached_devid = devid;
 	cache = (void *)intel_device_match[i].match_data;
 
+	if (cache->graphics_ver >= 20) {
+		ipver = xe_ipver_cache_lookup(devid);
+		if (ipver && ipver->devid == devid) {
+			memcpy(&xe_dev_info, cache, sizeof(struct intel_device_info));
+			xe_dev_info.graphics_ver = ipver->graphics_ver;
+			xe_dev_info.graphics_rel = ipver->graphics_rel;
+			cache = &xe_dev_info;
+		} else {
+			cached_devid = 0;
+		}
+	}
 out:
 	return cache;
 }
-- 
2.43.0

