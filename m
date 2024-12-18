Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEA04E77187
	for <igt-dev@archiver.kernel.org>; Wed, 18 Dec 2024 09:18:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F27B10EB27;
	Wed, 18 Dec 2024 09:18:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RmxuLf5E";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3AEE10EB2E
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Dec 2024 09:18:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734513507; x=1766049507;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=KnLoSE78FyVmV7PDXNrSVMp/iMGG2Dbhtc1yYYehZX8=;
 b=RmxuLf5EExsEfS5GSgrtCFdXHEEHHZWObIluawKfqebh0f0DSGqMe5HX
 IFHtz+bmtItK/bJ6CfIYWVKWZ5L5EJZ8gybL2rPxo7Pmyl+z61FtrI5+Y
 DTr6X6jo14SB8kTiT4mt5bC/6aj4KjYqU7lywKn22EMOgDuD+mrr7yo1j
 Xw8v1oJJqGG/8wvded3mp4bYbrGZNmcTBZps1M4g3ngY2ihk2a83bf/S3
 OiS0RruRWT2QJeeb1MzGclbEMmsbFN6zq4Yr0BKiwhk8noFbDOyzMXAdc
 sk/1JkD+CureEQNKAux3inQxzfXAck2J184XagqUBWHuhfdRDWw2jPvTu Q==;
X-CSE-ConnectionGUID: /VAYJpUES2mPGati+9ZNrQ==
X-CSE-MsgGUID: J7l8o4MrT5eWi0YDS1kswA==
X-IronPort-AV: E=McAfee;i="6700,10204,11289"; a="37816167"
X-IronPort-AV: E=Sophos;i="6.12,244,1728975600"; d="scan'208";a="37816167"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2024 01:18:27 -0800
X-CSE-ConnectionGUID: mbkHwHZ+SUe9GppjPQMe3w==
X-CSE-MsgGUID: sRXx4KVdTLmTcfPXX4A7dA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,244,1728975600"; d="scan'208";a="128607874"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by orviesa002.jf.intel.com with ESMTP; 18 Dec 2024 01:18:26 -0800
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: santhosh.reddy.guddati@intel.com, Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH i-g-t] test/kms_content_protection: Add HDCP retry after LIC
 failure
Date: Wed, 18 Dec 2024 14:48:26 +0530
Message-Id: <20241218091826.3014999-1-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
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

After LIC failure HDCP should be reenabled when retried in the
subsequent commits add function to re enable HDCP when LIC fails
in IGT.

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 tests/kms_content_protection.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/tests/kms_content_protection.c b/tests/kms_content_protection.c
index 04dff7a05..5b3e8f00f 100644
--- a/tests/kms_content_protection.c
+++ b/tests/kms_content_protection.c
@@ -373,21 +373,22 @@ static bool igt_pipe_is_free(igt_display_t *display, enum pipe pipe)
 	return true;
 }
 
-static void test_cp_lic(igt_output_t *output)
+static void test_cp_lic(igt_output_t *output,
+			enum igt_commit_style commit_style,
+			int content_type)
 {
 	bool ret;
-	uint64_t val;
 
 	/* Wait for 4Secs (min 2 cycles of Link Integrity Check) */
 	ret = wait_for_prop_value(output, CP_DESIRED, LIC_PERIOD_MSEC);
-	val = igt_output_get_prop(output,
-				  IGT_CONNECTOR_CONTENT_PROTECTION);
-	if (val == CP_DESIRED) {
+	if (ret) {
 		igt_debug("Link Integrity Check failed, waiting for reauthentication\n");
-		ret = wait_for_prop_value(output, CP_DESIRED, LIC_PERIOD_MSEC);
+		test_cp_enable_with_retry(output, commit_style, 3,
+					  content_type, false, false);
+	} else {
+		igt_assert_f(!ret, "Content Protection LIC Failed\n");
 	}
 
-	igt_assert_f(!ret, "Content Protection LIC Failed\n");
 }
 
 static bool write_srm_as_fw(const __u8 *srm, int len)
@@ -452,7 +453,7 @@ static void test_content_protection_on_output(igt_output_t *output,
 	}
 
 	if (data.cp_tests & CP_LIC)
-		test_cp_lic(output);
+		test_cp_lic(output, commit_style, content_type);
 
 	if (data.cp_tests & CP_DPMS) {
 		igt_pipe_set_prop_value(display, pipe,
-- 
2.34.1

