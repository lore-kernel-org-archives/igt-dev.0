Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19621D1CA3D
	for <igt-dev@archiver.kernel.org>; Tue,  5 Nov 2024 06:19:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DB4010E52C;
	Tue,  5 Nov 2024 06:19:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="haG1Cwnr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6789610E520
 for <igt-dev@lists.freedesktop.org>; Tue,  5 Nov 2024 06:19:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730787558; x=1762323558;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vsyGadWtvuB5Tuv3p8q7FssZijeZr9xaafZai39IGmM=;
 b=haG1Cwnr1FH6RP+8xpwXjaygXLed3TRHoH5tf4jX1mqvVOd4rj3uzJuw
 qAIf1+Q0U5sXXaGy6WELjxI7hBlAxS71niPX8ceHD8dzuWfNoBZNx4P5m
 CCDs5BqzB8bPHrYSdU/8qHByejdvVIdZ2DlIAbSxZXT0xIxP0/wlRH9Oz
 Fbfs6kR/RjhMAhyc40buJpULsP2Uu8ir0EtdOhVp6JUxh6RM1IA1y2OKm
 5S0up1s/XCIJyq0UHFX2mfwuH188FJAEeXttUUrDaGGBvIfxGEvFLsyAF
 8VAemYcRePBtruSNkLCF4K1xd6uvotmjIRST1uHZX/qMci3O9yx5TD2GN w==;
X-CSE-ConnectionGUID: sCmXtlH9ThqXbo62rc4+Kw==
X-CSE-MsgGUID: Jkv8Ph2pQBm4FK8MF61TGQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11246"; a="18133572"
X-IronPort-AV: E=Sophos;i="6.11,259,1725346800"; d="scan'208";a="18133572"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2024 22:19:16 -0800
X-CSE-ConnectionGUID: mnvr5YLSQ4CtAYwtZCsZDQ==
X-CSE-MsgGUID: Pmf2hkliQe6uA5NH26zqdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,259,1725346800"; d="scan'208";a="83781746"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2024 22:19:16 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t 9/9] xe_module_load: Stop caring about snd
Date: Mon,  4 Nov 2024 22:18:45 -0800
Message-ID: <20241105061845.2486557-10-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241105061845.2486557-1-lucas.demarchi@intel.com>
References: <20241105061845.2486557-1-lucas.demarchi@intel.com>
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

Just handle xe and it should work.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 tests/intel/xe_module_load.c | 40 ------------------------------------
 1 file changed, 40 deletions(-)

diff --git a/tests/intel/xe_module_load.c b/tests/intel/xe_module_load.c
index 83e37430f..b91da5c32 100644
--- a/tests/intel/xe_module_load.c
+++ b/tests/intel/xe_module_load.c
@@ -36,52 +36,12 @@
 #define BAR_SIZE_SHIFT 20
 #define MIN_BAR_SIZE 256
 
-static void file_write(const char *ptr, size_t size, size_t nmemb,
-                       FILE *fp)
-{
-	int count;
-
-	count = fwrite(ptr, size, nmemb, fp);
-	if (count == size * nmemb)
-		return;
-
-	igt_debug("Can't update hda dynamic debug with : %s\n", ptr);
-}
-
-static void hda_dynamic_debug(bool enable)
-{
-	FILE *fp;
-	static const char snd_hda_intel_on[] = "module snd_hda_intel +pf";
-	static const char snd_hda_core_on[] = "module snd_hda_core +pf";
-
-	static const char snd_hda_intel_off[] = "module snd_hda_intel =_";
-	static const char snd_hda_core_off[] = "module snd_hda_core =_";
-
-	fp = fopen("/sys/kernel/debug/dynamic_debug/control", "w");
-	if (!fp) {
-		igt_debug("hda dynamic debug not available\n");
-		return;
-	}
-
-	if (enable) {
-		file_write(snd_hda_intel_on, 1, sizeof(snd_hda_intel_on), fp);
-		file_write(snd_hda_core_on, 1, sizeof(snd_hda_core_on), fp);
-	} else {
-		file_write(snd_hda_intel_off, 1, sizeof(snd_hda_intel_off), fp);
-		file_write(snd_hda_core_off, 1, sizeof(snd_hda_core_off), fp);
-	}
-
-	fclose(fp);
-}
-
 static void load_and_check_xe(const char *opts)
 {
 	int error;
 	int drm_fd;
 
-	hda_dynamic_debug(true);
 	error = igt_xe_driver_load(opts);
-	hda_dynamic_debug(false);
 
 	igt_assert_eq(error, 0);
 
-- 
2.47.0

