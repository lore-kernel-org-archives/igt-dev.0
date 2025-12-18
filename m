Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99864D6E2CA
	for <igt-dev@archiver.kernel.org>; Thu, 18 Dec 2025 19:38:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FE9D10EAD6;
	Thu, 18 Dec 2025 19:38:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AhIqjxd5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4702910EAD6
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Dec 2025 19:38:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766086690; x=1797622690;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NFcDvWMPjz2+f7Kajab9Tnm5rP8hjPo0ANi3jxelCzA=;
 b=AhIqjxd5SF0iIMrkFpOz3CJLndv7PVqlAbhL+7XFMeIePJO6TtZUrZ1H
 +vQgTnjVD8UoAkYN985KKP39RNXNP66mMcRFben9TT3Il2x2wUWPxd1VF
 Y6x/JXxs1H6fIBhPIooG1T34KKAdGaqJ6kx+FUVOSxcbVSYp8c9NPSHxC
 L6d1+qnojoDsd8hlvwhub3HkuQZnhy1QR2MU4aJX6BUhJsoIrGl7TU4yF
 6j4JW1DUcK/IU2ron1mhOEMtuc1wWU+aeG8dlHLOQ2f76sjW1faM28IfP
 NNPbQ2lywYUBy3QLcJRE9rKMz4ZmokuydY9xxXVHX0Y+Vn+0pNLR1CRyV Q==;
X-CSE-ConnectionGUID: ooUfd3a9SReeWXBw+BTW/Q==
X-CSE-MsgGUID: 9fG6CzuxS+yW1W8Y5vS9ZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="67244723"
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; d="scan'208";a="67244723"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 11:38:10 -0800
X-CSE-ConnectionGUID: 4EilqsQ1SNac7bk72smMdA==
X-CSE-MsgGUID: KmReP2MGQdK8o3RsW1BV1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; d="scan'208";a="198680635"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by orviesa007-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2025 11:38:08 -0800
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: chaitanya.kumar.borah@intel.com,
	Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t,
 v6 5/8] tests/kms_color: Add helper for plane color pipeline tests
Date: Fri, 19 Dec 2025 01:14:59 +0530
Message-Id: <20251218194502.1306975-6-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251218194502.1306975-1-swati2.sharma@intel.com>
References: <20251218194502.1306975-1-swati2.sharma@intel.com>
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

Add a helper to run plane color pipeline tests across
all pipes and outputs on primary plane.

TODO: Extend the test to multiple planes (HDR & SDR)

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
Reviewed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
---
 tests/kms_color.c | 38 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/tests/kms_color.c b/tests/kms_color.c
index 87c0f4a5b..fc23ca8bd 100644
--- a/tests/kms_color.c
+++ b/tests/kms_color.c
@@ -828,6 +828,10 @@ static void test_setup(data_t *data, enum pipe p)
 					  data->primary->pipe->pipe,
 					  IGT_PIPE_CRC_SOURCE_AUTO);
 
+	igt_display_require_output_on_pipe(&data->display, p);
+	data->output = igt_get_single_output_for_pipe(&data->display, p);
+	igt_require(data->output);
+
 	igt_display_reset(&data->display);
 }
 
@@ -921,6 +925,40 @@ run_ctm_tests_for_pipe(data_t *data, enum pipe p,
 	test_cleanup(data);
 }
 
+__maybe_unused
+static void run_plane_color_tests(data_t *data,
+				  const color_t *fb_colors,
+				  const color_t *exp_colors,
+				  kms_colorop_t *colorops[])
+{
+	enum pipe pipe;
+
+	data->color_depth = 8;
+	data->drm_format = DRM_FORMAT_XRGB8888;
+
+	for_each_pipe(&data->display, pipe) {
+		test_setup(data, pipe);
+
+		data->mode = igt_output_get_mode(data->output);
+
+		if (!pipe_output_combo_valid(data, pipe)){
+			test_cleanup(data);
+			continue;
+		}
+
+		 /* TODO: extend the test to multiple planes (HDR & SDR) */
+		if (!igt_plane_has_prop(data->primary, IGT_PLANE_COLOR_PIPELINE))
+			continue;
+
+		igt_dynamic_f("pipe-%s-%s",
+			      kmstest_pipe_name(pipe),
+			      igt_output_name(data->output))
+			igt_assert(test_plane_colorops(data, fb_colors, exp_colors, colorops));
+	}
+
+	test_cleanup(data);
+}
+
 static void
 run_deep_color_tests_for_pipe(data_t *data, enum pipe p)
 {
-- 
2.25.1

