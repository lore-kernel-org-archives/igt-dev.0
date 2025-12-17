Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FB08D6408D
	for <igt-dev@archiver.kernel.org>; Wed, 17 Dec 2025 08:07:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B616310EBD0;
	Wed, 17 Dec 2025 08:07:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cTLLuLZc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A7DB10EBE1
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Dec 2025 08:07:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765958855; x=1797494855;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mfmFJq9xla+Hr7Qd+wtf6TQeiGdvsIXemXJMbhNX0OY=;
 b=cTLLuLZcAr336QskYbsjL8KSr8/8Iy8g2nzFAL5r9gDTcqOUm8IRNmnq
 QKBy49txNmX5vbeMQjTaFfrry+XDr/Xn6hIw1JDyhxonYhRcAIhS2vMLO
 +zFA3bs7yEc9EHoLgZ6Sk9O7tzQtRqhtE4X0FPf1gCPjTmoIu2xJjYOdg
 gbDN2O6bC6p/u/2P0hlQpFBUU9iVvcao50zNpUxulcqAJ4jm/08yh+DM4
 ckv0H+FVKRqwP9r1xxPyVtH+Jpi+dshYXEX/5pp7ZCtBOnXUxBEzf3uvl
 SpTVe8AQXFffc7O5LDrnktPWx7AvnYblmKyTZ33zMU2iTQUzcEyfHxjv9 A==;
X-CSE-ConnectionGUID: eBUrCpOiQam5M0pTeYsb2w==
X-CSE-MsgGUID: VL5n/i51QoqmDWkBR9VNQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11644"; a="71747850"
X-IronPort-AV: E=Sophos;i="6.21,155,1763452800"; d="scan'208";a="71747850"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2025 00:07:34 -0800
X-CSE-ConnectionGUID: MjVRK23DS7Kbs1Yn9FEXBw==
X-CSE-MsgGUID: OjGl7LxxRRS2fqqoGUGvlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,155,1763452800"; d="scan'208";a="197857456"
Received: from dut6304bmgfrd.fm.intel.com ([10.36.21.42])
 by fmviesa007.fm.intel.com with ESMTP; 17 Dec 2025 00:07:34 -0800
From: Xin Wang <x.wang@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: alex.zuo@intel.com, shuicheng.lin@intel.com, stuart.summers@intel.com,
 kamil.konieczny@intel.com, matthew.d.roper@intel.com,
 ravi.kumar.vodapalli@intel.com, Xin Wang <x.wang@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH v6 1/2] lib/intel_pat: read Xe PAT config from debugfs
Date: Wed, 17 Dec 2025 08:07:27 +0000
Message-ID: <20251217080732.266257-2-x.wang@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251217080732.266257-1-x.wang@intel.com>
References: <20251217080732.266257-1-x.wang@intel.com>
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

Parse the PAT software configuration from gt0/pat_sw_config instead
of relying on hard-coded indices.

V2: (Kamil)
- Show a detailed skip info when opening the debugfs file fails.
V3:
- Save the Xe PAT software configuration into the xe_dev structure
  to prevent scenarios where certain test cases drop root privileges
  after execution begins, which could block access to debugfs.
V4:
- Cache the parsed PAT table the first time we read pat_sw_config
  and reuse it for subsequent calls. This avoids repeated debugfs
  opens (and failures) in tests that drop root between steps, while
  still returning the correct PAT layout.
V5:
- Make PAT debugfs parsing lazy: avoid requiring debugfs from
  xe_device_get(), so tests that don't need PAT won't be skipped.
- If PAT info isn't available at device init, keep pat_sw_config empty
  and only require debugfs when PAT indices are requested.
- Add xe_get_pat_entries() helper to expose the parsed PAT entry table.

CC: Shuicheng Lin <shuicheng.lin@intel.com>
CC: Kamil Konieczny <kamil.konieczny@intel.com>
CC: Matt Roper <matthew.d.roper@intel.com>
CC: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Xin Wang <x.wang@intel.com>
---
 lib/intel_pat.c   | 140 ++++++++++++++++++++++++++++++++++++++--------
 lib/intel_pat.h   |  21 +++++++
 lib/xe/xe_query.c |   6 ++
 lib/xe/xe_query.h |   4 ++
 4 files changed, 148 insertions(+), 23 deletions(-)

diff --git a/lib/intel_pat.c b/lib/intel_pat.c
index e3588110a..46f6cd884 100644
--- a/lib/intel_pat.c
+++ b/lib/intel_pat.c
@@ -3,37 +3,118 @@
  * Copyright © 2023 Intel Corporation
  */
 
+#include "igt.h"
 #include "intel_pat.h"
