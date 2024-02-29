Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97659C54798
	for <igt-dev@archiver.kernel.org>; Thu, 29 Feb 2024 05:19:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FD1210E38F;
	Thu, 29 Feb 2024 05:19:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iouFSPmB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6126A10E363
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Feb 2024 05:19:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709183941; x=1740719941;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=FsJP5Vz+u2iewkX/y9MRcXSDVZfPbDztcdrAnCaCLE0=;
 b=iouFSPmBOulctXle1DBKI+liwg1eF5RXVc42ibNFze2OQnkjZqBXPjjy
 kjqQKOBzNSEYmcRyEGCelSpLqpEadV/sOck1Rm1Yu9tPMS+IOWQpngD5V
 zXn7Aq8hLyaB0DlCmV2WaDyqLNLdm70ec4oT94cjORkHE7GO3cOor158H
 uv2P9EbB15eK6qpiGiZJ5rY1eaKMpTXbZVVj74F93mDwXhtEYnxrZkfgs
 3Z4mP1PIhcYk9iYiUqBGUBZzQHy6DHQHNnHvuvqnHlmkFILUQn0OvDzmr
 7c5ntcEEKqUsIKkUpiH52SBoaa9Yd6ln72BKl3QjlUUmyK7rvX3Kv9FKN g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10998"; a="14780752"
X-IronPort-AV: E=Sophos;i="6.06,192,1705392000"; d="scan'208";a="14780752"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2024 21:19:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,192,1705392000"; d="scan'208";a="12250017"
Received: from bhanu-nuclab.iind.intel.com ([10.145.169.172])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2024 21:18:59 -0800
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [i-g-t v7 6/8] tests/kms_vrr: Add ability to flip static image for
 flicker profiling
Date: Thu, 29 Feb 2024 10:42:48 +0530
Message-ID: <20240229051250.2939774-7-bhanuprakash.modem@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240229051250.2939774-1-bhanuprakash.modem@intel.com>
References: <20240229051250.2939774-1-bhanuprakash.modem@intel.com>
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

From: Sean Paul <seanpaul@chromium.org>

Add a --static-image argument which will paint both framebuffers
identically. This allows us to profile VRR flicker on the panel.

v2:
- Add short opt to the main callsite (Bhanu)
v3: (Bhanu)
- Rebase
- Nit: 's/d:r:s:/drs:/'

Cc: Mark Yacoub <markyacoub@chromium.org>
Signed-off-by: Sean Paul <seanpaul@chromium.org>
Reviewed-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_vrr.c | 53 ++++++++++++++++++++++++++++++-------------------
 1 file changed, 33 insertions(+), 20 deletions(-)

diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
index cec263bb5..30a279c56 100644
--- a/tests/kms_vrr.c
+++ b/tests/kms_vrr.c
@@ -115,6 +115,7 @@ typedef struct data {
 	drmModeModeInfo switch_modes[RR_MODES_COUNT];
 	vtest_ns_t vtest_ns;
 	uint64_t duration_ns;
+	bool static_image;
 } data_t;
 
 typedef void (*test_t)(data_t*, enum pipe, igt_output_t*, uint32_t);
@@ -283,6 +284,7 @@ static void prepare_test(data_t *data, igt_output_t *output, enum pipe pipe)
 	drmModeModeInfo mode;
 	cairo_t *cr;
 	int bar_width, bar_height, bar_remaining, horizontal_bar_height;
+	int num_painted_fbs;
 
 	mode = *igt_output_get_mode(output);
 
@@ -312,25 +314,31 @@ static void prepare_test(data_t *data, igt_output_t *output, enum pipe pipe)
 	horizontal_bar_height = mode.vdisplay / 8;
 	bar_height = mode.vdisplay - horizontal_bar_height * 2;
 	bar_remaining = mode.hdisplay % bar_width;
-	cr = igt_get_cairo_ctx(data->drm_fd, &data->fb[0]);
-	for (int j = 0; j < num_bars; ++j) {
-		unsigned int width = bar_width;
-		if (j == num_bars - 1)
-			width += bar_remaining;
-
-		/* Red->Green->Blue gradient */
-		if (j < num_bars / 2)
-			paint_bar(cr, j * bar_width, 0, width, bar_height,
-				  j, num_bars / 2,
-				  1.0, 0.0, 0.0, 0.0, 1.0, 0.0);
-		else
-			paint_bar(cr, j * bar_width, 0, width, bar_height,
-				  j - num_bars / 2, num_bars / 2,
-				  0.0, 1.0, 0.0, 0.0, 0.0, 1.0);
+	num_painted_fbs = data->static_image ? 2 : 1;
+	for (int i = 0; i < num_painted_fbs; ++i) {
+		cr = igt_get_cairo_ctx(data->drm_fd, &data->fb[i]);
+		for (int j = 0; j < num_bars; ++j) {
+			unsigned int width = bar_width;
+			if (j == num_bars - 1)
+				width += bar_remaining;
+
+			/* Red->Green->Blue gradient */
+			if (j < num_bars / 2)
+				paint_bar(cr, j * bar_width, 0, width,
+					  bar_height,
+					  j, num_bars / 2,
+					  1.0, 0.0, 0.0, 0.0, 1.0, 0.0);
+			else
+				paint_bar(cr, j * bar_width, 0, width,
+					  bar_height,
+					  j - num_bars / 2, num_bars / 2,
+					  0.0, 1.0, 0.0, 0.0, 0.0, 1.0);
+		}
+		igt_paint_color(cr, 0, mode.vdisplay - horizontal_bar_height,
+				mode.hdisplay, horizontal_bar_height,
+				1.00, 1.00, 1.00);
+		igt_put_cairo_ctx(cr);
 	}
-	igt_paint_color(cr, 0, mode.vdisplay - horizontal_bar_height,
-			mode.hdisplay, horizontal_bar_height, 1.00, 1.00, 1.00);
-	igt_put_cairo_ctx(cr);
 
 	/* Take care of any required modesetting before the test begins. */
 	data->primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
@@ -725,6 +733,9 @@ static int opt_handler(int opt, int opt_index, void *_data)
 	case 'r':
 		data->vtest_ns.rate_ns = rate_from_refresh(atoi(optarg));
 		break;
+	case 's':
+		data->static_image = true;
+		break;
 	}
 	return IGT_OPT_HANDLER_SUCCESS;
 }
@@ -732,16 +743,18 @@ static int opt_handler(int opt, int opt_index, void *_data)
 static const struct option long_opts[] = {
 	{ .name = "duration", .has_arg = true, .val = 'd', },
 	{ .name = "refresh-rate", .has_arg = true, .val = 'r', },
+	{ .name = "static-image", .has_arg = false, .val = 's', },
 	{}
 };
 
 static const char help_str[] =
 	"  --duration <duration-seconds>\t\tHow long to run the test for\n"
-	"  --refresh-rate <refresh-hz>\t\tThe refresh rate to flip at\n";
+	"  --refresh-rate <refresh-hz>\t\tThe refresh rate to flip at\n"
+	"  --static-image\t\tFlip a static image for flicker profiling\n";
 
 static data_t data;
 
-igt_main_args("dr:", long_opts, help_str, opt_handler, &data)
+igt_main_args("drs:", long_opts, help_str, opt_handler, &data)
 {
 	igt_fixture {
 		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
-- 
2.43.0

