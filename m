Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECA3BC4345F
	for <igt-dev@archiver.kernel.org>; Fri, 19 Apr 2024 18:57:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EE6410F0B9;
	Fri, 19 Apr 2024 18:57:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ucdw1QFx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EA2C10F0B9
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Apr 2024 18:57:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713553066; x=1745089066;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=DC2utiZOPp1wNwHM6z2AKjV2WUoXZ2V5FZ+mFRsFO1g=;
 b=Ucdw1QFxpQjqJq6ODHTOBhFra8nwuz+Dg7pIvz5nKKSMTyMuwhsChQS7
 5zJwlUdcjQOHNF7Kz64ST9WDGzGUB4XXfnm7C/N3FrxinFScZZ83JOsvy
 4vI07yWB5qrRuPNh6GE1/XSYAlzb5lzDp3PTy7PiRYsN0p/YPKFYnNyls
 7aQxw98ss/01ZbckIHA2IHs2NvdvlU8dDQcMbRF8Ws2qOWQkhQqrdGK21
 zPKxjwtDbbd09FblLA0Zgylok0n/u7T8LWG2nyNHrfSvecfheguxPFcSd
 k4JOvd6R6qy+5G8XZuLjxKhG3jgwfi5+8oIN2wmeWTMRcWxBaXRjUYDGg w==;
X-CSE-ConnectionGUID: 4U6ik6zLRJqHQPMxep79qA==
X-CSE-MsgGUID: Adz6n/ZQRS+X+Ecf5hoITQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11049"; a="26683708"
X-IronPort-AV: E=Sophos;i="6.07,214,1708416000"; d="scan'208";a="26683708"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2024 11:57:45 -0700
X-CSE-ConnectionGUID: Q2rLWtPQTk+bYuuKsqA58w==
X-CSE-MsgGUID: ADLxujj1R4SPfu/WZeTC7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,214,1708416000"; d="scan'208";a="23480283"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2024 11:57:45 -0700
From: Brian Welty <brian.welty@intel.com>
To: igt-dev@lists.freedesktop.org,
 Priyanka Dandamudi <priyanka.dandamudi@intel.com>,
 Janga Rahul Kumar <janga.rahul.kumar@intel.com>
Subject: [PATCH i-g-t] tests/intel/xe_exec_fault_mode: Fix misuse of
 __xe_wait_ufence
Date: Fri, 19 Apr 2024 11:57:39 -0700
Message-ID: <20240419185739.30993-1-brian.welty@intel.com>
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

When confirming that xe_exec() user_fences completed, this is performed
in a loop.  When using __xe_wait_ufence(), it returns an updated timeout
value to reflect how much time was remaining.  As side-effect, when calling
in a loop without resetting the timeout, the timeout value will get
progressively smaller over many iterations.
We don't want a smaller timeout to be used on each subsequent call to
__xe_wait_ufence(), so fix here is to reset the timeout inside the loop.
This issue is visible in simulation runs due to the slower execution time,
where later iterations of the wait are failing due to timeout being too
small.

Signed-off-by: Brian Welty <brian.welty@intel.com>
---
 tests/intel/xe_exec_fault_mode.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/intel/xe_exec_fault_mode.c b/tests/intel/xe_exec_fault_mode.c
index 40fe1743e4..c0d082e7fa 100644
--- a/tests/intel/xe_exec_fault_mode.c
+++ b/tests/intel/xe_exec_fault_mode.c
@@ -273,11 +273,12 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 		}
 	}
 	if (!(flags & INVALID_FAULT)) {
-		int64_t timeout = ONE_SEC;
+		int64_t timeout;
 
 		j = flags & INVALIDATE ? n_execs - 1 : 0;
 
 		for (i = j; i < n_execs; i++) {
+			timeout = ONE_SEC;
 			if (flags & INVALID_VA && !(flags & ENABLE_SCRATCH))
 				igt_assert_eq(__xe_wait_ufence(fd, &data[i].exec_sync, USER_FENCE_VALUE,
 							       exec_queues[i % n_exec_queues], &timeout), -EIO);
-- 
2.43.0

