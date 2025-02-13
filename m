Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D3E4C021A0
	for <igt-dev@archiver.kernel.org>; Thu, 13 Feb 2025 11:03:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 395D210EA5C;
	Thu, 13 Feb 2025 11:03:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AinFSolI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD42610EA5C
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Feb 2025 11:03:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739444637; x=1770980637;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=d1TFo0uNm1owChk5iPq+Wr0uRdwDkhyr0SWCeESqMqA=;
 b=AinFSolIvmViGiyec59+Tfx7Itb0u8yEneYNj5rCajWlrZARZ6F7rsKx
 yYE3fQxkYpnCCq4xEjGQohuZ2VofuCEcy7k77rSg2xglHPWvtIGAmQqfw
 oxGcPsVh1SzRa25pE3npV4agzsfzKivALF3obDY8JCpC4Ovm7dXvUYNyR
 tTkbzn7qQHcsc56n+7ZNl9d6aBKcmXASD7jCkD8/1kICgyxA7WxcTaWZE
 lc/oH+nZVSBoBzL3eW4t5thsFx1Wi02gOfVGazOomTz3gxs8heizBHIL/
 N46vhkRbbEVIaCiHhGMR40hBf2BveWAWVPG1LKSFKAWBMTreANZCMRT4Y w==;
X-CSE-ConnectionGUID: Lc6/t4EMS8iaNyQ8+fks4Q==
X-CSE-MsgGUID: LNMAFCQPRGmcmqmKVHIBWg==
X-IronPort-AV: E=McAfee;i="6700,10204,11343"; a="62609495"
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; d="scan'208";a="62609495"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2025 03:03:57 -0800
X-CSE-ConnectionGUID: xMot5+EeT+m0s/t7juSUJg==
X-CSE-MsgGUID: VG4+jIehQpC8NRr8KNmdRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; d="scan'208";a="113094077"
Received: from dut2122ptlh.iind.intel.com (HELO
 linux-X299-AORUS-Gaming-3-Pro.iind.intel.com) ([10.223.34.115])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2025 03:03:55 -0800
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com,
	Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t 5/5] tests/intel/kms_cdclk: Use igt_get_max_cdclk()
Date: Thu, 13 Feb 2025 16:38:14 +0530
Message-Id: <20250213110814.351186-6-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250213110814.351186-1-swati2.sharma@intel.com>
References: <20250213110814.351186-1-swati2.sharma@intel.com>
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

Replace hardcoded max cdclk freq with one computed from debugfs.
in igt_get_max_cdclk(). Also, add same condition for
all_outputs subtest.

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/intel/kms_cdclk.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tests/intel/kms_cdclk.c b/tests/intel/kms_cdclk.c
index eeb1ecd69..3596fd30c 100644
--- a/tests/intel/kms_cdclk.c
+++ b/tests/intel/kms_cdclk.c
@@ -53,7 +53,6 @@ IGT_TEST_DESCRIPTION("Test cdclk features : crawling and squashing");
 #define HDISPLAY_4K	3840
 #define VDISPLAY_4K	2160
 #define VREFRESH	60
-#define MAX_CDCLK_4K	307200
 
 /* Test flags */
 enum {
@@ -250,7 +249,7 @@ static void test_mode_transition(data_t *data, enum pipe pipe, igt_output_t *out
 	igt_info("CD clock frequency %d -> %d\n", cdclk_ref, cdclk_new);
 
 	/* cdclk should bump */
-	if (cdclk_new != MAX_CDCLK_4K)
+	if (cdclk_new != igt_get_max_cdclk(debugfs_fd))
 		igt_assert_lt(cdclk_ref, cdclk_new);
 
 	/* cleanup */
@@ -341,7 +340,8 @@ static void test_mode_transition_on_all_outputs(data_t *data)
 	igt_info("CD clock frequency %d -> %d\n", cdclk_ref, cdclk_new);
 
 	/* cdclk should bump */
-	igt_assert_lt(cdclk_ref, cdclk_new);
+	if (cdclk_new != igt_get_max_cdclk(debugfs_fd))
+		igt_assert_lt(cdclk_ref, cdclk_new);
 
 	do_cleanup_display(display);
 	igt_remove_fb(data->drm_fd, &fb);
-- 
2.25.1

