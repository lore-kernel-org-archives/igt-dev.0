Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47EF9D767DB
	for <igt-dev@archiver.kernel.org>; Fri, 19 Dec 2025 11:19:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDC2010EF20;
	Fri, 19 Dec 2025 11:19:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XofVJuMB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DE0510EF20
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Dec 2025 11:19:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766143149; x=1797679149;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=v5+QigKhHBbjJ7HYi3DmV/fAwSeqFioWNJl19L5Mx0A=;
 b=XofVJuMBw9uH5t+9Tsau2tq2222s4QSNbnzqGRNtygSSeNc3EwwG4R6K
 iR+C/y+Tl4zzcb4sck+Q6v53cfj2USiaj1WywfN2znH4XhbLd+xdjfMnP
 YSTtAHB4S5VY6YK7PsmlrrCaMPyfhV7YT0hbR9IUGT7gAG9VVmz5aipph
 APpHbUqxOLd6dvDRhBgNehhYodjOKM53a9+XKyb+8uLeHZLzXjUiiUDKU
 CYFPVx4LjGLojV7ENo11I+OhumSMTpHN9E4zAUOXskTdt+yTl8Rz94G0K
 eqp9vW8aC2aPHbMQcm9xAPHFAzUJlvTjyFTu4VfXVb3GW+lSuFhU12vEC A==;
X-CSE-ConnectionGUID: E2ExoAonQaCXPE5KzHSsaA==
X-CSE-MsgGUID: MVrz0OMjQeqJ9+uqQn7eIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="78816169"
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; d="scan'208";a="78816169"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 03:19:09 -0800
X-CSE-ConnectionGUID: Ddsl+vDMSNmJv3aNdIc54w==
X-CSE-MsgGUID: rske25tlQJe+V6jo8ZExtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; d="scan'208";a="203235498"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by fmviesa005-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2025 03:19:08 -0800
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: chaitanya.kumar.borah@intel.com,
	Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t,
 v7 5/8] tests/kms_color: Add helper for plane color pipeline tests
Date: Fri, 19 Dec 2025 16:56:03 +0530
Message-Id: <20251219112606.1330425-6-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251219112606.1330425-1-swati2.sharma@intel.com>
References: <20251219112606.1330425-1-swati2.sharma@intel.com>
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
index c3c064d53..85c7d89d6 100644
--- a/tests/kms_color.c
+++ b/tests/kms_color.c
@@ -816,6 +816,10 @@ static void test_setup(data_t *data, enum pipe p)
 					  data->primary->pipe->pipe,
 					  IGT_PIPE_CRC_SOURCE_AUTO);
 
+	igt_display_require_output_on_pipe(&data->display, p);
+	data->output = igt_get_single_output_for_pipe(&data->display, p);
+	igt_require(data->output);
+
 	igt_display_reset(&data->display);
 }
 
@@ -909,6 +913,40 @@ run_ctm_tests_for_pipe(data_t *data, enum pipe p,
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

