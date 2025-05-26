Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82895C54FB3
	for <igt-dev@archiver.kernel.org>; Mon, 26 May 2025 12:38:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10EC210E2A5;
	Mon, 26 May 2025 12:38:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RSfSXY95";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A576910E2A5
 for <igt-dev@lists.freedesktop.org>; Mon, 26 May 2025 12:38:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748263137; x=1779799137;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KSqOMHoEJnl7ofrw+F40UeoUpm83BoGV/f5sgAb/sqI=;
 b=RSfSXY958unU52CSw5mXjEzMNMD/o0SqslbyISe58fIQ0dD29eULzdTI
 O4nMHS6lqbleKdjCUUT3PpR8sh2sW4Ed87b2GWnAyXJXzExGff7psuHdA
 X6N54k3BFfvo5qeshCeRgdj8NCyZfP/qgtjrajyyQ3SIonoeFHcoIfMY+
 KofSXZHib3WV9c4YtDSDqkZS9jivRC5bTEnGN/qTlvuywY4KKGIn+gOj8
 Cl4/c7Lao0ba1CYquW6Nj8Z8KrdpG5mc3bv8/hpZg1siKk5r8vH8cBygc
 Y+lrXJ7C6j4k8a4wjAUoxdlNUb+e653+pdXetBdfdIUjjmxG05l3prSEx w==;
X-CSE-ConnectionGUID: YxumnWRxTpONs2qS41Ss7g==
X-CSE-MsgGUID: 6qkWZV5uRiSbWNC9H9vDww==
X-IronPort-AV: E=McAfee;i="6700,10204,11445"; a="67786962"
X-IronPort-AV: E=Sophos;i="6.15,315,1739865600"; d="scan'208";a="67786962"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2025 05:38:57 -0700
X-CSE-ConnectionGUID: lT4CxkiSRH2aDhQRPuwYaw==
X-CSE-MsgGUID: NhFgWb/0Rb2bz9u4Zf6k/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,315,1739865600"; d="scan'208";a="142307044"
Received: from ifwibot07.gar.corp.intel.com (HELO
 rgsanthosh-Z690I-A-ULTRA-PLUS.iind.intel.com) ([10.190.216.152])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2025 05:38:55 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, suraj.kandpal@intel.com,
 mohammed.thasleem@intel.com, kamil.konieczny@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v2 2/2] tests/kms_content_protection: Whitelist check
 for panel support
Date: Mon, 26 May 2025 18:08:22 +0530
Message-Id: <20250526123822.16068-3-santhosh.reddy.guddati@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250526123822.16068-1-santhosh.reddy.guddati@intel.com>
References: <20250526123822.16068-1-santhosh.reddy.guddati@intel.com>
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

V2: Rename the function names to reflect the test exemption on panels.

Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
---
 tests/kms_content_protection.c | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/tests/kms_content_protection.c b/tests/kms_content_protection.c
index 6fe1edbc4..c50842375 100644
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
+#include "igt_panel.h"
 
 /**
  * SUBTEST: lic-type-0
@@ -578,6 +580,32 @@ test_fini(igt_output_t *output, enum igt_commit_style commit_style)
 	igt_display_commit2(&data.display, commit_style);
 }
 
+static bool is_output_hdcp_test_exempt(igt_output_t *output)
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
+	return igt_is_panel_blocked_hdcp(sink_name);
+}
+
 static void
 test_content_protection(enum igt_commit_style commit_style, int content_type)
 {
@@ -595,6 +623,9 @@ test_content_protection(enum igt_commit_style commit_style, int content_type)
 	}
 
 	for_each_connected_output(display, output) {
+		igt_require_f(!is_output_hdcp_test_exempt(output),
+			      "Skipped as the panel is blacklisted");
+
 		for_each_pipe(display, pipe) {
 			igt_display_reset(display);
 
@@ -923,6 +954,8 @@ static const struct {
 	},
 };
 
+
+
 igt_main
 {
 	igt_fixture {
-- 
2.34.1

