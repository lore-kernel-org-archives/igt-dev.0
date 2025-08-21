Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D049CA0EEB
	for <igt-dev@archiver.kernel.org>; Thu, 21 Aug 2025 08:02:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A3D210E8A0;
	Thu, 21 Aug 2025 08:02:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GPASQMya";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9AC310E8A0
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Aug 2025 08:02:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755763376; x=1787299376;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DgoHIa+SWqr0wz0Om//3JMp0YUE6PAjyj0niw30m59E=;
 b=GPASQMya2z1RnWthRqCIbjjEQEDHATQDFbr2hr+lhQBv2iomoKzgp8N7
 xAPVMdE565ZHuYdI5p1V5fDKDVWMyCY/HVPRAOjAwW6vOQR8yAjuRxcr4
 0jxzh4kC5d8/okuQ1tqZGXQ6wlT01so7/omAnw4CCHi+R/q7idEfcFS7Q
 oXmwftGA+1zD4bj7mqbMZqw/gKQR4wDvqYS22ELu0prSIK+moaNhBJfn2
 K0pXuxvPNN9E2OlafvXx5iNW+Ad+xtwXKxwzBxOyWczxOLIHMs4XvULE8
 wGEMZc/tdluHQWd88TsnPvXiKMOic0Fq7hoiqy6WHdd8h8lB5pTaMH1yg A==;
X-CSE-ConnectionGUID: eAp8eNe1Roq8HmnZmlc7xw==
X-CSE-MsgGUID: oY0EZ/ZiTw2L3jGN8DIrAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="80640351"
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; d="scan'208";a="80640351"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2025 01:02:56 -0700
X-CSE-ConnectionGUID: BopSYl5bRH6VM+aMM0hKyg==
X-CSE-MsgGUID: +yocftPOR9iX40ljk2ldCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; d="scan'208";a="168267994"
Received: from dut6245dg2frd.fm.intel.com ([10.80.55.42])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2025 01:02:56 -0700
From: Sobin Thomas <sobin.thomas@intel.com>
To: igt-dev@lists.freedesktop.org,
	matthew.brost@intel.com
Cc: Sobin Thomas <sobin.thomas@intel.com>
Subject: [PATCH v2 i-g-t] tests/intel/xe_exec_reset: Wait for spin jobs 
Date: Thu, 21 Aug 2025 08:02:38 +0000
Message-Id: <20250821080238.467357-2-sobin.thomas@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250821080238.467357-1-sobin.thomas@intel.com>
References: <20250821080238.467357-1-sobin.thomas@intel.com>
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

This fix will allow waiting for the spin jobs to be triggered
before performing the gt reset. This allows all the job
to be started on the guc ids and prevents the timeout message
in dmesg as warnings.

Signed-off-by: Sobin Thomas <sobin.thomas@intel.com>
---
 tests/intel/xe_exec_reset.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tests/intel/xe_exec_reset.c b/tests/intel/xe_exec_reset.c
index 7ae53c679..94768b48c 100644
--- a/tests/intel/xe_exec_reset.c
+++ b/tests/intel/xe_exec_reset.c
@@ -251,6 +251,9 @@ test_balancer(int fd, int gt, int class, int n_exec_queues, int n_execs,
 			xe_spin_wait_started(&data[i].spin);
 
 	}
+	for (i = 0; i < n_exec_queues && n_execs; i++)
+		igt_assert(syncobj_wait(fd, &syncobjs[i], 1, INT64_MAX, 0, 
+					NULL));
 
 	if (flags & GT_RESET)
 		xe_force_gt_reset_async(fd, gt);
@@ -266,9 +269,6 @@ test_balancer(int fd, int gt, int class, int n_exec_queues, int n_execs,
 		return;
 	}
 
-	for (i = 0; i < n_exec_queues && n_execs; i++)
-		igt_assert(syncobj_wait(fd, &syncobjs[i], 1, INT64_MAX, 0,
-					NULL));
 	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
 
 	sync[0].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
-- 
2.34.1

