Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 413A8E83EE7
	for <igt-dev@archiver.kernel.org>; Wed,  4 Feb 2026 08:28:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCBDC10E564;
	Wed,  4 Feb 2026 08:28:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AV1sz0fb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E407A10E564
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Feb 2026 08:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770193726; x=1801729726;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5Bw6NM3ztU8otTAEKJiLEB7pdkSHNNlcW8tJQEGzDvQ=;
 b=AV1sz0fbLpOYoeVf8BBqBLbKPCcJYANa6+Ou3Edw0VXKg1IDRG7XnUw+
 bSeXA/a244L44AQ9otewBfMNUDub7zX5uuTUzIsvdMOA/g7IULEabGh5m
 5BXZ6rF+8rznObw1GzRhS2paKVWf3Hm3foqSRCClMqY/CxmMSWc6jLyCf
 mofHGKCO2khc7Et2o1n3CIOiOMXw7x+W932l5iv2TauISfrgtICEdqisr
 AlRUUud0irTXnYIP6FQK6RrruamgyRufsXyCVxqteCcX9AnY0or6qplTy
 KtaKrLiptKKyJHfUb8eoD2WvLnzR3INr5k8XLXqjblhacTgaivR8Zd1h4 Q==;
X-CSE-ConnectionGUID: TwSgI8jMRnqKCJJvg1c9BA==
X-CSE-MsgGUID: cOKbWqMpSnSFT1P2VXaUrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="71278298"
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; d="scan'208";a="71278298"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2026 00:28:46 -0800
X-CSE-ConnectionGUID: 3T//pSjVTmmxPAOxFayMTQ==
X-CSE-MsgGUID: oicyruGCQxeLEZiIAwjyWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; d="scan'208";a="240930504"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.54])
 by fmviesa001.fm.intel.com with ESMTP; 04 Feb 2026 00:28:44 -0800
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, ramanaidu.naladala@intel.com,
 sameer.lattannavar@intel.com, pranay.samala@intel.com
Subject: [PATCH i-g-t 2/2] tests/kms_plane: Skip unsupported modifiers
Date: Wed,  4 Feb 2026 14:09:13 +0530
Message-Id: <20260204083913.1048566-3-pranay.samala@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260204083913.1048566-1-pranay.samala@intel.com>
References: <20260204083913.1048566-1-pranay.samala@intel.com>
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

Signed-off-by: Pranay Samala <pranay.samala@intel.com>
---
 tests/kms_plane.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/tests/kms_plane.c b/tests/kms_plane.c
index a7b1bf25d..69d06d627 100644
--- a/tests/kms_plane.c
+++ b/tests/kms_plane.c
@@ -1495,6 +1495,10 @@ run_tests_for_pipe_plane(data_t *data)
 	for (int i = 0; i < ARRAY_SIZE(modifiers); i++) {
 		igt_describe("verify the pixel formats for given plane and pipe");
 		igt_subtest_with_dynamic_f("pixel-format-%s-modifier", modifiers[i].str) {
+			igt_require_f(igt_display_has_format_mod(&data->display,
+								 DRM_FORMAT_XRGB8888,
+								 modifiers[i].modifier),
+								 "Modifier not supported\n");
 			data->mod = modifiers[i].modifier;
 			run_test(data, test_pixel_formats);
 		}
@@ -1504,6 +1508,10 @@ run_tests_for_pipe_plane(data_t *data)
 		igt_describe("verify the pixel formats for given plane and pipe with source clamping");
 		igt_subtest_with_dynamic_f("pixel-format-%s-modifier-source-clamping",
 					   modifiers[i].str) {
+			igt_require_f(igt_display_has_format_mod(&data->display,
+								 DRM_FORMAT_XRGB8888,
+								 modifiers[i].modifier),
+								 "Modifier not supported\n");
 			data->mod = modifiers[i].modifier;
 			data->crop = 4;
 			run_test(data, test_pixel_formats);
-- 
2.34.1

