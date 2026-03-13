Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E149A105F782
	for <igt-dev@archiver.kernel.org>; Fri, 13 Mar 2026 09:32:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9809010EB6A;
	Fri, 13 Mar 2026 09:32:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EeQF7h0N";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BD5410EB6A
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Mar 2026 09:32:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773394368; x=1804930368;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6BxyxRXoZOQYj/wRZiIZNRR9gS0rmv/7vu98cvcswRk=;
 b=EeQF7h0NW/np4zdOs2L7YxO0FtG/ktPhvyo3VVOQscmqsmlkV9rZgJad
 /VIItP7a/2IbJMayVFrlwyiXtbBPwQAec1fyoPm/HLCepZYGOneOHjCNW
 gJ2yjPfnZZt1Fv96DAK+p9CaIEkcmvZ7OH/z28jWFXjrgONwUATQcWBP1
 S5Zn1SATNVum2kNtMKEnuHHsEqd02GnKCdUCrz6W8lh4+aN50ToOUWPsh
 vdmX5WfT4Eg9FhdBOpl3b5RE8mBUY35bQHDVef/b6IFvu2OjIZuw7R8Mh
 2+E6/5AcpzwdPLIwgGV4um3tjuDmW5rUY5u9qEh6GK7tse7AJEUBF/rAj w==;
X-CSE-ConnectionGUID: n72qwEzoQii6SeSQ8y14FA==
X-CSE-MsgGUID: BocrkpRRTEWqJsIJGuv+cg==
X-IronPort-AV: E=McAfee;i="6800,10657,11727"; a="78390392"
X-IronPort-AV: E=Sophos;i="6.23,118,1770624000"; d="scan'208";a="78390392"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2026 02:32:47 -0700
X-CSE-ConnectionGUID: BwVP8P8UQYOfeVBpaMpTyQ==
X-CSE-MsgGUID: +s+JNIdPSlO6pOdP5f5hYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,118,1770624000"; d="scan'208";a="221322727"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.158])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2026 02:32:46 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com,
	jani.nikula@intel.com
Subject: [PATCH i-g-t 8/8] lib/i915/fbc: convert
 intel_fbc_supported_for_psr_mode() to igt_display_t*
Date: Fri, 13 Mar 2026 11:32:00 +0200
Message-ID: <7627bc6fba6eab09cafe5d5b0cf3050d32cc67aa.1773394225.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1773394225.git.jani.nikula@intel.com>
References: <cover.1773394225.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

Convert intel_fbc_supported_for_psr_mode() to igt_display_t* for a more
generally useful and convenient interface. This is less efficient, as
the devid and display version aren't cached. This is neglible here, but
if it becomes a problem, arguably they should be cached at
igt_display_require() for other uses as well.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 lib/i915/intel_fbc.c      | 9 +++++++--
 lib/i915/intel_fbc.h      | 2 +-
 tests/intel/kms_psr.c     | 4 +---
 tests/intel/kms_psr2_sf.c | 4 +---
 4 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/lib/i915/intel_fbc.c b/lib/i915/intel_fbc.c
