Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1571ACCF2E3
	for <igt-dev@archiver.kernel.org>; Mon, 19 Oct 2026 13:14:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C56D110ED00;
	Mon, 19 Oct 2026 13:14:35 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBA3C10ED2C
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Oct 2026 13:13:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792415622; x=1823951622;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=NATjC+lfOfcUmkbiv77bRURD0abhhMW8Vzwpsti566w=;
 b=LNotabLELm4FYEq3EvFtp698pDjVIoMninCZDhsHJ8kStbGtbVO10v9p
 9FSFMs55P00uztpIuyvN9IMw2N2ncYbyQg2w9SKVJ4uB1XMyGSLuKj6nt
 4ZFtfCwrUNQ8Qtt6dkT0rrYZiMuXBP2bpNzQ2JkzO/gInVnZhVZEYq+3G
 p8B+V3wfI5QbkQpd6KPt6J9djpcQiUbGXZQVpfII0iz0lDrzNdY9/UDfR
 GvVM5yuKk8R1YfBqTnPz+0Tmla+3aVu2Th4/PldUsxQiYC7jV7rNfz7m0
 QTvWk6flp9RRKhiCuA8hUS8ZxRQWRefdYhV2ohaTW9AiD2WnaQNR30Ijh A==;
X-CSE-ConnectionGUID: On+qQeq8RhCW6/SfUZLb7Q==
X-CSE-MsgGUID: SCfMCJ99RxmOPDb3xSYQ0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11939"; a="1105876"
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="1105876"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2026 06:13:42 -0700
X-CSE-ConnectionGUID: iYDf5YMsSGGLtv1viM8a6A==
X-CSE-MsgGUID: cMnRfJR0QlmfraWunQj2QQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="2869841"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.54])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2026 06:13:40 -0700
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com,
	pranay.samala@intel.com
Subject: [PATCH i-g-t] tests/kms_color: Fix simulation check placement
Date: Mon, 19 Oct 2026 18:43:31 +0530
Message-ID: <20261019131331.722457-1-pranay.samala@intel.com>
X-Mailer: git-send-email 2.53.0
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

Move the simulation check out of the dynamic block, so that
it stops the crtc loop after the first pipe on simulation.

Fixes: e8695996452f ("tests/kms_color: Add background-color subtest to test the BACKGROUND_COLOR property")

Signed-off-by: Pranay Samala <pranay.samala@intel.com>
---
 tests/kms_color.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/tests/kms_color.c b/tests/kms_color.c
index fd419489d..c6401d38c 100644
--- a/tests/kms_color.c
+++ b/tests/kms_color.c
@@ -1247,12 +1247,11 @@ run_tests_for_pipe(data_t *data)
 	igt_describe("Verify that the background color is set correctly");
 	igt_subtest_with_dynamic("background-color") {
 		for_each_crtc_with_valid_output(&data->display, crtc, data->output) {
-			igt_dynamic_f("pipe-%s-background-color", igt_crtc_name(crtc)) {
+			igt_dynamic_f("pipe-%s-background-color", igt_crtc_name(crtc))
 				run_background_color_tests_for_crtc(data, crtc, data->output);
 
-				if (igt_run_in_simulation())
-					break;
-			}
+			if (igt_run_in_simulation())
+				break;
 		}
 	}
 }
-- 
2.53.0

