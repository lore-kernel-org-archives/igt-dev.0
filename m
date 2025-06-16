Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09E39C71135
	for <igt-dev@archiver.kernel.org>; Mon, 16 Jun 2025 06:39:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6EE410E2AA;
	Mon, 16 Jun 2025 06:39:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fsJPwTNe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76A8910E2AA
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Jun 2025 06:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750055946; x=1781591946;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VZQiRQAVy+x6Z6TJ6iOWxfnlwB/RBTYs7D6VradQ388=;
 b=fsJPwTNeGu42uVtFmx5+iUG7T5wSMpmxLnwjNNVWFf8Ty7+zNE7TKk0l
 i2x6r6lAKFmojLfeb2hoqgInIVIy5WDnieYf6GNbb8M9p9tQwjQOy7aQY
 h6eZ+ZdFT/5rdnBAIUh8FXoRJv9D9tkjCTv/ax7UtLy4ivVHOQoLtmtMq
 18lFFLJIK/Z5wXqsiSxQG8YNi92Qc1aU0M8w1j93g7SoBhBmtxuVgzR21
 nIOb9i2Z5PxnXEywPHIxcdOM/rLDBNC/K5ixqmKQsQ5xUUnK+NqAppqsw
 ZMAVX0AqCpZgncn4HFKude2RUC3ZTwGGf3AHQETqGdgfZmnpzM6C9cq6J g==;
X-CSE-ConnectionGUID: Z1m6J56mQ3S65wOgNWyWYA==
X-CSE-MsgGUID: VTWkRmUISB25WCyNvWABUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="52280793"
X-IronPort-AV: E=Sophos;i="6.16,240,1744095600"; d="scan'208";a="52280793"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2025 23:39:06 -0700
X-CSE-ConnectionGUID: HvF5P8TRS4mR1Xh35szvlQ==
X-CSE-MsgGUID: q1BIpujjS5SDjZFOpIdJgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,240,1744095600"; d="scan'208";a="153535975"
Received: from unknown (HELO rgsanthosh-System-Product-Name.iind.intel.com)
 ([10.190.238.65])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2025 23:39:05 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, uma.shankar@intel.com,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v3 1/5] tests/kms_flip: Default to tiled modifiers for
 stable flips on high refresh panels
Date: Mon, 16 Jun 2025 12:08:27 +0530
Message-ID: <20250616063831.3332042-2-ramanaidu.naladala@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250616063831.3332042-1-ramanaidu.naladala@intel.com>
References: <20250616063831.3332042-1-ramanaidu.naladala@intel.com>
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

