Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14A54F8A151
	for <igt-dev@archiver.kernel.org>; Thu, 16 Apr 2026 09:27:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7EB210E84B;
	Thu, 16 Apr 2026 09:27:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fVGvkiiv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2F8A10E84B
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Apr 2026 09:26:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776331587; x=1807867587;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NtAZtmDeim+ByhSbbyYQmeDUV8t9AN5+GMPtuQlFWSQ=;
 b=fVGvkiivbCmw5ItXwChG5mtjsB7K8lwJ1NKf3gEveuzw+bn5b8ZNztzz
 TWlR9yP8OerNXWJsTTY3oIsD59Vq1Xdc49tfC6gVIO0P5GAvgIWMmA6kj
 du8I/EYbTTfRj3qNbPcoY/dYLZmVOfrtYln/+L2pGdAOVijHJrS8aQbma
 +GY1+8mvHosPV9fy8VZtY6LVIkC/PpWrUvrQGDOe/xdhkQE9CFudDOJpx
 klEaM/8+3uoCo2Al4B5w3c0pJxi/hC8aY53MIZQFKJMebInCvCQhxZtyd
 kmApsh4ooeykDQzEx6JiteAs4S2Yiz7qxXAd+h3DmjxlQpoXrHNhjyD+0 A==;
X-CSE-ConnectionGUID: pyZf5kT2RFmzNzvUtJZsQw==
X-CSE-MsgGUID: R2gre8zxS9Ob7lX/anlu9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11760"; a="88775904"
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="88775904"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2026 02:26:27 -0700
X-CSE-ConnectionGUID: 5cNnDpCiScKF4FkStBA0oQ==
X-CSE-MsgGUID: 2PQhbhV2T2aydd1pqj6Buw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="235062993"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO
 vgovind2-mobl4.intel.com) ([10.245.244.194])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2026 02:26:25 -0700
From: Vinod Govindapillai <vinod.govindapillai@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: vinod.govindapillai@intel.com, santhosh.reddy.guddati@intel.com,
 swati2.sharma@intel.com, jani.nikula@intel.com
Subject: [PATCH i-g-t v3 04/11] tests/intel/kms_frontbuffer_tracking:
 consolidate fbc tests skip checks
Date: Thu, 16 Apr 2026 12:25:52 +0300
Message-ID: <20260416092559.88735-5-vinod.govindapillai@intel.com>
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

While looking for "no fbc reasons" and decide whether to skip any specific
fbc related test, read the debugfs fbc status only once and look for any
skip reasons. Move this as a library function so that other FBC specific
tests could use the same library and all the skips reasons can be
maintained in a single place.

Suggested-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
---
 lib/i915/intel_fbc.c                   | 37 +++++++++++++++
 lib/i915/intel_fbc.h                   |  1 +
 tests/intel/kms_frontbuffer_tracking.c | 63 ++++----------------------
 3 files changed, 47 insertions(+), 54 deletions(-)

diff --git a/lib/i915/intel_fbc.c b/lib/i915/intel_fbc.c
index 47f0e2fc1..e2fbe3680 100644
--- a/lib/i915/intel_fbc.c
+++ b/lib/i915/intel_fbc.c
@@ -63,6 +63,43 @@ void intel_fbc_get_fbc_status(igt_crtc_t *crtc, char *fbc_status, int buf_size)
 					    buf_size);
 }
 
