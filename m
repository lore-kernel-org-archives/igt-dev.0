Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 222A6EC1EA6
	for <igt-dev@archiver.kernel.org>; Thu,  5 Feb 2026 11:35:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C972E10E877;
	Thu,  5 Feb 2026 11:35:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hkG8Txs2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F08B10E873
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Feb 2026 11:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770291348; x=1801827348;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eWpa7Cio8DQimSYQLRlkw3hZPYHN0vByTRz3nJ++3pM=;
 b=hkG8Txs20nEw8PKm32Uuc1f0/ZMugY2weP/O33FqlnnwPT/WhKGord04
 H1Fd1vDJIIDwhvaxsq1ZAuoI8fcwBP3bHEPdxzCsIocxCLcyzuhdRPmRh
 wxO6VWKM5eTLb+XAuX8mZy8tj9THL17rMtqs8xcBTFttPQE5+SygsCxwN
 zei2qlGVvVkqo3qBMUo64FNgi9Ps4W1flVsn+8P66QpbPiGEujx++ukue
 xGNOboxql4FWVHP+G1FyD8b7EwsrmljmW03SO7xhB+eSnyc7UIfOhoho0
 GLDb//yVByy1KtP+iHd6yfYGCcbUorHUBrlHjr6aBKB96PLCp6M3bRLbq Q==;
X-CSE-ConnectionGUID: u7HBwLaYTIuhrncxWn00wQ==
X-CSE-MsgGUID: 6G3IJwqYSxeLiqwhRFuWrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="71386094"
X-IronPort-AV: E=Sophos;i="6.21,274,1763452800"; d="scan'208";a="71386094"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2026 03:35:48 -0800
X-CSE-ConnectionGUID: Rh0Pm5iMRbKhFWZ7J63OHA==
X-CSE-MsgGUID: Ke1mXL9BQDSUl40WjCSVrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,274,1763452800"; d="scan'208";a="248096040"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.54])
 by orviesa001.jf.intel.com with ESMTP; 05 Feb 2026 03:35:47 -0800
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, ramanaidu.naladala@intel.com,
 sameer.lattannavar@intel.com, pranay.samala@intel.com
Subject: [PATCH i-g-t v3 1/2] tests/kms_plane: Skip cursor plane for source
 clamping
Date: Thu,  5 Feb 2026 17:16:18 +0530
Message-Id: <20260205114619.1054849-2-pranay.samala@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260205114619.1054849-1-pranay.samala@intel.com>
References: <20260205114619.1054849-1-pranay.samala@intel.com>
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

Avoid running source clamping tests on cursor plane,
which do not support clamping.

Signed-off-by: Pranay Samala <pranay.samala@intel.com>
---
 tests/kms_plane.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/tests/kms_plane.c b/tests/kms_plane.c
index 2be10f032..a7b1bf25d 100644
--- a/tests/kms_plane.c
+++ b/tests/kms_plane.c
@@ -1090,12 +1090,6 @@ static void test_format_plane(data_t *data, enum pipe pipe,
 	bool result = true;
 	bool found = false;
 
-	/*
-	 * No clamping test for cursor plane
-	 */
-	if (data->crop != 0 && plane->type == DRM_PLANE_TYPE_CURSOR)
-		igt_skip("Clamping is invalid for the cursor plane.\n");
-
 	for (int i = 0; i < plane->format_mod_count; i++) {
 		if (data->mod == plane->modifiers[i]) {
 			found = true;
@@ -1288,6 +1282,9 @@ test_pixel_formats(data_t *data, enum pipe pipe)
 	for_each_plane_on_pipe(&data->display, pipe, plane) {
 		if (skip_plane(data, plane))
 			continue;
+		if (data->crop != 0 && plane->type == DRM_PLANE_TYPE_CURSOR)
+			continue;
+
 		igt_dynamic_f("pipe-%s-plane-%u", kmstest_pipe_name(pipe), plane->index)
 			test_format_plane(data, pipe, output, plane, &primary_fb);
 	}
-- 
2.34.1

