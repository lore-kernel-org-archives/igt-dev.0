Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39D2EC0219B
	for <igt-dev@archiver.kernel.org>; Mon, 10 Feb 2025 05:20:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B382F10E173;
	Mon, 10 Feb 2025 05:20:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DLngDcq3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9E8210E173
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Feb 2025 05:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739164817; x=1770700817;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=9ohv1W0XxhMDP7TyF7iHKlZVBDWBGFKuf0jUNbX+Fo4=;
 b=DLngDcq30uO/I9bmjMkoCKRNl8P1zgFncbt4W+ZGmhTSFyYl+lH+asE/
 eQHFOjA2NP82nFCDdbsQ4+SGxKl4v7SmLlyALknJ+GL4m2CByH933CkeS
 tUThKnowGM3k17K2h8yRSlCYgdRUXHQQTV0y8cHRg06wo9j0RZEnDcLLj
 xNgpyvYl7+wjQ1RYuTa4jUoM4GFB37ajIrfiVqssmrlWBmFcbO9MIXk7l
 RNDQT8P9LImPuJn5rKvMiMlIcCTG4wKgoAG/uQj2C7b5dgo/m+KDCIcPG
 t/vhVVRTRBysO/JoLeiY9b6rWqf4BQYttL5HEM+vqomtGEk1NyeZKQqQ7 w==;
X-CSE-ConnectionGUID: ZcEJoJOyTGe7n7Bk33nuuQ==
X-CSE-MsgGUID: PMyMwHLcTySmlnSB0KD3mQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11340"; a="50357910"
X-IronPort-AV: E=Sophos;i="6.13,273,1732608000"; d="scan'208";a="50357910"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2025 21:20:17 -0800
X-CSE-ConnectionGUID: FClkm3jwTMSK/ZQZMs02xA==
X-CSE-MsgGUID: Lv2erMbAS+2Du72pUmVT4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="142967394"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2025 21:20:15 -0800
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com, pranay.samala@intel.com,
 Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t] tests/kms_display_modes: Require minimum 2 outputs for
 extended mode test
Date: Mon, 10 Feb 2025 11:05:51 +0530
Message-Id: <20250210053551.1228000-1-jeevan.b@intel.com>
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

extended mode test needs minimum 2 display to run, so add igt_require
to check if the required criteria is met or not.

v2: Fix commit message.
v3: Update subject.

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 tests/kms_display_modes.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tests/kms_display_modes.c b/tests/kms_display_modes.c
index e41c60cc0..117f82325 100644
--- a/tests/kms_display_modes.c
+++ b/tests/kms_display_modes.c
@@ -335,8 +335,10 @@ igt_main
 	}
 
 	igt_describe("Test for validating display extended mode with a pair of connected displays");
-	igt_subtest_with_dynamic("extended-mode-basic")
+	igt_subtest_with_dynamic("extended-mode-basic") {
+		igt_require_f(count > 1, "Minimum 2 outputs are required\n");
 		run_extendedmode_test(&data);
+	}
 
 	igt_describe("Negative test for validating display extended mode with a pair of connected "
 		     "2k-4k or 4k-4k displays");
-- 
2.25.1

