Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6231D606A31A
	for <igt-dev@archiver.kernel.org>; Mon, 26 Oct 2026 17:21:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=M4lS2Jgh
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1281710E1FD;
	Mon, 26 Oct 2026 17:21:02 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 095EB10E2BA
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Oct 2026 17:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793035110; x=1824571110;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kFe+LKVMhfMpVMqw6n5zeJWb6uH8RP144Ao0Yzhzgko=;
 b=M4lS2Jgh2pfYgNOjIFBLpvqet2iHAMqgaAThxnrpcodcjivBSGhPAmUv
 LBdBv3ZxxvpdJkqIuZ+1bm956j0ycdpyQ0KtVf6X5Gm+0mASeH1+4Hmb0
 Cab9xgwR9qQZGePtVxNfqzrXvCGbsZMGyqmEHJLsYmHp9LgLHDC1MHvkO
 2Lpp7rBAW19JkgkSMUEDaxuSmOvF3EItUjSLyOF8TnyVdvDHQYM9U+cTJ
 CXTZXokCLDTQP66TDGU5iZwsFU0fxmi/2dC6LuVYQLs+n7Ru6wK3XLk9s
 JtwCm0diTbtLQC0xRcjrprEO9Xkplda5Jd99ikg8IGxKaGN4IsGkeGVlR g==;
X-CSE-ConnectionGUID: siTjr9sXTj6jQJsBkHGMvw==
X-CSE-MsgGUID: ZyG3SfjjQSavnZMD93W+nA==
X-IronPort-AV: E=McAfee;i="6800,10657,11947"; a="1589191"
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="1589191"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2026 10:18:28 -0700
X-CSE-ConnectionGUID: Tx66N2yOSSSbQvq1JIsF0Q==
X-CSE-MsgGUID: QagfqnZpQzmW/G8b8IZnyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="4275107"
Received: from linux-panther-lake-client-platform.iind.intel.com (HELO
 jeevan-X299-AORUS-Gaming-3-Pro.iind.intel.com) ([10.190.238.87])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2026 10:18:26 -0700
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: pranay.samala@intel.com,
	Jeevan B <jeevan.b@intel.com>
Subject: [PATCH 1/3] tests/kms_cursor_legacy: reduce CI debug output
Date: Mon, 26 Oct 2026 22:48:34 +0530
Message-ID: <20261026171836.1434992-2-jeevan.b@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261026171836.1434992-1-jeevan.b@intel.com>
References: <20261026171836.1434992-1-jeevan.b@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Use DRM_UT_CORE instead of DRM_UT_KMS in CI to reduce log volume while
retaining diagnostics. This applies to all subtests, including the
reported cursorA-vs-flipA-atomic-transitions case.

Log the actual debug mask instead of the hard-coded 0x4.
Intel CI output-limit validation is still pending.

Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items/16961
Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 lib/igt_sysfs.c           | 3 ++-
 tests/kms_cursor_legacy.c | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/lib/igt_sysfs.c b/lib/igt_sysfs.c
index 9952c1c0d..873015bdc 100644
--- a/lib/igt_sysfs.c
+++ b/lib/igt_sysfs.c
@@ -537,7 +537,8 @@ void update_debug_mask_if_ci(unsigned int debug_mask_if_ci)
 	const char *ci_run = getenv("IGT_CI_RUN");
 
 	if (ci_run && ci_run[0] == '1') {
-		igt_debug("Currently under CI execution, reducing the DRM debug mask to 0x4\n");
+		igt_debug("Currently under CI execution, reducing the DRM debug mask to 0x%x\n",
+			  debug_mask_if_ci);
 		igt_drm_debug_mask_update(debug_mask_if_ci);
 	}
 }
diff --git a/tests/kms_cursor_legacy.c b/tests/kms_cursor_legacy.c
index 62339855e..5d8bcae9e 100644
--- a/tests/kms_cursor_legacy.c
+++ b/tests/kms_cursor_legacy.c
@@ -1888,7 +1888,8 @@ int igt_main()
 	};
 
 	igt_fixture() {
-		unsigned int debug_mask_if_ci = DRM_UT_KMS;
+		/* Keep CORE diagnostics without the high-volume KMS debug logs. */
+		unsigned int debug_mask_if_ci = DRM_UT_CORE;
 		display.drm_fd = drm_open_driver_master(DRIVER_ANY);
 		kmstest_set_vt_graphics_mode();
 
-- 
2.43.0

