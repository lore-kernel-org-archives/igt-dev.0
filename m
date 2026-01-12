Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8CE6CF45C9
	for <igt-dev@archiver.kernel.org>; Mon, 12 Jan 2026 19:17:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AE1B10E2B1;
	Mon, 12 Jan 2026 19:17:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aky0/4ix";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A38ED10E063
 for <igt-dev@lists.freedesktop.org>; Mon, 12 Jan 2026 19:17:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768245461; x=1799781461;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FXmRKwF8CIxThpUsOoYMTK+5gW0dLxkXVWpAC+/I/gk=;
 b=aky0/4ixI5fIgYQiUDww1E1z1wKmFwgHJb5W7I42vuAxEvTf8Qqhrb+G
 6IVrWIpI5QLgCKj5MnV5gWwUbE33FDaBV3Z70IuNdHEjmV855HT92TtfD
 dSDczLr2mXzZYXhgWzcJkQQtpcq+j5Di2yv7h1kDmBbt6XlWENDMpZTsJ
 zT1Ijw1F68YaDT/ZkaE9YQnPU/dCDyzmo+euUlkXWlcNEHF3/ZdItRIoc
 GUMCFzNVvLDPf64fF7bnqrE5GSqiy9TKV5up6JcTwmfPIdAFzzop9pTaw
 x6ZZSj+Ksrc6ufGTcDNCOo7PMhGCUEqSs9d53axkTfhdQZP8kVri85UT9 g==;
X-CSE-ConnectionGUID: jUpuVQcpTFeIRFpBv2k5tQ==
X-CSE-MsgGUID: P9atuEfdTm2gL+icDzlqyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="80978165"
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; d="scan'208";a="80978165"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 11:17:40 -0800
X-CSE-ConnectionGUID: hngda2t7SzaUoLqUqkOqlQ==
X-CSE-MsgGUID: br4SDoNYTxaV8Rk/u+bHkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; d="scan'208";a="209247609"
Received: from dut6304bmgfrd.fm.intel.com ([10.36.21.42])
 by orviesa005.jf.intel.com with ESMTP; 12 Jan 2026 11:17:39 -0800
From: Xin Wang <x.wang@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Xin Wang <x.wang@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Ravi Kumar V <ravi.kumar.vodapalli@intel.com>
Subject: [PATCH v10 2/2] lib/intel_device_info: Query runtime xe device
 graphics versions
Date: Mon, 12 Jan 2026 19:17:32 +0000
Message-ID: <20260112191732.672297-3-x.wang@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260112191732.672297-1-x.wang@intel.com>
References: <20260112191732.672297-1-x.wang@intel.com>
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

Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Xin Wang <x.wang@intel.com>
Reviewed-by: Ravi Kumar V <ravi.kumar.vodapalli@intel.com>
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

