Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96FE2EDB7DF
	for <igt-dev@archiver.kernel.org>; Tue,  7 Apr 2026 10:00:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 389C910E2EF;
	Tue,  7 Apr 2026 10:00:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j6LrfDUh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8436589C5E
 for <igt-dev@lists.freedesktop.org>; Tue,  7 Apr 2026 09:59:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775555967; x=1807091967;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8dIAn2ciIDiPm2uqaRtDMApe0t0bLlu+bCuhrt4IhLA=;
 b=j6LrfDUhZbybVBYC8e8cBnIXqOfTHKBPrUC01Cqr4GSTn6qshdE5jGGq
 CBAUDDf0dnOAegQgMKmAJUi3DWS9z6xWGay+ia8sOIjGnSqY46KNHcMzP
 Qf/Ujblu+wxd+7Cf/45sif0uRR2VCfO/thhqiIWmZ74GFVXnOGOL+u1vW
 f0wqOu64wRM5p+YDWK+Mb86COiSf8Pcumur7vJ5oQKutQhyz1bsYPv1NP
 gkABsyJkyj4JIEK8FZJ3tQojjO2b0rySCBq2WEYKYVxoEpYWP2f4PZ0xH
 1VSFExtFcQAVByiHZneSZKnXLCXIrkPW8pjU/s8VKxqxBiq8ZJRYNZr54 A==;
X-CSE-ConnectionGUID: pQVNqNtVSRGneWUCBSHEGw==
X-CSE-MsgGUID: t/pQNw/4SlKinf8cRHs2xA==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="87589077"
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; d="scan'208";a="87589077"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2026 02:59:27 -0700
X-CSE-ConnectionGUID: CvN0E0MjRQG2vuXCQgvaWQ==
X-CSE-MsgGUID: oAvrrxbdT7OHBxIbxpu4Nw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; d="scan'208";a="228400086"
Received: from abityuts-desk.ger.corp.intel.com (HELO
 vgovind2-mobl4.intel.com) ([10.245.244.134])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2026 02:59:25 -0700
From: Vinod Govindapillai <vinod.govindapillai@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: vinod.govindapillai@intel.com, santhosh.reddy.guddati@intel.com,
 swati2.sharma@intel.com, jani.nikula@intel.com, ville.syrjala@intel.com
Subject: [PATCH i-g-t v2 2/8] tests/intel/kms_frontbuffer_tracking: avoid
 multiple fbc status queries
Date: Tue,  7 Apr 2026 12:58:37 +0300
Message-ID: <20260407095843.43679-3-vinod.govindapillai@intel.com>
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

While looking for "no fbc reasons" and decide whether to skip any specific
fbc related test, read the debugfs fbc status only once and look for any
skip reasons.

Suggested-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
---
 lib/i915/intel_fbc.h                   |  8 +++++
 tests/intel/kms_frontbuffer_tracking.c | 50 +++++++-------------------
 2 files changed, 20 insertions(+), 38 deletions(-)

diff --git a/lib/i915/intel_fbc.h b/lib/i915/intel_fbc.h
index 8e2662824..b4596cca5 100644
--- a/lib/i915/intel_fbc.h
+++ b/lib/i915/intel_fbc.h
@@ -10,6 +10,14 @@
 
 enum psr_mode;
 
+const char *const no_fbc_reasons[] = {
+	"FBC disabled: not enough stolen memory",
+	"FBC disabled: stride not supported",
+	"FBC disabled: plane size too big",
+	"FBC disabled: surface size too big",
+	"FBC disabled: PSR1 enabled (Wa_14016291713)"
+};
+
 void intel_fbc_enable(igt_display_t *display);
 void intel_fbc_disable(igt_display_t *display);
 bool intel_fbc_supported(igt_crtc_t *crtc);
diff --git a/tests/intel/kms_frontbuffer_tracking.c b/tests/intel/kms_frontbuffer_tracking.c
index e764c9ce1..427cf3262 100644
--- a/tests/intel/kms_frontbuffer_tracking.c
+++ b/tests/intel/kms_frontbuffer_tracking.c
@@ -1651,44 +1651,21 @@ static bool fbc_wait_for_compression(void)
 	return igt_wait(fbc_is_compressing(), 2000, 1);
 }
 
-static bool fbc_not_enough_stolen(void)
+static bool fbc_found_skip_reason(void)
 {
-	char buf[128];
-
-	debugfs_read_crtc("i915_fbc_status", buf);
-	return strstr(buf, "FBC disabled: not enough stolen memory\n");
-}
-
-static bool fbc_stride_not_supported(void)
-{
-	char buf[128];
-
-	debugfs_read_crtc("i915_fbc_status", buf);
-	return strstr(buf, "FBC disabled: stride not supported\n");
-}
-
-static bool fbc_plane_size_too_big(void)
-{
-	char buf[128];
+	bool found_reason = false;
+	char fbc_status[128];
+	int i;
 
-	debugfs_read_crtc("i915_fbc_status", buf);
-	return strstr(buf, "FBC disabled: plane size too big\n");
-}
+	debugfs_read_crtc("i915_fbc_status", fbc_status);
 
-static bool fbc_surface_size_too_big(void)
-{
-	char buf[128];
-
-	debugfs_read_crtc("i915_fbc_status", buf);
-	return strstr(buf, "FBC disabled: surface size too big\n");
-}
+	if (strstr(fbc_status, "FBC Enabled\n"))
+		return false;
 
-static bool fbc_psr_not_possible(void)
-{
-	char buf[128];
+	for (i = 0; !found_reason && i < ARRAY_SIZE(no_fbc_reasons); i++)
+		found_reason = strstr(fbc_status, no_fbc_reasons[i]);
 
-	debugfs_read_crtc("i915_fbc_status", buf);
-	return strstr(buf, "FBC disabled: PSR1 enabled (Wa_14016291713)");
+	return found_reason;
 }
 
 static bool fbc_enable_per_plane(int plane_index, igt_crtc_t *crtc)
@@ -2362,11 +2339,8 @@ static void do_status_assertions(int flags)
 	}
 
 	if (flags & ASSERT_FBC_ENABLED) {
-		igt_require(!fbc_not_enough_stolen());
-		igt_require(!fbc_stride_not_supported());
-		igt_require(!fbc_plane_size_too_big());
-		igt_require(!fbc_surface_size_too_big());
-		igt_require(!fbc_psr_not_possible());
+		igt_require(!fbc_found_skip_reason());
+
 		if (!intel_fbc_wait_until_enabled(prim_mode_params.crtc)) {
 			igt_assert_f(intel_fbc_is_enabled(prim_mode_params.crtc, IGT_LOG_WARN),
 				     "FBC disabled\n");
-- 
2.43.0

