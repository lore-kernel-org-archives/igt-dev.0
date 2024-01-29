Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 718EAC48285
	for <igt-dev@archiver.kernel.org>; Mon, 29 Jan 2024 16:16:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2563A10E840;
	Mon, 29 Jan 2024 16:16:40 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 113A810E4D2
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Jan 2024 16:16:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706544995; x=1738080995;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=z1wtnh9pqnAKHSsxG/h1Eun2uC07eQRwUn3vRFkDlwY=;
 b=Q5MALaG8EfhFLGs/V7ex6vvWyo3nudRvUmVaLHklLjb+5CUqFNgvmnKh
 CNvdCOBhsU346xHo+k6DUalyqm2uBT2h9CovKzLJl0HE706zfh30BU5H2
 Asyh+d2JKrlU55WCdIy5SgysQ0saEwA+ux95AkgDMgn+X0A0z41bAV8vV
 7nklAcIFiBxdZe+F8+dxmRcx3iV8xKaGbaZb/Gdth8AxyeZ8dSa+9Ef3B
 OisR4/x58kNauJVYNyJGr2C39xcdv4CzL+ZtNW4Jgw6GZRMRpR+USSYHk
 uASJRuCGEyXqQJ/lZXjDTW7ydmnfPw4MOVilBc8RxFsj1RUC4LXUMnHxB Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10968"; a="401862250"
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; d="scan'208";a="401862250"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2024 08:16:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10968"; a="960935463"
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; d="scan'208";a="960935463"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orsmga005-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2024 08:16:03 -0800
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 1/2] tests/kms_feature_discovery: make display test
 dynamic
Date: Mon, 29 Jan 2024 21:55:34 +0530
Message-Id: <20240129162535.1462795-2-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240129162535.1462795-1-kunal1.joshi@intel.com>
References: <20240129162535.1462795-1-kunal1.joshi@intel.com>
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
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

currently kms_feature_discovery@display checks for number
of display from 1 to 4, make it dynamic to check from 1 to n
also reducing unwanted skips.

anyone who needs to check number of displays for a particular
config can check kms_feature_discovery@display test result.

Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/kms_feature_discovery.c | 35 ++++++-----------------------------
 1 file changed, 6 insertions(+), 29 deletions(-)

diff --git a/tests/kms_feature_discovery.c b/tests/kms_feature_discovery.c
index 5bca9ad76..e45c30ece 100644
--- a/tests/kms_feature_discovery.c
+++ b/tests/kms_feature_discovery.c
@@ -47,10 +47,6 @@
  * SUBTEST: display
  * Description: Make sure that we have display support.
  *
- * SUBTEST: display-%dx
- * Description: Make sure that we have display support with %arg[1]
- * 		outputs connected.
- *
  * SUBTEST: chamelium
  * Description: Make sure that Chamelium is configured and reachable.
  * Functionality: feature_discovery, chamelium
@@ -69,8 +65,6 @@
  * Description: Make sure that we have DP-MST configuration.
  * Functionality: feature_discovery, mst
  * Test category: functionality test
- *
- * arg[1].values: 1, 2, 3, 4
  */
 
 static igt_display_t display;
@@ -92,11 +86,6 @@ igt_main {
 			igt_display_require(&display, fd);
 		}
 
-		igt_describe("Make sure that we have display support.");
-		igt_subtest("display") {
-			/* will skip because of the fixture */
-		}
-
 		igt_subtest_group {
 			volatile int output_count = 0;
 			igt_output_t *output;
@@ -119,24 +108,12 @@ igt_main {
 				}
 			}
 
-			igt_describe("Make sure that we can use at least 1 output at the same time.");
-			igt_subtest("display-1x") {
-				igt_require(output_count >= 1);
-			}
-
-			igt_describe("Make sure that we can use at least 2 outputs at the same time.");
-			igt_subtest("display-2x") {
-				igt_require(output_count >= 2);
-			}
-
-			igt_describe("Make sure that we can use at least 3 outputs at the same time.");
-			igt_subtest("display-3x") {
-				igt_require(output_count >= 3);
-			}
-
-			igt_describe("Make sure that we can use at least 4 outputs at the same time.");
-			igt_subtest("display-4x") {
-				igt_require(output_count >= 4);
+			igt_describe("Make sure that we can use at least n output at the same time.");
+			igt_subtest_with_dynamic("display") {
+				int i;
+				for(i = 1; i <= output_count; i++)
+					igt_dynamic_f("-%dx", i)
+						igt_require(output_count >= i);
 			}
 		}
 
-- 
2.25.1

