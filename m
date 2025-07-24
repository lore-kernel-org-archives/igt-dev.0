Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22718C83F1A
	for <igt-dev@archiver.kernel.org>; Thu, 24 Jul 2025 12:27:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0B3E10E1FC;
	Thu, 24 Jul 2025 12:27:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dYeyi+BS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39FD110E1FC
 for <igt-dev@lists.freedesktop.org>; Thu, 24 Jul 2025 12:27:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753360040; x=1784896040;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=jUe38OX+Vntsw4a8ukQNigHNJ7bowzsgXqvztLZlzJA=;
 b=dYeyi+BS1IZPrZ9HNBMHL3Kd0S2ZZ1HMdTWQyPisCaSkFyGju120TWO2
 VnqdzQYzVSA2PhphtAAKlgI2gzNeYQTHO97nrKVMd1at6+kLB5rk9/idQ
 6rYbS40vGXpmac1Ue/iDSLUUqUdxtTibY2ZmJD35HG9rvXPweJqTlW+Bb
 qZ3eQB682EAmAh7GQ623wrBJMM/xmrYgb2TNa4vo+5zZ8lU9GTZKvK53t
 OfTMFArZ9W3HgTw0ZgcArEt5nRNfGZm40rhq7+iqlwBSPFEVg0eSYhObO
 U0UMQqXtxjAMooSdJZaYj8yypneWmuWwZlF5NpTrHDIBNU0CNCl3fl1Yn A==;
X-CSE-ConnectionGUID: pVupwn09QpuhppYnKiGNSg==
X-CSE-MsgGUID: aUdcdlyyQ86ngX5Z+iOSQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="55545240"
X-IronPort-AV: E=Sophos;i="6.16,337,1744095600"; d="scan'208";a="55545240"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2025 05:27:20 -0700
X-CSE-ConnectionGUID: qi7vr7RpTCuhbwrYpr8YLQ==
X-CSE-MsgGUID: Ax5Dhx7CT1eKH8Qd9bd4Ug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,337,1744095600"; d="scan'208";a="159793216"
Received: from mstancu-mobl1.ger.corp.intel.com (HELO
 friendship7-home.clients.intel.com) ([10.245.118.0])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2025 05:27:18 -0700
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Peter Senna Tschudin <peter.senna@linux.intel.com>,
 Karthik B S <karthik.b.s@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH v2 i-g-t] tests/kms_debugfs: Use static var for display
Date: Thu, 24 Jul 2025 14:27:10 +0200
Message-ID: <20250724122710.192060-1-peter.senna@linux.intel.com>
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

Commit ebe65a923a2b ("tests: Add kms_debugfs") introduced a new test.
Unfortunately, that commit used dynamic allocation for `display` and
missed a call to free(display) during cleanup. Use a stack variable
instead, eliminating the need for dynamic memory management.

Fixes: ebe65a923a2b ("tests: Add kms_debugfs")
Cc: Karthik B S <karthik.b.s@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Signed-off-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
---
 tests/kms_debugfs.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/tests/kms_debugfs.c b/tests/kms_debugfs.c
index 75ef15353..570ad1c0c 100644
--- a/tests/kms_debugfs.c
+++ b/tests/kms_debugfs.c
@@ -97,7 +97,7 @@ IGT_TEST_DESCRIPTION("Read entries from debugfs with display on/off.");
 igt_main
 {
 	int debugfs = -1;
-	igt_display_t *display;
+	igt_display_t display;
 	int fd = -1;
 
 	igt_fixture {
@@ -107,28 +107,27 @@ igt_main
 
 		kmstest_set_vt_graphics_mode();
 
-		display = calloc(1, sizeof(*display));
-		igt_display_require(display, fd);
+		igt_display_require(&display, fd);
 
 		/* Make sure we have at least one output connected */
-		igt_display_require_output(display);
+		igt_display_require_output(&display);
 	}
 
 	igt_subtest("display-off-read-all") {
-		igt_display_all_off(display);
+		igt_display_all_off(&display);
 
 		igt_dir_process_files_simple(debugfs);
 	}
 
 	igt_subtest("display-on-read-all") {
 		/* try to light all pipes */
-		igt_display_all_on(display);
+		igt_display_all_on(&display);
 
 		igt_dir_process_files_simple(debugfs);
 	}
 
 	igt_fixture {
-		igt_display_fini(display);
+		igt_display_fini(&display);
 		close(debugfs);
 		drm_close_driver(fd);
 	}
-- 
2.43.0

