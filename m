Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AFDCF532FA
	for <igt-dev@archiver.kernel.org>; Tue, 24 Mar 2026 09:02:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E429C10E5B1;
	Tue, 24 Mar 2026 09:02:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KR/eb0mY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F007710E634
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Mar 2026 09:02:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774342922; x=1805878922;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/SG1A4ozqo5uELvXn10YkHn3OkhD/ynP/+uxwx/+bz0=;
 b=KR/eb0mYVNYnd/Ua2uzAsLkxtSMnnAClwznWe6Zukfcu2YJSuuQ8l7x0
 am55VhfKaNsyCioVDa4Hoo3Jaes7s9jhUK6URGxqgRWddLHQC4wXIEnQ2
 VAttxwpkp3Uw8FyppTDJzLF/9ZLXXVeKPGk8kK+keAHH1vdR2YquRp4Ed
 OYxmzYQ86H3SPsTs8P8Z/Ng3xgT8tgt1HJsus33HddAQLnDGqrD+r3SUD
 9LhPlNFfmJiqu93JLkLcpoPv4XrvKgq7EEfQTVS0GwGZxHSmyxcPwo2Yh
 tW6Hn7Z1PJN61V8CYhEfnAK4R23QEHipFa/NMdXBSEj4+WLq7JVUQ5jtc g==;
X-CSE-ConnectionGUID: Qym8HVZdTViJw24odfuGGg==
X-CSE-MsgGUID: bIZH39I0TWim9xoITH1qgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="75545441"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; d="scan'208";a="75545441"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2026 02:02:02 -0700
X-CSE-ConnectionGUID: KrLwVvQLTxu3g3QpgaEFcg==
X-CSE-MsgGUID: /0ycsDflTgmPSxaVzO5Lug==
X-ExtLoop1: 1
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.246.52])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2026 02:02:00 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jani.nikula@intel.com,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
Subject: [CI 1/5] tests/kms_bw: fix misleading indent
Date: Tue, 24 Mar 2026 11:01:47 +0200
Message-ID: <8ac7415f4c77dfe5485679cb974f15d08d6a5091.1774342824.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1774342824.git.jani.nikula@intel.com>
References: <cover.1774342824.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
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

