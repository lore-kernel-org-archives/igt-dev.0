Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CDECD3ABD8
	for <igt-dev@archiver.kernel.org>; Sat,  6 Dec 2025 01:12:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 384BC10E294;
	Sat,  6 Dec 2025 01:12:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Dll+/bhR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6ACD410E073
 for <igt-dev@lists.freedesktop.org>; Sat,  6 Dec 2025 01:12:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764983571; x=1796519571;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8b8jRg5ZD6yb16yE2KthhRFa5M1JwKoDP6/lMvNFmlQ=;
 b=Dll+/bhRaHmVeNS6nvtYaUY9ioarl5ygPrLOiyWwfwkaAK+qqvyTi6st
 Twcx2fVI3pKcBA1xRE8mWE/MW0Ys6VVwETu+afUhXCSOkgr3VIPqCG/MV
 7ElODTYK+GSN1duKVoSJ+nA4vXkdzNeytSn8qYoIX4cwIkH7ubOgBSCXI
 ikuooDb8wXx04qseLfpPRrs41eha7zNKdvgjw6kYfuNinG3L0Aw2Z9rcg
 kni5OdruRiLkOfBcgS8sqPor05GLaHF/ej9W5n5ShIOxDtfIfV5RHNOPo
 +obfQbN5Sgu6qOtWqqZxzWOcSbGXEtLRU3y0hN8sLonYEmCjr9yPDo6q4 w==;
X-CSE-ConnectionGUID: pV49jy5vRU6nlewMIvye3w==
X-CSE-MsgGUID: rJvfOdilTQqPeHNoSUN6nQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11633"; a="70639925"
X-IronPort-AV: E=Sophos;i="6.20,253,1758610800"; d="scan'208";a="70639925"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2025 17:12:50 -0800
X-CSE-ConnectionGUID: +DwOyGirTEeCeMTOKEneHw==
X-CSE-MsgGUID: Qxr0SuvDQ8WSdq6oeKWuVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,253,1758610800"; d="scan'208";a="195062896"
Received: from dut6304bmgfrd.fm.intel.com ([10.36.21.69])
 by fmviesa007.fm.intel.com with ESMTP; 05 Dec 2025 17:12:50 -0800
From: Xin Wang <x.wang@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: shuicheng.lin@intel.com, alex.zuo@intel.com, Xin Wang <x.wang@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH v2 1/2] lib/intel_pat: read Xe PAT config from debugfs
Date: Sat,  6 Dec 2025 01:12:40 +0000
Message-ID: <20251206011241.67825-1-x.wang@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251113070502.2148615-1-x.wang@intel.com>
References: <20251113070502.2148615-1-x.wang@intel.com>
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

Parse the PAT software configuration from gt0/pat_sw_config instead
of relying on hard-coded indices.

Expose xe_get_pat_entries() so tests can grab the PAT table.

CC: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Xin Wang <x.wang@intel.com>
---
 lib/intel_pat.c | 126 ++++++++++++++++++++++++++++++++++++++++++------
 lib/intel_pat.h |   9 ++++
 2 files changed, 120 insertions(+), 15 deletions(-)

diff --git a/lib/intel_pat.c b/lib/intel_pat.c
index e3588110a..2d204e652 100644
--- a/lib/intel_pat.c
+++ b/lib/intel_pat.c
@@ -6,6 +6,7 @@
 #include "intel_pat.h"
 
 #include "igt.h"
+#include "igt_core.h"
 
 struct intel_pat_cache {
 	uint8_t uc; /* UC + COH_NONE */
@@ -13,27 +14,112 @@ struct intel_pat_cache {
 	uint8_t wb; /* WB + COH_AT_LEAST_1WAY */
 	uint8_t uc_comp; /* UC + COH_NONE + COMPRESSION, XE2 and later*/
 	uint8_t max_index;
+	struct xe_pat_entry entries[XE_PAT_MAX_ENTRIES];
+	uint32_t pat_mode;
+	uint32_t pat_ats;
 };
 
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
+static int32_t xe_get_pat_sw_config(int drm_fd, struct intel_pat_cache *xe_pat_cache)
+{
+	char *line = NULL;
+	size_t line_len = 0;
+	ssize_t nread;
+	int32_t parsed = 0;
+	int dbgfs_fd;
+	FILE *dbgfs_file = NULL;
+
+	dbgfs_fd = igt_debugfs_open(drm_fd, "gt0/pat_sw_config", O_RDONLY);
+	if (dbgfs_fd < 0)
+		return -ENOENT;
+	dbgfs_file = fdopen(dbgfs_fd, "r");
+	if (!dbgfs_file) {
+		close(dbgfs_fd);
+		return -errno;
+	}
+
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
+
+	return parsed;
+}
+
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
+	if (intel_gen(dev_id) >= 20) {
+		/* Cache parsed PAT config per device to avoid re-reading debugfs on every call */
+		static __thread struct intel_pat_cache intel_pat_cache;
+		static __thread uint16_t cached_devid;
+		if (cached_devid != dev_id) {
+			int ret = xe_get_pat_sw_config(fd, &intel_pat_cache);
+			igt_require(ret > 0);
+			cached_devid = dev_id;
+		}
+		*pat = intel_pat_cache;
 	} else if (IS_METEORLAKE(dev_id)) {
 		pat->uc = 2;
 		pat->wt = 1;
@@ -96,3 +182,13 @@ uint8_t intel_get_pat_idx_wb(int fd)
 	intel_get_pat_idx(fd, &pat);
 	return pat.wb;
 }
+
+uint8_t xe_get_pat_entries(int fd, struct xe_pat_entry *xe_pat_table)
+{
+	struct intel_pat_cache pat = {};
+	intel_get_pat_idx(fd, &pat);
+
+	memcpy(xe_pat_table, pat.entries, (pat.max_index + 1) * sizeof(struct xe_pat_entry));
+
+	return pat.max_index + 1;
+}
diff --git a/lib/intel_pat.h b/lib/intel_pat.h
index eb48cbc65..1d6c4f1ad 100644
--- a/lib/intel_pat.h
+++ b/lib/intel_pat.h
@@ -6,9 +6,16 @@
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
 
 uint8_t intel_get_max_pat_index(int fd);
 
@@ -18,4 +25,6 @@ uint8_t intel_get_pat_idx_wb(int fd);
 
 uint8_t intel_get_pat_idx_uc_comp(int fd);
 
+uint8_t xe_get_pat_entries(int fd, struct xe_pat_entry *xe_pat_table);
+
 #endif /* INTEL_PAT_H */
-- 
2.43.0

