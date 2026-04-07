Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33FFDEDB7DF
	for <igt-dev@archiver.kernel.org>; Tue,  7 Apr 2026 09:59:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6A8810E2EF;
	Tue,  7 Apr 2026 09:59:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TSrPvhoK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 826B910E2EF
 for <igt-dev@lists.freedesktop.org>; Tue,  7 Apr 2026 09:59:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775555964; x=1807091964;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=thqGR7wIDVxN247UdF1VuV8WeMSjyoAc80x3pWpF1G0=;
 b=TSrPvhoKCWs2GmVSq5qxVMPalE3uz3Bzo4pVtvwaB986o1EKktVxcXAh
 2LFkzPCNCe5gqI/UkuehH6Td1WYwh72vkL7o/ydhaFw08HGARlvH9YIL0
 IbOMhszftOAZ0I99E+cB0rhQ3xp7TPLiIFDOd27l/mUb/PGwmaOf1z+/G
 N23bVoMJFgA6kaH1b2X+QRCqs/HLoP3UiLskN8IXtGeueDdXLJbGGYC4V
 BNfIJ94m0O2HxKaWJ2SPDlERtEXwVXVbhR4U06x+EyEIuk8NWLeEwlz3a
 y6Oxw6mPMIsncLPdJFLjeqePxlYX8udg5+9i0XnwlA3TLs39C88NekLMc g==;
X-CSE-ConnectionGUID: ELQjgYMXRgmcL9nZBAwK0A==
X-CSE-MsgGUID: sbHGCjZJS4+9/9Y08Ywxgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="87589073"
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; d="scan'208";a="87589073"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2026 02:59:24 -0700
X-CSE-ConnectionGUID: O6+i7jmxTZiNtdb8dYx4MA==
X-CSE-MsgGUID: akJjQ7IOSOifmUBs2kEZjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; d="scan'208";a="228400078"
Received: from abityuts-desk.ger.corp.intel.com (HELO
 vgovind2-mobl4.intel.com) ([10.245.244.134])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2026 02:59:21 -0700
From: Vinod Govindapillai <vinod.govindapillai@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: vinod.govindapillai@intel.com, santhosh.reddy.guddati@intel.com,
 swati2.sharma@intel.com, jani.nikula@intel.com, ville.syrjala@intel.com
Subject: [PATCH i-g-t v2 1/8] tests/intel/kms_frontbuffer_tracking: update the
 outdated fbc status checks
Date: Tue,  7 Apr 2026 12:58:36 +0300
Message-ID: <20260407095843.43679-2-vinod.govindapillai@intel.com>
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

Replace the fbc status check for "mode too large for compression" wchich
is no longer being set by the driver with "plane size too big" and
"surface size too big" fbc status checks.

Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
---
 tests/intel/kms_frontbuffer_tracking.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/tests/intel/kms_frontbuffer_tracking.c b/tests/intel/kms_frontbuffer_tracking.c
index c16f63199..e764c9ce1 100644
--- a/tests/intel/kms_frontbuffer_tracking.c
+++ b/tests/intel/kms_frontbuffer_tracking.c
@@ -1664,15 +1664,23 @@ static bool fbc_stride_not_supported(void)
 	char buf[128];
 
 	debugfs_read_crtc("i915_fbc_status", buf);
-	return strstr(buf, "FBC disabled: framebuffer stride not supported\n");
+	return strstr(buf, "FBC disabled: stride not supported\n");
 }
 
-static bool fbc_mode_too_large(void)
+static bool fbc_plane_size_too_big(void)
 {
 	char buf[128];
 
 	debugfs_read_crtc("i915_fbc_status", buf);
-	return strstr(buf, "FBC disabled: mode too large for compression\n");
+	return strstr(buf, "FBC disabled: plane size too big\n");
+}
+
+static bool fbc_surface_size_too_big(void)
+{
+	char buf[128];
+
+	debugfs_read_crtc("i915_fbc_status", buf);
+	return strstr(buf, "FBC disabled: surface size too big\n");
 }
 
 static bool fbc_psr_not_possible(void)
@@ -2356,7 +2364,8 @@ static void do_status_assertions(int flags)
 	if (flags & ASSERT_FBC_ENABLED) {
 		igt_require(!fbc_not_enough_stolen());
 		igt_require(!fbc_stride_not_supported());
-		igt_require(!fbc_mode_too_large());
+		igt_require(!fbc_plane_size_too_big());
+		igt_require(!fbc_surface_size_too_big());
 		igt_require(!fbc_psr_not_possible());
 		if (!intel_fbc_wait_until_enabled(prim_mode_params.crtc)) {
 			igt_assert_f(intel_fbc_is_enabled(prim_mode_params.crtc, IGT_LOG_WARN),
-- 
2.43.0

