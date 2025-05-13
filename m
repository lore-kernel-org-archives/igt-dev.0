Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5374FC3ABCB
	for <igt-dev@archiver.kernel.org>; Tue, 13 May 2025 03:07:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F0EC10E2C2;
	Tue, 13 May 2025 03:07:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MFfz4enZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDF2210E2C2
 for <igt-dev@lists.freedesktop.org>; Tue, 13 May 2025 03:07:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747105667; x=1778641667;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=QfH3X0vWn4Erjzc14E84Ad8DTiQZZKv3UtfuA5g7QTQ=;
 b=MFfz4enZfEKklFXzfagCJOBiu3VeyjJJ5PM4iT60bKwahnIXFlxZLq63
 zghHTVEa5MkdKsHLaCSl2l98dUMfKgIHEcLmLiR96fe7mAxIIfxEbvIaK
 pJbCmaVvhPQ1xYx6yLeFL+it+VVUufmXPSWo6V7neZxFKnGs8c1UPvLVP
 Ziwc4a8jwtZ90e7x0qrjjVCQ0xIa/T1Mh8WnXQcf06YMmd6pZZZVZJ5QK
 M33AoeBJ5P8SC/7zPCCrqpZyh7m3piuS7SNN1LP7gqb4/W34DxuX799L4
 2UoytwGaZjhGeByDGT4xziym1gimo38AIPFPqdiWJgXM0ya22tRoGCtUF A==;
X-CSE-ConnectionGUID: HYINSinARbKOCTHis+RAxQ==
X-CSE-MsgGUID: aStuGY4pRzmwonaTPcGcmA==
X-IronPort-AV: E=McAfee;i="6700,10204,11431"; a="51584984"
X-IronPort-AV: E=Sophos;i="6.15,284,1739865600"; d="scan'208";a="51584984"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2025 20:07:42 -0700
X-CSE-ConnectionGUID: mZ5AjJkmT0WQf6WqJ7xu7w==
X-CSE-MsgGUID: bdl3uYSsRx6W0ffcd6SyQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,284,1739865600"; d="scan'208";a="137579855"
Received: from hchegond-ivm1.jf.intel.com ([10.165.21.208])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2025 20:07:42 -0700
From: Harish Chegondi <harish.chegondi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ashutosh.dixit@intel.com,
	Harish Chegondi <harish.chegondi@intel.com>
Subject: [PATCH i-g-t 1/1] tests/intel/xe_eu_stall: Do not check for presence
 of data on simulation
Date: Mon, 12 May 2025 20:07:38 -0700
Message-ID: <7480b4adc93d3606d60d718d269c92791c22df68.1747105491.git.harish.chegondi@intel.com>
X-Mailer: git-send-email 2.48.1
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

Some simulation models may not have full EU stall sampling support.

Signed-off-by: Harish Chegondi <harish.chegondi@intel.com>
---
 tests/intel/xe_eu_stall.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tests/intel/xe_eu_stall.c b/tests/intel/xe_eu_stall.c
index 411c30871..bdfa0fc4b 100644
--- a/tests/intel/xe_eu_stall.c
+++ b/tests/intel/xe_eu_stall.c
@@ -586,7 +586,6 @@ enable:
 
 	ret = wait_child(&work_load);
 	igt_assert_f(ret == 0, "waitpid() - ret: %d, errno: %d\n", ret, errno);
-	igt_assert_f(num_samples, "No EU stalls detected during the workload\n");
 
 	do_ioctl(stream_fd, DRM_XE_OBSERVATION_IOCTL_DISABLE, 0);
 	if (--iter)
@@ -594,6 +593,9 @@ enable:
 
 	close(stream_fd);
 	free(buf);
+
+	if (!igt_run_in_simulation())
+		igt_assert_f(num_samples, "No EU stalls detected during the workload\n");
 }
 
 static int opt_handler(int opt, int opt_index, void *data)
-- 
2.48.1

