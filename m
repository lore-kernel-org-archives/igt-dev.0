Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01BD2EDB7E7
	for <igt-dev@archiver.kernel.org>; Tue,  7 Apr 2026 10:00:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E66810E3A9;
	Tue,  7 Apr 2026 10:00:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aSkXm41v";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C79A10E2EF
 for <igt-dev@lists.freedesktop.org>; Tue,  7 Apr 2026 09:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775555991; x=1807091991;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RELR/V6R2mLAhO2PHiQ27dfElRK26snoEaQ3D5iu3gI=;
 b=aSkXm41vqNP51s9OXScFAaoFD7Cvhriv3PFwHhypDJPAAPmJ7qtnKGTt
 CyfhjQuKXGtAKD3sXEyqLMEOVHHO7QcuzB148tKpN0LqpIbtqRIqUGsMh
 4tpYgS2wdmxIA9LqCqA6vzZSuunVsOwi6prjSobZ5x+jbRz44PNPoao2Q
 PdIory+LPxyjBJDRaZJJHE4B+fUTTErAgwrxi9LpIMya6fsKrMH9L2QiD
 Wh9nxHHokxkZ0glgrjbpe6QJndTeH8dOV7Elgc/uUcjk1xL8clB3S2G8v
 13IS4c8wT9+fCf7iTzrHR9iULmRApON/l/IM8TBa8DQq8wHwvfM8ZbrkD Q==;
X-CSE-ConnectionGUID: OxWhpbFrQ+yEUjopdivorQ==
X-CSE-MsgGUID: fCVYSS2NSUCh3UdUNuduPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="87589101"
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; d="scan'208";a="87589101"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2026 02:59:50 -0700
X-CSE-ConnectionGUID: OIf5Aj3TSCWGfsnTYKQ43w==
X-CSE-MsgGUID: CuavCCSrSJyr6tmvOs7lrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; d="scan'208";a="228400139"
Received: from abityuts-desk.ger.corp.intel.com (HELO
 vgovind2-mobl4.intel.com) ([10.245.244.134])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2026 02:59:48 -0700
From: Vinod Govindapillai <vinod.govindapillai@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: vinod.govindapillai@intel.com, santhosh.reddy.guddati@intel.com,
 swati2.sharma@intel.com, jani.nikula@intel.com, ville.syrjala@intel.com
Subject: [PATCH i-g-t v2 8/8] tests/intel/kms_fbcon_fbt: use a common source
 for checking fbc tests skips
Date: Tue,  7 Apr 2026 12:58:43 +0300
Message-ID: <20260407095843.43679-9-vinod.govindapillai@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260407095843.43679-1-vinod.govindapillai@intel.com>
References: <20260407095843.43679-1-vinod.govindapillai@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo
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

There could be few reasons where fbc cannot be enabled and the tests
could be skipped. There is a common array declarred in intel_fbc.h
which act as source of fbc skip reasons for kms_frontbuffer_tracking
tests. Use that array for kms_fbcon_fbt tests as well and also update
the array with reasons from this tests also. All those reasons are
valid and declared by the driver as a reason for not enabling FBC in
a pipe.

Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
---
 lib/i915/intel_fbc.h        |  7 +++++++
 tests/intel/kms_fbcon_fbt.c | 16 ++--------------
 2 files changed, 9 insertions(+), 14 deletions(-)

diff --git a/lib/i915/intel_fbc.h b/lib/i915/intel_fbc.h
index 3dd15de31..2b6f21bc4 100644
--- a/lib/i915/intel_fbc.h
+++ b/lib/i915/intel_fbc.h
@@ -14,10 +14,17 @@ enum psr_mode;
 
 const char *const no_fbc_reasons[] = {
 	"FBC disabled: not enough stolen memory",
+	"FBC disabled: pixel format not supported",
+	"FBC disabled: tiling not supported",
+	"FBC disabled: rotation not supported",
 	"FBC disabled: stride not supported",
+	"FBC disabled: per-pixel alpha not supported",
 	"FBC disabled: plane size too big",
 	"FBC disabled: surface size too big",
 	"FBC disabled: PSR1 enabled (Wa_14016291713)"
+	"FBC disabled: plane start Y offset misaligned",
+	"FBC disabled: plane end Y offset misaligned",
+	"FBC disabled: pixel rate too high"
 };
 
 void intel_fbc_enable(igt_display_t *display);
diff --git a/tests/intel/kms_fbcon_fbt.c b/tests/intel/kms_fbcon_fbt.c
index 78c6cc4b2..95a4f66b7 100644
--- a/tests/intel/kms_fbcon_fbt.c
+++ b/tests/intel/kms_fbcon_fbt.c
@@ -296,18 +296,6 @@ static inline void psr_debugfs_enable(int device, int debugfs_fd)
 
 static void fbc_skips_on_fbcon(int debugfs_fd)
 {
-	const char *reasons[] = {
-		"pixel format not supported",
-		"tiling not supported",
-		"rotation not supported",
-		"stride not supported",
-		"per-pixel alpha not supported",
-		"plane size too big",
-		"surface size too big",
-		"plane start Y offset misaligned",
-		"plane end Y offset misaligned",
-		"pixel rate too high"
-	};
 	bool skip = false;
 	char buf[FBC_STATUS_BUF_LEN];
 	int i;
@@ -316,8 +304,8 @@ static void fbc_skips_on_fbcon(int debugfs_fd)
 	if (strstr(buf, "FBC enabled\n"))
 		return;
 
-	for (i = 0; skip == false && i < ARRAY_SIZE(reasons); i++)
-		skip = strstr(buf, reasons[i]);
+	for (i = 0; !skip && i < ARRAY_SIZE(no_fbc_reasons); i++)
+		skip = strstr(buf, no_fbc_reasons[i]);
 
 	igt_skip_on_f(skip, "fbcon modeset is not compatible with FBC\n");
 }
-- 
2.43.0

