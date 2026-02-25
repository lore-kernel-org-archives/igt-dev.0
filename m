Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3777DFD374E
	for <igt-dev@archiver.kernel.org>; Wed, 25 Feb 2026 12:51:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA84F10E76F;
	Wed, 25 Feb 2026 12:51:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Sk76e2Di";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2473710E76F
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Feb 2026 12:51:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772023901; x=1803559901;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=jzX+h+fVGd3yUiDifjP8s5c+OQvLdhlNtqYEE7tQaEU=;
 b=Sk76e2DiJrRBjxPtZ861L4PCAUsevZyit5NJgGiU+wN3oikNqRf4wynC
 AVrK73A45/yn5MvymR1F+s4rNZDd5g+fUAJrFXiWKrOYp3m5V22i/QL/x
 bqTwqNIAIDd56OtBMta9/M1EvCHQTauH7LyMEhYHJcnE4w8sLmqMRaqvy
 jWMsb/oXTPBNFo3j4WyPToHljhFzSDkOyaLFYyeDW3cvzWjwty0IyT/0g
 PMYyGR5OixLdYe3IZeIrcATPWql6/KbuPJAeqUurjbhVcltUaJWGUHhH2
 xBu4ZGBS+yaH8cEmWHNch/QbujHIh0e57QWNpeyqA7iOGdfjsqPfQ8aJI w==;
X-CSE-ConnectionGUID: wSVyekqsQhOz411CNo8yMA==
X-CSE-MsgGUID: QEN88LDOTx6SK0zt/tIBMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11711"; a="83772229"
X-IronPort-AV: E=Sophos;i="6.21,310,1763452800"; d="scan'208";a="83772229"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2026 04:51:41 -0800
X-CSE-ConnectionGUID: oI8beqMMRgi+tH20HJpNsQ==
X-CSE-MsgGUID: RUmKP4QvRBG87mg4rV7sUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,310,1763452800"; d="scan'208";a="213350040"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.244.16])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2026 04:51:39 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 08/19] tests/kms: Stop using igt_require_pipe()
Date: Wed, 25 Feb 2026 14:50:57 +0200
Message-ID: <20260225125108.31119-9-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260225125108.31119-1-ville.syrjala@linux.intel.com>
References: <20260225125108.31119-1-ville.syrjala@linux.intel.com>
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

The few remaining tests that use igt_require_pipe() don't actually
need it since the callers already have a 'crtc' that they got
from for_each_crtc(), meaning it's always valid.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 lib/igt_kms.c                         | 12 +-----------
 lib/igt_kms.h                         | 13 -------------
 tests/chamelium/kms_chamelium_color.c |  2 --
 tests/kms_color.c                     |  2 --
 4 files changed, 1 insertion(+), 28 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 94fa0680653b..b39e262303b5 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -2813,17 +2813,7 @@ void igt_display_reset(igt_display_t *display)
 static void igt_fill_plane_format_mod(igt_display_t *display, igt_plane_t *plane);
 static void igt_fill_display_format_mod(igt_display_t *display);
 
-/**
- * igt_require_pipe:
- * @display: pointer to igt_display_t
- * @pipe: pipe which need to check
- *
- * Skip a (sub-)test if the pipe not valid.
- *
- * Should be used everywhere where a test checks pipe and skip
- * test when pipe is not valid.
- */
-void igt_require_pipe(igt_display_t *display, enum pipe pipe)
+static void igt_require_pipe(igt_display_t *display, enum pipe pipe)
 {
 	igt_skip_on_f(pipe >= igt_display_n_crtcs(display) || !igt_crtc_for_pipe(display, pipe)->valid,
 			"Pipe %s does not exist\n",
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index d6ebd40dd7be..86991da20de3 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1242,19 +1242,6 @@ int igt_connector_sysfs_open(int drm_fd,
 uint32_t igt_reduce_format(uint32_t format);
 
 
-/*
- * igt_require_pipe:
- * @display: pointer to igt_display_t
- * @pipe: pipe which need to check
- *
- * Skip a (sub-)test if the pipe not valid.
- *
- * Should be used everywhere where a test checks pipe and skip
- * test when pipe is not valid.
- */
-void igt_require_pipe(igt_display_t *display,
-		enum pipe pipe);
-
 void igt_dump_connectors_fd(int drmfd);
 void igt_dump_crtcs_fd(int drmfd);
 bool igt_override_all_active_output_modes_to_fit_bw(igt_display_t *display);
diff --git a/tests/chamelium/kms_chamelium_color.c b/tests/chamelium/kms_chamelium_color.c
index 70dbedf82acc..e616ba438ae5 100644
--- a/tests/chamelium/kms_chamelium_color.c
+++ b/tests/chamelium/kms_chamelium_color.c
@@ -431,8 +431,6 @@ static bool test_pipe_limited_range_ctm(data_t *data,
 static void
 prep_pipe(data_t *data, igt_crtc_t *crtc)
 {
-	igt_require_pipe(&data->display, crtc->pipe);
-
 	if (igt_crtc_has_prop(crtc, IGT_CRTC_DEGAMMA_LUT_SIZE)) {
 		data->degamma_lut_size =
 			igt_crtc_get_prop(crtc,
diff --git a/tests/kms_color.c b/tests/kms_color.c
index fdc97d13dad6..0008a15a05b4 100644
--- a/tests/kms_color.c
+++ b/tests/kms_color.c
@@ -713,8 +713,6 @@ static void test_pipe_limited_range_ctm(data_t *data,
 static void
 prep_pipe(data_t *data, igt_crtc_t *crtc)
 {
-	igt_require_pipe(&data->display, crtc->pipe);
-
 	if (igt_crtc_has_prop(crtc, IGT_CRTC_DEGAMMA_LUT_SIZE)) {
 		data->degamma_lut_size =
 			igt_crtc_get_prop(crtc,
-- 
2.52.0

