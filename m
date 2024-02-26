Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 207E2C48BF6
	for <igt-dev@archiver.kernel.org>; Mon, 26 Feb 2024 07:26:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A26AA10EEE7;
	Mon, 26 Feb 2024 07:26:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KrmRve4g";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3603F10EEE1
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Feb 2024 07:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708932400; x=1740468400;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=paG5JXRlqKuIV78gRYaYB+5TT33tjmWX87B/JNBiBnQ=;
 b=KrmRve4ggOROi4+CtlBJ5a9NoQLDKgsdhaPQzNQQk5Cn6kLZGJKZA+jm
 sUhk8VYyC8aXZhIGxF6iaro934CeDV0RNw54B9vn4toHwvN+ytYZSKU3c
 FiCquyfA2KJjURuDuekBXYcVWtG2tJsUe90TwyW74Kf8f3C/JMVH8fn9W
 m1KE2bl/ixum8VYcCwtoPDxVSIrfBfXKFVDl+TXmCMbWR4yWMXjFEqmDo
 Vm5j9icfMXBjFlFIu8rc9BuwogdOUh9LdQdA/87qO0B6iPKEP+YGb2M/b
 viD0PWJByyC1sk0p0Ks3A19LtwTA8vLz7TOgeAee2LsV5kh7mtuS8EfTY A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10995"; a="6147569"
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; 
   d="scan'208";a="6147569"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2024 23:26:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; 
   d="scan'208";a="6923242"
Received: from bhanu-nuclab.iind.intel.com ([10.145.169.172])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2024 23:26:39 -0800
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [i-g-t v6 5/9] tests/kms_vrr: Change the pattern displayed in the test
Date: Mon, 26 Feb 2024 12:50:31 +0530
Message-ID: <20240226072035.2620383-6-bhanuprakash.modem@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240226072035.2620383-1-bhanuprakash.modem@intel.com>
References: <20240226072035.2620383-1-bhanuprakash.modem@intel.com>
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

Upgrade the tiny box in the top left corner to some vertical color
bars with horizontal grey and white bars at the bottom.

v2:
- Removed hardcoded bar heights
- Made number of vertical bars configurable
- Fill in the entire screen horizontally
v3: (Bhanu)
- Rebase
- Drop static variable

Cc: Mark Yacoub <markyacoub@chromium.org>
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Signed-off-by: Sean Paul <seanpaul@chromium.org>
Reviewed-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_vrr.c | 45 +++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 41 insertions(+), 4 deletions(-)

diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
index 86bc144ed..cec263bb5 100644
--- a/tests/kms_vrr.c
+++ b/tests/kms_vrr.c
@@ -258,11 +258,31 @@ static void set_vrr_on_pipe(data_t *data, enum pipe pipe,
 						 NULL) == 0);
 }
 
+static void paint_bar(cairo_t *cr, unsigned int x, unsigned int y,
+		      unsigned int w, unsigned int h,
+		      unsigned int bar, unsigned int num_bars,
+		      float start_r, float start_g, float start_b,
+		      float end_r, float end_g, float end_b)
+{
+	float progress = (float)bar / (float)num_bars;
+	float color[] = {
+		start_r + progress * (end_r - start_r),
+		start_g + progress * (end_g - start_g),
+		start_b + progress * (end_b - start_b)
+	};
+	igt_paint_color(cr, x, y, w, h,
+			color[0] > 0 ? color[0] : 0.0,
+			color[1] > 0 ? color[1] : 0.0,
+			color[2] > 0 ? color[2] : 0.0);
+}
+
 /* Prepare the display for testing on the given pipe. */
 static void prepare_test(data_t *data, igt_output_t *output, enum pipe pipe)
 {
+	unsigned int num_bars = 256;
 	drmModeModeInfo mode;
 	cairo_t *cr;
+	int bar_width, bar_height, bar_remaining, horizontal_bar_height;
 
 	mode = *igt_output_get_mode(output);
 
@@ -288,11 +308,28 @@ static void prepare_test(data_t *data, igt_output_t *output, enum pipe pipe)
 			    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
 			    0.50, 0.50, 0.50, &data->fb[1]);
 
+	bar_width = mode.hdisplay / num_bars;
+	horizontal_bar_height = mode.vdisplay / 8;
+	bar_height = mode.vdisplay - horizontal_bar_height * 2;
+	bar_remaining = mode.hdisplay % bar_width;
 	cr = igt_get_cairo_ctx(data->drm_fd, &data->fb[0]);
-
-	igt_paint_color(cr, 0, 0, mode.hdisplay / 10, mode.vdisplay / 10,
-			1.00, 0.00, 0.00);
-
+	for (int j = 0; j < num_bars; ++j) {
+		unsigned int width = bar_width;
+		if (j == num_bars - 1)
+			width += bar_remaining;
+
+		/* Red->Green->Blue gradient */
+		if (j < num_bars / 2)
+			paint_bar(cr, j * bar_width, 0, width, bar_height,
+				  j, num_bars / 2,
+				  1.0, 0.0, 0.0, 0.0, 1.0, 0.0);
+		else
+			paint_bar(cr, j * bar_width, 0, width, bar_height,
+				  j - num_bars / 2, num_bars / 2,
+				  0.0, 1.0, 0.0, 0.0, 0.0, 1.0);
+	}
+	igt_paint_color(cr, 0, mode.vdisplay - horizontal_bar_height,
+			mode.hdisplay, horizontal_bar_height, 1.00, 1.00, 1.00);
 	igt_put_cairo_ctx(cr);
 
 	/* Take care of any required modesetting before the test begins. */
-- 
2.43.0

