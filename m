Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E80DEC41513
	for <igt-dev@archiver.kernel.org>; Wed, 17 Jul 2024 14:59:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4934A10E1AF;
	Wed, 17 Jul 2024 14:59:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CpPdfUSU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A396D10E1A4
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Jul 2024 14:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721228383; x=1752764383;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pQ9tWuzVsltkYdu2BBLSN607mhLieyhKMoUpve2mOw8=;
 b=CpPdfUSUFrsGmahlSekKHty55dVCX4Lul4ho7KGZdDfyNR+O2WEI/9VL
 OLU3ZbDPovvfzogJfBz3D2IbhPGQx1g94H+TCR4l7T7qqwi+LFo8X8Uww
 HaKv6/Fk5IrS1AGYYAJt6N94SGV7pgaoPzQhBaYiWJUIFIOY/vyANm+QQ
 5hghOYY1hcjDNSM1wbwb3jancC3tBMdoQW43PO4CWE/Um1VjgjaQz4WSV
 EcSdrEUMYYTSfvZcaFBAX0eID4z0qRAl35GcKfQVDaSELSuYGjEaxUcZA
 +rEC8KTubxCCo8eJ4ovKi5DzZm02RN1khBzcxUfd5ePKC1dogMjHFyg0F Q==;
X-CSE-ConnectionGUID: aSDzR6OxQlK9wHydjNaNWA==
X-CSE-MsgGUID: kwwB74ZCR5eSq2LQJ/EdHQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11136"; a="18354552"
X-IronPort-AV: E=Sophos;i="6.09,214,1716274800"; d="scan'208";a="18354552"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2024 07:59:43 -0700
X-CSE-ConnectionGUID: QVoD6Y/qTD65UJISSCOH8g==
X-CSE-MsgGUID: LGJrKAKvTfy8SCBM7pyLQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,214,1716274800"; d="scan'208";a="87890798"
Received: from rgsanthosh-system-product-name.iind.intel.com ([10.145.169.76])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2024 07:59:41 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, kunal1.joshi@intel.com,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t 2/5] tests/kms_plane_scaling: Update the multi plane
 scaling function arguments
Date: Wed, 17 Jul 2024 20:33:43 +0530
Message-ID: <20240717150346.650276-3-ramanaidu.naladala@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240717150346.650276-1-ramanaidu.naladala@intel.com>
References: <20240717150346.650276-1-ramanaidu.naladala@intel.com>
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
v3: Address and update review comments (Ankit)

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

