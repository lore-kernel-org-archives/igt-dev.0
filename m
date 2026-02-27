Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5963BFD530E
	for <igt-dev@archiver.kernel.org>; Fri, 27 Feb 2026 08:07:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E647010EA4E;
	Fri, 27 Feb 2026 08:07:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OZioPzZk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E61F10EA4E
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Feb 2026 08:07:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772179651; x=1803715651;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=9M1BLmiV6latvnMN02W4lO8/w0NvrdlsZCv6W4o4H0I=;
 b=OZioPzZkqgEGwzEq1QKzjj4g1gxWk2p7TlP4bN5RnDhKEYEg5/HUiVhH
 JtEiaCmtPX6IGHc8XC+Tt1t0GghWK4ql3sfGa1Cco1A6rlh11dGogdUlJ
 7EauA/R22CKRVxN36U4YPeoGUeC5Vr69duOw3oZVWH8zM1zjjE4YyTEH2
 yCkluL/fMz12JooxLvzWFGyv0sb15LfyuuCmxDaB1CjZV9jIm9b55dCfo
 QS9159DkaHnhodwkEuzAQEF0zXybYR4Ol0PWslXHkO8QwgD1V1DMgkXBH
 ZX8pTlORSsHHw0yRM9dXrrmJAlPO2Rro9XwcAEAkb6WrP+sKUTFexNHmO g==;
X-CSE-ConnectionGUID: qFLaHm6jQL6LWsNHm2ZxOw==
X-CSE-MsgGUID: t+0/rOL/TjeM0G8uTQbw4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="75859411"
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; d="scan'208";a="75859411"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 00:07:31 -0800
X-CSE-ConnectionGUID: W67zrMyIRo2y+osho/ZUpg==
X-CSE-MsgGUID: 7Yyx2X7yTxmnESSNHJqXzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; d="scan'208";a="216731154"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost)
 ([10.245.245.74])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 00:07:30 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 08/17] lib/kms: Prefer "crtc" over "pipe" in function
 names
Date: Fri, 27 Feb 2026 10:06:44 +0200
Message-ID: <20260227080653.30389-9-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260227080653.30389-1-ville.syrjala@linux.intel.com>
References: <20260227080653.30389-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Rename a bunch of functions that operate on igt_crtc_t from
the old "pipe" terminology to the new "crtc" terminology.

 #include "scripts/iterators.cocci"

@func@
typedef igt_crtc_t;
identifier OLD_FUNC =~ "pipe";
identifier CRTC;
type T;
@@
T OLD_FUNC(..., igt_crtc_t *CRTC, ...);

@script:python rename@
OLD_FUNC << func.OLD_FUNC;
NEW_FUNC;
@@
coccinelle.NEW_FUNC = OLD_FUNC.replace("pipe", "crtc")

@@
identifier func.OLD_FUNC;
identifier rename.NEW_FUNC;
@@
- OLD_FUNC
+ NEW_FUNC
  (...) { ... }

@@
identifier func.OLD_FUNC;
identifier rename.NEW_FUNC;
type T;
@@
T
- OLD_FUNC
+ NEW_FUNC
  (...);

@@
identifier func.OLD_FUNC;
identifier rename.NEW_FUNC;
@@
- OLD_FUNC
+ NEW_FUNC
  (...)

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 lib/igt_kms.c         | 4 ++--
 lib/igt_kms.h         | 2 +-
 tests/intel/kms_dsc.c | 2 +-
 tests/kms_dither.c    | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 85dcff02efbc..60f16efa9562 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -6598,7 +6598,7 @@ unsigned int igt_get_output_max_bpc(igt_output_t *output)
  *
  * Returns: The current bpc from the crtc debugfs.
  */
-unsigned int igt_get_pipe_current_bpc(igt_crtc_t *crtc)
+unsigned int igt_get_crtc_current_bpc(igt_crtc_t *crtc)
 {
 	igt_display_t *display = crtc->display;
 	int drmfd = display->drm_fd;
@@ -6633,7 +6633,7 @@ static unsigned int get_current_bpc(igt_crtc_t *crtc, igt_output_t *output,
 				    unsigned int bpc)
 {
 	unsigned int maximum = igt_get_output_max_bpc(output);
-	unsigned int current = igt_get_pipe_current_bpc(crtc);
+	unsigned int current = igt_get_crtc_current_bpc(crtc);
 
 	igt_require_f(maximum >= bpc,
 		      "Monitor doesn't support %u bpc, max is %u\n", bpc,
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 24fe6db70128..b38f62f354fc 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1234,7 +1234,7 @@ bool igt_fit_modes_in_bw(igt_display_t *display);
 bool igt_has_lobf_debugfs(int drmfd, igt_output_t *output);
 bool igt_get_i915_edp_lobf_status(int drmfd, char *connector_name);
 unsigned int igt_get_output_max_bpc(igt_output_t *output);
-unsigned int igt_get_pipe_current_bpc(igt_crtc_t *crtc);
+unsigned int igt_get_crtc_current_bpc(igt_crtc_t *crtc);
 void igt_assert_output_bpc_equal(igt_crtc_t *crtc, igt_output_t *output,
 				 unsigned int bpc);
 bool igt_check_output_bpc_equal(igt_crtc_t *crtc, igt_output_t *output,
diff --git a/tests/intel/kms_dsc.c b/tests/intel/kms_dsc.c
index 74bc4af53ceb..69f335da34ec 100644
--- a/tests/intel/kms_dsc.c
+++ b/tests/intel/kms_dsc.c
@@ -226,7 +226,7 @@ static void update_display(data_t *data, uint32_t test_type)
 	restore_force_dsc_fractional_bpp_en();
 
 	if (test_type & TEST_DSC_BPC) {
-		current_bpc = igt_get_pipe_current_bpc(data->crtc);
+		current_bpc = igt_get_crtc_current_bpc(data->crtc);
 		igt_skip_on_f(data->input_bpc != current_bpc,
 			      "Input bpc = %d is not equal to current bpc = %d\n",
 			      data->input_bpc, current_bpc);
diff --git a/tests/kms_dither.c b/tests/kms_dither.c
index ca3b76b62459..ca367db613d4 100644
--- a/tests/kms_dither.c
+++ b/tests/kms_dither.c
@@ -103,7 +103,7 @@ static dither_status_t get_dither_state(data_t *data, igt_crtc_t *crtc)
 	igt_assert_eq(sscanf(start_loc, ", dither=%s", tmp), 1);
 	status.dither = !strcmp(tmp, "yes,");
 
-	status.bpc = igt_get_pipe_current_bpc(crtc);
+	status.bpc = igt_get_crtc_current_bpc(crtc);
 
 	return status;
 }
-- 
2.52.0

