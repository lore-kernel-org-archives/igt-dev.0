Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A5F8EE6B6F
	for <igt-dev@archiver.kernel.org>; Mon,  9 Feb 2026 08:23:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C843510E33E;
	Mon,  9 Feb 2026 08:23:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O8fvFn5P";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46DE410E33A
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Feb 2026 08:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770625384; x=1802161384;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BUm6sIAz9ATOPbR46Ma+AkbA02ke9BK09kXoIYvfeQo=;
 b=O8fvFn5PoSzWOzjZe+Wr4xw2WXZ2pJRVeQOzLeDfTbvlOL0SuYPOjbbo
 vS6qvQv0yByCAbLdGbz7jxOjJcjwwYx1eH6q79FIZYw8HFmVipcpliKHu
 VwfubWThR61p+hx7jAkbNkpLu3jyuhZ1u8U9zXmgZQWk5vaSGVDGfZS3E
 achBstjMt43iSuaMfDaa7lsv983PRtTpTPgBRsX/PleGQnwATnFVrABxj
 IPPJbdOSQU485JIhW4Jxfnu3gSbNjtqBol+pGPirjv7c0h2+euaEljEjr
 ewZYQ5fIewcO+5vdWtUldxDs5A8vQXSI3gQZBO6yUXSgNKsBghKqIpnCH A==;
X-CSE-ConnectionGUID: 7RthoizyQMODPyx9RHsCVw==
X-CSE-MsgGUID: q0W9S5ZbT1O/WxJgMMCcjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11695"; a="71718760"
X-IronPort-AV: E=Sophos;i="6.21,281,1763452800"; d="scan'208";a="71718760"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2026 00:23:03 -0800
X-CSE-ConnectionGUID: kMLo3rHSSPa6mKFrVatG3w==
X-CSE-MsgGUID: cti8xC8QTJSxyC2RHgbTqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,281,1763452800"; d="scan'208";a="211577203"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.54])
 by orviesa007.jf.intel.com with ESMTP; 09 Feb 2026 00:23:02 -0800
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, ramanaidu.naladala@intel.com,
 sameer.lattannavar@intel.com, pranay.samala@intel.com
Subject: [PATCH i-g-t v4 2/2] tests/kms_plane: Skip unsupported modifiers
Date: Mon,  9 Feb 2026 14:03:31 +0530
Message-Id: <20260209083331.1088550-3-pranay.samala@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260209083331.1088550-1-pranay.samala@intel.com>
References: <20260209083331.1088550-1-pranay.samala@intel.com>
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

Skip modifier subtests that are not supported.

v2: Avoid code duplication (Rama)

v3: Introduce pixel-format flag

v4: Use XRGB8888 for modifier check for more robust capability detection

Signed-off-by: Pranay Samala <pranay.samala@intel.com>
---
 tests/kms_plane.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/tests/kms_plane.c b/tests/kms_plane.c
index 22c45ae5e..f0eb5a854 100644
--- a/tests/kms_plane.c
+++ b/tests/kms_plane.c
@@ -167,6 +167,7 @@ enum {
 	TEST_PANNING_TOP_LEFT           = 1 << 2,
 	TEST_PANNING_BOTTOM_RIGHT       = 1 << 3,
 	TEST_SUSPEND_RESUME             = 1 << 4,
+	TEST_PIXEL_FORMAT               = 1 << 5,
 };
 
 static const struct {
@@ -1469,6 +1470,15 @@ static void run_test(data_t *data, void (*test)(data_t *, enum pipe))
 	int count = 0;
 
 	for_each_crtc_with_single_output(&data->display, crtc, data->output) {
+		if ((data->flags & TEST_PIXEL_FORMAT) &&
+		    !igt_display_has_format_mod(&data->display,
+						DRM_FORMAT_XBGR8888,
+						data->mod)) {
+			igt_info("Skipping: Modifier " IGT_MODIFIER_FMT " not supported\n",
+				 IGT_MODIFIER_ARGS(data->mod));
+			continue;
+		}
+
 		igt_display_reset(&data->display);
 
 		igt_output_set_crtc(data->output,
@@ -1497,6 +1507,7 @@ run_tests_for_pipe_plane(data_t *data)
 		igt_describe("verify the pixel formats for given plane and pipe");
 		igt_subtest_with_dynamic_f("pixel-format-%s-modifier", modifiers[i].str) {
 			data->mod = modifiers[i].modifier;
+			data->flags = TEST_PIXEL_FORMAT;
 			run_test(data, test_pixel_formats);
 		}
 	}
@@ -1507,6 +1518,7 @@ run_tests_for_pipe_plane(data_t *data)
 					   modifiers[i].str) {
 			data->mod = modifiers[i].modifier;
 			data->crop = 4;
+			data->flags = TEST_PIXEL_FORMAT;
 			run_test(data, test_pixel_formats);
 		}
 		data->crop = 0;
-- 
2.34.1

