Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 590E4C71157
	for <igt-dev@archiver.kernel.org>; Tue, 17 Jun 2025 16:24:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BEA310E41F;
	Tue, 17 Jun 2025 16:24:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DeEaTfUX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3486F10E415
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Jun 2025 16:24:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750177469; x=1781713469;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Ho9ixbC8fbcnfO5mUqR7rD4854kBO2WxStawSxlth6I=;
 b=DeEaTfUX5jIpixaBGuykDOZ2t4tL6LQsFL3gmmzj+DtT079Z7rV7UQTw
 PZpWj/lVBn1mYg3Qt4JeBbYHu0En2Z19KZgqUeMIbUVAaCH6iH2pJRlJ3
 OMlC5Qt6XKbqXqtDDV9Wu0Ha7swYgqASrCS/IgvYvmCaIZ+AgUo5TAksJ
 SrMaSOwaOMfh1wF+01nHIy0OunPv2s2RsvUKHIwrmUeSxceMJ0yfvIzGd
 UHWMUwCq+8IVv8KrYJsrj2GemxF1zL9H8fxRYwoXazl1UDgF5/C4F3HPn
 fGk9uQ7WgpqdMktzIlHzdn5THuH1rpkjagvO5EuN3mFBMHcyT8P9Qp3ME w==;
X-CSE-ConnectionGUID: Ofa0RTGvSp+iDAOdXshJTw==
X-CSE-MsgGUID: CCZr0ojNQeWjn88HYpiU3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11467"; a="52224048"
X-IronPort-AV: E=Sophos;i="6.16,243,1744095600"; d="scan'208";a="52224048"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2025 09:24:29 -0700
X-CSE-ConnectionGUID: XT/DvZSvQA2VLUMPiuirNQ==
X-CSE-MsgGUID: sAOKhEBhTMG3b8A9nX/2Xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,243,1744095600"; d="scan'208";a="179821076"
Received: from unknown (HELO rgsanthosh-System-Product-Name.iind.intel.com)
 ([10.190.238.65])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2025 09:24:27 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, uma.shankar@intel.com,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v4 1/2] tests/kms_flip: Default to tiled modifiers for
 stable flips on high refresh panels
Date: Tue, 17 Jun 2025 21:53:51 +0530
Message-ID: <20250617162353.3348190-2-ramanaidu.naladala@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250617162353.3348190-1-ramanaidu.naladala@intel.com>
References: <20250617162353.3348190-1-ramanaidu.naladala@intel.com>
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

Using tiled modifiers as the default significantly improves flip
test pass rates, especially on high refresh rate panels.

Consolidated report on 10 samples on each pipe as below.
    - PipeA:  95.01% -> 100.00% (Improved by 4.99%)
    - PipeB:  91.57% -> 100.00% (Improved by 8.43%)
    - PipeC:  73.17% -> 97.94% (Improved by 24.77%)
    - PipeD:  76.64% -> 98.89% (Improved by 22.25%)

Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
---
 tests/kms_flip.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/tests/kms_flip.c b/tests/kms_flip.c
index 65016c66d..ca31ef7dd 100755
--- a/tests/kms_flip.c
+++ b/tests/kms_flip.c
@@ -282,6 +282,8 @@ static drmModeConnector *last_connector;
 
 uint32_t *fb_ptr;
 
+static igt_display_t display;
+
 struct type_name {
 	int type;
 	const char *name;
@@ -1533,7 +1535,15 @@ restart:
 	if (o->flags & TEST_PAN)
 		o->fb_width *= 2;
 
-	modifier = DRM_FORMAT_MOD_LINEAR;
+	if (igt_display_has_format_mod(&display, DRM_FORMAT_XRGB8888,
+				       I915_FORMAT_MOD_4_TILED))
+		modifier = I915_FORMAT_MOD_4_TILED;
+	else if (igt_display_has_format_mod(&display, DRM_FORMAT_XRGB8888,
+					    I915_FORMAT_MOD_X_TILED))
+		modifier = I915_FORMAT_MOD_X_TILED;
+	else
+		modifier = DRM_FORMAT_MOD_LINEAR;
+
 	if (o->flags & TEST_FENCE_STRESS)
 		modifier = I915_FORMAT_MOD_X_TILED;
 
@@ -2034,7 +2044,6 @@ igt_main_args("e", NULL, help_str, opt_handler, NULL)
 		{ 0, TEST_BO_TOOBIG | TEST_NO_2X_OUTPUT, "bo-too-big" },
 		{ 10, TEST_FLIP | TEST_SUSPEND, "flip-vs-suspend" },
 	};
-	igt_display_t display;
 	int i;
 
 	igt_fixture {
-- 
2.43.0

