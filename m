Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC37F10E514
 for <igt-dev@lists.freedesktop.org>; Tue,  7 Nov 2023 11:48:42 +0000 (UTC)
From: Matthew Auld <matthew.auld@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue,  7 Nov 2023 11:48:07 +0000
Message-ID: <20231107114816.190793-7-matthew.auld@intel.com>
In-Reply-To: <20231107114816.190793-1-matthew.auld@intel.com>
References: <20231107114816.190793-1-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v8 06/15] lib/intel_pat: add helpers for
 common pat_index modes
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

For now just add uc, wt and wb for every platform. The wb mode should
always be at least 1way coherent, if messing around with system memory.
Also make non-matching platforms throw an error rather than trying to
inherit the modes from previous platforms since they will likely be
different.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: José Roberto de Souza <jose.souza@intel.com>
Cc: Pallavi Mishra <pallavi.mishra@intel.com>
Reviewed-by: Pallavi Mishra <pallavi.mishra@intel.com>
Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 lib/intel_pat.c | 77 +++++++++++++++++++++++++++++++++++++++++++++++++
 lib/intel_pat.h | 19 ++++++++++++
 lib/meson.build |  1 +
 3 files changed, 97 insertions(+)
 create mode 100644 lib/intel_pat.c
 create mode 100644 lib/intel_pat.h

diff --git a/lib/intel_pat.c b/lib/intel_pat.c
new file mode 100644
index 000000000..2b892ee52
--- /dev/null
+++ b/lib/intel_pat.c
@@ -0,0 +1,77 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#include "intel_pat.h"
+
+#include "igt.h"
+
+struct intel_pat_cache {
+	uint8_t uc; /* UC + COH_NONE */
+	uint8_t wt; /* WT + COH_NONE */
+	uint8_t wb; /* WB + COH_AT_LEAST_1WAY */
+
+	uint8_t max_index;
+};
+
+static void intel_get_pat_idx(int fd, struct intel_pat_cache *pat)
+{
+	uint16_t dev_id = intel_get_drm_devid(fd);
+
+	if (intel_get_device_info(dev_id)->graphics_ver == 20) {
+		pat->uc = 3;
+		pat->wt = 15; /* Compressed + WB-transient */
+		pat->wb = 2;
+		pat->max_index = 31;
+	} else if (IS_METEORLAKE(dev_id)) {
+		pat->uc = 2;
+		pat->wt = 1;
+		pat->wb = 3;
+		pat->max_index = 3;
+	} else if (IS_PONTEVECCHIO(dev_id)) {
+		pat->uc = 0;
+		pat->wt = 2;
+		pat->wb = 3;
+		pat->max_index = 7;
+	} else if (intel_graphics_ver(dev_id) <= IP_VER(12, 60)) {
+		pat->uc = 3;
+		pat->wt = 2;
+		pat->wb = 0;
+		pat->max_index = 3;
+	} else {
+		igt_critical("Platform is missing PAT settings for uc/wt/wb\n");
+	}
+}
+
+uint8_t intel_get_max_pat_index(int fd)
+{
+	struct intel_pat_cache pat = {};
+
+	intel_get_pat_idx(fd, &pat);
+	return pat.max_index;
+}
+
+uint8_t intel_get_pat_idx_uc(int fd)
+{
+	struct intel_pat_cache pat = {};
+
+	intel_get_pat_idx(fd, &pat);
+	return pat.uc;
+}
+
+uint8_t intel_get_pat_idx_wt(int fd)
+{
+	struct intel_pat_cache pat = {};
+
+	intel_get_pat_idx(fd, &pat);
+	return pat.wt;
+}
+
+uint8_t intel_get_pat_idx_wb(int fd)
+{
+	struct intel_pat_cache pat = {};
+
+	intel_get_pat_idx(fd, &pat);
+	return pat.wb;
+}
diff --git a/lib/intel_pat.h b/lib/intel_pat.h
new file mode 100644
index 000000000..c24dbc275
--- /dev/null
+++ b/lib/intel_pat.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#ifndef INTEL_PAT_H
+#define INTEL_PAT_H
+
+#include <stdint.h>
+
+#define DEFAULT_PAT_INDEX ((uint8_t)-1) /* igt-core can pick 1way or better */
+
+uint8_t intel_get_max_pat_index(int fd);
+
+uint8_t intel_get_pat_idx_uc(int fd);
+uint8_t intel_get_pat_idx_wt(int fd);
+uint8_t intel_get_pat_idx_wb(int fd);
+
+#endif /* INTEL_PAT_H */
diff --git a/lib/meson.build b/lib/meson.build
index a7bccafc3..48466a2e9 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -64,6 +64,7 @@ lib_sources = [
 	'intel_device_info.c',
 	'intel_mmio.c',
 	'intel_mocs.c',
+	'intel_pat.c',
 	'ioctl_wrappers.c',
 	'media_spin.c',
 	'media_fill.c',
-- 
2.41.0
