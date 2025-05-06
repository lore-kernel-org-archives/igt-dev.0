Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5A8FC3ABBE
	for <igt-dev@archiver.kernel.org>; Tue,  6 May 2025 17:32:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B0C210E706;
	Tue,  6 May 2025 17:32:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JBGOvyC3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88BE910E706
 for <igt-dev@lists.freedesktop.org>; Tue,  6 May 2025 17:32:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746552733; x=1778088733;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Z9sb7YALo3c3bqIEq/znH7zT/pWvLxpdD4oLgeCGG3s=;
 b=JBGOvyC3oXwgK7iAJEPSCre15IZRdnvDrz7tWINBxG3rVPbb0Oe9pLZQ
 4ljDsj6h3UpVfz8MJFCeBw8g6dYAh2c1c7/sdVHu2xv6SlxifxxvcXDPX
 cj1Oz/ARU+INMobRusakqbmsMS6VN3/IE4T5A52u4eCfKei93hoes4bBr
 KGLrS2n6Fn5wL4H+SWhxnVnPds6CZFWcteZa7j424T71ie32f39jLXrHB
 4OgSD+o2GDjBSSC8j39yGwja1RWL/SVyXP15tBAOUW3qUyd1ofCjN1ffS
 Z4Hpx/iJGfecdmXWL0lQXazDbWwGzpgb3we6j17JDH9+E/bl9B1YiEGbA A==;
X-CSE-ConnectionGUID: Qv1W2LBeSLOMyXEtu6eXxw==
X-CSE-MsgGUID: HGCuT5PaQYiueG8v0xhezA==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="65771951"
X-IronPort-AV: E=Sophos;i="6.15,267,1739865600"; d="scan'208";a="65771951"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2025 10:32:13 -0700
X-CSE-ConnectionGUID: iibZz2bzQo+Tvl/AB/yD3w==
X-CSE-MsgGUID: Nhj96ybdSzy9+mMz8vK+Hw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,267,1739865600"; d="scan'208";a="136198249"
Received: from ifwibot07.gar.corp.intel.com (HELO
 rgsanthosh-Z690I-A-ULTRA-PLUS.iind.intel.com) ([10.190.216.152])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2025 10:32:11 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kunal1.joshi@intel.com, suraj.kandpal@intel.com,
 mohammed.thasleem@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v1 2/2] tests/kms_content_protection: Whitelist check
 for panel support
Date: Tue,  6 May 2025 22:53:37 +0530
Message-Id: <20250506172337.2985430-3-santhosh.reddy.guddati@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250506172337.2985430-1-santhosh.reddy.guddati@intel.com>
References: <20250506172337.2985430-1-santhosh.reddy.guddati@intel.com>
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

Verify the connected output is not blacklisted and if the blacklist is
found , skip the test on the output.

Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
---
 tests/kms_content_protection.c | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/tests/kms_content_protection.c b/tests/kms_content_protection.c
index 6fe1edbc4..6df418a76 100644
--- a/tests/kms_content_protection.c
+++ b/tests/kms_content_protection.c
@@ -36,9 +36,11 @@
 #include <sys/stat.h>
 #include <libudev.h>
 #include "igt.h"
+#include "igt_edid.h"
 #include "igt_sysfs.h"
 #include "igt_kms.h"
 #include "igt_kmod.h"
+#include "igt_whitelist.h"
 
 /**
  * SUBTEST: lic-type-0
@@ -578,6 +580,32 @@ test_fini(igt_output_t *output, enum igt_commit_style commit_style)
 	igt_display_commit2(&data.display, commit_style);
 }
 
+static bool is_output_whitelist(igt_output_t *output)
+{
+	drmModePropertyBlobPtr edid_blob = NULL;
+	uint64_t edid_blob_id;
+	const struct edid *edid;
+	char edid_vendor[4];
+	char sink_name[20];
+
+	igt_assert(kmstest_get_property(data.drm_fd,
+					output->config.connector->connector_id,
+					DRM_MODE_OBJECT_CONNECTOR, "EDID", NULL,
+					&edid_blob_id, NULL));
+
+	igt_assert(edid_blob = drmModeGetPropertyBlob(data.drm_fd, edid_blob_id));
+
+	edid = (const struct edid *)edid_blob->data;
+	edid_get_mfg(edid, edid_vendor);
+	edid_vendor[3] = '\0';
+
+	edid_get_monitor_name(edid, sink_name, ARRAY_SIZE(sink_name));
+
+	drmModeFreePropertyBlob(edid_blob);
+
+	return is_panel_blacklisted_hdcp(sink_name);
+}
+
 static void
 test_content_protection(enum igt_commit_style commit_style, int content_type)
 {
@@ -595,6 +623,7 @@ test_content_protection(enum igt_commit_style commit_style, int content_type)
 	}
 
 	for_each_connected_output(display, output) {
+		igt_require_f(!is_output_whitelist(output), "Skipped as the panel is blacklisted");
 		for_each_pipe(display, pipe) {
 			igt_display_reset(display);
 
@@ -923,6 +952,8 @@ static const struct {
 	},
 };
 
+
+
 igt_main
 {
 	igt_fixture {
-- 
2.34.1

