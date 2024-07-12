Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90D7BC3DA4E
	for <igt-dev@archiver.kernel.org>; Fri, 12 Jul 2024 06:46:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BA5710EC16;
	Fri, 12 Jul 2024 06:46:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cen8gBjf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 552BB10EC16
 for <igt-dev@lists.freedesktop.org>; Fri, 12 Jul 2024 06:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720766769; x=1752302769;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mJHPpeAvcr2yvGP1Ht9o9vhW0H/ZDprFwZXJD6wC4OA=;
 b=cen8gBjfTLDZY7s2dkOZdk9GbXrB+d3Y1pclHFhARaKYpWZ3J9BI52qb
 3hsFTW5sPzLSkjjUwbo1ml44CocY11aw4RWObR3cPsuRsxb0TgI0M/UzX
 z2Ti4tXLcKSTuM12QVnQSjRfRuvQsTAN53zg/IYD9WqDodVtVL3/RMwST
 wTZAUXBCIq68wPrAHHou/2cyV2ly8VShldZeYu4FLD1/7wpAarFs+YRPC
 fiTobwFlWnsC9bmyzwFCrE8bHalS31gKIghZW7xnlhz53fmu9iikRasH2
 q15jY7dFQgT5UxzJEmclUlw3gV9PgIf66oQoG3pDal936Dqx+3lc3jM/Y Q==;
X-CSE-ConnectionGUID: U6Vyr4tTRxa4+FR4/HhGxw==
X-CSE-MsgGUID: SRPiOkGXSUiFKd3OROuISQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11130"; a="18036268"
X-IronPort-AV: E=Sophos;i="6.09,202,1716274800"; d="scan'208";a="18036268"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2024 23:46:09 -0700
X-CSE-ConnectionGUID: TyF7OLxDSLaLPxk0hyHTtw==
X-CSE-MsgGUID: ErAJPoz2SeC4yf5U6AsW8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,202,1716274800"; d="scan'208";a="48728697"
Received: from rgsanthosh-system-product-name.iind.intel.com ([10.145.169.76])
 by fmviesa007-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2024 23:46:07 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, kunal1.joshi@intel.com,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t 3/4] tests/kms_plane_scaling: Update the multi plane
 scaling function arguments
Date: Fri, 12 Jul 2024 12:20:02 +0530
Message-ID: <20240712065003.530021-4-ramanaidu.naladala@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240712065003.530021-1-ramanaidu.naladala@intel.com>
References: <20240712065003.530021-1-ramanaidu.naladala@intel.com>
MIME-Version: 1.0
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

This patch remove the unused function arguments for multi plane subtests.
It will not impact any functionality.

v2:Update the function arguments (Ankit)

Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
---
 tests/kms_plane_scaling.c | 48 ++++++++++++++++++++-------------------
 1 file changed, 25 insertions(+), 23 deletions(-)

diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
index c6d7ee832..733dc24b8 100644
--- a/tests/kms_plane_scaling.c
+++ b/tests/kms_plane_scaling.c
@@ -210,8 +210,6 @@ typedef struct {
 	igt_display_t display;
 	struct igt_fb fb[4];
 	bool extended;
-	double sf_plane1;
-	double sf_plane2;
 	bool flag;
 } data_t;
 
@@ -851,23 +849,25 @@ find_connected_pipe(igt_display_t *display, bool second, igt_output_t **output)
 }
 
 static void
-__test_planes_scaling_combo(data_t *d, int w1, int h1, int w2, int h2,
-			    enum pipe pipe, igt_output_t *output,
-			    igt_plane_t *p1, igt_plane_t *p2,
-			    struct igt_fb *fb1, struct igt_fb *fb2,
-			    enum scaler_combo_test_type test_type)
+__test_planes_scaling_combo(data_t *d,
+		double sf_plane1, double sf_plane2,
+		enum pipe pipe, igt_output_t *output,
+		igt_plane_t *p1, igt_plane_t *p2,
+		struct igt_fb *fb1, struct igt_fb *fb2,
+		enum scaler_combo_test_type test_type)
 {
 	igt_display_t *display = &d->display;
 	drmModeModeInfo *mode;
 	int ret;
 	bool mode_support = false;
+	int w1, h1, w2, h2;
 
 	for_each_connector_mode(output) {
 		mode = &output->config.connector->modes[j__];
-		w1 = get_width(mode, d->sf_plane1);
-		h1 = get_height(mode, d->sf_plane1);
-		w2 = get_width(mode, d->sf_plane2);
-		h2 = get_height(mode, d->sf_plane2);
+		w1 = get_width(mode, sf_plane1);
+		h1 = get_height(mode, sf_plane1);
+		w2 = get_width(mode, sf_plane2);
+		h2 = get_height(mode, sf_plane2);
 
 		igt_output_override_mode(output, mode);
 		igt_plane_set_fb(p1, fb1);
@@ -917,16 +917,22 @@ static void setup_fb(int fd, int width, int height, struct igt_fb *fb)
 }
 
 static void
-test_planes_scaling_combo(data_t *d, int w1, int h1, int w2, int h2,
-			  enum pipe pipe, igt_output_t *output,
-			  enum scaler_combo_test_type test_type)
+test_planes_scaling_combo(data_t *d,
+		double sf_plane1, double sf_plane2,
+		enum pipe pipe, igt_output_t *output,
+		enum scaler_combo_test_type test_type)
 {
 	igt_display_t *display = &d->display;
 	drmModeModeInfo *mode;
 	int n_planes;
+	int w1, h1, w2, h2;
 
 	cleanup_crtc(d);
 	mode = igt_output_get_mode(output);
+	w1 = get_width(mode, sf_plane1);
+	h1 = get_height(mode, sf_plane1);
+	w2 = get_width(mode, sf_plane2);
+	h2 = get_height(mode, sf_plane2);
 
 	igt_output_set_pipe(output, pipe);
 
@@ -965,7 +971,7 @@ test_planes_scaling_combo(data_t *d, int w1, int h1, int w2, int h2,
 		if (p1->type == DRM_PLANE_TYPE_CURSOR || p2->type == DRM_PLANE_TYPE_CURSOR)
 				continue;
 
-		__test_planes_scaling_combo(d, w1, h1, w2, h2,
+		__test_planes_scaling_combo(d, sf_plane1, sf_plane2,
 					    pipe, output, p1, p2,
 					    &d->fb[1], &d->fb[2],
 					    test_type);
@@ -1453,16 +1459,12 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 						continue;
 
 					igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
-						drmModeModeInfo *mode = igt_output_get_mode(output);
-						data.sf_plane1 = scaler_with_2_planes_tests[index].sf_plane1;
-						data.sf_plane2 = scaler_with_2_planes_tests[index].sf_plane2;
 
 						test_planes_scaling_combo(&data,
-							get_width(mode, scaler_with_2_planes_tests[index].sf_plane1),
-							get_height(mode, scaler_with_2_planes_tests[index].sf_plane1),
-							get_width(mode, scaler_with_2_planes_tests[index].sf_plane2),
-							get_height(mode, scaler_with_2_planes_tests[index].sf_plane2),
-							pipe, output, scaler_with_2_planes_tests[index].test_type);
+								scaler_with_2_planes_tests[index].sf_plane1,
+								scaler_with_2_planes_tests[index].sf_plane2,
+								pipe, output,
+								scaler_with_2_planes_tests[index].test_type);
 					}
 					break;
 				}
-- 
2.43.0

