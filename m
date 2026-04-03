Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A873D3940A
	for <igt-dev@archiver.kernel.org>; Fri,  3 Apr 2026 01:41:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D061A10F333;
	Fri,  3 Apr 2026 01:41:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dYEmgEd1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BD2810E43C
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Apr 2026 01:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775180443; x=1806716443;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=P4uK6rWqN+Te1jxiHw3SqVspJ/dCPriW5vuC6MgSoLM=;
 b=dYEmgEd1qE0vmukFvPStlnrDO44pRDSMXdTOrN83+1BDNepZ0Gat32Tt
 Ac1ZkarNM4lbbnLM1PkEgBKP6YsN97PUDa4UWs78tm8zUWIGGjEEQ138r
 WVQTuARaiTRLlBS5TyYh+Cy+Ff6/VTjzbk3QBBKR7AY37XTQoW80CBoDD
 riSR0Ns2pXdMHyI57hCFXwTu5LwPrh31tgvIg4gNFGASBUHkJqAqkrYvC
 AkhjwYucYAPXtf6svdS4P8Vm9ZpBwgrYATxKx5/N6WtaGyxcFguVqTlLY
 Hfv1EtdCcIj8+tQWzZ0njfOfWmHNL/X49tcFGqv9ZVg8lDUWQRo6nAoSl g==;
X-CSE-ConnectionGUID: hubxvqDQTQa/89UOiXdlhw==
X-CSE-MsgGUID: EMtce/SiThuoLjWZOR+YNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11747"; a="98861870"
X-IronPort-AV: E=Sophos;i="6.23,156,1770624000"; d="scan'208";a="98861870"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2026 18:40:42 -0700
X-CSE-ConnectionGUID: QTKMbJz3S5mCPpyQZTOIHQ==
X-CSE-MsgGUID: OB0kmNI1T+eKPUtd/onTFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,156,1770624000"; d="scan'208";a="224291576"
Received: from xwang-desk.fm.intel.com ([10.121.64.134])
 by fmviesa008.fm.intel.com with ESMTP; 02 Apr 2026 18:40:41 -0700
From: Xin Wang <x.wang@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Xin Wang <x.wang@intel.com>
Subject: [PATCH 1/5] lib/xe: cache engine class masks from debugfs info
Date: Thu,  2 Apr 2026 18:40:36 -0700
Message-ID: <20260403014040.310758-2-x.wang@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260403014040.310758-1-x.wang@intel.com>
References: <20260403014040.310758-1-x.wang@intel.com>
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

Read the multi_lrc_engine_classes and multi_queue_engine_classes lines
from the xe debugfs info node and cache them in struct xe_device as
bitmasks indexed by DRM_XE_ENGINE_CLASS_* values.

The new fields are set to UINT16_MAX when the kernel does not yet expose
the information (i.e. when the key is not present in the info node), so
callers can distinguish "not available" from "empty set".

Signed-off-by: Xin Wang <x.wang@intel.com>
---
 lib/xe/xe_query.c | 86 +++++++++++++++++++++++++++++++++++++++++++++++
 lib/xe/xe_query.h | 12 +++++++
 2 files changed, 98 insertions(+)

diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
index 00331c628..441e95794 100644
--- a/lib/xe/xe_query.c
+++ b/lib/xe/xe_query.c
@@ -6,6 +6,7 @@
  *    Matthew Brost <matthew.brost@intel.com>
  */
 
+#include <fcntl.h>
 #include <stdlib.h>
 #include <pthread.h>
 
@@ -19,6 +20,7 @@
 #endif
 
 #include "drmtest.h"
+#include "igt_debugfs.h"
 #include "ioctl_wrappers.h"
 #include "igt_map.h"
 #include "intel_pat.h"
@@ -134,6 +136,85 @@ static uint32_t __mem_default_alignment(struct drm_xe_query_mem_regions *mem_reg
 	return alignment;
 }
 
