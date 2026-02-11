Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28C28ECD6C1
	for <igt-dev@archiver.kernel.org>; Wed, 11 Feb 2026 16:34:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D31FA10E628;
	Wed, 11 Feb 2026 16:34:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c8+X8Z0W";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33AAA10E628
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Feb 2026 16:34:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770827673; x=1802363673;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=gEoUOElqAsiZyl5TofAr/8qHvFyhU9s0++/R7nF/rkw=;
 b=c8+X8Z0WarOyx1fwfY0wjZbUWdEkarQsY54yn4HqdrCDIV/dTamgDG8U
 y3H7GIR4uWb1FFKrXCtBkajaRKNl8hpyJvYaLzxFpjueMRGj2SDN/4Y+7
 21kJWNhBy6bLMyjDz/mKZ/dW3CHZTQTEuYzL21muyGtGawyHjXkr+2JlK
 f1rsh2OlwmJ8yaGi3W0NRs6d1Ckjtzt8SaMD2MWw3pt4IegAFMLZMduIZ
 KkQbPahUsjzSr8zh8oFtaV43bUpoeR5I+Ol9aNnkBOjWDMiLk+d2IcmL6
 jLHiIKb/ypJdoe7dIraRZ7FOrar/oHflDVHdbGVOqREL/msGc2C3UW6Y+ Q==;
X-CSE-ConnectionGUID: +lOgMmDJSrKzqRv7IZ1UUg==
X-CSE-MsgGUID: zwhTedOVT6u2B1G89zo5Ww==
X-IronPort-AV: E=McAfee;i="6800,10657,11698"; a="83082182"
X-IronPort-AV: E=Sophos;i="6.21,285,1763452800"; d="scan'208";a="83082182"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2026 08:34:33 -0800
X-CSE-ConnectionGUID: 26zZko6OTLqfHVHY7YgLww==
X-CSE-MsgGUID: ytWTCBcTS9+EEsr22i6ovw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,285,1763452800"; d="scan'208";a="211405387"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost)
 ([10.245.245.23])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2026 08:34:32 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 06/17] tests/intel/kms_psr2_su: Use igt_crtc_t instead
 of enum pipe
Date: Wed, 11 Feb 2026 18:33:53 +0200
Message-ID: <20260211163404.2018-7-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260211163404.2018-1-ville.syrjala@linux.intel.com>
References: <20260211163404.2018-1-ville.syrjala@linux.intel.com>
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

Convert the use of enum pipe to igt_crtc_t in
tests/intel/kms_psr2_su.

The pipes[] array (afterwards crtcs[]) complicates this
one sufficiently that the conversion was done by hand.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/intel/kms_psr2_su.c | 24 +++++++++++-------------
 1 file changed, 11 insertions(+), 13 deletions(-)

diff --git a/tests/intel/kms_psr2_su.c b/tests/intel/kms_psr2_su.c
index f7652f165a2d..95bd4f605ff8 100644
--- a/tests/intel/kms_psr2_su.c
+++ b/tests/intel/kms_psr2_su.c
@@ -292,13 +292,12 @@ static void cleanup(data_t *data, igt_output_t *output)
 	igt_remove_fb(data->drm_fd, &data->fb[0]);
 }
 
-static int check_psr2_support(data_t *data, enum pipe pipe)
+static int check_psr2_support(data_t *data, igt_crtc_t *crtc)
 {
 	int status;
 
 	igt_output_t *output;
 	igt_display_t *display = &data->display;
-	igt_crtc_t *crtc = igt_crtc_for_pipe(display, pipe);
 
 	igt_display_reset(display);
 	output = data->output;
@@ -317,8 +316,8 @@ int igt_main()
 	igt_crtc_t *crtc;
 	int r, i;
 	igt_output_t *outputs[IGT_MAX_PIPES * IGT_MAX_PIPES];
-	int pipes[IGT_MAX_PIPES * IGT_MAX_PIPES];
-	int n_pipes = 0;
+	igt_crtc_t *crtcs[IGT_MAX_PIPES * IGT_MAX_PIPES];
+	int n_crtcs = 0;
 
 	igt_fixture() {
 		struct itimerspec interval;
@@ -357,10 +356,10 @@ int igt_main()
 
 		for_each_crtc_with_valid_output(&data.display, crtc,
 						data.output) {
-			if (check_psr2_support(&data, crtc->pipe)) {
-				pipes[n_pipes] = crtc->pipe;
-				outputs[n_pipes] = data.output;
-				n_pipes++;
+			if (check_psr2_support(&data, crtc)) {
+				crtcs[n_crtcs] = crtc;
+				outputs[n_crtcs] = data.output;
+				n_crtcs++;
 			}
 		}
 	}
@@ -372,11 +371,10 @@ int igt_main()
 			data.format = *format++;
 			igt_describe("Test that selective update works when screen changes");
 			igt_subtest_with_dynamic_f("%s-%s", op_str(data.op), igt_format_str(data.format)) {
-				for (i = 0; i < n_pipes; i++) {
-					igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipes[i]),
-							igt_output_name(outputs[i])) {
-						igt_output_set_crtc(outputs[i],
-								    igt_crtc_for_pipe(outputs[i]->display, pipes[i]));
+				for (i = 0; i < n_crtcs; i++) {
+					igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtcs[i]),
+						      igt_output_name(outputs[i])) {
+						igt_output_set_crtc(outputs[i], crtcs[i]);
 						if (data.op == FRONTBUFFER &&
 						    intel_display_ver(intel_get_drm_devid(data.drm_fd)) >= 12) {
 							/*
-- 
2.52.0

