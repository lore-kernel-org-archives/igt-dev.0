Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC032C3600B
	for <igt-dev@archiver.kernel.org>; Thu, 27 Mar 2025 07:46:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6184310E865;
	Thu, 27 Mar 2025 07:46:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eBfVZZNA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 226F410E865
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Mar 2025 07:46:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743061609; x=1774597609;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3f3PI/3BcMowr6YnJDxTsYNp5mf6Lg4F+vi/KWFx/fM=;
 b=eBfVZZNAIrQ9OxGfRUfi6GmXQ2ixHu/xKSi1gLmG20ZNV529AWuXVFVB
 IKO4rfS//HdSphblb24jTEjfdH85SlM9CkvdS79N5anQG8tr9DjRnhCB+
 uc/5Zcr2MBSbs+cIMg4trwOaN/kTtesFwIKv4erEPU9kbFgX2sqU467+0
 lOaWAoi+RQpFBG0P2fbkB1OQ4ShIboAgqNQgA78PLLBNL19+KrF3/LdYn
 nfz///2D9wyzv3BTekbQkmMhSrbbqNJz5UvM7VSONFMn80KFhupTsjdnC
 HnWTAY8qQ2+G2+kYzbLpuoq+kLQ496tDdAQnXRmiJykWJ0vVitfk4H/Z8 Q==;
X-CSE-ConnectionGUID: Sp5fhrZASg2QYkxCw7258w==
X-CSE-MsgGUID: u9UpCxUbTGiV3ySgCH9lZw==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="31979916"
X-IronPort-AV: E=Sophos;i="6.14,279,1736841600"; d="scan'208";a="31979916"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2025 00:46:49 -0700
X-CSE-ConnectionGUID: Q4WDndILRD+q5fzQPX8oeg==
X-CSE-MsgGUID: bTB3U3V+TgGMMdvtGIZ7Gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,279,1736841600"; d="scan'208";a="162288296"
Received: from carterle-desk.ger.corp.intel.com (HELO
 vgovind2-mobl3.intel.com) ([10.245.246.8])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2025 00:46:46 -0700
From: Vinod Govindapillai <vinod.govindapillai@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: vinod.govindapillai@intel.com, jouni.hogander@intel.com,
 jeevan.b@intel.com, jani.saarinen@intel.com
Subject: [PATCH i-g-t v2 2/2] lib/i915/fbc: update fbc support based on psr
 mode
Date: Thu, 27 Mar 2025 09:46:21 +0200
Message-ID: <20250327074621.559200-4-vinod.govindapillai@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250327074621.559200-1-vinod.govindapillai@intel.com>
References: <20250327074621.559200-1-vinod.govindapillai@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

Combination of fbc and psr modes (psr1, psr2 and pr) depends on
display version. Consolidate this fbc combination check into
one place and update the relevent tests to use this consolidated
function

Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
---
 lib/i915/intel_fbc.c      | 47 ++++++++++++++++++++++++++++++---------
 lib/i915/intel_fbc.h      |  4 +++-
 tests/intel/kms_psr.c     | 10 ++++++---
 tests/intel/kms_psr2_sf.c |  9 +++++---
 4 files changed, 52 insertions(+), 18 deletions(-)

diff --git a/lib/i915/intel_fbc.c b/lib/i915/intel_fbc.c
index 3971e4920..a8ded0a59 100644
--- a/lib/i915/intel_fbc.c
+++ b/lib/i915/intel_fbc.c
@@ -6,6 +6,7 @@
 #include <fcntl.h>
 
 #include "igt.h"
+#include "igt_psr.h"
 
 #include "intel_fbc.h"
 
@@ -156,22 +157,46 @@ bool intel_fbc_plane_size_supported(int fd, uint32_t width, uint32_t height)
 }
 
 /**
- * intel_fbc_psr_combo_supported
+ * intel_fbc_supported_for_psr_mode
  *
- * @fd: fd of the device
+ * @disp_ver: Display version
+ * @mode: psr mode
  *
- * FBC PSR combination support depends on the display version.
+ * FBC and PSR1/PSR2/PR combination support depends on the display version.
  *
  * Returns:
- * true if FBC and PSR can be enabled together in a platform
+ * true if FBC and the given PSR mode can be enabled together in a platform
  */
-bool intel_fbc_psr_combo_supported(int device)
+bool intel_fbc_supported_for_psr_mode(int disp_ver, enum psr_mode mode)
 {
-	int ver = intel_display_ver(intel_get_drm_devid(device));
-
-	/* In Xe3 FBC PSR combo not supported because of FBC dirty rect */
-	if (ver >= 20 && ver < 30)
-		return true;
+	bool fbc_supported = true;
+
+	switch(mode) {
+	case PSR_MODE_1:
+		/* TODO: Update this to exclude MTL C0 onwards from this list */
+		if (disp_ver >= 12 && disp_ver <= 14)
+			fbc_supported = false;
+		break;
+	case PSR_MODE_2:
+	case PSR_MODE_2_SEL_FETCH:
+	case PSR_MODE_2_ET:
+	case PR_MODE_SEL_FETCH:
+	case PR_MODE_SEL_FETCH_ET:
+		/*
+		 * FBC is not supported if PSR2 is enabled in display version 12 to 14.
+		 * According to the xe2lpd+ requirements, display driver need to
+		 * implement a selection logic between FBC and PSR2/Panel Replay selective
+		 * update based on dirty region threshold. Until that is implemented,
+		 * keep FBC disabled if PSR2/PR selective update is on.
+		 *
+		 * TODO: Update this based on the selection logic in the driver
+		 */
+		fbc_supported = false;
+		break;
+	case PR_MODE:
+	default:
+		break;
+	}
 
-	return false;
+	return fbc_supported;
 }
