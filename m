Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CCF3EA3F01
	for <igt-dev@archiver.kernel.org>; Tue, 10 Feb 2026 04:57:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12A3910E4B3;
	Tue, 10 Feb 2026 04:57:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hatnAfmQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 704CB10E4B5
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Feb 2026 04:57:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770699470; x=1802235470;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cs/H+zIm1eNGqscupNhYOzzFte+h5ERVvGpwxqyjDWk=;
 b=hatnAfmQy7EiYShs0SU4KZW9HnKRJS2KKrn/VVzrwa9VCY7YQRPqnJNP
 3kml72BYF0FTIADrnAVf2PNgBolMWYTyvjySNPvLfsyNmpGLb7flEhDy+
 kf6d4bi2Bs6rAC4RLOhn8Wyk7lzJhXCLAZ4XuzmdttMbiQ72bj1tG2V1o
 F5TnY25FWfd0BnYPvvrGrD9U2+Y5sZtiqFbHOZz2GaWrqjh/zS8O9WCW4
 r+hhZoGfMYROgFUXnBsZL3N3uZAKUIwu0VAT839tSBZkH5VsUAENPqe1M
 cBuUGXAO1CIaZb5Q5ylwSlRiVSLGtphBxJjD65/Mh4i6zu1BMdpMVrYY9 g==;
X-CSE-ConnectionGUID: SPhWffe2Q4iYN1P0VP6HAg==
X-CSE-MsgGUID: QQEI1BlkQaWBTWNQcMN5Qw==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="82925837"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="82925837"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2026 20:57:50 -0800
X-CSE-ConnectionGUID: uPwU1pv+QJijOPI35zzqOg==
X-CSE-MsgGUID: YpPLxGcwQtyGFoVa90kvjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="211346963"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.54])
 by fmviesa010.fm.intel.com with ESMTP; 09 Feb 2026 20:57:48 -0800
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, ramanaidu.naladala@intel.com,
 sameer.lattannavar@intel.com, pranay.samala@intel.com
Subject: [PATCH i-g-t v5 2/2] tests/kms_plane: Skip unsupported modifiers
Date: Tue, 10 Feb 2026 10:38:22 +0530
Message-Id: <20260210050822.1095409-3-pranay.samala@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260210050822.1095409-1-pranay.samala@intel.com>
References: <20260210050822.1095409-1-pranay.samala@intel.com>
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

Skip modifier subtests that are not supported.

v2: Avoid code duplication (Rama)

v3: Introduce pixel-format flag

v4: Use XRGB8888 for modifier check for more robust capability detection

v5: Edit skipping message (Rama)

Signed-off-by: Pranay Samala <pranay.samala@intel.com>
---
 tests/kms_plane.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/tests/kms_plane.c b/tests/kms_plane.c
index 22c45ae5e..3588203cc 100644
--- a/tests/kms_plane.c
+++ b/tests/kms_plane.c
@@ -167,6 +167,7 @@ enum {
 	TEST_PANNING_TOP_LEFT           = 1 << 2,
 	TEST_PANNING_BOTTOM_RIGHT       = 1 << 3,
 	TEST_SUSPEND_RESUME             = 1 << 4,
+	TEST_PIXEL_FORMAT               = 1 << 5,
 };
 
 static const struct {
@@ -1469,6 +1470,18 @@ static void run_test(data_t *data, void (*test)(data_t *, enum pipe))
 	int count = 0;
 
 	for_each_crtc_with_single_output(&data->display, crtc, data->output) {
+		if ((data->flags & TEST_PIXEL_FORMAT) &&
+		    !igt_display_has_format_mod(&data->display,
+						DRM_FORMAT_XBGR8888,
+						data->mod)) {
+			igt_info("Skipping: Modifier " IGT_MODIFIER_FMT
+				 " is not supported on pipe %s, output %s\n",
+				 IGT_MODIFIER_ARGS(data->mod),
+				 kmstest_pipe_name(crtc->pipe),
+				 igt_output_name(data->output));
+			continue;
+		}
+
 		igt_display_reset(&data->display);
 
 		igt_output_set_crtc(data->output,
@@ -1497,6 +1510,7 @@ run_tests_for_pipe_plane(data_t *data)
 		igt_describe("verify the pixel formats for given plane and pipe");
 		igt_subtest_with_dynamic_f("pixel-format-%s-modifier", modifiers[i].str) {
 			data->mod = modifiers[i].modifier;
+			data->flags = TEST_PIXEL_FORMAT;
 			run_test(data, test_pixel_formats);
 		}
 	}
@@ -1507,6 +1521,7 @@ run_tests_for_pipe_plane(data_t *data)
 					   modifiers[i].str) {
 			data->mod = modifiers[i].modifier;
 			data->crop = 4;
+			data->flags = TEST_PIXEL_FORMAT;
 			run_test(data, test_pixel_formats);
 		}
 		data->crop = 0;
-- 
2.34.1

