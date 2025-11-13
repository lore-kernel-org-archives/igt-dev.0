Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE4EACD5BA1
	for <igt-dev@archiver.kernel.org>; Thu, 13 Nov 2025 08:40:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CA6F10E716;
	Thu, 13 Nov 2025 08:40:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fIua7Dih";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E78710E7D9
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Nov 2025 08:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763023220; x=1794559220;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EbCic03XMXyzD6jTaXMO1qX4mWVbdsjafzj0u/8xdcU=;
 b=fIua7DihizXhM0mj+burItb3Pct765hkZHJqj3vuynjr/q67+y5694gn
 7MG/2Y+JRpNC3RsliUooHL1zCeZv00+1zXY6t6MB0gSwozlVq0g4rpGOZ
 YJeTHzdPTTLSKHVzetv0ehW+wEyZjqInGphoC8h9xWX+zuc539L8JCq+E
 psWyLgdCgsxXuiG7mkwaxn3Fx4f4ChMBCasInlUGCSOoNsY+cxUaxPbsB
 loeAbcxaTeGeJkXoOIUOIfF+mFb3yZIfFBi4Q8SlXF0a/M8LNRff0C1GR
 Q6mKfxYvcGGIb0pYhR3WwnOJzeiafaCpiMQn98SrXvw6FXQs12weceYJZ A==;
X-CSE-ConnectionGUID: IyUiQiD/Rs2ICA2KkfqU/A==
X-CSE-MsgGUID: KH6wRciNSFup6GZedpWAbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11611"; a="67696701"
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; d="scan'208";a="67696701"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 00:40:17 -0800
X-CSE-ConnectionGUID: SZgLDGmITG2fbMQ/W3GV0g==
X-CSE-MsgGUID: xYA4L47BQHOR2pNlkvtiHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; d="scan'208";a="194434763"
Received: from sowmi-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.56])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 00:40:15 -0800
From: Sowmiya S <sowmiya.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com, suraj.kandpal@intel.com,
 Sowmiya S <sowmiya.s@intel.com>
Subject: [PATCH i-g-t v2 7/9] tests/kms_writeback: FB creation within subtest
Date: Thu, 13 Nov 2025 14:27:59 +0530
Message-ID: <20251113085801.3088957-8-sowmiya.s@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251113085801.3088957-1-sowmiya.s@intel.com>
References: <20251113085801.3088957-1-sowmiya.s@intel.com>
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

