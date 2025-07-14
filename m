Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF533C83F1B
	for <igt-dev@archiver.kernel.org>; Mon, 14 Jul 2025 14:52:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FBC610E14D;
	Mon, 14 Jul 2025 14:52:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Qet97mSn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F024A10E4A6
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Jul 2025 14:52:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752504759; x=1784040759;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=oq7buEzdWul8pozcmgobw4BKPvUb/a0yI1xT/hCW4OU=;
 b=Qet97mSnbLwac3ciIU1IdisRAIa4oNiGGH+kAm6lJ9fIY/t/NEUQIC4O
 yWj0H/meIDqTVpd5vk1GYhWaGJnLykHStbue1iFEKVnIhxKBYEyZuoV2Y
 j6nuJymLlxIM2dN0xGUaKEx7Yiaqxo6craKcE9qgtiiEhFazidcyOMYhj
 3HISam4c7vxYVMTAeLThk7LS1HDBKNDYJ4ICMkS/7mvbJqlajMxo3g1KH
 jfVcN8jec5Jb+t7tzYB1F925MXwpqPbK/EMoodufSMh315GDjzin8+wwG
 Up7DXawDPTx93aKN6c2do8qXSQzhi2StO0vTv11yMVrej8EKwiZqUVbIh Q==;
X-CSE-ConnectionGUID: q8jpHiQ5S9Gv5kFBgWhWOw==
X-CSE-MsgGUID: ER3S7taeR3G0/y9f1aCFSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="66059515"
X-IronPort-AV: E=Sophos;i="6.16,311,1744095600"; d="scan'208";a="66059515"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2025 07:52:39 -0700
X-CSE-ConnectionGUID: naNHDiKqSZOvNVOsC7Z96g==
X-CSE-MsgGUID: xWgGL2O4TFu7bRWS7sWgJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,311,1744095600"; d="scan'208";a="157447166"
Received: from unknown (HELO jeevan-X299-AORUS-Gaming-3-Pro.iind.intel.com)
 ([10.227.90.91])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2025 07:52:37 -0700
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ramanaidu.naladala@intel.com,
	Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t] tests/kms_vrr: Pull Panel Replay check before setting
 up output
Date: Mon, 14 Jul 2025 20:22:29 +0530
Message-ID: <20250714145229.213214-1-jeevan.b@intel.com>
X-Mailer: git-send-email 2.43.0
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

Adding the Panel Replay support check later in the test was causing
an invalid skip, since the test disables PSR/PR in output_constraint().
Move the check earlier to ensure correct capability detection and avoid
unintended skips.

v2: Refactor TEST_LINK_OFF logic to avoid duplicate conditions.

Fixes: 7da0c57182cc ("tests/kms_vrr: Skip LOBF test if PR is not supported on sink")
Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 tests/kms_vrr.c | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
index 9c2c4ac92..fc290203c 100644
--- a/tests/kms_vrr.c
+++ b/tests/kms_vrr.c
@@ -961,9 +961,17 @@ static bool output_constraint(data_t *data, igt_output_t *output, uint32_t flags
 	}
 
 	if (flags & TEST_LINK_OFF) {
-		if (psr_sink_support(data->drm_fd, data->debugfs_fd, PSR_MODE_1, NULL) ||
-		    psr_sink_support(data->drm_fd, data->debugfs_fd, PR_MODE, NULL))
-			psr_disable(data->drm_fd, data->debugfs_fd, NULL);
+		if (!psr_sink_support(data->drm_fd,
+				      data->debugfs_fd, PR_MODE, NULL)) {
+			igt_info("LOBF not supported\n");
+			return false;
+		}
+
+		if (flags & TEST_LINK_OFF) {
+			if (psr_sink_support(data->drm_fd, data->debugfs_fd, PSR_MODE_1, NULL) ||
+			    psr_sink_support(data->drm_fd, data->debugfs_fd, PR_MODE, NULL))
+				psr_disable(data->drm_fd, data->debugfs_fd, NULL);
+		}
 	}
 
 	/* Reset output */
@@ -1051,11 +1059,6 @@ run_vrr_test(data_t *data, test_t test, uint32_t flags)
 				continue;
 			}
 
-			if (flags == TEST_LINK_OFF)
-				igt_require_f(psr_sink_support(data->drm_fd,
-					      data->debugfs_fd, PR_MODE, output),
-					      "LOBF not supported");
-
 			igt_dynamic_f("pipe-%s-%s",
 				      kmstest_pipe_name(pipe), output->name)
 				test(data, pipe, output, flags);
-- 
2.43.0

