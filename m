Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A59C2C5AD49
	for <igt-dev@archiver.kernel.org>; Mon, 26 May 2025 12:38:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46C7910E31A;
	Mon, 26 May 2025 12:38:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fczNJg4G";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 077E610E2A5
 for <igt-dev@lists.freedesktop.org>; Mon, 26 May 2025 12:38:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748263136; x=1779799136;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rml9TyTZ90rLpFBb4RK9FsKTXfeyFBtrYtOmIXQJ+g8=;
 b=fczNJg4GJ3y5qITZTT4cB9I10oRu12O8ThZ1sWVwgVdV57QNV259jRTG
 FEKr81tarrPsr/VTHdBq5RxDXw34WKJcj3xccAPn1JCvIilrrlR+KFW3/
 cY3xzizT4TFWDMyrC7tnGXFEa4sy1rzh8Wslyf0aE3HkeXyTeYPl4fgsH
 F4lz39DYWrXk5kAp7cnYaAArK5Bs0g7jNP1PfR/HFonj5Mo3n+uM/PASG
 HDaEHdGm1jCPrkwCLot+KSBXLUl4yRyf6O4lHSv4fslckkrDH45vV1MJP
 vNISj8X+KFNT2HatorOX2D+etbUn+RM95zkPA8IBhZqZZWGR+tVK7wJ+A g==;
X-CSE-ConnectionGUID: Op+EB4roQFe6uTfdP2oimw==
X-CSE-MsgGUID: /sx9hhYtS/KCvbMb/JydKg==
X-IronPort-AV: E=McAfee;i="6700,10204,11445"; a="67786960"
X-IronPort-AV: E=Sophos;i="6.15,315,1739865600"; d="scan'208";a="67786960"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2025 05:38:54 -0700
X-CSE-ConnectionGUID: z7lAtvVESQKbqVB9JN6/zQ==
X-CSE-MsgGUID: 30C2Zj5tSWaNVEB8mTPqgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,315,1739865600"; d="scan'208";a="142307039"
Received: from ifwibot07.gar.corp.intel.com (HELO
 rgsanthosh-Z690I-A-ULTRA-PLUS.iind.intel.com) ([10.190.216.152])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2025 05:38:52 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, suraj.kandpal@intel.com,
 mohammed.thasleem@intel.com, kamil.konieczny@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v2 1/1] lib/igt_panel: Skip hdcp tests on unsupported
 panels
Date: Mon, 26 May 2025 18:08:21 +0530
Message-Id: <20250526123822.16068-2-santhosh.reddy.guddati@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250526123822.16068-1-santhosh.reddy.guddati@intel.com>
References: <20250526123822.16068-1-santhosh.reddy.guddati@intel.com>
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

Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
---
 lib/igt_edid.c  | 27 ++++++++++++++++++++++
 lib/igt_edid.h  |  1 +
 lib/igt_panel.c | 61 +++++++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_panel.h | 15 ++++++++++++
 lib/meson.build |  1 +
 5 files changed, 105 insertions(+)
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
index 000000000..ffe08f49e
--- /dev/null
+++ b/lib/igt_panel.c
@@ -0,0 +1,61 @@
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
+ * List of Panels that should be excluded from hdcp tests
+ *
+ * This array is used to identify and handle scenarios where the test is
+ * executed on dummy monitors, such as those found on shard machines.
+ * Since these dummy monitors are not real and always the test is not consistent,
+ * the test is skipped in such cases to avoid false negatives or
+ * irrelevant test results.
+ */
+static const char *const hdcp_blocklist[] = {
+	"DPF90435", /* Example monitor name */
+	/* Add more monitor names here as needed */
+};
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
+static bool igt_is_panel_blocked(const char *vendor_name,
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
+/**
+ * igt_is_panel_blocked_hdcp - Checks if a panel vendor is blocklisted for HDCP.
+ * @vendor_name: The name of the panel vendor to check.
+ *
+ * Returns:
+ * true if the vendor is blocklisted for HDCP, false otherwise.
+ */
+bool igt_is_panel_blocked_hdcp(const char *vendor_name)
+{
+	return igt_is_panel_blocked(vendor_name, hdcp_blocklist,
+			       ARRAY_SIZE(hdcp_blocklist));
+}
diff --git a/lib/igt_panel.h b/lib/igt_panel.h
new file mode 100644
index 000000000..79cdaf11c
--- /dev/null
+++ b/lib/igt_panel.h
@@ -0,0 +1,15 @@
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
+bool igt_is_panel_blocked_hdcp(const char *vendor_name);
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

