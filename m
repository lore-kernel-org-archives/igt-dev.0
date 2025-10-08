Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 346B0CAC5BB
	for <igt-dev@archiver.kernel.org>; Wed,  8 Oct 2025 04:31:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7E5510E0A6;
	Wed,  8 Oct 2025 04:31:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hHU1mawh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F42010E07B
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Oct 2025 04:31:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759897877; x=1791433877;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=fVoZpyX1vxAZhWX/LHhoISk6jC8rTGaDW9/CPnmWi9I=;
 b=hHU1mawhVGZY6xDnZ/01oqIj21ZXhGBCDbCwz6wS2PSEYtQZj1ULL737
 CLdOvBdVqQbxL5nlYFBUGyNxsVXx1G3G3PBJ4pdWBwM1aIxbNnWSu0IBo
 +EgPQBr+sJryeWkYS3YGhLn/CI3QH/YlLHgpnjT8gF+Plu8Ji047c4/pc
 dvWN7lp2Dghd6RPGJTDf4sa/qjLUTu9c1AFHcSn96Mm8E3OSEDbaVg2Fk
 KUqApm4LmWGH/jaVVWOCLeT5CvbLbMI5u1gE9RHWTuXInpwuDjxvYRt9I
 eSaQEQWO4VbzGU8VqcfUY/Hzd6xnskEOLD98cnupX7i0pN2qvLySw6c1y w==;
X-CSE-ConnectionGUID: kSH+ix4QRP6V81+MroJrcQ==
X-CSE-MsgGUID: LdmZr7xwSGC3nml+dffdNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11575"; a="61118813"
X-IronPort-AV: E=Sophos;i="6.18,323,1751266800"; d="scan'208";a="61118813"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 21:31:17 -0700
X-CSE-ConnectionGUID: L2KjNXjeSU+hiY8+RhhY3g==
X-CSE-MsgGUID: flODPSzbTvORpazpEoOcmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,323,1751266800"; d="scan'208";a="217435550"
Received: from jeevan-x299-aorus-gaming-3-pro.iind.intel.com ([10.227.90.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 21:31:16 -0700
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com,
	Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t] kms_flip_tiling: reduce exec. time for sim env
Date: Wed,  8 Oct 2025 10:01:07 +0530
Message-ID: <20251008043107.1536018-1-jeevan.b@intel.com>
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
by running test only with basic tiling combincations.

v2: Add helper to check basic tiling support.

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 tests/intel/kms_flip_tiling.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/tests/intel/kms_flip_tiling.c b/tests/intel/kms_flip_tiling.c
index ff9ad1229..72fe01daf 100644
--- a/tests/intel/kms_flip_tiling.c
+++ b/tests/intel/kms_flip_tiling.c
@@ -84,6 +84,13 @@ static int try_commit(igt_display_t *display)
 				       COMMIT_ATOMIC : COMMIT_LEGACY);
 }
 
+static bool is_allowed_modifier(uint64_t mod)
+{
+	return mod == DRM_FORMAT_MOD_LINEAR ||
+	       mod == I915_FORMAT_MOD_4_TILED ||
+	       mod == I915_FORMAT_MOD_X_TILED;
+}
+
 static uint64_t pageflip_timeout_us(drmModeModeInfo *mode)
 {
 	uint64_t timeout_ns;
@@ -242,6 +249,15 @@ igt_main
 					if (plane->formats[j] != data.testformat)
 						continue;
 
+					if (igt_run_in_simulation() &&
+					    !is_allowed_modifier(plane->modifiers[i]))
+						continue;
+
+					if (igt_run_in_simulation() &&
+					    !is_allowed_modifier(plane->modifiers[j]))
+						continue;
+
+
 					igt_dynamic_f("pipe-%s-%s-%s-to-%s",
 						      kmstest_pipe_name(pipe),
 						      igt_output_name(output),
-- 
2.43.0

