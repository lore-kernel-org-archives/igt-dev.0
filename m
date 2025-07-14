Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 382EDC83F1A
	for <igt-dev@archiver.kernel.org>; Mon, 14 Jul 2025 14:56:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0D1A10E4B1;
	Mon, 14 Jul 2025 14:56:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cWQSlUQW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A2C510E4A6
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Jul 2025 14:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752504967; x=1784040967;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=HYP2OkrU5Z2QA9l1e+nDjwC/bx8onqz5d2IWrGbnGjU=;
 b=cWQSlUQWeg6bhXC8owL+oaKi2gsMq1qiNGgrU9PYhp1Jw0MpDukraM8o
 c1+Xmy9Z0jKOg7TwT0kvuPpv8cT3+5rekCb58ql73eUuQr4wFqvG37CrB
 iB9RdlEDq1w4fzN3jDllVOHtW9SDUF+4eLNHIgovtEcY1XMKWtXxRnTs1
 CGUowQlIznX1uy09IqdERtx3OpVQtDy0hTYJO3sDc4jW6ko9J7FLsmmnq
 xg8Picb86X0MbZ9YYIuRMta09BG2HJRHu6vhvOfM/SWUBaVMlkhg4JeK+
 lrULhrEHkCupN+RIT2LdKY59596SdTyllHB+yIwM0146OWG0xX8XHDZ9L A==;
X-CSE-ConnectionGUID: SJ/9c/ehSeiJg34GTYBeZg==
X-CSE-MsgGUID: pwXZVnFtQcSjjtqDdbGoFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="54635482"
X-IronPort-AV: E=Sophos;i="6.16,311,1744095600"; d="scan'208";a="54635482"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2025 07:56:04 -0700
X-CSE-ConnectionGUID: TL0JTO+DRvK0eLhhIYI0Kw==
X-CSE-MsgGUID: o7NfXpj5R5ywdEjRIWnYlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,311,1744095600"; d="scan'208";a="180644958"
Received: from unknown (HELO jeevan-X299-AORUS-Gaming-3-Pro.iind.intel.com)
 ([10.227.90.91])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2025 07:56:02 -0700
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ramanaidu.naladala@intel.com,
	Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t] tests/kms_vrr: Pull Panel Replay check before setting
 up output
Date: Mon, 14 Jul 2025 20:25:56 +0530
Message-ID: <20250714145556.213318-1-jeevan.b@intel.com>
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
 tests/kms_vrr.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
index 9c2c4ac92..233143770 100644
--- a/tests/kms_vrr.c
+++ b/tests/kms_vrr.c
@@ -961,6 +961,12 @@ static bool output_constraint(data_t *data, igt_output_t *output, uint32_t flags
 	}
 
 	if (flags & TEST_LINK_OFF) {
+		if (!psr_sink_support(data->drm_fd,
+				      data->debugfs_fd, PR_MODE, NULL)) {
+			igt_info("LOBF not supported\n");
+			return false;
+		}
+
 		if (psr_sink_support(data->drm_fd, data->debugfs_fd, PSR_MODE_1, NULL) ||
 		    psr_sink_support(data->drm_fd, data->debugfs_fd, PR_MODE, NULL))
 			psr_disable(data->drm_fd, data->debugfs_fd, NULL);
@@ -1051,11 +1057,6 @@ run_vrr_test(data_t *data, test_t test, uint32_t flags)
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

