Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 185EAD591A5
	for <igt-dev@archiver.kernel.org>; Tue, 19 Nov 2024 05:40:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C06F010E5BC;
	Tue, 19 Nov 2024 05:40:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TXgVez3Z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AF4E10E143
 for <igt-dev@lists.freedesktop.org>; Tue, 19 Nov 2024 05:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731994825; x=1763530825;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VXoUXlv+1JQn3AfmvTccOstY5xW1Thqlf9a4mu5E4zY=;
 b=TXgVez3ZRKIP7sKwlCmHGpefn02LqPFuovECiuPem7MKEs2HTDYqhLTp
 SPbewUPTn8mSwh+viv31WMkiG4H2Qogx+iV1iUZvbdrOSLuDNVwU5EAQg
 5MxyvPK7A49a+SP2pS9VyqR62d+h0VInnBP2zv2p//HfwdUSIhjnW8iLM
 ZkdF/Kk5zJ6V/ApKuuh9hR+Dze/bavxDriN+j8Wo9UUxbTVG/eK86SxR+
 ySHg2DlkK3Ju3Kzpx+cZ9YGx2QFGWWiwYj3aTOK264UDKWPkuH/u90TLP
 YLAdms8xffHIHtuHkt30MEHnERXZzSU9VKyxby7M7g9VLE2ax4ArtUJbV A==;
X-CSE-ConnectionGUID: IqZJ4yCPTLGJOk4qUktVjA==
X-CSE-MsgGUID: a6KCTQyPQCWeSY6HJfJ+KA==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="19588158"
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="19588158"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 21:40:24 -0800
X-CSE-ConnectionGUID: gcPvlKiTTw+lnvqhCWdKJw==
X-CSE-MsgGUID: cSkkiprJT8eQe3Ttk5XG+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="89222426"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 21:40:24 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [CI 8/9] i915_module_load: Stop caring about snd/intel-gtt
Date: Mon, 18 Nov 2024 21:40:07 -0800
Message-ID: <20241119054008.2001984-8-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241119054008.2001984-1-lucas.demarchi@intel.com>
References: <20241119054008.2001984-1-lucas.demarchi@intel.com>
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

Neither snd or intel-gtt need special handling as "unwanted modules".
Just care about loading/unloading i915 and it should work.

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
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

