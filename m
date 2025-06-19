Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E014C7115D
	for <igt-dev@archiver.kernel.org>; Thu, 19 Jun 2025 20:06:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 524AB10E10C;
	Thu, 19 Jun 2025 20:06:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PE1XPaSd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FDFB10E10C
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Jun 2025 20:05:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750363559; x=1781899559;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Ho9ixbC8fbcnfO5mUqR7rD4854kBO2WxStawSxlth6I=;
 b=PE1XPaSdLqelKirKY4GiEx14ecpr0rMn7x4e2odqt+7W0xk4DUDgdOXi
 RDdb5YeimvTCkC1fNr+TgfZlM/47VX7HZfCt9B9Y/4VYBHlLNmsbEnrXR
 aEqvWeXfe9UgK4dx9WSNTLz8UJKbhRq9viMztUMMEs/cVDLSNuKvC1geu
 KJWL1NB2auRNMSReT9igrzlWYzgLJTSnv8cwQBv46hhy1SFcXO1uQnOZH
 WSQHi5EZHkGs9Jsu3uPN91nnxPw7IPf7qqKJWDVw1VRBgXGh4HxQSR+xG
 pXQFHDp7oBLQTweHfA1/ymLSHEgehN/EM+zAOfzaJoNENOyh6vXHEW9QI A==;
X-CSE-ConnectionGUID: fjZCPcHATeuK1zBCSEPEgQ==
X-CSE-MsgGUID: /J2ef0OETw+ahyqC3NcRxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="56446601"
X-IronPort-AV: E=Sophos;i="6.16,249,1744095600"; d="scan'208";a="56446601"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2025 13:05:59 -0700
X-CSE-ConnectionGUID: aQ511zbrQe+QX1AXoUG92w==
X-CSE-MsgGUID: u37DRCvDQ5uWsLRZi6AC8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,249,1744095600"; d="scan'208";a="181756440"
Received: from unknown (HELO rgsanthosh-System-Product-Name.iind.intel.com)
 ([10.190.238.65])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2025 13:05:57 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, uma.shankar@intel.com,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v5 1/2] tests/kms_flip: Default to tiled modifiers for
 stable flips on high refresh panels
Date: Fri, 20 Jun 2025 01:35:48 +0530
Message-ID: <20250619200549.66329-2-ramanaidu.naladala@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250619200549.66329-1-ramanaidu.naladala@intel.com>
References: <20250619200549.66329-1-ramanaidu.naladala@intel.com>
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

