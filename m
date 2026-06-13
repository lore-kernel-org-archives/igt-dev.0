Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CE3ECD98CF
	for <igt-dev@archiver.kernel.org>; Sat, 13 Jun 2026 19:50:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 872A910E233;
	Sat, 13 Jun 2026 19:50:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GLaUrGxb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3196A10E233
 for <igt-dev@lists.freedesktop.org>; Sat, 13 Jun 2026 19:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781380212; x=1812916212;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=upXbsbt7gHS50Cyaya5dBTvwCsNnPzYXlfSmx/yWHm0=;
 b=GLaUrGxbw/U1Ul/KOKcoaf+eU0G2U0c18UtsNUnw207QSc9FUeUflZYA
 W/mYfsJd7Gs+Fhz1VYpCowv628GZZcLpIU56OexZXs/eErAQvm5p6xAl9
 TZjC60ReI8/DV4gzZoo3JnaXqPLtncXwa+RRL1IFv1B8ZvKbT2o3tOwL1
 Z0hPY2jmvPrWVAog/hLyCH/vamekepquNkWS1XJ7EgNZtPJTTFduQDHI7
 tSeo2c0LKzIPONviG6ItWEXK+5yRMafKmzRPy6Niw+aKgg9N0eu0NfAta
 0W2RP95pVsS2unV0QKBPh+bC4A7uUpWCp4c7tkc5m8iREqZ7m44mr53yL A==;
X-CSE-ConnectionGUID: 88xrWO5mQTm6aCwLXleWjw==
X-CSE-MsgGUID: M0hvGrCNRs2X7dKDU6sMpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11816"; a="92500587"
X-IronPort-AV: E=Sophos;i="6.24,203,1774335600"; d="scan'208";a="92500587"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2026 12:50:12 -0700
X-CSE-ConnectionGUID: NXzmPGZlQX2jDkgs7LddAw==
X-CSE-MsgGUID: TdsIWiRVRcSvS7JA1zfQmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,203,1774335600"; d="scan'208";a="270773073"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2026 12:50:10 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t] tests/kms_feature_discovery: add HDR,
 VRR and DSC discovery
Date: Sun, 14 Jun 2026 01:29:01 +0530
Message-Id: <20260613195901.2675666-1-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
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

Add display feature discovery subtests for HDR, VRR and DSC.

HDR requires:
- IGT_CONNECTOR_MAX_BPC with max bpc >= 10
- IGT_CONNECTOR_HDR_OUTPUT_METADATA
- EDID HDR capability via igt_is_panel_hdr()

VRR checks connector vrr_capable support.
DSC checks sink support via igt_is_dsc_supported_by_sink().

Assisted-by: GitHub Copilot:Claude Opus 4.6
Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/kms_feature_discovery.c | 75 +++++++++++++++++++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/tests/kms_feature_discovery.c b/tests/kms_feature_discovery.c
index 28ec89c55..07a0c5e16 100644
--- a/tests/kms_feature_discovery.c
+++ b/tests/kms_feature_discovery.c
@@ -36,6 +36,7 @@
 #ifdef HAVE_CHAMELIUM
 #include "igt_chamelium.h"
 #endif
+#include "igt_hdr.h"
 #include "igt_kms.h"
 #include "igt_psr.h"
 #include "igt_sysfs.h"
@@ -63,6 +64,18 @@
  * SUBTEST: dp-mst
  * Description: Make sure that we have DP-MST configuration.
  *
+ * SUBTEST: hdr
+ * Description: Make sure that we have at least one HDR-capable panel.
+ * Mega feature: HDR
+ *
+ * SUBTEST: vrr
+ * Description: Make sure that we have at least one VRR-capable panel.
+ * Mega feature: VRR
+ *
+ * SUBTEST: dsc
+ * Description: Make sure that we have at least one DSC-capable sink.
+ * Mega feature: DSC
+ *
  * arg[1].values: 1, 2, 3, 4
  */
 
@@ -174,5 +187,67 @@ int igt_main() {
 			}
 			igt_require_f(ret == 0, "No DP-MST configuration found.\n");
 		}
+
+		igt_describe("Make sure that we have at least one HDR-capable panel.");
+		igt_subtest("hdr") {
+			igt_output_t *output;
+			bool found = false;
+
+			for_each_connected_output(&display, output) {
+				if (!igt_output_has_prop(output, IGT_CONNECTOR_MAX_BPC))
+					continue;
+
+				if (igt_get_output_max_bpc(output) < 10)
+					continue;
+
+				if (!igt_output_has_prop(output,
+							 IGT_CONNECTOR_HDR_OUTPUT_METADATA))
+					continue;
+
+				if (!igt_is_panel_hdr(fd, output))
+					continue;
+
+				found = true;
+				break;
+			}
+
+			igt_require_f(found,
+				      "No HDR-capable panel found with max bpc, HDR metadata, and EDID HDR support.\n");
+		}
+
+		igt_describe("Make sure that we have at least one VRR-capable panel.");
+		igt_subtest("vrr") {
+			igt_output_t *output;
+			bool found = false;
+
+			for_each_connected_output(&display, output) {
+				if (!igt_output_has_prop(output, IGT_CONNECTOR_VRR_CAPABLE))
+					continue;
+
+				if (!igt_output_get_prop(output, IGT_CONNECTOR_VRR_CAPABLE))
+					continue;
+
+				found = true;
+				break;
+			}
+
+			igt_require_f(found, "No VRR-capable panel found.\n");
+		}
+
+		igt_describe("Make sure that we have at least one DSC-capable sink.");
+		igt_subtest("dsc") {
+			igt_output_t *output;
+			bool found = false;
+
+			for_each_connected_output(&display, output) {
+				if (!igt_is_dsc_supported_by_sink(fd, output->name))
+					continue;
+
+				found = true;
+				break;
+			}
+
+			igt_require_f(found, "No DSC-capable sink found.\n");
+		}
 	}
 }
-- 
2.25.1

