Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42D68CFA475
	for <igt-dev@archiver.kernel.org>; Fri, 21 Nov 2025 05:41:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE71710E071;
	Fri, 21 Nov 2025 05:41:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n9FKk5ZH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF66210E7EF
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Nov 2025 05:41:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763703669; x=1795239669;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CeUqyFiu6OYCYlOTen+730SpWa/bo2ij2XIb6wHnv1A=;
 b=n9FKk5ZH17qf1ff2d7ONcILGKKp3x7EiNVCA0H48F4EZGwa10U/krsWQ
 FTaWYGZ8HXKQM2ZOd40bjxDS/xhaLo94OmMqt7JsXD9oxQH+2QcLIt0w0
 LaIF4CJiRg/CRUCa9R/GGVEMmRqP796CllWs2sfvgvJf/P5DXx2ZWHsDg
 rUgup9nUrUSEcd93VUNEnrzzQyso8LQzDbb4An3qyianf4VsT5U5a+DOo
 5p/4/8G6vZd2JFLBvKFbGVZsye+A2dISSb5Rvhg3L92WOkI1dl/rnw9BJ
 Qx9lXSNovuCfk2QfraxUUgJvSxjj/Ax8XqcvzCen/mlr7fJJJy2U7J5/P A==;
X-CSE-ConnectionGUID: zx3Y4iySSnO4qNGTe3lGGQ==
X-CSE-MsgGUID: J5UaGdKIRjWKrODR7jS2wQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="69658159"
X-IronPort-AV: E=Sophos;i="6.20,215,1758610800"; d="scan'208";a="69658159"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 21:41:09 -0800
X-CSE-ConnectionGUID: ArYYv1bbSVmyVOYW+kP04Q==
X-CSE-MsgGUID: 7tWx6clzQ8m6g7hoo8Clbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,215,1758610800"; d="scan'208";a="214961897"
Received: from sowmi-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.56])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 21:41:07 -0800
From: Sowmiya S <sowmiya.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com, suraj.kandpal@intel.com,
 Sowmiya S <sowmiya.s@intel.com>
Subject: [PATCH i-g-t v3 11/12] tests/kms_writeback: Add negative test for
 invalid-mode
Date: Fri, 21 Nov 2025 11:28:38 +0530
Message-ID: <20251121055839.3116906-12-sowmiya.s@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251121055839.3116906-1-sowmiya.s@intel.com>
References: <20251121055839.3116906-1-sowmiya.s@intel.com>
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

Introduced a negative test case to validate
invalid-mode inputs.

Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
---
 tests/kms_writeback.c | 44 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c
index c35d1f948..98fcf8a52 100644
--- a/tests/kms_writeback.c
+++ b/tests/kms_writeback.c
@@ -431,6 +431,44 @@ static void writeback_check_output(igt_output_t *output, igt_plane_t *plane,
 	igt_remove_fb(output_fb->fd, &second_out_fb);
 }
 
+static void  do_invalid_mode(igt_output_t *output, igt_display_t *display,
+			     igt_fb_t *input_fb, drmModeModeInfo *mode)
+{
+	int ret;
+	unsigned int fb_id;
+	int32_t out_fence;
+	drmModeModeInfo test_mode = {
+		.clock = 1066500,
+		.hdisplay = 5120,
+		.hsync_start = 5152,
+		.hsync_end = 5184,
+		.htotal = 5300,
+		.hskew = 0,
+		.vdisplay = 2880,
+		.vsync_start = 2883,
+		.vsync_end = 2888,
+		.vtotal = 2900,
+		.vscan = 0,
+		.vrefresh = 120,
+		.flags = DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
+		.name = {"5120x2880-120"},
+	};
+
+	igt_output_override_mode(output, &test_mode);
+	test_mode = *igt_output_get_mode(output);
+	fb_id = igt_create_fb(display->drm_fd, test_mode.hdisplay,
+			      test_mode.vdisplay,
+			      is_intel_device(data.drm_fd) ? DRM_FORMAT_XBGR8888
+			      : DRM_FORMAT_XRGB8888,
+			      DRM_FORMAT_MOD_LINEAR,
+			      input_fb);
+	igt_assert(fb_id >= 0);
+	ret = do_writeback_test(output, fb_id,
+				&out_fence,
+				false);
+	igt_assert_neq(ret, 0);
+}
+
 static void do_single_commit(igt_output_t *output, igt_plane_t *plane, igt_fb_t *in_fb,
 			      igt_fb_t *out_fb)
 {
@@ -767,6 +805,12 @@ igt_main_args("b:c:f:dl", long_options, help_str, opt_handler, NULL)
 		}
 	}
 
+	igt_describe("check writeback fb with invalid mode");
+	igt_subtest("invalid-mode") {
+		igt_skip_on(data.dump_check || data.list_modes);
+		do_invalid_mode(output, &display, &input_fb, &mode);
+	}
+
 	igt_fixture {
 		cleanup_writeback(&display, output);
 		igt_remove_fb(display.drm_fd, &input_fb);
-- 
2.43.0

