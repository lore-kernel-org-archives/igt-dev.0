Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0D0BC61DFD
	for <igt-dev@archiver.kernel.org>; Mon, 31 Aug 2026 19:24:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81E4810E33F;
	Mon, 31 Aug 2026 19:24:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iqOvSBRJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3F0410E33F
 for <igt-dev@lists.freedesktop.org>; Mon, 31 Aug 2026 19:20:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788204043; x=1819740043;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NxLjyDr3RSn8h5oV5FP7LE2JYn6UrgHzF8JiLMBtS0A=;
 b=iqOvSBRJTNorBDIPvFmm8tr9euiI1r3ZVl7/1qU44Y6/9pcOlXvYen9x
 TQXrnuUXnDynxZBJORF5Wp/O1Blma5rJxzogdWIcz78/JxX3/g8MnDoWF
 lveKvVZzTitlZ9H0xFBvusomjGAyXJA7C1m9t58eEJeysMfg0ZWHOTtRc
 XiqusUwFMDSLzfVPVMfazvFbpw27BhWaBsByhckoLtOEtGlNTw6KxINzk
 /xlpi9ABO/1166ZPe6D7QFBZIjugax7dnTZZCpDb7c9Flf3j/zbmwEvdi
 rKfnSR93wmqHRqDJgpJ6Fu6h+hxhKkhcg0Y6Yf97YZRo9y/JtJtpWzpsy g==;
X-CSE-ConnectionGUID: 4sqd0J5bS3CQK8r74btDYg==
X-CSE-MsgGUID: P8SzNSgCS0WT1r9Z3G2iRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11892"; a="88549125"
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; d="scan'208";a="88549125"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2026 12:20:43 -0700
X-CSE-ConnectionGUID: PvlnK/wGTgWB8HUa0xNDtg==
X-CSE-MsgGUID: cWCgFPQpTCS2zZwqd8e3WQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; d="scan'208";a="272392373"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 12:20:42 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: chaitanya.kumar.borah@intel.com,
	Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t,
 v5 7/7] tests/chamelium/kms_chamelium_color_pipeline: Fix CRTC naming
Date: Tue,  1 Sep 2026 00:59:35 +0530
Message-Id: <20260831192935.463134-8-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260831192935.463134-1-swati2.sharma@intel.com>
References: <20260831192935.463134-1-swati2.sharma@intel.com>
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

Use igt_crtc_name() instead of kmstest_pipe_name(crtc->pipe).

Assisted-by: GitHub Copilot
Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/chamelium/kms_chamelium_color_pipeline.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/chamelium/kms_chamelium_color_pipeline.c b/tests/chamelium/kms_chamelium_color_pipeline.c
index c69783450..99d3c9719 100644
--- a/tests/chamelium/kms_chamelium_color_pipeline.c
+++ b/tests/chamelium/kms_chamelium_color_pipeline.c
@@ -224,7 +224,7 @@ test_plane_colorops(data_t *data, igt_crtc_t *crtc,
 		if (!igt_plane_has_prop(plane, IGT_PLANE_COLOR_PIPELINE))
 			continue;
 
-		igt_dynamic_f("pipe-%s-plane-%u", kmstest_pipe_name(crtc->pipe), plane_id)
+		igt_dynamic_f("pipe-%s-plane-%u", igt_crtc_name(crtc), plane_id)
 			_test_plane_colorops(data, plane, fb_colors,
 					     exp_colors, colorops,
 					     data->ports[port_idx],
-- 
2.25.1

