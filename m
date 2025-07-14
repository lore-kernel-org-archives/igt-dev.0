Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26C92C83F1B
	for <igt-dev@archiver.kernel.org>; Mon, 14 Jul 2025 10:28:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF8E210E446;
	Mon, 14 Jul 2025 10:28:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FFfXiRMJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23F5010E446
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Jul 2025 10:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752488902; x=1784024902;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=oAGTnR89tm72kAcptMuD5kQBivudbfAjWM5ZXjNHJgU=;
 b=FFfXiRMJpZGlBvUd5XD5f5ASJBLOEL7ZpaH+rCiit04Ej3X6YnG8KuvF
 xLvLIn/AUsjhqhhdRBTTSODppGNwWrJRlSc5f9DJVRgf6DTQIVW+aM6II
 N3gIXu1dN0smjVMoFpfYujA2fHG7KamDExVSB5MnezQSZ/KZQClC4iLUZ
 cfVZTSxWih2OUImBcpe+cAqDEK7BXzov0Xqgk5qdLg+/qEavTYWp0IXzq
 13Ony2zdlDjxMuw5U9tT/mOWQvfH4wYVy7c4oSPHuRj/KWxOoJLhrM0kf
 1chZvaeDUqnsbxVrda967o1VUWyCO9gsDLmKfkWmnf0IFrMl14wqABUUU w==;
X-CSE-ConnectionGUID: AUGGyL75RyeK/k4ayko5QA==
X-CSE-MsgGUID: 4qYoXAqfRd+mHVMM4DDJig==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="72123314"
X-IronPort-AV: E=Sophos;i="6.16,310,1744095600"; d="scan'208";a="72123314"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2025 03:28:22 -0700
X-CSE-ConnectionGUID: NTi36MDTRtSyMXtTaGBx9A==
X-CSE-MsgGUID: IPXpJW9pSXKi6GR+EE1lhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,310,1744095600"; d="scan'208";a="162564060"
Received: from unknown (HELO jeevan-X299-AORUS-Gaming-3-Pro.iind.intel.com)
 ([10.227.90.91])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2025 03:28:20 -0700
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, ramanaidu.naladala@intel.com,
 Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t] tests/kms_vrr: Pull Panel Replay check before setting
 up output
Date: Mon, 14 Jul 2025 15:58:12 +0530
Message-ID: <20250714102812.212333-1-jeevan.b@intel.com>
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

Fixes: 7da0c57182cc ("tests/kms_vrr: Skip LOBF test if PR is not supported on sink")
Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 tests/kms_vrr.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
index 9c2c4ac92..85a90bb25 100644
--- a/tests/kms_vrr.c
+++ b/tests/kms_vrr.c
@@ -960,6 +960,14 @@ static bool output_constraint(data_t *data, igt_output_t *output, uint32_t flags
 		return false;
 	}
 
+	if (flags & TEST_LINK_OFF) {
+		if (!psr_sink_support(data->drm_fd,
+				      data->debugfs_fd, PR_MODE, NULL)) {
+			igt_info("LOBF not supported\n");
+			return false;
+		}
+	}
+
 	if (flags & TEST_LINK_OFF) {
 		if (psr_sink_support(data->drm_fd, data->debugfs_fd, PSR_MODE_1, NULL) ||
 		    psr_sink_support(data->drm_fd, data->debugfs_fd, PR_MODE, NULL))
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

