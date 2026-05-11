Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30581CD3427
	for <igt-dev@archiver.kernel.org>; Mon, 11 May 2026 03:42:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D564E10E461;
	Mon, 11 May 2026 03:42:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aouVxMKK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E3B610E461
 for <igt-dev@lists.freedesktop.org>; Mon, 11 May 2026 03:41:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778470909; x=1810006909;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2wwwww2ewoD+Dgh+hwL1KVokilx1te0lOB+xvpZmK9c=;
 b=aouVxMKKlZO3MxV2F+Z6Ks1ayjjjV+iJb+oxCvLP+oYDWpHlf55DVlV3
 qCUNrQVmHxLvcpQRQasSpD/oMDXXOBZjNVvl6tUBcScBSXHhc3MaFFLcW
 MqAwC11RliflITSy0t8M1y6uEhwoz4m/IjdtIMx/vQmuaAG1c+tjeprMk
 2DiwzFIJ9WxPICl+FwcQVbEO8OfNQ9hy/dFIMMkNlvzeu07LS3EVh8oyS
 6AzzQIAOkE1FfpiVtJmjhCQsN8fKn6lM+mIVAYbERBeSSmmB73CnRuTPz
 T7qZHoxULce4NfmP9ZUVcy5jT7mWnIAA0UxgXxi+pGE3Gwo4dG/ElM+Ng g==;
X-CSE-ConnectionGUID: 7rgAXtZ/QOWkXe3RO2rRNQ==
X-CSE-MsgGUID: Z56hGucFTnax846TdyFrhQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11782"; a="78380776"
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; d="scan'208";a="78380776"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2026 20:41:49 -0700
X-CSE-ConnectionGUID: aKvO2WnVSBa5LiUJ6zcApA==
X-CSE-MsgGUID: uJyB8q1tQPaG8UbG13XAYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; d="scan'208";a="242309102"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by fmviesa005.fm.intel.com with ESMTP; 10 May 2026 20:41:48 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com, santhosh.reddy.guddati@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH i-g-t 1/2] tests/kms_content_protection: Group all
 force_hdcp14 tests together
Date: Mon, 11 May 2026 09:11:37 +0530
Message-Id: <20260511034137.93127-2-suraj.kandpal@intel.com>
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
tests.
The only exception here is the DPMS and suspend resume test which are
run last since the help MST DOCK to return back to good state.

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 tests/kms_content_protection.c | 64 +++++++++++++++++-----------------
 1 file changed, 32 insertions(+), 32 deletions(-)

diff --git a/tests/kms_content_protection.c b/tests/kms_content_protection.c
index a42f699e9..3baf225cd 100644
--- a/tests/kms_content_protection.c
+++ b/tests/kms_content_protection.c
@@ -1025,42 +1025,17 @@ static const struct {
 	bool content_type;
 	bool is_force_hdcp14;
 } subtests[] = {
-	{ .desc = "Test content protection with atomic modesetting with HDCP1.4.",
-	  .name = "atomic-hdcp14",
-	  .cp_tests = 0,
-	  .content_type = HDCP_CONTENT_TYPE_0,
-	  .is_force_hdcp14 = true,
-	},
 	{ .desc = "Test content protection with atomic modesetting",
 	  .name = "atomic",
 	  .cp_tests = 0,
 	  .content_type = HDCP_CONTENT_TYPE_0,
 	  .is_force_hdcp14 = false,
 	},
-	{ .desc = "Test content protection with DPMS ON/OFF during "
-		  "atomic modesetting with HDCP1.4.",
-	  .name = "atomic-dpms-hdcp14",
-	  .cp_tests = CP_DPMS,
-	  .content_type = HDCP_CONTENT_TYPE_0,
-	  .is_force_hdcp14 = true,
-	},
-	{ .desc = "Test content protection with DPMS ON/OFF during atomic modesetting.",
-	  .name = "atomic-dpms",
-	  .cp_tests = CP_DPMS,
-	  .content_type = HDCP_CONTENT_TYPE_0,
-	  .is_force_hdcp14 = false,
-	},
 	{ .desc = "Test for the integrity of link with type 0 content.",
 	  .name = "lic-type-0",
 	  .cp_tests = CP_LIC,
 	  .content_type = HDCP_CONTENT_TYPE_0,
 	},
-	{ .desc = "Test for the integrity of link with type 0 content.",
-	  .name = "lic-type-0-hdcp14",
-	  .cp_tests = CP_LIC,
-	  .content_type = HDCP_CONTENT_TYPE_0,
-	  .is_force_hdcp14 = true,
-	},
 	{ .desc = "Test for the integrity of link with type 1 content",
 	  .name = "lic-type-1",
 	  .cp_tests = CP_LIC,
@@ -1093,13 +1068,6 @@ static const struct {
 	  .content_type = HDCP_CONTENT_TYPE_0,
 	  .is_force_hdcp14 = false,
 	},
-	{ .desc = "Test to detect the HDCP status change when we are reading the uevent "
-		  "sent with the corresponding connector id and property id.",
-	  .name = "uevent-hdcp14",
-	  .cp_tests = CP_UEVENT,
-	  .content_type = HDCP_CONTENT_TYPE_0,
-	  .is_force_hdcp14 = true,
-	},
 	/*
 	 *  Testing the revocation check through SRM needs a HDCP sink with
 	 *  programmable Ksvs or we need a uAPI from kernel to read the
@@ -1115,6 +1083,38 @@ static const struct {
 	  .content_type = HDCP_CONTENT_TYPE_0,
 	  .is_force_hdcp14 = false,
 	},
+	{ .desc = "Test content protection with atomic modesetting with HDCP1.4.",
+	  .name = "atomic-hdcp14",
+	  .cp_tests = 0,
+	  .content_type = HDCP_CONTENT_TYPE_0,
+	  .is_force_hdcp14 = true,
+	},
+	{ .desc = "Test for the integrity of link with type 0 content.",
+	  .name = "lic-type-0-hdcp14",
+	  .cp_tests = CP_LIC,
+	  .content_type = HDCP_CONTENT_TYPE_0,
+	  .is_force_hdcp14 = true,
+	},
+	{ .desc = "Test to detect the HDCP status change when we are reading the uevent "
+		  "sent with the corresponding connector id and property id.",
+	  .name = "uevent-hdcp14",
+	  .cp_tests = CP_UEVENT,
+	  .content_type = HDCP_CONTENT_TYPE_0,
+	  .is_force_hdcp14 = true,
+	},
+	{ .desc = "Test content protection with DPMS ON/OFF during "
+		  "atomic modesetting with HDCP1.4.",
+	  .name = "atomic-dpms-hdcp14",
+	  .cp_tests = CP_DPMS,
+	  .content_type = HDCP_CONTENT_TYPE_0,
+	  .is_force_hdcp14 = true,
+	},
+	{ .desc = "Test content protection with DPMS ON/OFF during atomic modesetting.",
+	  .name = "atomic-dpms",
+	  .cp_tests = CP_DPMS,
+	  .content_type = HDCP_CONTENT_TYPE_0,
+	  .is_force_hdcp14 = false,
+	},
 	{.desc = "Test to verify the behaviour of HDCP after suspend resume cycles.",
 	 .name = "suspend-resume",
 	 .cp_tests = SUSPEND_RESUME,
-- 
2.34.1