+/*
+ * parse_engine_class_mask - parse a space-separated list of engine class names
+ * into a bitmask indexed by DRM_XE_ENGINE_CLASS_* values.
+ *
+ * @names: the engine class names string, e.g. " vcs vecs" or "bcs ccs"
+ *
+ * The kernel debugfs "info" output for multi_lrc_engine_classes and
+ * multi_queue_engine_classes uses the same short names as
+ * xe_engine_class_short_string(): "rcs", "bcs", "vcs", "vecs", "ccs".
+ *
+ * Returns the bitmask, or 0 if no known class names were found.
+ */
+static uint16_t parse_engine_class_mask(const char *names)
+{
+	static const struct {
+		const char *name;
+		uint32_t engine_class;
+	} class_map[] = {
+		{ "rcs",    DRM_XE_ENGINE_CLASS_RENDER },
+		{ "bcs",    DRM_XE_ENGINE_CLASS_COPY },
+		{ "vcs",    DRM_XE_ENGINE_CLASS_VIDEO_DECODE },
+		{ "vecs",   DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE },
+		{ "ccs",    DRM_XE_ENGINE_CLASS_COMPUTE },
+	};
+	uint16_t mask = 0;
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(class_map); i++) {
+		if (strstr(names, class_map[i].name))
+			mask |= BIT(class_map[i].engine_class);
+	}
+
+	return mask;
+}
+
+/*
+ * Read the debugfs "info" file and OR together the engine class bitmasks from
+ * every line that contains @key.  Returns UINT16_MAX if @key is not found
+ * (kernel too old to expose this information).
+ *
+ * multi_lrc_engine_classes is printed once at device level; multi_queue_engine_classes
+ * is printed once per GT, so the OR handles the multi-GT case transparently.
+ */
+static uint16_t xe_device_query_engine_class_mask(int fd, const char *key)
+{
+	char *line = NULL;
+	size_t line_len = 0;
+	uint16_t mask = UINT16_MAX;
+	size_t key_len = strlen(key);
+	int dbgfs_fd;
+	FILE *dbgfs_file;
+
+	dbgfs_fd = igt_debugfs_open(fd, "info", O_RDONLY);
+	if (dbgfs_fd < 0)
+		return mask;
+
+	dbgfs_file = fdopen(dbgfs_fd, "r");
+	if (!dbgfs_file) {
+		close(dbgfs_fd);
+		return mask;
+	}
+
+	while (getline(&line, &line_len, dbgfs_file) != -1) {
+		const char *p = strstr(line, key);
+
+		if (!p)
+			continue;
+
+		if (mask == UINT16_MAX)
+			mask = 0;
+		mask |= parse_engine_class_mask(p + key_len);
+	}
+
+	free(line);
+	fclose(dbgfs_file);
+
+	return mask;
+}
+
 /**
  * xe_engine_class_supports_multi_queue:
  * @engine_class: engine class
@@ -330,6 +411,11 @@ struct xe_device *xe_device_get(int fd)
 	}
 	pthread_mutex_unlock(&cache.cache_mutex);
 
+	xe_dev->multi_lrc_mask =
+		xe_device_query_engine_class_mask(fd, "multi_lrc_engine_classes");
+	xe_dev->multi_queue_engine_class_mask =
+		xe_device_query_engine_class_mask(fd, "multi_queue_engine_classes");
+
 	return xe_dev;
 }
 
diff --git a/lib/xe/xe_query.h b/lib/xe/xe_query.h
index 05e2ad84f..f33562bda 100644
--- a/lib/xe/xe_query.h
+++ b/lib/xe/xe_query.h
@@ -79,6 +79,18 @@ struct xe_device {
 
 	/** @pat_cache: cached PAT index configuration, NULL if not yet populated */
 	struct intel_pat_cache *pat_cache;
+
+	/**
+	 * @multi_lrc_mask: bitmask of engine classes supporting multi-LRC.
+	 * UINT16_MAX if not available (older kernel).
+	 */
+	uint16_t multi_lrc_mask;
+
+	/**
+	 * @multi_queue_engine_class_mask: bitmask of engine classes supporting
+	 * multi-queue. UINT16_MAX if not available (older kernel).
+	 */
+	uint16_t multi_queue_engine_class_mask;
 };
 
 #define xe_for_each_engine(__fd, __hwe) \
-- 
2.43.0

