Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A3B2E668A2
	for <igt-dev@archiver.kernel.org>; Fri, 19 Dec 2025 23:46:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61D6910F109;
	Fri, 19 Dec 2025 23:46:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gcs+R2T9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84B0C10F109
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Dec 2025 23:46:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766187980; x=1797723980;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hp0i1efxF0Co6Hpm1Bni6p2a1gDixduYvGkC9rd8XWg=;
 b=gcs+R2T9/xZmVRb0eeeXJthQ6QJikMRp5tdFuJmv7Q8H18eBIz1uNfCP
 dv/UuUgljxFsMub1MziXaNxOoH0mjkA9DLiWS9mAw9BD/VBAEKHWW6tt/
 RH+zopx+AfcQ7V2MHwMkDrLyKh7Hy1wACANmmEGg06cfhW1PUcsLf1MqW
 1n9y/aevlhZAIwUP2tL4LfwA8yNlFgppA/a596ttxbB/UT1Nx+OFV6p0z
 aCNsdJu5ehgFiHTexIxBXHmbHD/AATmtt7U2TMyxCySGz8NXF1x6EQsE2
 DIdrVgRWyfCQRLzOZlO8NasGdPUZ06vLVvqCuVB59V61747OxgTDvUVv0 g==;
X-CSE-ConnectionGUID: Aa89JSqPRKGy9HkeQ8X4QQ==
X-CSE-MsgGUID: ZC+vv3nzSSyP0FTYdSuUzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11647"; a="67146942"
X-IronPort-AV: E=Sophos;i="6.21,162,1763452800"; d="scan'208";a="67146942"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 15:46:20 -0800
X-CSE-ConnectionGUID: pUl/hLGDQcuUvhkB2IfyxQ==
X-CSE-MsgGUID: ed2wjIT/Qiq7Pg2QG6pwwA==
X-ExtLoop1: 1
Received: from dut6304bmgfrd.fm.intel.com ([10.36.21.42])
 by fmviesa003.fm.intel.com with ESMTP; 19 Dec 2025 15:46:20 -0800
From: Xin Wang <x.wang@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: alex.zuo@intel.com, shuicheng.lin@intel.com, stuart.summers@intel.com,
 kamil.konieczny@intel.com, matthew.d.roper@intel.com,
 ravi.kumar.vodapalli@intel.com, zbigniew.kempczynski@intel.com,
 Xin Wang <x.wang@intel.com>, Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH v8 1/2] lib/intel_pat: add pat_sw_config debugfs parser
Date: Fri, 19 Dec 2025 23:46:13 +0000
Message-ID: <20251219234615.90213-2-x.wang@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251219234615.90213-1-x.wang@intel.com>
References: <20251219234615.90213-1-x.wang@intel.com>
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

Add xe_get_pat_sw_config() to parse the Xe PAT software configuration
from debugfs (gt0/pat_sw_config). This is intended for test-only use
to validate the kernel-exposed PAT layout against IGT's predefined
UC/WT/WB/UC_COMP mapping.

The intel_get_pat_idx_*() helpers continue to use a predefined per-devid
mapping, keeping them usable from unprivileged users. This avoids
introducing a debugfs dependency in the common library path while still
allowing tests to detect PAT table drift as new platforms are added.

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
V6:
- code optimization
V7:
- Keep intel_get_pat_*() usable for unprivileged users by switching back
to the predefined per-devid UC/WT/WB/UC_COMP mapping (no debugfs required).
- Stop reading pat_sw_config from the common device setup path: remove the
PAT debugfs fetch from xe_device_get() (and drop the cached field in the
xe device struct), avoiding a global debugfs dependency in lib code paths.
- Treat PAT parsing as test-only plumbing: make xe_get_pat_sw_config()
explicitly root-gated.

CC: Shuicheng Lin <shuicheng.lin@intel.com>
CC: Kamil Konieczny <kamil.konieczny@intel.com>
CC: Matt Roper <matthew.d.roper@intel.com>
CC: Matthew Auld <matthew.auld@intel.com>
CC: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Signed-off-by: Xin Wang <x.wang@intel.com>
---
 lib/intel_pat.c | 96 ++++++++++++++++++++++++++++++++++++++++++++-----
 lib/intel_pat.h | 20 +++++++++++
 2 files changed, 108 insertions(+), 8 deletions(-)

diff --git a/lib/intel_pat.c b/lib/intel_pat.c
index e3588110a..fcab5e145 100644
--- a/lib/intel_pat.c
+++ b/lib/intel_pat.c
@@ -3,17 +3,97 @@
  * Copyright © 2023 Intel Corporation
  */
 
+#include "igt.h"
 #include "intel_pat.h"
 
-#include "igt.h"
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
+
+	igt_require_f(getgid() == 0, "Must be root to read PAT configuration\n");
+
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
+
+	return parsed;
+}
 
 static void intel_get_pat_idx(int fd, struct intel_pat_cache *pat)
 {
diff --git a/lib/intel_pat.h b/lib/intel_pat.h
index eb48cbc65..e9ade2e2e 100644
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
 
@@ -18,4 +36,6 @@ uint8_t intel_get_pat_idx_wb(int fd);
 
 uint8_t intel_get_pat_idx_uc_comp(int fd);
 
+int32_t xe_get_pat_sw_config(int drm_fd, struct intel_pat_cache *xe_pat_cache);
+
 #endif /* INTEL_PAT_H */
-- 
2.43.0

