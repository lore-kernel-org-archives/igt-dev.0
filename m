Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D616C3ABB2
	for <igt-dev@archiver.kernel.org>; Thu, 29 May 2025 01:56:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34AFE10E6DD;
	Thu, 29 May 2025 01:56:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d1cB0ghR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A5F110E6DD
 for <igt-dev@lists.freedesktop.org>; Thu, 29 May 2025 01:56:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748483767; x=1780019767;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3cDM4lSLf1I889uMhoH9FdoSLX1mlUU2d1Ex7qc/BT4=;
 b=d1cB0ghRa4N+WA+/0A3Pd70yDpuRWrkCOrYi5Wv7odp8T7RL5aXX/KkR
 8KFi9+5wlqwbzSnOJeapO6aDDyMvVM/2OSvhBOrrSUi9UHJk9CAGj7DCY
 j2hcapYOnmQFxa/ZKnCiftyfxusktoJSxaUMzha/4ZkAVAgxU3tUoeUxq
 k6MytYh5jUntg8nKpFlhY9IMbW90n+k/MyjmSkSGZxErGiOGVJKREBkNF
 Fpb24a99rUNFrvXEnFmsLNyixLJgz84arx7C2g5C8tDar9MgpBIzg7yLl
 8oIKuS59fYaODkzSwN5BZ0VXHsTJXfL28H5Q/ewojvfTuHwPLv9R5vwmc g==;
X-CSE-ConnectionGUID: MNOQiunaTya3uafkuD2U0g==
X-CSE-MsgGUID: HVnBGWSrRiWo8wqR1UItjg==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="61585223"
X-IronPort-AV: E=Sophos;i="6.15,322,1739865600"; d="scan'208";a="61585223"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 18:56:06 -0700
X-CSE-ConnectionGUID: w0wcFPiHShWmgWi+CTQXCw==
X-CSE-MsgGUID: XDJqXnpMR2KyB374SLf11Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,322,1739865600"; d="scan'208";a="166569819"
Received: from ifwibot07.gar.corp.intel.com (HELO
 rgsanthosh-Z690I-A-ULTRA-PLUS.iind.intel.com) ([10.190.216.152])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 18:56:04 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, suraj.kandpal@intel.com,
 mohammed.thasleem@intel.com, kamil.konieczny@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v3 2/2] tests/kms_content_protection: Whitelist check
 for panel support
Date: Thu, 29 May 2025 07:25:22 +0530
Message-Id: <20250529015522.298460-3-santhosh.reddy.guddati@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250529015522.298460-1-santhosh.reddy.guddati@intel.com>
References: <20250529015522.298460-1-santhosh.reddy.guddati@intel.com>
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

V3: Add blocklist array to content_protection and use
igt_is_panel_blocked (Suraj)

Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
---
 tests/kms_content_protection.c | 47 ++++++++++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/tests/kms_content_protection.c b/tests/kms_content_protection.c
index 6fe1edbc4..90e2ee79c 100644
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
@@ -128,6 +130,20 @@ __u8 facsimile_srm[] = {
 	0x83, 0xAA, 0xC2, 0x5B, 0x24, 0xB3, 0x36, 0x84, 0x94, 0x75, 0x34, 0xDB,
 	0x10, 0x9E, 0x3B, 0x23, 0x13, 0xD8, 0x7A, 0xC2, 0x30, 0x79, 0x84};
 
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
 static void flip_handler(int fd, unsigned int sequence, unsigned int tv_sec,
 			 unsigned int tv_usec, void *_data)
 {
@@ -578,6 +594,32 @@ test_fini(igt_output_t *output, enum igt_commit_style commit_style)
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
+	return igt_is_panel_blocked(sink_name, hdcp_blocklist, ARRAY_SIZE(hdcp_blocklist));
+}
+
 static void
 test_content_protection(enum igt_commit_style commit_style, int content_type)
 {
@@ -595,6 +637,9 @@ test_content_protection(enum igt_commit_style commit_style, int content_type)
 	}
 
 	for_each_connected_output(display, output) {
+		igt_require_f(!is_output_hdcp_test_exempt(output),
+			      "Skipped as the panel is blacklisted");
+
 		for_each_pipe(display, pipe) {
 			igt_display_reset(display);
 
@@ -923,6 +968,8 @@ static const struct {
 	},
 };
 
+
+
 igt_main
 {
 	igt_fixture {
-- 
2.34.1

