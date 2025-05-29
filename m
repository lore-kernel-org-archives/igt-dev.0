Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8557FC5B549
	for <igt-dev@archiver.kernel.org>; Thu, 29 May 2025 01:56:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30C4210E6DB;
	Thu, 29 May 2025 01:56:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="du9QrYj0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71F2410E6DB
 for <igt-dev@lists.freedesktop.org>; Thu, 29 May 2025 01:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748483764; x=1780019764;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RZ4zdclW1CXszf97XTG3j1rYzVVvEBe+7UlR3dEGjuI=;
 b=du9QrYj08YjJmErx6t1iJHiu66ve7DbsHjYJiip4ssL1QGmRR7j5xEbb
 YThC1Vs01jaOXD5uBb7+4H9yBgaWs8Bm1aLSfdQJQhkXyB1tlxa4H6IyD
 njIl6AgUzUHKAW0kl9fKXlklNsK5+LIU1oOg6R92PQ1TEdPBmgCunlGaS
 FoIYgiZjNlUQueXl4PxCzM8+PMd+E5X+IQiM7lNN1XS3k5/78cgBJcW4X
 YvLF895BoGgzqx4RSeAb9hCS9BNtRKrprHjIK/MvpTxCyALiXW33Id0k8
 yk8hvEEBOcO06w0ILEffMTWZeY85Zf1sHTsrCPcxrPTxeg45F1adTdjod g==;
X-CSE-ConnectionGUID: l9/Zv3vQSJihbDkwRtFm0g==
X-CSE-MsgGUID: mC3LjltpRgqNXPO2HsdpIw==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="61585218"
X-IronPort-AV: E=Sophos;i="6.15,322,1739865600"; d="scan'208";a="61585218"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 18:56:04 -0700
X-CSE-ConnectionGUID: pHChq1xjSGioTq+QDWe9XQ==
X-CSE-MsgGUID: sC7TQQtuRCqq/0LVspiQvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,322,1739865600"; d="scan'208";a="166569812"
Received: from ifwibot07.gar.corp.intel.com (HELO
 rgsanthosh-Z690I-A-ULTRA-PLUS.iind.intel.com) ([10.190.216.152])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 18:56:02 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, suraj.kandpal@intel.com,
 mohammed.thasleem@intel.com, kamil.konieczny@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v3 1/2] lib/igt_panel: Skip hdcp tests on unsupported
 panels
Date: Thu, 29 May 2025 07:25:21 +0530
Message-Id: <20250529015522.298460-2-santhosh.reddy.guddati@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250529015522.298460-1-santhosh.reddy.guddati@intel.com>
References: <20250529015522.298460-1-santhosh.reddy.guddati@intel.com>
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

This introduces a mechanism to handle specific panels
like emulators/dummies that are known to face issues with certain
features like HDCP.

Tests are skipped for those outputs connected to prevent false negatives
and unnecessary debugging

V2: Refactor variable ,function names and fix coding style (Kamil)

V3: Remove extra wrapper and maintain blocklist array in test instead of
    in library (Suraj)

Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
---
 lib/igt_edid.c  | 27 +++++++++++++++++++++++++++
 lib/igt_edid.h  |  1 +
 lib/igt_panel.c | 35 +++++++++++++++++++++++++++++++++++
 lib/igt_panel.h | 17 +++++++++++++++++
 lib/meson.build |  1 +
 5 files changed, 81 insertions(+)
 create mode 100644 lib/igt_panel.c
 create mode 100644 lib/igt_panel.h

diff --git a/lib/igt_edid.c b/lib/igt_edid.c
index 80dcea112..627201c34 100644
--- a/lib/igt_edid.c
+++ b/lib/igt_edid.c
@@ -210,6 +210,33 @@ void edid_get_mfg(const struct edid *edid, char out[static 3])
 	out[2] = (edid->mfg_id[1] & 0x1F) + '@';
 }
 
+void edid_get_monitor_name(const struct edid *edid, char *name, size_t name_size)
+{
+	const struct detailed_timing *dt;
+	const struct detailed_non_pixel *np;
+	const struct detailed_data_string *ds;
+	size_t i;
+
+	assert(name_size > 0);
+	name[0] = '\0';
+
+	for (i = 0; i < DETAILED_TIMINGS_LEN; i++) {
+		dt = &edid->detailed_timings[i];
+		np = &dt->data.other_data;
+
+		if (np->type != EDID_DETAIL_MONITOR_NAME)
+			continue;
+
+		ds = &np->data.string;
+		strncpy(name, ds->str, name_size - 1);
+		name[name_size - 1] = '\0';
+		igt_debug("Monitor name: %s\n", name);
+		return;
+	}
+	igt_debug("No monitor name found in EDID\n");
+	name[0] = '\0';
+}
+
 static void edid_set_mfg(struct edid *edid, const char mfg[static 3])
 {
 	edid->mfg_id[0] = (mfg[0] - '@') << 2 | (mfg[1] - '@') >> 3;
diff --git a/lib/igt_edid.h b/lib/igt_edid.h
index 02645345f..be0ccf529 100644
--- a/lib/igt_edid.h
+++ b/lib/igt_edid.h
@@ -456,5 +456,6 @@ void *dispid_block_tiled(void *ptr,
 			 int htile, int vtile,
 			 int hsize, int vsize,
 			 const char *topology_id);
+void edid_get_monitor_name(const struct edid *edid, char *name, size_t name_size);
 
 #endif
diff --git a/lib/igt_panel.c b/lib/igt_panel.c
new file mode 100644
index 000000000..c89bf9123
--- /dev/null
+++ b/lib/igt_panel.c
@@ -0,0 +1,35 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#include <stdbool.h>
+#include <string.h>
+
+#include "drmtest.h"
+#include "igt_panel.h"
+
+/**
+ * igt_is_panel_blocked - Checks if a given vendor name is present in a blocklist.
+ *
+ * @vendor_name: The name of the vendor to check for in the blocklist.
+ * @blocklist: An array of strings representing the blocklist.
+ * @blocklist_size: The number of entries in the blocklist array.
+ *
+ * Returns:
+ * true if the vendor name is found in the blocklist, false otherwise.
+ */
+bool igt_is_panel_blocked(const char *vendor_name,
+			    const char *const blocklist[],
+			    size_t blocklist_size)
+{
+	int i;
+
+	for (i = 0; i < blocklist_size; i++) {
+		if (strstr(blocklist[i], vendor_name) != NULL)
+			return true;
+	}
+
+	return false;
+}
+
diff --git a/lib/igt_panel.h b/lib/igt_panel.h
new file mode 100644
index 000000000..b9fb88cc7
--- /dev/null
+++ b/lib/igt_panel.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#ifndef IGT_PANEL_H
+#define IGT_PANEL_H
+
+#include <stdbool.h>
+#include <string.h>
+
+bool igt_is_panel_blocked(const char *vendor_name,
+				 const char *const blocklist[],
+				 size_t blocklist_size);
+
+#endif
+
diff --git a/lib/meson.build b/lib/meson.build
index f54198051..139855f2e 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -94,6 +94,7 @@ lib_sources = [
 	'igt_draw.c',
 	'igt_list.c',
 	'igt_map.c',
+	'igt_panel.c',
 	'igt_pm.c',
 	'igt_dummyload.c',
 	'igt_store.c',
-- 
2.34.1

