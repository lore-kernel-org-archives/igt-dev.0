Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B00BA1093179
	for <igt-dev@archiver.kernel.org>; Fri, 20 Mar 2026 06:43:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50EC910EA7F;
	Fri, 20 Mar 2026 06:43:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BxdVMVVm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBA0010EA7F
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Mar 2026 06:42:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773988979; x=1805524979;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=U8dlprjjrxgw5lAhdVfY8KrBjqY6p9NrOM9TfmMbL5w=;
 b=BxdVMVVm7WbC8GZlATNvz0/+rJshoWIiZUSnS6v1kPaeRsIj/g9Rn4gJ
 pyrLm3Og+E63rHoVl219Wzaw8xNS5XGjB7xWzetM1HWSttVaqg9EKRIye
 3SbrluF3mxg8FHEpl9p1k6gb1u+OSc3HB7Rn+wLjbo4czNCNiaWlx9LGz
 UEnqYm5uW+9BWhDft+LRe+PkaSoKMEaWZT7/m/NEPmak3kLT+LqBSKTdb
 zTJx9G6Q+sjrP6etyJa6KzoMgQKolEEaW2KjFfOjyHGEc3FGBu2WvH1+6
 M1FEJRbfnU3KC1ghisP7pV75vTbupI+HvSCDgVa3WUp4soXGn5XHsF9ev Q==;
X-CSE-ConnectionGUID: SU3AX2bXSrCOGp1BXpfrwQ==
X-CSE-MsgGUID: LbjU05avTbWRA9YGvkrDDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11734"; a="75036336"
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; d="scan'208";a="75036336"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2026 23:42:58 -0700
X-CSE-ConnectionGUID: 5Nuk2KzOSuWl3ZP8lgMj+A==
X-CSE-MsgGUID: Q4eRKO0wRwO78/s3gP/6Gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; d="scan'208";a="261104545"
Received: from rgsanthosh-system-product-name.iind.intel.com ([10.190.238.65])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2026 23:42:57 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: mohammed.bilal@intel.com, sowmiya.s@intel.com,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v2] kms/feature_discovery: Add VRR capability subtest
 per output
Date: Fri, 20 Mar 2026 12:13:42 +0530
Message-ID: <20260320064342.772014-1-ramanaidu.naladala@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260121001324.118542-1-ramanaidu.naladala@intel.com>
References: <20260121001324.118542-1-ramanaidu.naladala@intel.com>
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

v2: Address review comments. (Bilal, Sowmiya)

Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
---
 tests/kms_feature_discovery.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/tests/kms_feature_discovery.c b/tests/kms_feature_discovery.c
index 28ec89c55..7b197b848 100644
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
@@ -157,6 +161,21 @@ int igt_main() {
 			igt_require(psr_sink_support(fd, debugfs_fd, PSR_MODE_2, NULL));
 		}
 
+		igt_describe("Make sure that we have VRR support on output.");
+		igt_subtest_with_dynamic("vrr") {
+			igt_output_t *output;
+
+			igt_skip_on_f(!igt_output_has_prop(output, IGT_CONNECTOR_VRR_CAPABLE),
+				      "Driver does not support VRR.\n");
+
+			for_each_connected_output(&display, output) {
+				igt_dynamic_f("%s", output->name)
+					if (!igt_output_get_prop(output,
+								 IGT_CONNECTOR_VRR_CAPABLE))
+						igt_skip("VRR not supported on this output.\n");
+			}
+		}
+
 		igt_describe("Make sure that we have DP-MST configuration.");
 		igt_subtest("dp-mst") {
 			struct kmstest_connector_config config;
-- 
2.43.0

