Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB65CE9A767
	for <igt-dev@archiver.kernel.org>; Tue, 24 Mar 2026 10:57:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C96310E59C;
	Tue, 24 Mar 2026 10:57:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UNv8ONRf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C54310E5C8
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Mar 2026 10:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774349834; x=1805885834;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=8h0s2Obf9YtIpVtAcObIV0V9TC9hjeAtZvUMmjqCS4Y=;
 b=UNv8ONRfDgMH+cG7wVFEGPhw3w3kBEnXb+hOy/YVsLp8YplWkv+pHm+0
 LINKQ9G3XBYTyMKYruoPE4a3Oc0k25yBMp5324blDMlQ4b4NFQHsVvqca
 TBqqqi/nGzVnib+TbOg8RN7lBofddp3UmUKM/Vx/KPtN0S2PvFd7xau0s
 76wo+8iTFf4w0+3S6+uuDr4X+X2xz7XI0Wxlp+zydz8/lhrszp3b72b/b
 XS8HtLRkMz1OsZGXZhtnuj77zgXffbKsYMs2KrxeICqZi/+OkIsV9hQmA
 XcZbfswJ3qcFPKYfsfGxxDtqhbEahSY2bQAAlTUhzC/Ixn4a8lc6CShKd w==;
X-CSE-ConnectionGUID: 4xByN6KeTwmC9MHfcv8X3g==
X-CSE-MsgGUID: 68oeZIBoSa+ZH7IYY2Akkg==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="75246531"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; d="scan'208";a="75246531"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2026 03:57:13 -0700
X-CSE-ConnectionGUID: ORIqiEfOQ2W0vQeZwvpdLA==
X-CSE-MsgGUID: hvT3L/21SaWrWiqHxkeobA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; d="scan'208";a="247394637"
Received: from cml-cometlake-client-platform.iind.intel.com ([10.223.55.11])
 by fmviesa002.fm.intel.com with ESMTP; 24 Mar 2026 03:57:12 -0700
From: Aditya Chauhan <aditya.chauhan@intel.com>
To: ramadevi.gandi@intel.com, himanshu.girotra@intel.com,
 igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t] tests/intel/xe_exec_multi_queue: Update test
 documentation
Date: Tue, 24 Mar 2026 16:27:11 +0530
Message-Id: <20260324105711.281730-1-aditya.chauhan@intel.com>
X-Mailer: git-send-email 2.34.1
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

Due to incorrect categorization of multiqueue tests, they were tracked
under general core features. Updating the Megafeature and sub-category
will ensure that the tests now fall under MultiQ feature

Signed-off-by: Aditya Chauhan <aditya.chauhan@intel.com>
---
 tests/intel/xe_exec_multi_queue.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/intel/xe_exec_multi_queue.c b/tests/intel/xe_exec_multi_queue.c
index 4a0e88402..f987f8d6a 100644
--- a/tests/intel/xe_exec_multi_queue.c
+++ b/tests/intel/xe_exec_multi_queue.c
@@ -6,8 +6,8 @@
 /**
  * TEST: Basic tests for exec functionality with multi-queue feature
  * Category: Core
- * Mega feature: General Core features
- * Sub-category: CMD submission
+ * Mega feature: MultiQ
+ * Sub-category: MultiQ tests
  * Functionality: multi-queue
  */
 
-- 
2.34.1

