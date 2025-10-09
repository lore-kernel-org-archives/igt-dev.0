Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57A7DCCA471
	for <igt-dev@archiver.kernel.org>; Thu,  9 Oct 2025 06:29:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEC0110E915;
	Thu,  9 Oct 2025 06:29:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kLSjj7Am";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 451E410E915
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Oct 2025 06:29:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759991384; x=1791527384;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=vMy2aRrMAijYQ+4tYEymbMo2wx3YQrqcXCwDFwG1gTA=;
 b=kLSjj7AmNisMbg+rLWvrADfCyUsPi8wHS6GkASuB+Tkr3U/xsgBkCVB/
 BWFVALS9AqadDHut2L3y3memILWNa0Jk18pbkqEYd68eRJ4Gu4w/M/qAb
 aOj8J/HENiRt7VLEdiBBSBWwYBGq7AZKWxvj/vGkblhvoQPZNtX9iNhUB
 rBBFRf3aoAp+zuaTGql+fNpYSQ/XoIK7suMrm82/enDDwQ5PSO+Yj8CfG
 g+B9SDBu9Btk7QbYBPrpc7b3lylFTxV7SwPXRKcQYeF8Vra1sCIrR9u3a
 cwD37KZw6IHEmGTjQW2l6++/n/bWMgaZbGxWbtVjv2luQom+Z3fZBdQa9 Q==;
X-CSE-ConnectionGUID: 54qMnnrzRPKUzfTYoaRMLg==
X-CSE-MsgGUID: B89i323nRm+pxfigSC7nkw==
X-IronPort-AV: E=McAfee;i="6800,10657,11576"; a="62356864"
X-IronPort-AV: E=Sophos;i="6.19,215,1754982000"; d="scan'208";a="62356864"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 23:29:43 -0700
X-CSE-ConnectionGUID: GDbj6BSqTriTgsxajE5yPA==
X-CSE-MsgGUID: JvTqvcqVSR+YLmBXJf2iNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,215,1754982000"; d="scan'208";a="185928924"
Received: from jeevan-x299-aorus-gaming-3-pro.iind.intel.com ([10.227.90.91])
 by fmviesa004-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2025 23:29:40 -0700
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com, pranay.samala@intel.com,
 Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t] kms_flip_tiling: reduce exec time for sim env
Date: Thu,  9 Oct 2025 11:59:32 +0530
Message-ID: <20251009062932.1559735-1-jeevan.b@intel.com>
X-Mailer: git-send-email 2.43.0
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

For simulation environment, we can reduce execution time
by running test only with basic tiling combinations.

v2: Add helper to check basic tiling support.
v3: Rename helper to is_basic_tiling_modifier() and add comment.

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 tests/intel/kms_flip_tiling.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/tests/intel/kms_flip_tiling.c b/tests/intel/kms_flip_tiling.c
index ff9ad1229..d078653e9 100644
--- a/tests/intel/kms_flip_tiling.c
+++ b/tests/intel/kms_flip_tiling.c
@@ -84,6 +84,16 @@ static int try_commit(igt_display_t *display)
 				       COMMIT_ATOMIC : COMMIT_LEGACY);
 }
 
+/* This helper is used to restrict tests to commonly supported tiling modes
+ * across platforms for simulation.
+ */
+static bool is_basic_tiling_modifier(uint64_t mod)
+{
+	return mod == DRM_FORMAT_MOD_LINEAR ||
+	       mod == I915_FORMAT_MOD_4_TILED ||
+	       mod == I915_FORMAT_MOD_X_TILED;
+}
+
 static uint64_t pageflip_timeout_us(drmModeModeInfo *mode)
 {
 	uint64_t timeout_ns;
@@ -216,6 +226,7 @@ igt_main
 	igt_describe("Check pageflip between modifiers");
 	igt_subtest_with_dynamic("flip-change-tiling") {
 		enum pipe pipe;
+		bool run_in_simulation = igt_run_in_simulation();
 
 		for_each_pipe_with_valid_output(&data.display, pipe, output) {
 			igt_plane_t *plane;
@@ -242,6 +253,11 @@ igt_main
 					if (plane->formats[j] != data.testformat)
 						continue;
 
+					if (run_in_simulation &&
+					    (!is_basic_tiling_modifier(plane->modifiers[i]) ||
+					     !is_basic_tiling_modifier(plane->modifiers[j])))
+						continue;
+
 					igt_dynamic_f("pipe-%s-%s-%s-to-%s",
 						      kmstest_pipe_name(pipe),
 						      igt_output_name(output),
-- 
2.43.0

