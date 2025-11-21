Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3911CCFA476
	for <igt-dev@archiver.kernel.org>; Fri, 21 Nov 2025 05:41:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA96A10E110;
	Fri, 21 Nov 2025 05:41:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ys7Tt1ZD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB64A10E110
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Nov 2025 05:41:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763703662; x=1795239662;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EbCic03XMXyzD6jTaXMO1qX4mWVbdsjafzj0u/8xdcU=;
 b=Ys7Tt1ZDWdczuii7LdMuRz7+VrlUryiS/LR9cGaKsiMgyws8KDBz3Oa9
 QwSfILdEK85XRb8Zed4R9kAHnyqbIzVcy2LYGfEBMmn9oq9hH7w1sH5lR
 8kIdn9+Y/p+pvH2AJE/Fo05rAIRIDYAZl9PqqALvQCoXGHz0YzQQvrLJZ
 i+ngdz+KPPd9NKrXitweLNR6GnjRrDM8qjeTSx0Ko7YEIRJz8yfr1MEb5
 Jz/jZ86tYylAm/j1GGkJrfqCkWEu9v2sK3IfXrbd9U/8ORlx7PbXPQmwN
 H+lw2lpUSeMMLpHeyiYD2zBXoPBpO4RTTOwVyjvf5IfdQCmlyvgqlg0JW Q==;
X-CSE-ConnectionGUID: HkTTLmzzTP+bi6XtS1TwXw==
X-CSE-MsgGUID: S3mkNGNXSY+5uI9uX7L+8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="69658153"
X-IronPort-AV: E=Sophos;i="6.20,215,1758610800"; d="scan'208";a="69658153"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 21:41:02 -0800
X-CSE-ConnectionGUID: qQbp7NiORV+vx6bvrbVnDA==
X-CSE-MsgGUID: Lh7AdGXtR0WV87IqBjy9Cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,215,1758610800"; d="scan'208";a="214961830"
Received: from sowmi-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.56])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 21:41:00 -0800
From: Sowmiya S <sowmiya.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com, suraj.kandpal@intel.com,
 Sowmiya S <sowmiya.s@intel.com>
Subject: [PATCH i-g-t v3 07/12] tests/kms_writeback: FB creation within subtest
Date: Fri, 21 Nov 2025 11:28:34 +0530
Message-ID: <20251121055839.3116906-8-sowmiya.s@intel.com>
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

Moved input framebuffer creation into the subtest to allow
platform-specific handling. This ensures that the correct
format and configuration are applied based on the
target platform.

Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
---
 tests/kms_writeback.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c
index d031a9f54..f724cd33f 100644
--- a/tests/kms_writeback.c
+++ b/tests/kms_writeback.c
@@ -688,12 +688,25 @@ igt_main_args("b:c:f:dl", long_options, help_str, opt_handler, NULL)
 		     "(output framebuffer and fence); this test goes through"
 		     "the combination of possible bad options");
 	igt_subtest("writeback-invalid-parameters") {
+		uint32_t format;
 		igt_fb_t invalid_output_fb;
 
 		igt_skip_on(data.dump_check || data.list_modes);
+		if (is_intel_device(display.drm_fd))
+			format = DRM_FORMAT_XBGR8888;
+		else
+			format = DRM_FORMAT_XRGB8888;
+
+		fb_id = igt_create_fb(display.drm_fd, mode.hdisplay,
+				      mode.vdisplay,
+				      format,
+				      DRM_FORMAT_MOD_LINEAR,
+				      &input_fb);
+		igt_require(fb_id > 0);
+
 		fb_id = igt_create_fb(display.drm_fd, mode.hdisplay / 2,
 				      mode.vdisplay / 2,
-				      DRM_FORMAT_XRGB8888,
+				      format,
 				      DRM_FORMAT_MOD_LINEAR,
 				      &invalid_output_fb);
 		igt_require(fb_id > 0);
-- 
2.43.0

