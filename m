Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39186F46452
	for <igt-dev@archiver.kernel.org>; Mon, 16 Mar 2026 11:20:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D37B210E4AC;
	Mon, 16 Mar 2026 11:20:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LqBaEGxh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFA9610E4A5
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2026 11:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773659998; x=1805195998;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZfswmA2CsNd2u6VLM52X5pjx1uaTXs+rk7kmOdQPPNM=;
 b=LqBaEGxhy5se+MRK2iYvXliBQgjiMczWnJs6AATSP8aerD4YHDuPc3Mx
 qPWIhGib4dYKc51G893cAxPqnjNmBasg6YMqAOpWQzPztawkJ4pz0ZAQN
 fFOcg6Q7JO55+Lb2Udua44DUMVqesg2w9DLK030k+0/7qWzJYUmVco6zT
 tUIwQs0zyML6m+G4Oqls1Nh8Vzd0MjHAsuFfD3iOFX6B+EedhOxkiNbm2
 GMqYzxurs/Obj5GdbY+Ch3bUnNh7unhWz91yDy0C+vRRtjDNw+k1N50PN
 UoMGGJd95noUDiqROSCaeHlOJwcdTD88uC2nlCn23cZJIGYMVuASx1Z2l g==;
X-CSE-ConnectionGUID: Bcsm9AZNTFK75d4KKTlKQQ==
X-CSE-MsgGUID: wY7TwWLMSOKqBPgco3oBPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11730"; a="92240288"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; d="scan'208";a="92240288"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2026 04:19:58 -0700
X-CSE-ConnectionGUID: 6aYeMst9Q32CSY3gW1dVHA==
X-CSE-MsgGUID: 1URKdWBkS7yLnkL9uw3ymg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; d="scan'208";a="226874379"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.238])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2026 04:19:56 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH i-g-t 08/12] tests/kms_bw: fix misleading indent
Date: Mon, 16 Mar 2026 13:19:10 +0200
Message-ID: <b6dc3977fa92067605c3fba8c82f30e442a3d085.1773659680.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1773659680.git.jani.nikula@intel.com>
References: <cover.1773659680.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

igt_subtest_f() starts a block. Indent the run_test_linear_tiling()
calls properly.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 tests/kms_bw.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/tests/kms_bw.c b/tests/kms_bw.c
index a6cb46e8244f..1c339f252a3e 100644
--- a/tests/kms_bw.c
+++ b/tests/kms_bw.c
@@ -317,17 +317,15 @@ int igt_main()
 	 * _amount_ of pipes */
 	for (i = 0; i < IGT_MAX_PIPES; i++) {
 		for (j = 0; j < ARRAY_SIZE(test_mode); j++) {
-			igt_subtest_f("linear-tiling-%d-displays-%s", i+1,
-			      test_mode[j].name)
-			run_test_linear_tiling(&data, i, &test_mode[j], false);
+			igt_subtest_f("linear-tiling-%d-displays-%s", i+1, test_mode[j].name)
+				run_test_linear_tiling(&data, i, &test_mode[j], false);
 		}
 	}
 
         for (i = 0; i < IGT_MAX_PIPES; i++) {
                 for (j = 0; j < ARRAY_SIZE(test_mode); j++) {
-                        igt_subtest_f("connected-linear-tiling-%d-displays-%s", i+1,
-                              test_mode[j].name)
-                        run_test_linear_tiling(&data, i, &test_mode[j], true);
+                        igt_subtest_f("connected-linear-tiling-%d-displays-%s", i+1, test_mode[j].name)
+				run_test_linear_tiling(&data, i, &test_mode[j], true);
                 }
         }
 
-- 
2.47.3

