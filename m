Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69365C5475B
	for <igt-dev@archiver.kernel.org>; Mon, 11 Mar 2024 11:47:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F2BC1129C2;
	Mon, 11 Mar 2024 11:47:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Jl6nM6tS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C60931129C2
 for <igt-dev@lists.freedesktop.org>; Mon, 11 Mar 2024 11:47:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710157656; x=1741693656;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=K9CpgvWiouKGurK3cArb56KtXGOuiAh1aCg6Nk21U6k=;
 b=Jl6nM6tSISjN4zspsZVZQbmiaW8uofgT/KKwzPQ9k5dYq8lmK5MpE+kI
 Gj9WEgO+3aG5/rZmXFnJ3nW5gY2ammuynzn9Bsod3HNJ60VrOwfPHmsbA
 VTd3buouRBlBuYGQndANg0xP2tMR4QEc+4TOQJdnhcTnqwpUUVznnRZd2
 oI71kDzcNWcZ+7+h8xyoLP73yCcJtfLvAeMAE4Cc7SIuHxHkP0cjaNyl3
 aEMKoO7Ka1A5t8HTE61a6NRTAXZgpbYyur53yZ24b0NDFrl2lgo3Nem5o
 IfazuEs/xvnme96Nn3u3+R8oQZUTVPvZr2eSKPMoTuz8n5LMgya6SDMCH Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11009"; a="8568409"
X-IronPort-AV: E=Sophos;i="6.07,116,1708416000"; 
   d="scan'208";a="8568409"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2024 04:47:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,116,1708416000"; d="scan'208";a="42122777"
Received: from unknown (HELO localhost) ([10.245.244.202])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2024 04:47:33 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH i-g-t] tests/xe_ccs: Separate inc dimension start width
Date: Mon, 11 Mar 2024 12:47:30 +0100
Message-Id: <20240311114730.77947-1-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Instead of manipulating param width/heigth add dedicated variable
used in inc-dimension subtests. This fixes issue when all subtests
are run one-by-one what causes failures on comparing surfaces due
to different sizes.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
---
 tests/intel/xe_ccs.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/tests/intel/xe_ccs.c b/tests/intel/xe_ccs.c
index 9ac05983fb..5a79642c9d 100644
--- a/tests/intel/xe_ccs.c
+++ b/tests/intel/xe_ccs.c
@@ -63,6 +63,7 @@ static struct param {
 	bool print_surface_info;
 	int width;
 	int height;
+	int incdim_width;
 } param = {
 	.compression_format = 0,
 	.tiling = -1,
@@ -71,6 +72,7 @@ static struct param {
 	.print_surface_info = false,
 	.width = 512,
 	.height = 512,
+	.incdim_width = 1,
 };
 
 struct test_config {
@@ -636,8 +638,8 @@ static void block_copy_test(int xe,
 						    param.width, param.height,
 						    tiling, copy_function);
 			} else {
-				for (int w = param.width;
-				     w < param.width + config->width_steps;
+				for (int w = param.incdim_width;
+				     w < param.incdim_width + config->width_steps;
 				     w += config->width_increment) {
 					snprintf(testname, sizeof(testname),
 						 "%s-%s-compfmt%d-%s%s-%dx%d",
@@ -735,8 +737,6 @@ igt_main_args("bf:pst:W:H:", NULL, help_str, opt_handler, NULL)
 	igt_subtest_with_dynamic("block-copy-uncompressed-inc-dimension") {
 		struct test_config config = { .width_increment = 15,
 					      .width_steps = 512 };
-		param.width = 1;
-		param.height = 1;
 
 		block_copy_test(xe, &config, set, BLOCK_COPY);
 	}
@@ -753,8 +753,6 @@ igt_main_args("bf:pst:W:H:", NULL, help_str, opt_handler, NULL)
 		struct test_config config = { .compression = true,
 					      .width_increment = 15,
 					      .width_steps = 512 };
-		param.width = 1;
-		param.height = 1;
 
 		block_copy_test(xe, &config, set, BLOCK_COPY);
 	}
-- 
2.34.1

