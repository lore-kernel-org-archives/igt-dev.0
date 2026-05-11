Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18A90CD37AC
	for <igt-dev@archiver.kernel.org>; Mon, 11 May 2026 03:42:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA94D10E461;
	Mon, 11 May 2026 03:42:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YRxQDiIK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09D5410E461
 for <igt-dev@lists.freedesktop.org>; Mon, 11 May 2026 03:41:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778470911; x=1810006911;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=n2qVP/RgCD4hZrTBaJK4+05yLl5te9rirxVGKsM06C4=;
 b=YRxQDiIKtPd/32CNIzfUMaYlq9+xiyvGrxFvdS296NJmqLBPfyqbWSgW
 m3WzjfVNGQxFwWxOg4GhNtcyAP78QTMdamTUC9XzPHFq2n23TTFaEyghA
 iikT6ssjl4ZwxCaxIIHvafzoX8XeiflvL+zvyMAkTHeUYR12azyEZpuaL
 3ugYHwwRgeUyef9TnGoqzuUeh8FSVRAzsmUaoUJn5eL7H0JnlB/46GMCb
 /TuiiIaN09JYuzqJb+6Cv79exPP0sXzBDzKTrIMMzU02CFbStc58Ql6ua
 lBxZ3KZ1VvQpqycrEU5K9QIpxvAWtVS0dAKqGSjZSsQaElw8nf0lOuLWw Q==;
X-CSE-ConnectionGUID: L2M8hCOhShW5NGULeO2CkA==
X-CSE-MsgGUID: I5VMpm1jRr6AzfOWV/GlCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11782"; a="78380778"
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; d="scan'208";a="78380778"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2026 20:41:51 -0700
X-CSE-ConnectionGUID: 4BwGCU6fSBCjb6x41fkr6w==
X-CSE-MsgGUID: HDHD9djhRVCmYTK8MayS8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; d="scan'208";a="242309105"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by fmviesa005.fm.intel.com with ESMTP; 10 May 2026 20:41:49 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com, santhosh.reddy.guddati@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH i-g-t 2/2] tests/kms_content_protection: Group all MST
 force_hdcp14 tests together
Date: Mon, 11 May 2026 09:11:38 +0530
Message-Id: <20260511034137.93127-3-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260511034137.93127-1-suraj.kandpal@intel.com>
References: <20260511034137.93127-1-suraj.kandpal@intel.com>
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

Change ordering of tests so that all force_hdcp14 test are run together,
that too after all the regular tests have been run.
Currently we are seeing these tests are putting MST DOCK in a bad state from
time to time where it can only report HDCP 1.4 after running these
tests or not reporting any HDCP capability causing test skips.
The only exception here is the DPMS and suspend resume test which are
run last since the help MST DOCK to return back to good state.

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 tests/kms_content_protection.c | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/tests/kms_content_protection.c b/tests/kms_content_protection.c
index 3baf225cd..c59441f11 100644
--- a/tests/kms_content_protection.c
+++ b/tests/kms_content_protection.c
@@ -1135,28 +1135,16 @@ static const struct {
 	  .content_type = HDCP_CONTENT_TYPE_0,
 	  .is_force_hdcp14 = false,
 	},
-	{ .desc = "Test Content protection(Type 0) over DP MST with HDCP1.4.",
-	  .name = "dp-mst-type-0-hdcp14",
+	{ .desc = "Test Content protection(Type 1) over DP MST.",
+	  .name = "dp-mst-type-1",
 	  .cp_tests = 0,
-	  .content_type = HDCP_CONTENT_TYPE_0,
-	  .is_force_hdcp14 = true,
-	},
-	{ .desc = "Test Content protection(Type 0) over DP MST with LIC.",
-	  .name = "dp-mst-lic-type-0",
-	  .cp_tests = CP_LIC,
-	  .content_type = HDCP_CONTENT_TYPE_0,
+	  .content_type = HDCP_CONTENT_TYPE_1,
 	  .is_force_hdcp14 = false,
 	},
 	{ .desc = "Test Content protection(Type 0) over DP MST with LIC.",
-	  .name = "dp-mst-lic-type-0-hdcp14",
+	  .name = "dp-mst-lic-type-0",
 	  .cp_tests = CP_LIC,
 	  .content_type = HDCP_CONTENT_TYPE_0,
-	  .is_force_hdcp14 = true,
-	},
-	{ .desc = "Test Content protection(Type 1) over DP MST.",
-	  .name = "dp-mst-type-1",
-	  .cp_tests = 0,
-	  .content_type = HDCP_CONTENT_TYPE_1,
 	  .is_force_hdcp14 = false,
 	},
 	{ .desc = "Test Content protection(Type 1) over DP MST with LIC.",
@@ -1165,6 +1153,18 @@ static const struct {
 	  .content_type = HDCP_CONTENT_TYPE_1,
 	  .is_force_hdcp14 = false,
 	},
+	{ .desc = "Test Content protection(Type 0) over DP MST with HDCP1.4.",
+	  .name = "dp-mst-type-0-hdcp14",
+	  .cp_tests = 0,
+	  .content_type = HDCP_CONTENT_TYPE_0,
+	  .is_force_hdcp14 = true,
+	},
+	{ .desc = "Test Content protection(Type 0) over DP MST with LIC.",
+	  .name = "dp-mst-lic-type-0-hdcp14",
+	  .cp_tests = CP_LIC,
+	  .content_type = HDCP_CONTENT_TYPE_0,
+	  .is_force_hdcp14 = true,
+	},
 	{ .desc = "Test Content protection(Type 0) over DP MST with suspend resume.",
 	  .name = "dp-mst-type-0-suspend-resume",
 	  .cp_tests = SUSPEND_RESUME,
-- 
2.34.1

