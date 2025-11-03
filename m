Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B7E8CCF9F8
	for <igt-dev@archiver.kernel.org>; Mon,  3 Nov 2025 10:21:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9C9F10E3A5;
	Mon,  3 Nov 2025 10:21:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QpUoxCt4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3072610E3A8
 for <igt-dev@lists.freedesktop.org>; Mon,  3 Nov 2025 10:21:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762165279; x=1793701279;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TcNcfXIme36xs7S0/uJ2of7rQNuVEBovyR3suJRwYEU=;
 b=QpUoxCt43ZwQLGSNUoC5fuSXa/iqtEGDOqnFGREwuI+4m5dHi+tlwPtr
 Yde7k+xfD7lGqLW9gZf3IDosUy7ial7P08IxTZyzJ0prnm/BBHZYwch8k
 tq4zgRRjpYu5CSYuSviwvLDqy3salKsJPDBmhXp4suqD5Ol+h1vP5W62K
 MwBR+OQuZPDjA7TKheWrCXVD6/XW8d+vWGuZSp3VtspwsK7A76wUGW+zO
 truOq1J2WbTlh/0Ah5v1ack6BLsLMqSpzNVVQA0Vtuouv5cnnBvGj/l9m
 e7tnLlaX9Jp01m4KxMhy1SqSWohVNCSJGVlEKgyH9pZIKZC9HENdyUuB9 A==;
X-CSE-ConnectionGUID: kH3I2mwOQaaBbzNko0BLfA==
X-CSE-MsgGUID: aY3fDcrCRC22lf+o1SAuHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="64162524"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="64162524"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2025 02:21:19 -0800
X-CSE-ConnectionGUID: TPr3/47FSPKQ1tQ4aE30xA==
X-CSE-MsgGUID: YvINYX19SiqbClnHefI7pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,275,1754982000"; d="scan'208";a="186120234"
Received: from sowmi-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.56])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2025 02:21:16 -0800
From: Sowmiya S <sowmiya.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, swati2.sharma@intel.com,
 Sowmiya S <sowmiya.s@intel.com>
Subject: [PATCH i-g-t v1 6/8] tests/kms_writeback: FB creation within subtest
Date: Mon,  3 Nov 2025 16:08:40 +0530
Message-ID: <20251103103842.3025204-7-sowmiya.s@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251103103842.3025204-1-sowmiya.s@intel.com>
References: <20251103103842.3025204-1-sowmiya.s@intel.com>
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
index 8f434b3b5..3bb6891cb 100644
--- a/tests/kms_writeback.c
+++ b/tests/kms_writeback.c
@@ -687,12 +687,25 @@ igt_main_args("b:c:f:dl", long_options, help_str, opt_handler, NULL)
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

