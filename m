Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D9EAD4920E
	for <igt-dev@archiver.kernel.org>; Tue, 19 Nov 2024 05:40:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3C5E10E5BD;
	Tue, 19 Nov 2024 05:40:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dErha+cW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43CCE10E16D
 for <igt-dev@lists.freedesktop.org>; Tue, 19 Nov 2024 05:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731994825; x=1763530825;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rkvUnnd3s4reJf4W1wFiC9pewK9SEAsIl8sMKC/60GQ=;
 b=dErha+cWNttEoHHT/8PZ1PvIYFjvfUn470GAzdKyfWi8dySAQYj/koOj
 0PHXZs36QdrAJ0ZAljaWWk7xKO58lq7aRrsP5s1ChpZBEI5ssgXlG0Ck/
 a5IeKMEdPlSa6pZYNH9hozwnO2qBjk/nu4RsA1luQCTeddES0zO3Uz7QB
 l2h/rppCYMYhP8FjyvdFI5vr1qyFkRhSImuPG7ZDAm7xAk6xmEj+EvLKB
 2+GoG5ulZoh77XdBxG4fI5IGXDFWSg2HUHCE32OI6LMgiIAOpCT6pI7t9
 1++QxtTj7dYZkIP6gWiq95KXTezQH24QybC/vnQEUZgz7UVOeAFy/P6ZY g==;
X-CSE-ConnectionGUID: kuJSxv5rQda1sy2O+tS8FQ==
X-CSE-MsgGUID: y0k6MLUlRIyBrtXogkBVMg==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="19588159"
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="19588159"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 21:40:24 -0800
X-CSE-ConnectionGUID: fOXhoWicRBm00et5iCq5Lw==
X-CSE-MsgGUID: jhZ48FMQTj2lVbgc2nApXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="89222429"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 21:40:24 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [CI 9/9] xe_module_load: Stop caring about snd
Date: Mon, 18 Nov 2024 21:40:08 -0800
Message-ID: <20241119054008.2001984-9-lucas.demarchi@intel.com>
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

Just handle xe and it should work.

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
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

