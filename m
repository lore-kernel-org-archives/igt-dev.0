Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91497F8A14D
	for <igt-dev@archiver.kernel.org>; Thu, 16 Apr 2026 09:27:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30A7C10E84B;
	Thu, 16 Apr 2026 09:27:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gtWD7yg7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6773C10E84B
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Apr 2026 09:26:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776331609; x=1807867609;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jXrBgkIQd1sBJB4VI2yWjhuoK2nLPMwZ6DuXC2nJlGg=;
 b=gtWD7yg74DCzXP5Ki6t6esEPYq3toQd70G6F+epqYAR2XY70IqjESX8t
 7XueST9mpYrSxsibjRViGYIk5XqTWZkVx0kaN1umsWPRaBiT9H0lVZo5G
 cKdAd6jAGbjqP3PN8jMtDHghkcQbn7FprcY91DbZ/Gxs/+W/1msDMBt+J
 aJlWwJhv7Kcal4/NHdgU8tgNM+f4MJ2VaPsowi+PLKTrFE8EmQ/+WDVvO
 QSV2gYSVtFyEMXHajX6UHjjDAvqEYNO90R4n6KU4EfWkWWPcJU1xzvny5
 msW0o2sqhexIUDpquRIm88CER/z6FN20GJh7kMrWMTJubwLuGSCTwMvhI g==;
X-CSE-ConnectionGUID: 53p+qvmGQjadLM8FAC3afg==
X-CSE-MsgGUID: N1nQrRqVSyCjEeCxI4k46w==
X-IronPort-AV: E=McAfee;i="6800,10657,11760"; a="88775936"
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="88775936"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2026 02:26:49 -0700
X-CSE-ConnectionGUID: +gbAf/fgTDaqLxOPw/kqHg==
X-CSE-MsgGUID: YQTK7+QlRCuAFoxStiL3iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="235063076"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO
 vgovind2-mobl4.intel.com) ([10.245.244.194])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2026 02:26:46 -0700
From: Vinod Govindapillai <vinod.govindapillai@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: vinod.govindapillai@intel.com, santhosh.reddy.guddati@intel.com,
 swati2.sharma@intel.com, jani.nikula@intel.com
Subject: [PATCH i-g-t v3 11/11] tests/intel/kms_fbcon_fbt: use common routine
 to skip tests on fbc status
Date: Thu, 16 Apr 2026 12:25:59 +0300
Message-ID: <20260416092559.88735-12-vinod.govindapillai@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260416092559.88735-1-vinod.govindapillai@intel.com>
References: <20260416092559.88735-1-vinod.govindapillai@intel.com>
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

Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
---
 lib/i915/intel_fbc.c        |  7 +++++++
 tests/intel/kms_fbcon_fbt.c | 26 ++------------------------
 2 files changed, 9 insertions(+), 24 deletions(-)

diff --git a/lib/i915/intel_fbc.c b/lib/i915/intel_fbc.c
index fde9ef03b..30584925f 100644
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
 		"FBC disabled: PSR1 enabled (Wa_14016291713)"
+		"FBC disabled: plane start Y offset misaligned",
+		"FBC disabled: plane end Y offset misaligned",
+		"FBC disabled: pixel rate too high"
 	};
 	bool found_reason = false;
 	char fbc_status[FBC_STATUS_BUF_LEN];
diff --git a/tests/intel/kms_fbcon_fbt.c b/tests/intel/kms_fbcon_fbt.c
index f738e243f..470027a84 100644
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