+#include "xe/xe_query.h"
+
+/**
+ * xe_get_pat_sw_config - Helper to read PAT (Page Attribute Table) software configuration
+ * from debugfs
+ *
+ * @drm_fd: DRM device fd to use with igt_debugfs_open
+ * @xe_pat_cache: Pointer to a struct that will receive the parsed PAT configuration
+ *
+ * Returns: The number of PAT entries successfully read on success, or a negative error
+ *          code on failure (-ENOENT if debugfs is missing, -errno otherwise)
+ */
+int32_t xe_get_pat_sw_config(int drm_fd, struct intel_pat_cache *xe_pat_cache)
+{
+	char *line = NULL;
+	size_t line_len = 0;
+	ssize_t nread;
+	int32_t parsed = 0;
+	int dbgfs_fd;
+	FILE *dbgfs_file = NULL;
+	static __thread struct intel_pat_cache cached_pat;
+
+	/* Return cached value if already read for this thread */
+	if (cached_pat.max_index != 0) {
+		*xe_pat_cache = cached_pat;
+		return cached_pat.max_index + 1;
+	}
 
-#include "igt.h"
+	dbgfs_fd = igt_debugfs_open(drm_fd, "gt0/pat_sw_config", O_RDONLY);
+	if (dbgfs_fd < 0)
+		return -ENOENT;
+	dbgfs_file = fdopen(dbgfs_fd, "r");
+	if (!dbgfs_file) {
+		close(dbgfs_fd);
+		return -errno;
+	}
 
-struct intel_pat_cache {
-	uint8_t uc; /* UC + COH_NONE */
-	uint8_t wt; /* WT + COH_NONE */
-	uint8_t wb; /* WB + COH_AT_LEAST_1WAY */
-	uint8_t uc_comp; /* UC + COH_NONE + COMPRESSION, XE2 and later*/
-	uint8_t max_index;
-};
+	memset(xe_pat_cache, 0, sizeof(*xe_pat_cache));
+	while ((nread = getline(&line, &line_len, dbgfs_file)) != -1) {
+		uint32_t value = 0;
+		char *p = NULL;
+
+		/* Expect patterns like: PAT[ 0] = [ 0, 0, 0, 0, 0 ]  (     0x0) */
+		if (strncmp(line, "PAT[", 4) == 0) {
+			bool is_reserved;
+			p = strstr(line, "(");
+			if (p && sscanf(p, "(%x", &value) == 1) {
+				if (parsed < XE_PAT_MAX_ENTRIES) {
+					is_reserved = strchr(line, '*') != NULL;
+					xe_pat_cache->entries[parsed].pat = value;
+					xe_pat_cache->entries[parsed].rsvd = is_reserved;
+					xe_pat_cache->max_index = parsed;
+					parsed++;
+
+					igt_debug("Parsed PAT entry %d: 0x%08x%s\n",
+						  parsed - 1, value,
+						  is_reserved ? " (reserved)" : "");
+				} else {
+					igt_warn("Too many PAT entries, line ignored: %s\n", line);
+				}
+			} else {
+				igt_warn("Failed to parse PAT entry line: %s\n", line);
+			}
+		} else if (strncmp(line, "PAT_MODE", 8) == 0) {
+			p = strstr(line, "(");
+			if (p && sscanf(p, "(%x", &value) == 1)
+				xe_pat_cache->pat_mode = value;
+		} else if (strncmp(line, "PAT_ATS", 7) == 0) {
+			p = strstr(line, "(");
+			if (p && sscanf(p, "(%x", &value) == 1)
+				xe_pat_cache->pat_ats = value;
+		} else if (strncmp(line, "IDX[XE_CACHE_NONE]", 18) == 0) {
+			p = strstr(line, "=");
+			if (p && sscanf(p, "= %d", &value) == 1)
+				xe_pat_cache->uc = value;
+		} else if (strncmp(line, "IDX[XE_CACHE_WT]", 16) == 0) {
+			p = strstr(line, "=");
+			if (p && sscanf(p, "= %d", &value) == 1)
+				xe_pat_cache->wt = value;
+		} else if (strncmp(line, "IDX[XE_CACHE_WB]", 16) == 0) {
+			p = strstr(line, "=");
+			if (p && sscanf(p, "= %d", &value) == 1)
+				xe_pat_cache->wb = value;
+		} else if (strncmp(line, "IDX[XE_CACHE_NONE_COMPRESSION]", 28) == 0) {
+			p = strstr(line, "=");
+			if (p && sscanf(p, "= %d", &value) == 1)
+				xe_pat_cache->uc_comp = value;
+		}
+	}
+
+	free(line);
+	fclose(dbgfs_file);
+	cached_pat = *xe_pat_cache;
+
+	return parsed;
+}
 
 static void intel_get_pat_idx(int fd, struct intel_pat_cache *pat)
 {
 	uint16_t dev_id = intel_get_drm_devid(fd);
 
-	if (intel_graphics_ver(dev_id) == IP_VER(35, 11)) {
-		pat->uc = 3;
-		pat->wb = 2;
-		pat->max_index = 31;
-	} else if (intel_get_device_info(dev_id)->graphics_ver == 30 ||
-		   intel_get_device_info(dev_id)->graphics_ver == 20) {
-		pat->uc = 3;
-		pat->wt = 15; /* Compressed + WB-transient */
-		pat->wb = 2;
-		pat->uc_comp = 12; /* Compressed + UC, XE2 and later */
-		pat->max_index = 31;
-
-		/* Wa_16023588340: CLOS3 entries at end of table are unusable */
-		if (intel_graphics_ver(dev_id) == IP_VER(20, 1))
-			pat->max_index -= 4;
+	if (intel_graphics_ver(dev_id) >= IP_VER(20, 0)) {
+		struct xe_device *xe_dev = xe_device_get(fd);
+		memcpy(pat, &xe_dev->pat_sw_config, sizeof(*pat));
+		if (pat->max_index == 0) {
+			/* If PAT info is not available, try to read it now */
+			igt_require_f(xe_get_pat_sw_config(fd, pat) > 0,
+				      "Unable to open the pat_sw_config file in debugfs.\n");
+			memcpy(&xe_dev->pat_sw_config, pat, sizeof(*pat));
+		}
 	} else if (IS_METEORLAKE(dev_id)) {
 		pat->uc = 2;
 		pat->wt = 1;
@@ -96,3 +177,16 @@ uint8_t intel_get_pat_idx_wb(int fd)
 	intel_get_pat_idx(fd, &pat);
 	return pat.wb;
 }
+
+uint8_t xe_get_pat_entries(int drm_fd, struct xe_pat_entry *entry)
+{
+	struct intel_pat_cache pat = {};
+	uint8_t max_index;
+
+	intel_get_pat_idx(drm_fd, &pat);
+	max_index = pat.max_index;
+
+	memcpy(entry, pat.entries, (max_index + 1) * sizeof(*entry));
+
+	return max_index + 1;
+}
diff --git a/lib/intel_pat.h b/lib/intel_pat.h
index eb48cbc65..48ee10c0e 100644
--- a/lib/intel_pat.h
+++ b/lib/intel_pat.h
@@ -6,9 +6,27 @@
 #ifndef INTEL_PAT_H
 #define INTEL_PAT_H
 
+#include <stdbool.h>
 #include <stdint.h>
 
 #define DEFAULT_PAT_INDEX ((uint8_t)-1) /* igt-core can pick 1way or better */
+#define XE_PAT_MAX_ENTRIES 32
+
+struct xe_pat_entry {
+	uint32_t pat;
+	bool rsvd;
+};
+
+struct intel_pat_cache {
+	uint8_t uc; /* UC + COH_NONE */
+	uint8_t wt; /* WT + COH_NONE */
+	uint8_t wb; /* WB + COH_AT_LEAST_1WAY */
+	uint8_t uc_comp; /* UC + COH_NONE + COMPRESSION, XE2 and later*/
+	uint8_t max_index;
+	struct xe_pat_entry entries[XE_PAT_MAX_ENTRIES];
+	uint32_t pat_mode;
+	uint32_t pat_ats;
+};
 
 uint8_t intel_get_max_pat_index(int fd);
 
@@ -18,4 +36,7 @@ uint8_t intel_get_pat_idx_wb(int fd);
 
 uint8_t intel_get_pat_idx_uc_comp(int fd);
 
+int32_t xe_get_pat_sw_config(int drm_fd, struct intel_pat_cache *xe_pat_cache);
+uint8_t xe_get_pat_entries(int drm_fd, struct xe_pat_entry *entry);
+
 #endif /* INTEL_PAT_H */
diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
index 981d76948..a456aa44e 100644
--- a/lib/xe/xe_query.c
+++ b/lib/xe/xe_query.c
@@ -299,6 +299,12 @@ struct xe_device *xe_device_get(int fd)
 	xe_dev->default_alignment = __mem_default_alignment(xe_dev->mem_regions);
 	xe_dev->has_vram = __mem_has_vram(xe_dev->mem_regions);
 
+	/* Populate PAT software configuration */
+	if (xe_get_pat_sw_config(fd, &xe_dev->pat_sw_config) < 0) {
+		/* If PAT info is not available, zero it out */
+		memset(&xe_dev->pat_sw_config, 0, sizeof(xe_dev->pat_sw_config));
+	}
+
 	/* We may get here from multiple threads, use first cached xe_dev */
 	pthread_mutex_lock(&cache.cache_mutex);
 	prev = find_in_cache_unlocked(fd);
diff --git a/lib/xe/xe_query.h b/lib/xe/xe_query.h
index d7a9f95f9..12cae99d9 100644
--- a/lib/xe/xe_query.h
+++ b/lib/xe/xe_query.h
@@ -12,6 +12,7 @@
 #include <stdint.h>
 #include <xe_drm.h>
 
+#include "intel_pat.h"
 #include "igt_aux.h"
 #include "igt_list.h"
 #include "igt_sizes.h"
@@ -74,6 +75,9 @@ struct xe_device {
 
 	/** @dev_id: Device id of xe device */
 	uint16_t dev_id;
+
+	/** @pat_sw_config: Xe PAT software configuration */
+	struct intel_pat_cache pat_sw_config;
 };
 
 #define xe_for_each_engine(__fd, __hwe) \
-- 
2.43.0

