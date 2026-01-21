Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83AAFD262AB
	for <igt-dev@archiver.kernel.org>; Wed, 21 Jan 2026 00:12:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3493510E1D7;
	Wed, 21 Jan 2026 00:12:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h7TOOx0T";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF06910E677
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Jan 2026 00:12:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768954358; x=1800490358;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=FuoriBXGbFqY2VoHlgD353p1X/9UJgfJ2NTCqcC4WeU=;
 b=h7TOOx0T/OurrJ3LX5OCR3QV/dygK4+EYfNeXtNBeaNuCzUCwqQJ9Czq
 dKBSCzTE+tHqJMaWh5P6EizZqpyaU9yczFXpSw6/KlexcXe33jAA35GDW
 FxiLkfR3wNNl719j2/B1o/RPPBht5br1eETxiMhlzQUvvjr7KUDCHmZO/
 fF9GNRmbPheJz3Dp7v+iyqbJqtHTouCsILHPnP+H5QhOO9xgoXO186R2V
 sXDc7uTz1ckrl/0O1mFh4VUFem4u+2v+QFPu+opupczCkMPlQRC8ETZxp
 M+9Bc5w2nKqKgOSKpQJf0B+qHmu7CmkTeKs+reV5QoFJdtl5TX3y6lYsc A==;
X-CSE-ConnectionGUID: hDS2FH0TTg+3tU1JPZ9o/g==
X-CSE-MsgGUID: RiI9lzLGT+eQwx625D9wpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="81553982"
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; d="scan'208";a="81553982"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 16:12:37 -0800
X-CSE-ConnectionGUID: Mlo/RP+vS9eW78FAWuCTPw==
X-CSE-MsgGUID: SaZymcFWTpGEEI7J6BkAKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; d="scan'208";a="206073398"
Received: from rgsanthosh-system-product-name.iind.intel.com ([10.190.238.65])
 by orviesa009-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2026 16:12:35 -0800
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com, Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v1] kms/feature_discovery: Add VRR capability subtest
 per output
Date: Wed, 21 Jan 2026 05:43:24 +0530
Message-ID: <20260121001324.118542-1-ramanaidu.naladala@intel.com>
X-Mailer: git-send-email 2.43.0
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

Add a dynamic "vrr" subtest that checks vrr capability on each
connected output, skipping if the driver or output lacks VRR
support.

Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
---
 tests/kms_feature_discovery.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/tests/kms_feature_discovery.c b/tests/kms_feature_discovery.c
index da80ecf66..bf36740cf 100644
--- a/tests/kms_feature_discovery.c
+++ b/tests/kms_feature_discovery.c
@@ -60,6 +60,10 @@
  * Description: Make sure that we have eDP panel with PSR2 support.
  * Mega feature: PSR
  *
+ * SUBTEST: vrr
+ * Description: Make sure that we have VRR support on output.
+ * Mega feature: Adaptive Sync
+ *
  * SUBTEST: dp-mst
  * Description: Make sure that we have DP-MST configuration.
  *
@@ -155,6 +159,21 @@ int igt_main() {
 			igt_require(psr_sink_support(fd, debugfs_fd, PSR_MODE_2, NULL));
 		}
 
+		igt_describe("Make sure that we have VRR support on output.");
+		igt_subtest_with_dynamic("vrr") {
+			igt_output_t *output;
+
+			for_each_connected_output(&display, output) {
+				igt_dynamic_f("%s", output->name) {
+					if (!igt_output_has_prop(output, IGT_CONNECTOR_VRR_CAPABLE))
+						igt_skip("Driver not supports VRR.\n");
+
+					if (!igt_output_get_prop(output, IGT_CONNECTOR_VRR_CAPABLE))
+						igt_skip("Output not supports VRR.\n");
+				}
+			}
+		}
+
 		igt_describe("Make sure that we have DP-MST configuration.");
 		igt_subtest("dp-mst") {
 			struct kmstest_connector_config config;
-- 
2.43.0

