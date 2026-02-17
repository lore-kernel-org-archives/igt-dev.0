Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46C67E83856
	for <igt-dev@archiver.kernel.org>; Tue, 17 Feb 2026 05:45:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE3BA10E43F;
	Tue, 17 Feb 2026 05:45:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GtOuCQ/G";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB20C10E43F
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Feb 2026 05:45:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771307127; x=1802843127;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=RW93Ctd/aho2XswaYXSpYbCNE6ijov1GJ00GpA5gWXI=;
 b=GtOuCQ/Gc8+GijE4qHmmC4IuLfUjZsipuvYS0JgWyPUL/GFCczbo+z71
 4sxzL5tnxMVOMx8sD5zwJJl5PM43WuHDigSS/T+umzYm+7tOhZVDqlaiW
 Z7Vr/C07rKgV2DL6sdi/R6QmYyECEorA6hpbbUNH5FtnLcUz+A1sWxh3g
 vkCjvwdj+Kt/Oyu4fcScxXV5EzIJyDZlHkfJEJgtHkozijKLfIm3DIbSb
 yYR2XasqxM5b3HjgJXnK8YlpSvgcB+8WFLTAzepHpxZnq5TkcJbzooAW1
 sQ1hS52wQk0JuwWAAxHBvDka6+YDWeGTcdhis92Czi5K024z++s4scRBO g==;
X-CSE-ConnectionGUID: BRICRy/MRdq7/tWScMIpHQ==
X-CSE-MsgGUID: J+HC0DySROaFseWbHFBs4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11703"; a="83736657"
X-IronPort-AV: E=Sophos;i="6.21,295,1763452800"; d="scan'208";a="83736657"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2026 21:45:27 -0800
X-CSE-ConnectionGUID: zT49ciXRRW+9qU5S8gZqxA==
X-CSE-MsgGUID: RAwcHmdxS5ysYsGGjjyBNQ==
X-ExtLoop1: 1
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.54])
 by fmviesa003.fm.intel.com with ESMTP; 16 Feb 2026 21:45:26 -0800
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, sameer.lattannavar@intel.com,
 pranay.samala@intel.com
Subject: [PATCH i-g-t] tests/kms_plane: Optimize modifier check for
 unsupported platforms
Date: Tue, 17 Feb 2026 11:26:06 +0530
Message-Id: <20260217055606.1595789-1-pranay.samala@intel.com>
X-Mailer: git-send-email 2.34.1
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

Optimize the modifier check by moving it outside the CRTC/Output loop.
This avoids redundancy and ensures the test is cleanly skipped.

Fixes: a4805b36cf23 ("tests/kms_plane: Skip unsupported modifiers")
Signed-off-by: Pranay Samala <pranay.samala@intel.com>
---
 tests/kms_plane.c | 18 +++++++-----------
 1 file changed, 7 insertions(+), 11 deletions(-)

diff --git a/tests/kms_plane.c b/tests/kms_plane.c
index 362748cdb..f37b019d1 100644
--- a/tests/kms_plane.c
+++ b/tests/kms_plane.c
@@ -1489,18 +1489,14 @@ static void run_test(data_t *data, void (*test)(data_t *, enum pipe))
 	igt_crtc_t *crtc;
 	int count = 0;
 
+	igt_skip_on_f(((data->flags & TEST_PIXEL_FORMAT) &&
+		       !igt_display_has_format_mod(&data->display,
+		       DRM_FORMAT_XBGR8888, data->mod)),
+		       "Skipping: Modifier " IGT_MODIFIER_FMT
+		       " is not supported on this platform\n",
+		       IGT_MODIFIER_ARGS(data->mod));
+
 	for_each_crtc_with_single_output(&data->display, crtc, data->output) {
-		if ((data->flags & TEST_PIXEL_FORMAT) &&
-		    !igt_display_has_format_mod(&data->display,
-						DRM_FORMAT_XBGR8888,
-						data->mod)) {
-			igt_info("Skipping: Modifier " IGT_MODIFIER_FMT
-				 " is not supported on pipe %s, output %s\n",
-				 IGT_MODIFIER_ARGS(data->mod),
-				 kmstest_pipe_name(crtc->pipe),
-				 igt_output_name(data->output));
-			continue;
-		}
 
 		igt_display_reset(&data->display);
 
-- 
2.34.1

