Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A375DD6A221
	for <igt-dev@archiver.kernel.org>; Thu, 14 Nov 2024 18:02:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EE4E10E36E;
	Thu, 14 Nov 2024 18:02:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UptGHjqM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8988A10E36E
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Nov 2024 18:02:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731607338; x=1763143338;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=rCDYZBdyLmOrBgfz6XasbOiTbebAtmRegBubpoh9esc=;
 b=UptGHjqMSB3cRQcAKZDoewiJgJxqrGdjXEGgzpnXUZel+KZQAUfpljF4
 epZh1CkfRTeuNbdEQXB6R865reQE5eF2hw4Ke3MewtUXPHPrJd8wZhHqQ
 Ye3YepTdMsYnP496SGLu85wdR5PA9I5UlpiT8nton53oKsWGQ8gQaJTZ2
 V3xADczmVS+OiEfkx20athKDrmdPPJJqcZEtqVmHqTcWkMgI79S6Rh8Lo
 OM5qkN2Y/KaN4XQlOO07hxq15bWUTgkv9EzLsnr9fmrtKPMYi7DknKXJu
 knadRj3R7NCMmkLRs4wmi99jKU7IyUG8tWmRBNeWLLuksudNS9favH6Oi w==;
X-CSE-ConnectionGUID: PXOT5AcFRpmQ/1ittYfM/w==
X-CSE-MsgGUID: y3FNiYYZTeS1ki+SOaqevA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="31757564"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="31757564"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2024 10:02:18 -0800
X-CSE-ConnectionGUID: ox4M2x/3Se6GN6Ar+tJmBg==
X-CSE-MsgGUID: mPLMpHgxQqi+9E5VrUvj3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,154,1728975600"; d="scan'208";a="88704658"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by fmviesa009-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2024 10:02:16 -0800
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: santhosh.reddy.guddati@intel.com,
	Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t] tests/kms_display_modes: Skip test if big joiner
 display is connected
Date: Thu, 14 Nov 2024 23:46:47 +0530
Message-Id: <20241114181647.1499084-1-jeevan.b@intel.com>
X-Mailer: git-send-email 2.25.1
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

High-resolution displays that support big joiner can cause extended mode
tests to fail. This commit introduces a check to skip these tests if a
big joiner display is connected, ensuring the test suite runs smoothly
without unnecessary failures.

v2: Add ultra joiner check.

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 tests/kms_display_modes.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/tests/kms_display_modes.c b/tests/kms_display_modes.c
index f1d8ab03d..eefe4e85e 100644
--- a/tests/kms_display_modes.c
+++ b/tests/kms_display_modes.c
@@ -318,6 +318,14 @@ igt_main
 		igt_display_require_output(&data.display);
 
 		for_each_connected_output(&data.display, output) {
+			drmModeConnector *connector = output->config.connector;
+			drmModeModeInfo mode;
+			int max_dotclock = igt_get_max_dotclock(data.drm_fd);
+
+			igt_require_f(!bigjoiner_mode_found(data.drm_fd, connector, max_dotclock, &mode),
+				      "Big Joiner Connector Found Unsupported Config\n");
+			igt_require_f(!ultrajoiner_mode_found(data.drm_fd, connector, max_dotclock, &mode),
+				      "Ultra Joiner Connector Found Unsupported Config\n");
 			data.mst_output[count++] = output;
 			if (output_is_dp_mst(&data, output, dp_mst_outputs))
 				dp_mst_outputs++;
-- 
2.25.1

