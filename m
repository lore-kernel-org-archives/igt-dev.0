Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F18FC3DA49
	for <igt-dev@archiver.kernel.org>; Thu, 18 Jul 2024 11:04:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C049B10E776;
	Thu, 18 Jul 2024 11:04:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DJ9jbLMQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6ED2C10E776
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Jul 2024 11:04:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721300688; x=1752836688;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=T8suLA0lMF5cKlL6ZQz7A2HNFfTk9O2nfp1lDDQXY7w=;
 b=DJ9jbLMQDr0GHQPYTde1Y5QhoqOL0FROfe2BW5s3tEMKfI5cWhHemYJf
 IaTcw02TSthK2YWxYZe7o0mRiQ7jVHPl2i+V/X9L29Xo3lH20BwXnYxM3
 ZjfRt6acbr6C5oev1rZM0AR5U7HIczk4uepFgnwY4/Dxg83ZKUnRdFvHv
 sq/FOxLcatf5a/Z1ih/MsGLIXRwCwV3TtZLErrbfMsQ4Qe5s6yUBuPQ0C
 xCiHiog+N9/7TFBvPc8UJRBK/Xi33J3MvwaUH7sA8TKjHcuxY8oOMYnlN
 zgUBhhzKyRYS/bjgCfo+JkQsAYv9lNyM/QG6Nh7ug4bif1aLj45AbRwmT Q==;
X-CSE-ConnectionGUID: INK1dQ+kTO+A+aDncnwLXw==
X-CSE-MsgGUID: gWeI3CF7Q4uGszjj/XP81Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11136"; a="18476565"
X-IronPort-AV: E=Sophos;i="6.09,217,1716274800"; d="scan'208";a="18476565"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2024 04:04:48 -0700
X-CSE-ConnectionGUID: oE1phvUDSgm8TXiBVNfrxw==
X-CSE-MsgGUID: /3H9060yRduvAqVO1Apq6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,217,1716274800"; d="scan'208";a="50811525"
Received: from rgsanthosh-system-product-name.iind.intel.com ([10.145.169.76])
 by fmviesa010-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2024 04:04:45 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, kunal1.joshi@intel.com,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v6 2/5] tests/kms_plane_scaling: Update the multi plane
 scaling function arguments
Date: Thu, 18 Jul 2024 16:38:48 +0530
Message-ID: <20240718110851.665102-3-ramanaidu.naladala@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240718110851.665102-1-ramanaidu.naladala@intel.com>
References: <20240718110851.665102-1-ramanaidu.naladala@intel.com>
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
---
 tests/kms_plane_scaling.c | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
index bd38513ab..8a69aacfd 100644
--- a/tests/kms_plane_scaling.c
+++ b/tests/kms_plane_scaling.c
@@ -913,19 +913,27 @@ static void setup_fb(int fd, int width, int height, struct igt_fb *fb)
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
 
@@ -1458,14 +1466,12 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
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

