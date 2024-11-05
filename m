Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CBB0D1CA3E
	for <igt-dev@archiver.kernel.org>; Tue,  5 Nov 2024 06:19:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07C7D10E52B;
	Tue,  5 Nov 2024 06:19:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IsXgX8Fx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58D4010E523
 for <igt-dev@lists.freedesktop.org>; Tue,  5 Nov 2024 06:19:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730787558; x=1762323558;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FoZA0ML1dAk9a9t586if+4yjKSUyPDkuCIbFnieZX54=;
 b=IsXgX8FxezNZGS7EVcIdD+143gyf5X9t6/AM4UqXrGpoon0laZ6w0e0R
 cBxj2AfPjP6xdnRJdXtc4TVOBv7NE8xcSf9pjQMPFRzgpUyQJMt7rjk/Q
 N0kEgsTGvJ+mSV4Z/naTD4jxwRsdewSKAahHs52sLZsXbs59JAPG5M142
 tEsheqbtp+yYLneLOZTrcFVoY+f0CTv4KdJ4Fg2FtIy8PpOElOc5pUOnB
 jBL6f7bIqwFOTOCPSncGsNVZz5sBqZCA+kM/5JqYffHUdvE1ImM87o/YH
 dqmjUHOS2YOWCW75oyxbi5HQ234+w5lemJ0iKag37BVMJlfh8LKuVceXZ w==;
X-CSE-ConnectionGUID: Z3OWxjVFQhuO8IPkQXPE0A==
X-CSE-MsgGUID: M01ayPEWQiSzRMvyc0xC/A==
X-IronPort-AV: E=McAfee;i="6700,10204,11246"; a="18133571"
X-IronPort-AV: E=Sophos;i="6.11,259,1725346800"; d="scan'208";a="18133571"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2024 22:19:16 -0800
X-CSE-ConnectionGUID: j9mAaVqXQiquyvUtn/2Kqw==
X-CSE-MsgGUID: 6EaPMLvBR9ui4cdt9/Abtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,259,1725346800"; d="scan'208";a="83781743"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2024 22:19:16 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t 8/9] i915_module_load: Stop caring about snd
Date: Mon,  4 Nov 2024 22:18:44 -0800
Message-ID: <20241105061845.2486557-9-lucas.demarchi@intel.com>
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

Just handle i915 and it should work.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 tests/intel/i915_module_load.c | 32 --------------------------------
 1 file changed, 32 deletions(-)

diff --git a/tests/intel/i915_module_load.c b/tests/intel/i915_module_load.c
index b3752a19c..c78b843f9 100644
--- a/tests/intel/i915_module_load.c
+++ b/tests/intel/i915_module_load.c
@@ -271,41 +271,12 @@ static void gem_sanitycheck(void)
 	igt_assert_eq(err, expected);
 }
 
-static void
-hda_dynamic_debug(bool enable)
-{
-	FILE *fp;
-	const char snd_hda_intel_on[] = "module snd_hda_intel +pf";
-	const char snd_hda_core_on[] = "module snd_hda_core +pf";
-
-	const char snd_hda_intel_off[] = "module snd_hda_core =_";
-	const char snd_hda_core_off[] = "module snd_hda_intel =_";
-
-	fp = fopen("/sys/kernel/debug/dynamic_debug/control", "w");
-	if (!fp) {
-		igt_debug("hda dynamic debug not available\n");
-		return;
-	}
-
-	if (enable) {
-		fwrite(snd_hda_intel_on, 1, sizeof(snd_hda_intel_on), fp);
-		fwrite(snd_hda_core_on, 1, sizeof(snd_hda_core_on), fp);
-	} else {
-		fwrite(snd_hda_intel_off, 1, sizeof(snd_hda_intel_off), fp);
-		fwrite(snd_hda_core_off, 1, sizeof(snd_hda_core_off), fp);
-	}
-
-	fclose(fp);
-}
-
 static void load_and_check_i915(void)
 {
 	int error;
 	int drm_fd;
 
-	hda_dynamic_debug(true);
 	error = igt_i915_driver_load(NULL);
-	hda_dynamic_debug(false);
 
 	igt_assert_eq(error, 0);
 
@@ -367,9 +338,6 @@ igt_main
 	igt_subtest("load") {
 		const char * unwanted_drivers[] = {
 			"i915",
-			"intel-gtt",
-			"snd_hda_intel",
-			"snd_hdmi_lpe_audio",
 			NULL
 		};
 
-- 
2.47.0

