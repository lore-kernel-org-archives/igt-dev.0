Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4455C43458
	for <igt-dev@archiver.kernel.org>; Thu,  9 Jul 2026 06:50:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DE4F10F3A9;
	Thu,  9 Jul 2026 06:50:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kwHZecNF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E93ED10E028
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Jul 2026 06:49:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783579798; x=1815115798;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FMwSYQAthZOkJwm8JuvwYTsfh+HeQ4ZiXIMr/+dtveM=;
 b=kwHZecNFI6dpQtPFNFpZpbno5DAGVRjUp3g7icIVFejBrgARgzmgosPv
 aK0ihwTeuzmnHeuayxZDlaf2cPizu0cd70/7yjwN9wqC4DrYnt7CRShq5
 hA8ROwH/mALo00FYxQpWBpTuh9v6uSMrLSiHiN27/6gmqEzg/sUZMxliY
 Gzrspd1LGX0dKBQHhMw9GPJjnU4kSgrEq+mJJzvhgQntLQX+zlxutcF1T
 pH7alNbdxImNqvcNP5sMBbHMOhCkhmptwR3w3mA4vAqsuhNRHWC1FOT3E
 GebLfbQU/7Do5RNW250JE8fI19A1Fc3fO1Zuuz+rEq0LGN0iapBicqJaV g==;
X-CSE-ConnectionGUID: PpjBLD1xSQqwQSksbcMyoA==
X-CSE-MsgGUID: dlunvEbVSJm0rJM6BtFrfg==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84129885"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="84129885"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2026 23:49:58 -0700
X-CSE-ConnectionGUID: 2Nze9khiQPCbqWnhXK8AFg==
X-CSE-MsgGUID: dV3hIzg8RmiaHxXOjONCAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="258089723"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2026 23:49:57 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@linux.intel.com,
	Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t 1/2] tests/kms_feature_discovery: add HDR,
 VRR and DSC discovery
Date: Thu,  9 Jul 2026 12:28:51 +0530
Message-Id: <20260709065852.3000382-2-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260709065852.3000382-1-swati2.sharma@intel.com>
References: <20260709065852.3000382-1-swati2.sharma@intel.com>
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

v2:
- Rebase

Assisted-by: GitHub Copilot:Claude Opus 4.6
Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/kms_feature_discovery.c | 77 +++++++++++++++++++++++++++++++++++
 1 file changed, 77 insertions(+)

diff --git a/tests/kms_feature_discovery.c b/tests/kms_feature_discovery.c
index 28ec89c55..4ad2e6a74 100644
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
 
@@ -174,5 +187,69 @@ int igt_main() {
 			}
 			igt_require_f(ret == 0, "No DP-MST configuration found.\n");
 		}
+
+		igt_describe("Make sure that we have at least one HDR-capable panel.");
+		igt_subtest("hdr") {
+			igt_output_t *output;
+			unsigned int max_bpc;
+			bool found = false;
+
+			for_each_connected_output(&display, output) {
+				if (!igt_output_has_prop(output, IGT_CONNECTOR_MAX_BPC))
+					continue;
+
+				if (!igt_get_output_max_bpc(output, &max_bpc) ||
+				    max_bpc < 10)
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

