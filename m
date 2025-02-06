Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B557BC02194
	for <igt-dev@archiver.kernel.org>; Thu,  6 Feb 2025 15:08:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 731FC10E888;
	Thu,  6 Feb 2025 15:08:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mZGanJUw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76C8B10E88B
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Feb 2025 15:08:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738854492; x=1770390492;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=r7K/BKcla7Uqfh4WJKk4dftClEqexl9mLHd4I6v2o8I=;
 b=mZGanJUwpZC6i/WHqLk1tuVgl3RNYhV1bdGshdk6FxAwBoi2ZUzsJj5L
 OZI6J4d4Su04eBvTlHYQCAS19t3UN/zYEyllNVpoJK2ZfQ4FuL87tg/p7
 mw77JhCe+RhOwa9uOMw7cv+tKwxdfIdkWlydbnF+zSGMuqnlm3IxPEPUk
 v0DgzlWU7h37fJPmjd7BxbnMFTb5wvvfr6HJqnhuVguKk6jIXgQPW2I1Q
 9TJB+4sQjjABQOaL6bxyuDgF3z16/OZESepqx+gtcToPiXWnhxIHMzHBQ
 /fPYteZB1//WtlbCLJKonu2MwP+ZMUcdNf9pkACejk2rQUmhiuZ956FtY A==;
X-CSE-ConnectionGUID: lZ40f4BTSCCTcVSdnfZL1w==
X-CSE-MsgGUID: L6C2oZWuRNm5/ULDG1Jnqg==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="50886846"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="50886846"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2025 07:08:12 -0800
X-CSE-ConnectionGUID: LiF7qPk4RF6wSSmGILTcaA==
X-CSE-MsgGUID: KMg0jgKUTMW8GWasSO7POw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="112121653"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2025 07:08:11 -0800
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t] tests/kms_display_modes: Add logs to skips
Date: Thu,  6 Feb 2025 20:53:48 +0530
Message-Id: <20250206152348.972063-1-jeevan.b@intel.com>
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

Add igt_require check to ensure that test criteria are met before
execution. If the required is not met, skip the test with log.

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

