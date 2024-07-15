Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA3F8C3DA4B
	for <igt-dev@archiver.kernel.org>; Mon, 15 Jul 2024 15:42:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C62610E423;
	Mon, 15 Jul 2024 15:42:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hdDhbPHu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2205A10E423
 for <igt-dev@lists.freedesktop.org>; Mon, 15 Jul 2024 15:42:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721058142; x=1752594142;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3i/REyB5qsLglMFf9+DNUAhuWJ/U56BNtdLYDBoV6fA=;
 b=hdDhbPHus/09agK7ZeErIICmmh09M/L0BEIOA3EFU48YZDzAeA0+cvIG
 EzqjIu/5C16/p70cYoqo6A6UB9WhOEf97vHw0b/wFl61RLtOeEVtV7l6B
 58txDgSbpOLcPZu5W6PqzZmz8x7QffuCjxsePIlYQMQhpPgNrF/DSPabs
 L71cxsC8gfgonZBl/bro0fSZCxnRA1OeA7RlRNUhPkmwSNTX2Aeb+9mNZ
 8siCiBEi3aAKXmKaEJQ6cwY1aY9MJQFLoLdJ6SdvUkxd7hd10e2WyAZ7N
 c3UjM7kRWgkbJcRAjt1HuHzuEtvDmRnfIDU38B3/qeNhmi0gxe2UoRc8F A==;
X-CSE-ConnectionGUID: LqbS7LetQmK3pUzQbzdu7g==
X-CSE-MsgGUID: J41oKCm8Qh2rVvibGG3vug==
X-IronPort-AV: E=McAfee;i="6700,10204,11134"; a="35987961"
X-IronPort-AV: E=Sophos;i="6.09,210,1716274800"; d="scan'208";a="35987961"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2024 08:42:22 -0700
X-CSE-ConnectionGUID: 5HsLiYEXSbu+/Rwu7cpj5Q==
X-CSE-MsgGUID: PU/AoIn7TiuiTJXhxdXyfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,210,1716274800"; d="scan'208";a="49408709"
Received: from rgsanthosh-system-product-name.iind.intel.com ([10.145.169.76])
 by fmviesa006-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2024 08:42:20 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, kunal1.joshi@intel.com,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t 2/5] tests/kms_plane_scaling: Update the multi plane
 scaling function arguments
Date: Mon, 15 Jul 2024 21:16:25 +0530
Message-ID: <20240715154628.583682-3-ramanaidu.naladala@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240715154628.583682-1-ramanaidu.naladala@intel.com>
References: <20240715154628.583682-1-ramanaidu.naladala@intel.com>
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

Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
---
 tests/kms_plane_scaling.c | 43 +++++++++++++++++++++++----------------
 1 file changed, 26 insertions(+), 17 deletions(-)

diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
index f5efd13ef..0048e6e51 100644
--- a/tests/kms_plane_scaling.c
+++ b/tests/kms_plane_scaling.c
@@ -853,17 +853,23 @@ find_connected_pipe(igt_display_t *display, bool second, igt_output_t **output)
 }
 
 static void
-__test_planes_scaling_combo(data_t *d, int w1, int h1, int w2, int h2,
-			    enum pipe pipe, igt_output_t *output,
-			    igt_plane_t *p1, igt_plane_t *p2,
-			    struct igt_fb *fb1, struct igt_fb *fb2,
-			    enum scaler_combo_test_type test_type)
+__test_planes_scaling_combo(data_t *d, double sf_plane1,
+		double sf_plane2,
+		enum pipe pipe, igt_output_t *output,
+		igt_plane_t *p1, igt_plane_t *p2,
+		struct igt_fb *fb1, struct igt_fb *fb2,
+		enum scaler_combo_test_type test_type)
 {
 	igt_display_t *display = &d->display;
 	drmModeModeInfo *mode;
 	int ret;
+	int w1, h1, w2, h2;
 
 	mode = igt_output_get_mode(output);
+	w1 = get_width(mode, sf_plane1);
+	h1 = get_height(mode, sf_plane1);
+	w2 = get_width(mode, sf_plane2);
+	h2 = get_height(mode, sf_plane2);
 
 	igt_plane_set_fb(p1, fb1);
 	igt_plane_set_fb(p2, fb2);
@@ -908,18 +914,24 @@ static void setup_fb(int fd, int width, int height, struct igt_fb *fb)
 }
 
 static void
-test_planes_scaling_combo(data_t *d, int w1, int h1, int w2, int h2,
-			  enum pipe pipe, igt_output_t *output,
-			  enum scaler_combo_test_type test_type)
+test_planes_scaling_combo(data_t *d, double sf_plane1,
+		double sf_plane2,
+		enum pipe pipe, igt_output_t *output,
+		enum scaler_combo_test_type test_type)
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
 
 	n_planes = display->pipes[pipe].n_planes;
 	igt_require(n_planes >= 2);
@@ -956,10 +968,10 @@ test_planes_scaling_combo(data_t *d, int w1, int h1, int w2, int h2,
 		if (p1->type == DRM_PLANE_TYPE_CURSOR || p2->type == DRM_PLANE_TYPE_CURSOR)
 				continue;
 
-		__test_planes_scaling_combo(d, w1, h1, w2, h2,
-					    pipe, output, p1, p2,
-					    &d->fb[1], &d->fb[2],
-					    test_type);
+		__test_planes_scaling_combo(d, sf_plane1, sf_plane2,
+				pipe, output, p1, p2,
+				&d->fb[1], &d->fb[2],
+				test_type);
 	}
 
 	cleanup_fbs(d);
@@ -1450,13 +1462,10 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 						continue;
 
 					igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
-						drmModeModeInfo *mode = igt_output_get_mode(output);
 
 						test_planes_scaling_combo(&data,
-							get_width(mode, scaler_with_2_planes_tests[index].sf_plane1),
-							get_height(mode, scaler_with_2_planes_tests[index].sf_plane1),
-							get_width(mode, scaler_with_2_planes_tests[index].sf_plane2),
-							get_height(mode, scaler_with_2_planes_tests[index].sf_plane2),
+							scaler_with_2_planes_tests[index].sf_plane1,
+							scaler_with_2_planes_tests[index].sf_plane2,
 							pipe, output, scaler_with_2_planes_tests[index].test_type);
 					}
 					break;
-- 
2.43.0

