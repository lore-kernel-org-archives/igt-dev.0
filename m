Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EC8BCCD187
	for <igt-dev@archiver.kernel.org>; Tue, 14 Oct 2025 06:41:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D154F10E545;
	Tue, 14 Oct 2025 06:41:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YQ7DbpW/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2EEA10E545
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Oct 2025 06:41:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760424093; x=1791960093;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=r5dFC/kYw0xXL7JkA/z40NGPjTX6hN9mQB7ZZ97S3wY=;
 b=YQ7DbpW/e8ZIA3kaBxmW3/N8V1rTC/+IaY2xts1nJnEFawKOfXfHo4XM
 rkWgCjCXEAfITWURr3KCSjPelQZ4+5Gb11fxBEBF8gDnHSd7bl5UmaelC
 cEnY6poFz8NyH36cqW03F6CC3QLdd6iY+uhatcJPWLmSCtLG91d2O1hab
 0R/+9Vy3dsTKWtqyw1gb5/N6yM4vz61gzyCyj7OC0a787WVr2qYAiV1OM
 VOjN1J0Vy2AhxTayWVJlxq/4sMPsmOSEAoWS3OLxKDYaQtrIedvPZL4+B
 WmWKhKRYhNDrYWl0pfiIo6FaUmUk5SQHB99Y7doqEPvIGrE0ph5zwF1bC A==;
X-CSE-ConnectionGUID: ZgTpF1E7SNG07XJvv9QmXg==
X-CSE-MsgGUID: VHB8mJl+S4uIGwGGEfNNDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="88038270"
X-IronPort-AV: E=Sophos;i="6.19,227,1754982000"; d="scan'208";a="88038270"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 23:41:32 -0700
X-CSE-ConnectionGUID: Sd+9CwUyQVij/pE6f58J2w==
X-CSE-MsgGUID: kRfG6PHgSeWrx8hd6Vjhsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,227,1754982000"; d="scan'208";a="205496574"
Received: from fmbmgg31rpls058.fm.intel.com (HELO DUT6304BMGFRD.fm.intel.com)
 ([10.36.21.81])
 by fmviesa002.fm.intel.com with ESMTP; 13 Oct 2025 23:41:32 -0700
From: Xin Wang <x.wang@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@intel.com, matthew.d.roper@intel.com,
 shuicheng.lin@intel.com, brian3.nguyen@intel.com, alex.zuo@intel.com,
 nakshtra.goyal@intel.com, dnyaneshwar.bhadane@intel.com,
 gustavo.sousa@intel.com, Xin Wang <x.wang@intel.com>
Subject: [PATCH v4 2/2] lib: Query runtime xe device info
Date: Tue, 14 Oct 2025 06:41:28 +0000
Message-ID: <20251014064128.36139-3-x.wang@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251014064128.36139-1-x.wang@intel.com>
References: <20251014064128.36139-1-x.wang@intel.com>
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

For platforms with graphics_ver >= 20, query the runtime xe device info
instead of relying solely on hardcoded values from the PCI device table.
This enables accurate IP minor version (graphics_rel) detection for
platforms like Xe2 where different steppings have different IP versions.

Implementation details:
- Use weak symbol linkage for xe_device_get_info() to handle static
  library compilation (libigt_chipset.a, libigt_device_scan.a) without
  xe_query.c dependencies which are used for i915 tools (i915_perf and
  intel_gpu_top)
- Provide a weak stub that returns NULL when xe_query is not linked
- For Gen20+ platforms, prefer runtime xe device info over static data
- Fall back to PCI table if xe device info is unavailable
- Reset cache on query failure to allow retry

Remove hardcoded graphics_rel from static table entries for xe devices
as they will be populated at runtime from GMD_ID.

This unifies device info handling between i915 and xe drivers, enabling:
- Platform-specific workarounds based on accurate IP minor versions
- Consistent device info API across both drivers

Signed-off-by: Xin Wang <x.wang@intel.com>
---
 lib/intel_device_info.c | 23 ++++++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

diff --git a/lib/intel_device_info.c b/lib/intel_device_info.c
index a853f9ab4..0eefce1c7 100644
--- a/lib/intel_device_info.c
+++ b/lib/intel_device_info.c
@@ -3,6 +3,17 @@
 #include "i915_pciids_local.h"
 
 #include <strings.h> /* ffs() */
+#include <stddef.h>
+
+/* Forward declaration for xe_device_get_info */
+struct intel_device_info;
+struct intel_device_info *xe_device_get_info(uint32_t devid) __attribute__((weak));
+
+/* Weak symbol stub - will be overridden if xe_query.c is linked */
+struct intel_device_info *xe_device_get_info(uint32_t devid)
+{
+	return NULL;
+}
 
 static const struct intel_device_info intel_generic_info = {
 	.graphics_ver = 0,
@@ -505,7 +516,6 @@ static const struct intel_device_info intel_pontevecchio_info = {
 
 static const struct intel_device_info intel_lunarlake_info = {
 	.graphics_ver = 20,
-	.graphics_rel = 4,
 	.display_ver = 20,
 	.has_4tile = true,
 	.has_flatccs = true,
@@ -517,7 +527,6 @@ static const struct intel_device_info intel_lunarlake_info = {
 
 static const struct intel_device_info intel_battlemage_info = {
 	.graphics_ver = 20,
-	.graphics_rel = 1,
 	.display_ver = 14,
 	.has_4tile = true,
 	.has_flatccs = true,
@@ -529,7 +538,6 @@ static const struct intel_device_info intel_battlemage_info = {
 
 static const struct intel_device_info intel_pantherlake_info = {
 	.graphics_ver = 30,
-	.graphics_rel = 0,
 	.display_ver = 30,
 	.has_4tile = true,
 	.has_flatccs = true,
@@ -675,6 +683,7 @@ const struct intel_device_info *intel_get_device_info(uint16_t devid)
 {
 	static __thread const struct intel_device_info *cache = &intel_generic_info;
 	static __thread uint16_t cached_devid;
+	struct intel_device_info *xe_dev_info;
 	int i;
 
 	if (cached_devid == devid)
@@ -689,6 +698,14 @@ const struct intel_device_info *intel_get_device_info(uint16_t devid)
 	cached_devid = devid;
 	cache = (void *)intel_device_match[i].match_data;
 
+	if(cache->graphics_ver >=20)
+	{
+		xe_dev_info = xe_device_get_info(devid);
+		if(xe_dev_info)
+			cache = xe_dev_info;
+		else
+			cached_devid = 0; /* reset cache on failure */
+	}
 out:
 	return cache;
 }
-- 
2.43.0