+/**
+ * intel_fbc_found_skip_reason
+ * @device: fd of the device
+ * @crtc_index: crtc index
+ *
+ * Read the debugfs entry for current fbc status of a crtc and check for any reasons
+ * why FBC cannot be enabled. This helps in skipping FBC test cases where FBC cannot
+ * be enabled. These no fbc reasons are defined by the driver.
+ *
+ * Returns:
+ * True if there is a reason that FBC cannot be enabled otherwise false.
+ */
+bool intel_fbc_found_skip_reason(int device, int crtc_index)
+{
+	const char *const no_fbc_reasons[] = {
+		"FBC disabled: not enough stolen memory",
+		"FBC disabled: stride not supported",
+		"FBC disabled: plane size too big",
+		"FBC disabled: surface size too big",
+		"FBC disabled: PSR1 enabled (Wa_14016291713)"
+	};
+	bool found_reason = false;
+	char fbc_status[FBC_STATUS_BUF_LEN];
+	int i;
+
+	intel_fbc_get_fbc_status_crtc_index(device, crtc_index, fbc_status,
+					    sizeof(fbc_status));
+
+	if (strstr(fbc_status, "FBC Enabled\n"))
+		return false;
+
+	for (i = 0; !found_reason && i < ARRAY_SIZE(no_fbc_reasons); i++)
+		found_reason = strstr(fbc_status, no_fbc_reasons[i]);
+
+	return found_reason;
+}
+
 /**
  * intel_fbc_supported:
  * @crtc: CRTC
diff --git a/lib/i915/intel_fbc.h b/lib/i915/intel_fbc.h
index f8a506f23..e4b9e5529 100644
--- a/lib/i915/intel_fbc.h
+++ b/lib/i915/intel_fbc.h
@@ -20,5 +20,6 @@ bool intel_fbc_supported_for_psr_mode(igt_display_t *display, enum psr_mode mode
 void intel_fbc_get_fbc_status_crtc_index(int device, int crtc_index,
 					 char *fbc_status, int buf_size);
 void intel_fbc_get_fbc_status(igt_crtc_t *crtc, char *fbc_status, int buf_size);
+bool intel_fbc_found_skip_reason(int device, int crtc_index);
 
 #endif
diff --git a/tests/intel/kms_frontbuffer_tracking.c b/tests/intel/kms_frontbuffer_tracking.c
index 5bdfbd105..4fa185e76 100644
--- a/tests/intel/kms_frontbuffer_tracking.c
+++ b/tests/intel/kms_frontbuffer_tracking.c
@@ -1652,51 +1652,6 @@ static bool fbc_wait_for_compression(void)
 	return igt_wait(fbc_is_compressing(), 2000, 1);
 }
 
-static bool fbc_not_enough_stolen(void)
-{
-	char fbc_status[128];
-
-	intel_fbc_get_fbc_status(prim_mode_params.crtc, fbc_status, sizeof(fbc_status));
-
-	return strstr(fbc_status, "FBC disabled: not enough stolen memory\n");
-}
-
-static bool fbc_stride_not_supported(void)
-{
-	char fbc_status[128];
-
-	intel_fbc_get_fbc_status(prim_mode_params.crtc, fbc_status, sizeof(fbc_status));
-
-	return strstr(fbc_status, "FBC disabled: stride not supported\n");
-}
-
-static bool fbc_plane_size_too_big(void)
-{
-	char fbc_status[128];
-
-	intel_fbc_get_fbc_status(prim_mode_params.crtc, fbc_status, sizeof(fbc_status));
-
-	return strstr(fbc_status, "FBC disabled: plane size too big\n");
-}
-
-static bool fbc_surface_size_too_big(void)
-{
-	char fbc_status[128];
-
-	intel_fbc_get_fbc_status(prim_mode_params.crtc, fbc_status, sizeof(fbc_status));
-
-	return strstr(fbc_status, "FBC disabled: surface size too big\n");
-}
-
-static bool fbc_psr_not_possible(void)
-{
-	char fbc_status[128];
-
-	intel_fbc_get_fbc_status(prim_mode_params.crtc, fbc_status, sizeof(fbc_status));
-
-	return strstr(fbc_status, "FBC disabled: PSR1 enabled (Wa_14016291713)");
-}
-
 static bool fbc_enable_per_plane(int plane_index, igt_crtc_t *crtc)
 {
 	char fbc_status[PATH_MAX];
@@ -2345,6 +2300,8 @@ static void do_crc_assertions(int flags)
 
 static void do_status_assertions(int flags)
 {
+	igt_crtc_t *crtc = prim_mode_params.crtc;
+
 	if (!opt.check_status) {
 		/* Make sure we settle before continuing. */
 		sleep(1);
@@ -2362,27 +2319,25 @@ static void do_status_assertions(int flags)
 			igt_assert_f(false, "DRRS LOW\n");
 		}
 	} else if (flags & ASSERT_DRRS_INACTIVE) {
-		if (!intel_is_drrs_inactive(prim_mode_params.crtc)) {
+		if (!intel_is_drrs_inactive(crtc)) {
 			drrs_print_status();
 			igt_assert_f(false, "DRRS INACTIVE\n");
 		}
 	}
 
 	if (flags & ASSERT_FBC_ENABLED) {
-		igt_require(!fbc_not_enough_stolen());
-		igt_require(!fbc_stride_not_supported());
-		igt_require(!fbc_plane_size_too_big());
-		igt_require(!fbc_surface_size_too_big());
-		igt_require(!fbc_psr_not_possible());
-		if (!intel_fbc_wait_until_enabled(prim_mode_params.crtc)) {
-			igt_assert_f(intel_fbc_is_enabled(prim_mode_params.crtc, IGT_LOG_WARN),
+		igt_require(!intel_fbc_found_skip_reason(crtc->display->drm_fd,
+							 crtc->crtc_index));
+
+		if (!intel_fbc_wait_until_enabled(crtc)) {
+			igt_assert_f(intel_fbc_is_enabled(crtc, IGT_LOG_WARN),
 				     "FBC disabled\n");
 		}
 
 		if (opt.fbc_check_compression)
 			igt_assert(fbc_wait_for_compression());
 	} else if (flags & ASSERT_FBC_DISABLED) {
-		igt_assert(!intel_fbc_wait_until_enabled(prim_mode_params.crtc));
+		igt_assert(!intel_fbc_wait_until_enabled(crtc));
 	}
 
 	if (flags & ASSERT_PSR_ENABLED) {
-- 
2.43.0

