Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07BC4CCFA18
	for <igt-dev@archiver.kernel.org>; Thu, 13 Nov 2025 07:59:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADD8E10E510;
	Thu, 13 Nov 2025 07:59:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A7P5DSp+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA69B10E34C
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Nov 2025 07:59:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763020747; x=1794556747;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EbCic03XMXyzD6jTaXMO1qX4mWVbdsjafzj0u/8xdcU=;
 b=A7P5DSp+JAvSn4u21yKlYvBOguzelyNnatOoUdqNkrDLvTKiv6Hvfp9k
 OPFVLTss0ZvC6ikxz1JmSb1YJR/hQvOidH7JFS7djVikljsY1j3cAeUCf
 zR/I+Oh0atbzEH5/z0NWivpqd+KZ/RGKxkw3hS5vBWjas1IKogmcUaI9k
 xshzT7s+rXPHBr6Kd+41xyme4jnu12SNBMlL//xQksPsDLAS1WPuDTH4i
 e/5ome1x50PGNmApPbS+ULcF/FhjKRW6SFzSLFVSJgqVpxkmyaXVoXAS7
 cpRPbvF3zO/H0+bUTIkg64cf8UVXhBt/l9eE0h5Y5+MxjryCSKGmnMeN/ w==;
X-CSE-ConnectionGUID: 550FIDGdShqniGmRuZ9jHw==
X-CSE-MsgGUID: aW3v2XvFRSakKARYYhDaig==
X-IronPort-AV: E=McAfee;i="6800,10657,11611"; a="64298425"
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; d="scan'208";a="64298425"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2025 23:59:07 -0800
X-CSE-ConnectionGUID: NX6fKe6jSJScYOhAB56YXw==
X-CSE-MsgGUID: aaWwc/nXRJ+dVyQNLeL3/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; d="scan'208";a="189230446"
Received: from sowmi-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.56])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2025 23:59:07 -0800
From: Sowmiya S <sowmiya.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: suraj.kandpal@intel.com,
	Sowmiya S <sowmiya.s@intel.com>
Subject: [PATCH i-g-t v1 7/9] tests/kms_writeback: FB creation within subtest
Date: Thu, 13 Nov 2025 13:45:21 +0530
Message-ID: <20251113081523.3088787-8-sowmiya.s@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251113081523.3088787-1-sowmiya.s@intel.com>
References: <20251103103842.3025204-1-sowmiya.s@intel.com>
 <20251113081523.3088787-1-sowmiya.s@intel.com>
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

