Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70AF9108B8ED
	for <igt-dev@archiver.kernel.org>; Fri, 20 Mar 2026 10:40:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20B6D10E97C;
	Fri, 20 Mar 2026 10:40:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KvALjIM6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D5E510E97C
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Mar 2026 10:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774003213; x=1805539213;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/SG1A4ozqo5uELvXn10YkHn3OkhD/ynP/+uxwx/+bz0=;
 b=KvALjIM6t2iuLAn0e4Pb/MgC0316co/uTBiMfsnM2WAx9NjTihHbUdh7
 0I/3fqjhR9UeSUhGmGz8l+VlnyldYwPd2L0b6aILuo0fPASMpJ0yCn/a7
 yzWUFBLyleruilWWxOdpYksqfXxI+agVoZ3svBnvylwiI0FK8Zmusdk8u
 EdC1ZXkKvdRfsRCOMDtN+HmgHvZzvEN+z1k42cHyuWmygw48p0jCvjVyy
 Uy6OA6EZcJdoivUlNwW1ELbVhO2VNwLRtYDw/td1HnWRlnOHVdkuiu17V
 B9ibzq3mdmpNCnyJOnWdbrqx0awQ6VjbilD/5L03Crw/P5/GCKy7qvhij g==;
X-CSE-ConnectionGUID: w8nbbJ7YT5KAXuXJFob4gQ==
X-CSE-MsgGUID: Dlc3bDL4Q8KD9HgC63rgSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11734"; a="75052774"
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; d="scan'208";a="75052774"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2026 03:40:12 -0700
X-CSE-ConnectionGUID: goieOAkcSpuSGvRQdHYMQw==
X-CSE-MsgGUID: jQPo50XfQTaPaVCm4G3Bqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; d="scan'208";a="223276307"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.197])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2026 03:40:10 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jani.nikula@intel.com,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
Subject: [PATCH i-g-t v2 07/11] tests/kms_bw: fix misleading indent
Date: Fri, 20 Mar 2026 12:39:27 +0200
Message-ID: <6445471299718b09368fe2754d2a336d9a48520e.1774002591.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1774002591.git.jani.nikula@intel.com>
References: <cover.1774002591.git.jani.nikula@intel.com>
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

