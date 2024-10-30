Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C3ABD5CCAC
	for <igt-dev@archiver.kernel.org>; Wed, 30 Oct 2024 23:00:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA69710E815;
	Wed, 30 Oct 2024 23:00:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R2QvR5UV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B657B10E822
 for <igt-dev@lists.freedesktop.org>; Wed, 30 Oct 2024 23:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730329228; x=1761865228;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZuLxOvzNFQZldPS/xNzp6tOphGKEEHrDZFMaecFb/Ys=;
 b=R2QvR5UVxrxaPzTwasZtpxRZqW7dZOG+N1PxTmT4I3Z/O/BqugVytd1w
 papD000kLfu/IA/d18CErt7RNUn0yl6Dn52iddPAOcjGBdBPTgs3qUYsi
 jnIUaIgmHRnra1v7RC0aHwBlwg8H8zcZ+RFLW/CPYTPE3qu3q37wUkbUw
 W2Fgr0yy4eVWZ5b+aB68dfXtR6oYmc+iZb1FytfQGoEpGpVPvnvTAGCnF
 M8lG8SxI4qCVVRpFReK0YAvKPTVl/JeOA5lv+9FEPgQ3RMaZgZAh0O5Ay
 HASIkt656le+utkDXKtBBDsLahEHM/VFrwMoQAJdBfDg+qWphlYxRWrdV g==;
X-CSE-ConnectionGUID: jPl3jDWAR7+xtM8oTXVBpA==
X-CSE-MsgGUID: RklU0JuRRTqpcCFoj36b3w==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="33748298"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="33748298"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2024 16:00:28 -0700
X-CSE-ConnectionGUID: /bLiYVRfQyqsH3BAh41bSQ==
X-CSE-MsgGUID: XZsVvo6wQzyqmFopVetKDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,246,1725346800"; d="scan'208";a="87015286"
Received: from fyang16-desk.jf.intel.com ([10.165.21.214])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2024 16:00:22 -0700
From: fei.yang@intel.com
To: igt-dev@lists.freedesktop.org
Cc: Fei Yang <fei.yang@intel.com>
Subject: [i-g-t 3/4] tests/intel/xe_exec_threads: wait for all submissions to
 complete
Date: Wed, 30 Oct 2024 16:03:49 -0700
Message-Id: <20241030230350.1681757-4-fei.yang@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241030230350.1681757-1-fei.yang@intel.com>
References: <20241030230350.1681757-1-fei.yang@intel.com>
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

From: Fei Yang <fei.yang@intel.com>

In test_compute_mode, there is an one second sleep waiting for all the
submissions to complete, but a hardcode wait is not reliable for test
that could have thousands of xe_execs submissions. Instead we should
wait for the ufence to make sure the GPU is inactive before unbinding
the BO.

Signed-off-by: Fei Yang <fei.yang@intel.com>
---
 tests/intel/xe_exec_threads.c | 27 +++++++++++++++++++++------
 1 file changed, 21 insertions(+), 6 deletions(-)

diff --git a/tests/intel/xe_exec_threads.c b/tests/intel/xe_exec_threads.c
index 962957cd7..03043c53e 100644
--- a/tests/intel/xe_exec_threads.c
+++ b/tests/intel/xe_exec_threads.c
@@ -404,16 +404,31 @@ test_compute_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
 		}
 	}
 
-	j = flags & INVALIDATE ?
-		(flags & RACE ? n_execs / 2 + 1 : n_execs - 1) : 0;
+	j = 0; /* wait for all submissions to complete */
+	if (flags & INVALIDATE)
+		/*
+		 * For !RACE cases xe_wait_ufence has been called in above for-loop
+		 * except the last batch of submissions. For RACE cases we will need
+		 * to wait for the second half of the submissions to complete. There
+		 * is a potential race here because the first half submissions might
+		 * have updated the fence in the old physical location while the test
+		 * is remapping the buffer from a different physical location, but the
+		 * wait_ufence only checks the fence from the new location which would
+		 * never be updated. We have to assume the first half of the submissions
+		 * complete before the second half.
+		 */
+		j = (flags & RACE) ? (n_execs / 2 + 1) : (((n_execs - 1) & ~0x1f) + 1);
+	else if (flags & REBIND)
+		/*
+		 * For REBIND cases xe_wait_ufence has been called in above for-loop
+		 * except the last batch of submissions.
+		 */
+		j = ((n_execs - 1) & ~0x1f) + 1;
+
 	for (i = j; i < n_execs; i++)
 		xe_wait_ufence(fd, &data[i].exec_sync, USER_FENCE_VALUE,
 			       exec_queues[i % n_exec_queues], fence_timeout);
 
-	/* Wait for all execs to complete */
-	if (flags & INVALIDATE)
-		sleep(1);
-
 	sync[0].addr = to_user_pointer(&data[0].vm_sync);
 	xe_vm_unbind_async(fd, vm, 0, 0, addr, bo_size, sync, 1);
 	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, 0, fence_timeout);
-- 
2.25.1

