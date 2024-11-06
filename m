Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FF61D3E798
	for <igt-dev@archiver.kernel.org>; Wed,  6 Nov 2024 09:18:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E05A310E69C;
	Wed,  6 Nov 2024 09:18:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ETPKBC5x";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C39510E692
 for <igt-dev@lists.freedesktop.org>; Wed,  6 Nov 2024 09:18:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730884714; x=1762420714;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=hnAhJrMoWEMBRqBzs9cBe4mIBGbIsWkJL9RfIj5dcWA=;
 b=ETPKBC5xk29PClodtcZq4Y4pwD6Slk73ZLYdIx9k0rpUKZJHmsQjwhbe
 9uj3FJSIev85CNLGoR5xkkJG40+U2WFZ0NPVtoUmZV3UpZJ5vZKYgWEuq
 5yaBgPXFGV/cDEcKWxXLo/Iioor4rBySvSkHvjUIa5hqXUdDg2TBdHOAK
 5yjj2C3d2r7frjhBjaDNFELbwPxPOGeMwQfUBjoGnLosrnylILd5JIhPu
 gRsiexZIAQxXDFHAf54UMMhrOo31LGHdei7o0i1l2Fvem444l/oUNdBuZ
 R20WSPiikZygXVKsca6gqmjT21D8B//Up8pHVJtO3EKC377ybqU6JEqHW A==;
X-CSE-ConnectionGUID: z5brqvO2Swi63BAvCimaVA==
X-CSE-MsgGUID: ASHPs7fPSbuMQzUQry5bqQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="41772850"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="41772850"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2024 01:18:33 -0800
X-CSE-ConnectionGUID: 4NfcRnxjTX2R4X2W+DhcAA==
X-CSE-MsgGUID: saArWmkBQjidQ9+2/23jdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,262,1725346800"; d="scan'208";a="89004123"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.140])
 by fmviesa004.fm.intel.com with ESMTP; 06 Nov 2024 01:18:31 -0800
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, kunal1.joshi@intel.com,
 sameer.lattannavar@intel.com, pranay.samala@intel.com
Subject: [PATCH i-g-t v2 1/2] tests/kms_atomic_transition: Use extended flag
 for local execution
Date: Wed,  6 Nov 2024 14:49:05 +0530
Message-Id: <20241106091906.1831538-1-pranay.samala@intel.com>
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

There is no need to reduce the debug log level for local executions.
This flag is used to prevent the reduction of the debug log level in
local environments, while it will lower the log level in CI environments.

To avoid reducing the debug log level in local executions, the extended
flag must be explicitly used.

Signed-off-by: Pranay Samala <pranay.samala@intel.com>
---
 tests/kms_atomic_transition.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/tests/kms_atomic_transition.c b/tests/kms_atomic_transition.c
index f4f8afc66..f11e846d8 100644
--- a/tests/kms_atomic_transition.c
+++ b/tests/kms_atomic_transition.c
@@ -1189,13 +1189,15 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 		for_each_connected_output(&data.display, output)
 			count++;
 
-		dir = igt_sysfs_drm_module_params_open();
-		if (dir >= 0) {
-			current_log_level = igt_drm_debug_level_get(dir);
-			close(dir);
-
-			if (current_log_level > 10)
-				igt_drm_debug_level_update(10);
+		if (!data.extended) {
+			dir = igt_sysfs_drm_module_params_open();
+			if (dir >= 0) {
+				current_log_level = igt_drm_debug_level_get(dir);
+				close(dir);
+
+				if (current_log_level > 10)
+					igt_drm_debug_level_update(10);
+			}
 		}
 	}
 
-- 
2.34.1

