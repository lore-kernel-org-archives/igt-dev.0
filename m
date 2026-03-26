Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED8EA1099B5F
	for <igt-dev@archiver.kernel.org>; Thu, 26 Mar 2026 07:26:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1C6F10E8F2;
	Thu, 26 Mar 2026 07:26:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F6uWrDDh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC92810E2EA
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Mar 2026 07:26:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774509994; x=1806045994;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=thqGR7wIDVxN247UdF1VuV8WeMSjyoAc80x3pWpF1G0=;
 b=F6uWrDDhkG+YRrA6Fh5lV4n1dExtbTtBP0HtD8Fx5vejRbBVwMW3ffcl
 QCGm8ZTj2p0k4ZVQ8oVO568mAUZvsDU4yxQCsQggL1qMOI6T2U2GYstCj
 equbYIhan2Z2k2M5gd1kET62sCqt2qbALCzDbgoipsn4SGSMM1G/Cqpcv
 0XrxSHERA4K6Eye3klxYdyuG6Fn32SpkSBi5jCNt/L1rv4gdmUmvf4/J/
 OrJU5xHlSV8Yat7zGLpSpb1323hcZOk07gYg49IAZhhlQWDCfIv9Rz2Bp
 89UfIAJQfYt15QxrKvTlTYt/cFnLDNldfh1lJEqIURl9obMCM7KV7q2uf w==;
X-CSE-ConnectionGUID: FntM4j2BSU2i3nbnDyUUCA==
X-CSE-MsgGUID: nnOa3MsESs219ANAeHPJpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="85866197"
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; d="scan'208";a="85866197"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2026 00:26:34 -0700
X-CSE-ConnectionGUID: c2WFXk5FR/uMEroZUFfahA==
X-CSE-MsgGUID: D4aVQxc5TQmwtNAu2IlSZA==
X-ExtLoop1: 1
Received: from ncintean-mobl1.ger.corp.intel.com (HELO
 vgovind2-mobl4.intel.com) ([10.245.245.223])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2026 00:26:32 -0700
From: Vinod Govindapillai <vinod.govindapillai@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: vinod.govindapillai@intel.com, santhosh.reddy.guddati@intel.com,
 swati2.sharma@intel.com
Subject: [PATCH i-g-t 1/4] tests/intel/kms_frontbuffer_tracking: update the
 outdated fbc status checks
Date: Thu, 26 Mar 2026 09:25:52 +0200
Message-ID: <20260326072555.160329-2-vinod.govindapillai@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260326072555.160329-1-vinod.govindapillai@intel.com>
References: <20260326072555.160329-1-vinod.govindapillai@intel.com>
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