index a01023babb12..9c1767846c25 100644
--- a/lib/i915/intel_fbc.c
+++ b/lib/i915/intel_fbc.c
@@ -167,7 +167,7 @@ bool intel_fbc_plane_size_supported(igt_display_t *display, uint32_t width, uint
 /**
  * intel_fbc_supported_for_psr_mode
  *
- * @disp_ver: Display version
+ * @display: display pointer
  * @mode: psr mode
  *
  * FBC and PSR1/PSR2/PR combination support depends on the display version.
@@ -175,10 +175,15 @@ bool intel_fbc_plane_size_supported(igt_display_t *display, uint32_t width, uint
  * Returns:
  * true if FBC and the given PSR mode can be enabled together in a platform
  */
-bool intel_fbc_supported_for_psr_mode(int disp_ver, enum psr_mode mode)
+bool intel_fbc_supported_for_psr_mode(igt_display_t *display, enum psr_mode mode)
 {
+	uint32_t devid;
+	int disp_ver;
 	bool fbc_supported = true;
 
+	devid = intel_get_drm_devid(display->drm_fd);
+	disp_ver = intel_display_ver(devid);
+
 	switch(mode) {
 	case PSR_MODE_1:
 		/* TODO: Update this to exclude MTL C0 onwards from this list */
diff --git a/lib/i915/intel_fbc.h b/lib/i915/intel_fbc.h
index d45ff1d77dd1..8e2662824430 100644
--- a/lib/i915/intel_fbc.h
+++ b/lib/i915/intel_fbc.h
@@ -16,6 +16,6 @@ bool intel_fbc_supported(igt_crtc_t *crtc);
 bool intel_fbc_wait_until_enabled(igt_crtc_t *crtc);
 bool intel_fbc_is_enabled(igt_crtc_t *crtc, int log_level);
 bool intel_fbc_plane_size_supported(igt_display_t *display, uint32_t width, uint32_t height);
-bool intel_fbc_supported_for_psr_mode(int disp_ver, enum psr_mode mode);
+bool intel_fbc_supported_for_psr_mode(igt_display_t *display, enum psr_mode mode);
 
 #endif
diff --git a/tests/intel/kms_psr.c b/tests/intel/kms_psr.c
index 862b9f2ffe87..7b02dd207237 100644
--- a/tests/intel/kms_psr.c
+++ b/tests/intel/kms_psr.c
@@ -786,7 +786,6 @@ int igt_main()
 	int fbc_status[] = {FBC_DISABLED, FBC_ENABLED};
 	igt_output_t *output;
 	bool fbc_chipset_support = false;
-	int disp_ver;
 
 	igt_fixture() {
 		igt_crtc_t *crtc;
@@ -798,7 +797,6 @@ int igt_main()
 		data.bops = buf_ops_create(data.drm_fd);
 		igt_display_require(&data.display, data.drm_fd);
 		igt_require_f(output_supports_psr(&data), "Sink does not support PSR/PSR2/PR\n");
-		disp_ver = intel_display_ver(data.devid);
 
 		for_each_crtc(&data.display, crtc) {
 			if (intel_fbc_supported(crtc))
@@ -811,7 +809,7 @@ int igt_main()
 		for (z = 0; z < ARRAY_SIZE(modes); z++) {
 			data.op_psr_mode = modes[z];
 			data.fbc_flag = fbc_chipset_support &&
-					intel_fbc_supported_for_psr_mode(disp_ver,
+					intel_fbc_supported_for_psr_mode(&data.display,
 									 data.op_psr_mode);
 
 			igt_describe("Basic check for psr if it is detecting changes made "
diff --git a/tests/intel/kms_psr2_sf.c b/tests/intel/kms_psr2_sf.c
index 7a8b7826b3a7..1cc57ad35a1c 100644
--- a/tests/intel/kms_psr2_sf.c
+++ b/tests/intel/kms_psr2_sf.c
@@ -1169,7 +1169,6 @@ int igt_main()
 	};
 	int psr_status[] = {PSR_MODE_2, PR_MODE_SEL_FETCH};
 	bool fbc_chipset_support = false;
-	int disp_ver;
 
 	igt_fixture() {
 		drmModeResPtr res;
@@ -1181,7 +1180,6 @@ int igt_main()
 		display_init(&data);
 
 		data.devid = intel_get_drm_devid(data.drm_fd);
-		disp_ver = intel_display_ver(data.devid);
 
 		data.damage_area_count = MAX_DAMAGE_AREAS;
 		data.primary_format = DRM_FORMAT_XRGB8888;
@@ -1233,7 +1231,7 @@ int igt_main()
 			data.op_fbc_mode = fbc_status[y];
 			data.psr_mode = psr_status[z];
 			data.fbc_flag = fbc_chipset_support &&
-					intel_fbc_supported_for_psr_mode(disp_ver, data.psr_mode);
+					intel_fbc_supported_for_psr_mode(&data.display, data.psr_mode);
 
 			/* Verify primary plane selective fetch */
 			igt_describe("Test that selective fetch works on primary plane");
-- 
2.47.3

