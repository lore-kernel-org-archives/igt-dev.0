Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE5C1F42122
	for <igt-dev@archiver.kernel.org>; Wed, 15 Apr 2026 18:20:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D1F410E729;
	Wed, 15 Apr 2026 18:20:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YCpybyRK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFB1510E729
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Apr 2026 18:20:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776277212; x=1807813212;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=VCd2vEnGD+AHXQZ2r0QRlq+mzvY8jSptXYDIbjogHFE=;
 b=YCpybyRKy17od9YlFqAYJOThGJX49UydUrAcD6afhurmBgW3qF2HTkBH
 o8ltR3o2Rul/bxhgmVbX5aQgsKP0zHOzuTIqwONclDebXHSSSIvspK4oD
 PAzy3v9yGe4CHF352zc3c3/KhKHmV3FF9ZZi8j7wIDgZzyvaHTivSOE6H
 YyP26n2jdC8UDK7nBPY2TKKFnNdtrrrbYKAkGxMph7J+UaMuGNfYHqu6h
 1YiW53LYBlvyUBkPFrQswL1RLy7vLfrYgyzt305Yp2ZsPFAHzsInrflnd
 S19Mz3K8wiUQmu/BfAPgQvDEfAc/5LOUXNTrCw57Xckv5V+I2GT1SeMw4 Q==;
X-CSE-ConnectionGUID: eTwjiCSJRsOT43QE2tmFTg==
X-CSE-MsgGUID: b8yrDI0mQq2F+GKZqKdDvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11760"; a="88348822"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="88348822"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2026 11:20:11 -0700
X-CSE-ConnectionGUID: tECvKnurT3Kag3x8J3RGSg==
X-CSE-MsgGUID: w2IH8gcnSummBtNkhtw5/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="225794006"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by fmviesa006-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2026 11:20:09 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Swati Sharma <swati2.sharma@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
Subject: [PATCH i-g-t] tests/kms_invalid_mode: Remove outdated fixed mode check
Date: Wed, 15 Apr 2026 23:58:53 +0530
Message-Id: <20260415182853.1045081-1-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Remove the has_scaling_mode_prop() check and associated FIXME in
adjust_mode_clock_too_high(). The kernel already rejects modes
whose vrefresh doesn't match any of the connector's fixed modes,
making this skip unnecessary.

v2: -remove the outdated fixed mode check entirely

Suggested-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/kms_invalid_mode.c | 19 -------------------
 1 file changed, 19 deletions(-)

diff --git a/tests/kms_invalid_mode.c b/tests/kms_invalid_mode.c
index 5edffb649..8bdfa70ef 100644
--- a/tests/kms_invalid_mode.c
+++ b/tests/kms_invalid_mode.c
@@ -72,14 +72,6 @@ struct _data {
 	bool (*adjust_mode)(data_t *data, drmModeModeInfoPtr mode);
 };
 
-static bool has_scaling_mode_prop(data_t *data)
-{
-	return kmstest_get_property(data->drm_fd,
-				    data->output->id,
-				    DRM_MODE_OBJECT_CONNECTOR,
-				    "scaling mode",
-				    NULL, NULL, NULL);
-}
 static bool
 can_bigjoiner(data_t *data)
 {
@@ -128,17 +120,6 @@ adjust_mode_clock_too_high(data_t *data, drmModeModeInfoPtr mode)
 
 	igt_require(max_dotclock != 0);
 
-	/*
-	 * FIXME When we have a fixed mode, the kernel will ignore
-	 * the user timings apart from hdisplay/vdisplay. Should
-	 * fix the kernel to at least make sure the requested
-	 * refresh rate as specified by the user timings will
-	 * roughly match the user will get. For now skip the
-	 * test on  any connector with a fixed mode.
-	 */
-	if (has_scaling_mode_prop(data))
-		return false;
-
 	/*
 	 * Newer platforms can support modes higher than the maximum dot clock
 	 * by using pipe joiner, so set the mode clock twice that of maximum
-- 
2.25.1