diff --git a/lib/i915/intel_fbc.h b/lib/i915/intel_fbc.h
index 0abd18478..fcafe6049 100644
--- a/lib/i915/intel_fbc.h
+++ b/lib/i915/intel_fbc.h
@@ -11,11 +11,13 @@
 #define intel_fbc_enable(device) igt_set_module_param_int(device, "enable_fbc", 1)
 #define intel_fbc_disable(device) igt_set_module_param_int(device, "enable_fbc", 0)
 
+enum psr_mode;
+
 bool intel_fbc_supported_on_chipset(int device, enum pipe pipe);
 bool intel_fbc_wait_until_enabled(int device, enum pipe pipe);
 bool intel_fbc_is_enabled(int device, enum pipe pipe, int log_level);
 void intel_fbc_max_plane_size(int fd, uint32_t *width, uint32_t *height);
 bool intel_fbc_plane_size_supported(int device, uint32_t width, uint32_t height);
-bool intel_fbc_psr_combo_supported(int device);
+bool intel_fbc_supported_for_psr_mode(int disp_ver, enum psr_mode mode);
 
 #endif
diff --git a/tests/intel/kms_psr.c b/tests/intel/kms_psr.c
index a83d90194..1fdb565fa 100644
--- a/tests/intel/kms_psr.c
+++ b/tests/intel/kms_psr.c
@@ -781,6 +781,8 @@ igt_main
 	int modes[] = {PSR_MODE_1, PSR_MODE_2, PR_MODE};
 	int fbc_status[] = {FBC_DISABLED, FBC_ENABLED};
 	igt_output_t *output;
+	bool fbc_chipset_support;
+	int disp_ver;
 
 	igt_fixture {
 		data.drm_fd = drm_open_driver_master(DRIVER_INTEL | DRIVER_XE);
@@ -790,15 +792,17 @@ igt_main
 		data.bops = buf_ops_create(data.drm_fd);
 		igt_display_require(&data.display, data.drm_fd);
 		igt_require_f(output_supports_psr(&data), "Sink does not support PSR/PSR2/PR\n");
-		if (intel_fbc_supported_on_chipset(data.drm_fd, pipe) &&
-		    intel_fbc_psr_combo_supported(data.drm_fd))
-			data.fbc_flag = true;
+		disp_ver = intel_display_ver(data.devid);
+		fbc_chipset_support = intel_fbc_supported_on_chipset(data.drm_fd, pipe);
 	}
 
 	for (y = 0; y < ARRAY_SIZE(fbc_status); y++) {
 		data.op_fbc_mode = fbc_status[y];
 		for (z = 0; z < ARRAY_SIZE(modes); z++) {
 			data.op_psr_mode = modes[z];
+			data.fbc_flag = fbc_chipset_support &&
+					intel_fbc_supported_for_psr_mode(disp_ver,
+									 data.op_psr_mode);
 
 			igt_describe("Basic check for psr if it is detecting changes made "
 				     "in planes");
diff --git a/tests/intel/kms_psr2_sf.c b/tests/intel/kms_psr2_sf.c
index 4c9847692..68842b020 100644
--- a/tests/intel/kms_psr2_sf.c
+++ b/tests/intel/kms_psr2_sf.c
@@ -1190,6 +1190,8 @@ igt_main
 		"pr-"
 	};
 	int psr_status[] = {PSR_MODE_2, PR_MODE_SEL_FETCH};
+	bool fbc_chipset_support;
+	int disp_ver;
 
 	igt_fixture {
 		drmModeResPtr res;
@@ -1200,9 +1202,8 @@ igt_main
 
 		display_init(&data);
 
-		if (intel_fbc_supported_on_chipset(data.drm_fd, data.pipe) &&
-		    intel_fbc_psr_combo_supported(data.drm_fd))
-			data.fbc_flag = true;
+		disp_ver = intel_display_ver(intel_get_drm_devid(data.drm_fd));
+		fbc_chipset_support = intel_fbc_supported_on_chipset(data.drm_fd, data.pipe);
 
 		data.damage_area_count = MAX_DAMAGE_AREAS;
 		data.primary_format = DRM_FORMAT_XRGB8888;
@@ -1240,6 +1241,8 @@ igt_main
 
 			data.op_fbc_mode = fbc_status[y];
 			data.psr_mode = psr_status[z];
+			data.fbc_flag = fbc_chipset_support &&
+					intel_fbc_supported_for_psr_mode(disp_ver, data.psr_mode);
 
 			/* Verify primary plane selective fetch */
 			igt_describe("Test that selective fetch works on primary plane");
-- 
2.43.0

