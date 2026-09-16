Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 288D9C88E77
	for <igt-dev@archiver.kernel.org>; Wed, 16 Sep 2026 11:20:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC17B10E043;
	Wed, 16 Sep 2026 11:20:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NjUlJRyB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A082910E043
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Sep 2026 11:12:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789557123; x=1821093123;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0PxDZTbVYmvu9EEYPyLr9YBZAdIszfBohoh7mWoneZo=;
 b=NjUlJRyBiB63IRQ5KbzJ86V64Lj9pa6+WzG21anoIFNBvd8qscDL4DVj
 37zs18VnM1EdIykJTh6zrnHSMRxd+3VXd2qsDv6lTD3hB2gSbWHVNCHDx
 /ijvrsuxfKcxaJzQEB9Kogp/Bq1wR5oxkY1Onq+SJivrtORe1DcMH+9iD
 rvkw82OJkB+t055nhtRGCB3YGI7Cl7lCA4cVvCMviL4RKVYxOTIVncOl8
 CdjQveX2vOnwwzcSIcdP8M0RIV4RyWZeUwiHRUXJAl5g48WiKvQnrZICw
 H5lrKSxCclkCuy4H0zlCal0PkFqurKbbKOcsp3we3iTufS2CVJbLjpfhS w==;
X-CSE-ConnectionGUID: F926ilesTN+c+ZGf52tb3A==
X-CSE-MsgGUID: EPcZI0pVQ46rOqzfu9f3IA==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="440576"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="440576"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa115.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 04:12:03 -0700
X-CSE-ConnectionGUID: 5Owyrnr4RaiTigMepyj9qQ==
X-CSE-MsgGUID: HnwI72S7Q4GVno7zMpysHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="296801056"
Received: from rgsanthosh-z690i-a-ultra-plus.iind.intel.com ([10.190.216.152])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 04:12:00 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: suraj.kandpal@intel.com, swati2.sharma@intel.com,
 santhoshguddati@gmail.com, ankit.k.nautiyal@intel.com,
 karthik.b.s@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v1 14/16] tools/intel_hdcp: Actually select HDCP1.4 when
 it is asked for
Date: Wed, 16 Sep 2026 16:37:07 +0530
Message-ID: <20260916110718.596603-15-santhosh.reddy.guddati@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260916110718.596603-1-santhosh.reddy.guddati@intel.com>
References: <20260916110718.596603-1-santhosh.reddy.guddati@intel.com>
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

Use i915_force_hdcp14 to force HDCP1.4 for the 1.4 menu entry, and clear
it for every other state.

The override is best effort: without it, the kernel continues choosing
the HDCP version as before. The code comments describe the uAPI details.

Assisted-by: GitHub Copilot:Claude Opus 4.6
Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
---
 tools/intel_hdcp.c | 41 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/tools/intel_hdcp.c b/tools/intel_hdcp.c
index 1fdbd459e4..076a878049 100644
--- a/tools/intel_hdcp.c
+++ b/tools/intel_hdcp.c
@@ -14,6 +14,7 @@
 #include <time.h>
 
 #include "igt.h"
+#include "igt_sysfs.h"
 #include "version.h"
 
 #define MAX_HDCP_BUF_LEN	5000
@@ -197,6 +198,38 @@ static const char * const menu_lines[] = {
 	"q. Quit"
 };
 
+/*
+ * Keep the driver on HDCP1.4, or let it choose again.
+ *
+ * There is no uAPI for picking the HDCP version. Content Type 0 is satisfied
+ * by either 1.4 or 2.2, so the kernel takes 2.2 whenever the sink offers it,
+ * and a request for "HDCP1.4" is byte-identical to one for "HDCP2.2 Type 0".
+ * i915 exposes a per-connector override, which is the only way to actually get
+ * 1.4 on a sink that supports both.
+ *
+ * Best effort: on another driver, or a kernel without the file, the request
+ * still goes out and the kernel picks the version as it always did.
+ */
+static void force_hdcp14(data_t *data, igt_output_t *output, bool force)
+{
+	const char *name = igt_output_name(output);
+	int dir;
+
+	if (!is_intel_device(data->fd))
+		return;
+
+	dir = igt_debugfs_connector_dir(data->fd, name, O_RDONLY);
+	if (dir < 0)
+		return;
+
+	if (igt_sysfs_write(dir, "i915_force_hdcp14", force ? "1" : "0", 1) < 0)
+		fprintf(stderr,
+			"%s: no i915_force_hdcp14, so the kernel picks the HDCP version\n",
+			name);
+
+	close(dir);
+}
+
 static void set_hdcp_prop(data_t *data, int property, int type, int connector_id)
 {
 	igt_output_t *output;
@@ -211,6 +244,8 @@ static void set_hdcp_prop(data_t *data, int property, int type, int connector_id
 
 	switch (property) {
 	case CP_UNDESIRED:
+		/* Don't leave the connector pinned to 1.4 behind us. */
+		force_hdcp14(data, output, false);
 		igt_output_set_prop_value(output, IGT_CONNECTOR_CONTENT_PROTECTION, CP_UNDESIRED);
 		break;
 	case CP_DESIRED:
@@ -245,6 +280,12 @@ static void set_hdcp_prop(data_t *data, int property, int type, int connector_id
 						  content_type);
 		}
 
+		/*
+		 * Type 1 rules out 1.4 by definition, so the override is only
+		 * ever asked for on the 1.4 entry and cleared everywhere else.
+		 */
+		force_hdcp14(data, output, type == HDCP_TYPE_1_4);
+
 		igt_output_set_prop_value(output, IGT_CONNECTOR_CONTENT_PROTECTION, CP_DESIRED);
 		break;
 	default:
-- 
2.43.0

