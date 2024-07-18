Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F41B6C3DA63
	for <igt-dev@archiver.kernel.org>; Thu, 18 Jul 2024 14:01:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B748010E8A6;
	Thu, 18 Jul 2024 14:01:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JTFMsXOh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 516A310E8A6
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Jul 2024 14:01:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721311303; x=1752847303;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EhTm53w9u1Xvkuja2pze/2K7+Y8h9Y9hGIJ4WNo94tY=;
 b=JTFMsXOhCQ6HcZ+H7aqaTtIgRlad+GK6ZA9bHX7UECQumzRm4YjqB0dA
 M0rV75Fd/NKTVR5snfGiuE/4HVTvp62Rqdt7wewo6lKXXcBiuIuYlUOs6
 r5TxVry5fAYjM134rPoBiGXmgje+a77K+nI9Taz6lAtjlDvk2EwUqLSl+
 jTydacuTu1jAdGMHWWipUP2QrrhSm77GMN1yC2p2Rf4g5IY6xfoggSISF
 wcINV8+1mTORjroOOKrfPMjYaL8tauiI54Cbn/Mos/3pXRTYuKgLZ2pWs
 HvLAj4v9kUf5cNxKy8+wI6QFSccup2/nK0f9R4GbfRrykS71vsNxwqQV5 A==;
X-CSE-ConnectionGUID: htOsqL3cRIW3TSOzyq5n7g==
X-CSE-MsgGUID: 5Sjb7cB5QO6bPcDRwCfDdQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11137"; a="19005878"
X-IronPort-AV: E=Sophos;i="6.09,218,1716274800"; d="scan'208";a="19005878"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2024 07:01:43 -0700
X-CSE-ConnectionGUID: Dtombba/RouiWzZQZVqSxQ==
X-CSE-MsgGUID: YXX2/yRRS0q4aHQV4XHMKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,218,1716274800"; d="scan'208";a="55927299"
Received: from rgsanthosh-system-product-name.iind.intel.com ([10.145.169.76])
 by orviesa004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2024 07:01:40 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, kunal1.joshi@intel.com,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v7 2/5] tests/kms_plane_scaling: Update the multi plane
 scaling function arguments
Date: Thu, 18 Jul 2024 19:35:43 +0530
Message-ID: <20240718140546.676903-3-ramanaidu.naladala@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240718140546.676903-1-ramanaidu.naladala@intel.com>
References: <20240718140546.676903-1-ramanaidu.naladala@intel.com>
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

Update the helper test_planes_scaling_combo to use a scaling_factor
for plane1 and plane2 instead of explicit width and height parameters.
This change simplifies the function interfaces and allows for testing
scenarios, where we need to recalculate the width and height based on
the display mode. Adjusted all function calls to match new argument
order.

v2: Update the function arguments (Ankit)

Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 tests/kms_plane_scaling.c | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
index 450381831..84812430a 100644
--- a/tests/kms_plane_scaling.c
+++ b/tests/kms_plane_scaling.c
@@ -911,19 +911,27 @@ static void setup_fb(int fd, int width, int height, struct igt_fb *fb)
 }
 
 static void
-test_planes_scaling_combo(data_t *d, int w1, int h1, int w2, int h2,
-			  enum pipe pipe, igt_output_t *output,
+test_planes_scaling_combo(data_t *d, double sf_plane1,
+			  double sf_plane2,
+			  enum pipe pipe,
+			  igt_output_t *output,
 			  enum scaler_combo_test_type test_type)
 {
 	igt_display_t *display = &d->display;
 	drmModeModeInfo *mode;
 	int n_planes;
+	int w1, h1, w2, h2;
 
 	cleanup_crtc(d);
 
 	igt_output_set_pipe(output, pipe);
 	mode = igt_output_get_mode(output);
 
+	w1 = get_width(mode, sf_plane1);
+	h1 = get_height(mode, sf_plane1);
+	w2 = get_width(mode, sf_plane2);
+	h2 = get_height(mode, sf_plane2);
+
 	n_planes = display->pipes[pipe].n_planes;
 	igt_require(n_planes >= 2);
 
@@ -1456,14 +1464,12 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 						continue;
 
 					igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
-						drmModeModeInfo *mode = igt_output_get_mode(output);
 
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

