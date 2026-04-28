Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62A2AFF885A
	for <igt-dev@archiver.kernel.org>; Tue, 28 Apr 2026 06:55:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1236110E06A;
	Tue, 28 Apr 2026 06:55:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AYJM9xYd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 708AA10E06A
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Apr 2026 06:54:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777359274; x=1808895274;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ycvNleOujtwZ/Z4vS3txhL0/9VIZLNxEbDLIk2ZtSGs=;
 b=AYJM9xYd0O5d83kKdSwGtLsjHIOXVr18e5jwkCXpT+7r/JQlSrJcgKZS
 oOhb/6tIMEWlSmcr2Hq/wsSS5yPVd5pj67CnsJoB6+I+VzwrxbtE8hxIL
 KktTgWF0Ura3sI0ctfrmWN396C6/Zucc5uLQc7l1cYMKjblcb23FpmjI/
 2v8WRcXJ8mlCg7fHAwiSOPDEt03ofIOvq7LQlPv+L9fgAxj08x6NWrKXd
 /n8kpshXmSUA/EUOc33/mIIPMbdbRZMWgBKVEDgAlro7O9sFM52/HvErL
 Mzmbdvzv6D03UPINXU4aO+q+GmXEZvV00XqDNRIFBGShDWP+sFXCd6aIE g==;
X-CSE-ConnectionGUID: UJmX9G9iRwKQzhXwARUKpg==
X-CSE-MsgGUID: otHaHNnaQ1+bOcfDylpWCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11769"; a="78137874"
X-IronPort-AV: E=Sophos;i="6.23,203,1770624000"; d="scan'208";a="78137874"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 23:54:34 -0700
X-CSE-ConnectionGUID: GEt6IlPyQ4W0e3GYFuh0pQ==
X-CSE-MsgGUID: mt9f6ar7SvCmPIFh6seNrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,203,1770624000"; d="scan'208";a="232863009"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO fedora)
 ([10.245.244.161])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 23:54:34 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: maarten.lankhorst@linux.intel.com,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH i-g-t 3/6] lib/xe: add xe_cgroup_region_name() helper
Date: Tue, 28 Apr 2026 08:54:08 +0200
Message-ID: <20260428065411.4222-4-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260428065411.4222-1-thomas.hellstrom@linux.intel.com>
References: <20260428065411.4222-1-thomas.hellstrom@linux.intel.com>
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
index 3286a3b37..ad8b16f74 100644
--- a/lib/xe/xe_query.c
+++ b/lib/xe/xe_query.c
@@ -7,6 +7,7 @@
  */
 
 #include <fcntl.h>
+#include <limits.h>
 #include <stdlib.h>
 #include <pthread.h>
 
@@ -21,6 +22,7 @@
 
 #include "drmtest.h"
 #include "igt_debugfs.h"
+#include "igt_device.h"
 #include "ioctl_wrappers.h"
 #include "igt_map.h"
 #include "intel_pat.h"
@@ -1270,6 +1272,36 @@ int xe_query_eu_thread_count(int fd, int gt)
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
index 8815c6c66..b01a5dac1 100644
--- a/lib/xe/xe_query.h
+++ b/lib/xe/xe_query.h
@@ -204,4 +204,6 @@ void xe_device_put(int fd);
 int xe_query_eu_count(int fd, int gt);
 int xe_query_eu_thread_count(int fd, int gt);
 
+char *xe_cgroup_region_name(int fd, uint64_t region);
+
 #endif	/* XE_QUERY_H */
-- 
2.53.0

