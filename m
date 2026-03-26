Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B87910A88E3
	for <igt-dev@archiver.kernel.org>; Thu, 26 Mar 2026 16:10:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27ACD10EB35;
	Thu, 26 Mar 2026 16:10:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LGEJKsTA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15F4410EA44
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Mar 2026 16:10:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774541434; x=1806077434;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=smohxnxAZknp7pULccdFZR2XBmOvklYEGjQG31M1o9g=;
 b=LGEJKsTAXPbB8tRPX51ryXaHFPqN5gOO+rfwWrex7v25g8BbCEcLMaHG
 BrQRussBkCMqm4D6NcFKXui2R+uGsoFCuEXgPpS0wkr1/kY2errqOTtB9
 GOz7pRR3HOonHg7JXO29Gm4jrF6WHigz7utF8FWZc54ZnbEEk053T3w13
 ZuK1xqk55fTwr7nKaAf1CUF47YAy8JGaWnuuYd6shYDCO0Pj2t0txDnDS
 grbLK7C9vPuN4iCFMIBBDz8tTXmENE6pGCDpgJmxzPktnLMENCkPjgOaG
 DaFUKFRF6Jiz/+gdBxZ4qZjV6nCcpFZIz1wEFr4izcKQ2/2hrSMTZxgxy Q==;
X-CSE-ConnectionGUID: ZsVj2cOkQHO1hCHX2bRQkQ==
X-CSE-MsgGUID: +jN8yM/fRuOC1DenYPySgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="75488978"
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; d="scan'208";a="75488978"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2026 09:10:34 -0700
X-CSE-ConnectionGUID: 2vbs221tT9es78a4RO2BxQ==
X-CSE-MsgGUID: OzBpvJ9ATXqCf7m1upZofw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; d="scan'208";a="229505963"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO fedora)
 ([10.245.245.251])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2026 09:10:30 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: dev@lankhorst.se,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH i-g-t 3/5] lib/xe: add xe_cgroup_region_name() helper
Date: Thu, 26 Mar 2026 17:10:05 +0100
Message-ID: <20260326161007.39294-4-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260326161007.39294-1-thomas.hellstrom@linux.intel.com>
References: <20260326161007.39294-1-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Add xe_cgroup_region_name(fd, region) which constructs the dmem cgroup
region path for a given xe memory region.  The returned string has the
form "drm/<pci-slot>/<region>" (e.g. "drm/0000:03:00.0/vram0"),
matching the name registered by the kernel via drmm_cgroup_register_region().

Only VRAM regions are tracked by the dmem controller; system and stolen
memory regions return NULL.

Assisted-by: GitHub Copilot:claude-sonnet-4.6
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 lib/xe/xe_query.c | 32 ++++++++++++++++++++++++++++++++
 lib/xe/xe_query.h |  2 ++
 2 files changed, 34 insertions(+)

diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
index 3afca353e..b0465147c 100644
--- a/lib/xe/xe_query.c
+++ b/lib/xe/xe_query.c
@@ -6,6 +6,7 @@
  *    Matthew Brost <matthew.brost@intel.com>
  */
 
+#include <limits.h>
 #include <stdlib.h>
 #include <pthread.h>
 
@@ -19,6 +20,7 @@
 #endif
 
 #include "drmtest.h"
+#include "igt_device.h"
 #include "ioctl_wrappers.h"
 #include "igt_map.h"
 #include "intel_pat.h"
@@ -1146,6 +1148,36 @@ int xe_query_eu_thread_count(int fd, int gt)
 		xe_hwconfig_lookup_value_u32(fd, INTEL_HWCONFIG_NUM_THREADS_PER_EU);
 }
 
+/**
+ * xe_cgroup_region_name() - Build the dmem cgroup region name for an xe memory region.
+ * @fd: xe device fd.
+ * @region: Region mask (as used by xe_mem_region(), xe_region_name(), etc.).
+ *
+ * Constructs the full dmem cgroup region path for @region on the device
+ * identified by @fd.  The returned string has the form
+ * ``drm/<pci-slot>/<region>`` (e.g. ``drm/0000:03:00.0/vram0``), matching
+ * the name registered by the kernel driver via drmm_cgroup_register_region().
+ *
+ * Only VRAM regions are registered with the dmem controller; passing a
+ * system-memory region returns %NULL.
+ *
+ * Return: A newly allocated string that the caller must free(), or %NULL if
+ * @region is not tracked by the dmem cgroup controller.
+ */
+char *xe_cgroup_region_name(int fd, uint64_t region)
+{
+	char pci_slot[NAME_MAX];
+	char *name;
+
+	if (xe_region_class(fd, region) != DRM_XE_MEM_REGION_CLASS_VRAM)
+		return NULL;
+
+	igt_device_get_pci_slot_name(fd, pci_slot);
+
+	igt_assert(asprintf(&name, "drm/%s/%s", pci_slot, xe_region_name(region)) > 0);
+	return name;
+}
+
 igt_constructor
 {
 	xe_device_cache_init();
diff --git a/lib/xe/xe_query.h b/lib/xe/xe_query.h
index 05e2ad84f..20794ad75 100644
--- a/lib/xe/xe_query.h
+++ b/lib/xe/xe_query.h
@@ -191,4 +191,6 @@ void xe_device_put(int fd);
 int xe_query_eu_count(int fd, int gt);
 int xe_query_eu_thread_count(int fd, int gt);
 
+char *xe_cgroup_region_name(int fd, uint64_t region);
+
 #endif	/* XE_QUERY_H */
-- 
2.53.0

