Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8A83CD6E55
	for <igt-dev@archiver.kernel.org>; Mon,  1 Jun 2026 20:48:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58EDA10E987;
	Mon,  1 Jun 2026 20:48:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AP/fOMFx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DABB10E978
 for <igt-dev@lists.freedesktop.org>; Mon,  1 Jun 2026 20:44:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780346688; x=1811882688;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QBrQp3vatmcVcMRqrfO6x+jLCDR8ZPJIqKa56I5Xreo=;
 b=AP/fOMFxRw3uBsOhy74D+p25MuLVv1LGvFLd4BnLrW5LFht2S7ukH/wF
 eRo8KJJ4JiBXgTTGcr3JFMGiFoZduZbzCDD1F/AWciW2BoiLSS39XO0W/
 s4GOKUYKUjJLSddMDo7MZG7y6K9eLm/iWO2fHZFZWxLmRJUDWNTVKNHpb
 0DmA9TqcghRzjcRr3mSiNiWVFlGc11GMwJbfNnMVssLp8siDNJmMxSJ+s
 YyzavrSt9OYwQzhM7oCfxDjyENP4zQFq9l4lx9XkcdTRwn51XVHqYRZW0
 o5g/i7FCJPQwB6SrtoICv6xzlGHy/3l4hJa5O1jfhvAZT/R5KL8+B3g93 g==;
X-CSE-ConnectionGUID: aUT/aVKKQsiAxBMxQHoffA==
X-CSE-MsgGUID: M2DBuucpTjGaKrKkLsR4LA==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="68652880"
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; d="scan'208";a="68652880"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2026 13:44:47 -0700
X-CSE-ConnectionGUID: Q9HvjtEyTXmqXQLBzNxWjg==
X-CSE-MsgGUID: 9fJVIv2bR8adRZsSaZbqIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; d="scan'208";a="267331538"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO
 vgovind2-mobl4.intel.com) ([10.245.245.188])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2026 13:44:45 -0700
From: Vinod Govindapillai <vinod.govindapillai@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: vinod.govindapillai@intel.com, santhosh.reddy.guddati@intel.com,
 swati2.sharma@intel.com
Subject: [PATCH i-g-t v4 11/12] tests/intel/kms_fbcon_fbt: use common routine
 to skip tests on fbc status
Date: Mon,  1 Jun 2026 23:44:06 +0300
Message-ID: <20260601204407.39934-12-vinod.govindapillai@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260601204407.39934-1-vinod.govindapillai@intel.com>
References: <20260601204407.39934-1-vinod.govindapillai@intel.com>
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

Use the common intel_fbc_found_skip_reason() defined as part of the fbc
library functions to check and assess the fbc skip reasons. The "no fbc
reasons" are appended based on the reasons defined in the kms_fbcon_fbt
tests.

v2: update the missing coma (Santhosh)

Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
---
 lib/i915/intel_fbc.c        |  9 ++++++++-
 tests/intel/kms_fbcon_fbt.c | 26 ++------------------------
 2 files changed, 10 insertions(+), 25 deletions(-)

diff --git a/lib/i915/intel_fbc.c b/lib/i915/intel_fbc.c
index ccd7f411c..45791a72b 100644
--- a/lib/i915/intel_fbc.c
+++ b/lib/i915/intel_fbc.c
@@ -77,10 +77,17 @@ bool intel_fbc_found_skip_reason(int device, int crtc_index)
 {
 	const char *const no_fbc_reasons[] = {
 		"FBC disabled: not enough stolen memory",
+		"FBC disabled: pixel format not supported",
+		"FBC disabled: tiling not supported",
+		"FBC disabled: rotation not supported",
 		"FBC disabled: stride not supported",
+		"FBC disabled: per-pixel alpha not supported",
 		"FBC disabled: plane size too big",
 		"FBC disabled: surface size too big",
-		"FBC disabled: PSR1 enabled (Wa_14016291713)"
+		"FBC disabled: PSR1 enabled (Wa_14016291713)",
+		"FBC disabled: plane start Y offset misaligned",
+		"FBC disabled: plane end Y offset misaligned",
+		"FBC disabled: pixel rate too high"
 	};
 	bool found_reason = false;
 	char fbc_status[FBC_STATUS_BUF_LEN];
diff --git a/tests/intel/kms_fbcon_fbt.c b/tests/intel/kms_fbcon_fbt.c
index fdd8515cc..378d0ea8a 100644
--- a/tests/intel/kms_fbcon_fbt.c
+++ b/tests/intel/kms_fbcon_fbt.c
@@ -297,30 +297,8 @@ static inline void psr_debugfs_enable(struct drm_info *drm)
 
 static void fbc_skips_on_fbcon(struct drm_info *drm)
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
-	bool skip = false;
-	char buf[FBC_STATUS_BUF_LEN];
-	int i;
-
-	igt_debugfs_simple_read(drm->debugfs_fd, "i915_fbc_status", buf, sizeof(buf));
-	if (strstr(buf, "FBC enabled\n"))
-		return;
-
-	for (i = 0; skip == false && i < ARRAY_SIZE(reasons); i++)
-		skip = strstr(buf, reasons[i]);
-
-	igt_skip_on_f(skip, "fbcon modeset is not compatible with FBC\n");
+	igt_skip_on_f(intel_fbc_found_skip_reason(drm->fd, drm->crtc_index),
+		      "fbcon modeset is not compatible with FBC\n");
 }
 
 static void psr_skips_on_fbcon(struct drm_info *drm)
-- 
2.43.0

