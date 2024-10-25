Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F176D149E7
	for <igt-dev@archiver.kernel.org>; Fri, 25 Oct 2024 19:51:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3264D10E0D9;
	Fri, 25 Oct 2024 19:51:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Mv0P7pyJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD01310EB7C
 for <igt-dev@lists.freedesktop.org>; Fri, 25 Oct 2024 19:51:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729885914; x=1761421914;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OKgte3Ge18mCuXWhRUVrjdNwSkGAca0gfJ1sTjS/m/E=;
 b=Mv0P7pyJ8lyfg4Uu0BB4h40+kzIUYrerg41VTcNj3QMjG3PfBF0tMNJF
 lUH3cCpBw48OaJMsKYrrPj/tgZjJxMJMLI6MgEyZnUhfQ8n8OjWlse1Cg
 O3lqzTqHSJG6P0BXjlQEj1iXcqyvzZIUnVbUFlfRV3u5hlc7CU5l5vemN
 MYvoCyuQuqS6RKCCuuTdSx6Zvj2UTnvN2zf+rp7SHXdWdeYLlSTyMKgp4
 2roySYIaPyDKlqBMs+pD6Tvw01D/aK53vfGXgY9pge3Cuw7PIdKDjC7y+
 6/274O11BbvGtHLgnK3WTBPuBgmaZ8hn72qYAnXD5RyCm3ZAkbYJPdsrj Q==;
X-CSE-ConnectionGUID: YRkGTbQHSvi0SHZvaWlulA==
X-CSE-MsgGUID: bTSVB6oFTxGmADV444dMvw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="47028014"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="47028014"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2024 12:51:53 -0700
X-CSE-ConnectionGUID: FbOntKLvQxKmHsglwsnntA==
X-CSE-MsgGUID: JFKH/LrNR0mkLX95J2cFjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,232,1725346800"; d="scan'208";a="81163031"
Received: from fyang16-desk.jf.intel.com ([10.165.21.214])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2024 12:51:53 -0700
From: fei.yang@intel.com
To: igt-dev@lists.freedesktop.org
Cc: Fei Yang <fei.yang@intel.com>
Subject: [i-g-t 1/1] tests/intel/xe_exec_threads: wait for all submissions to
 complete
Date: Fri, 25 Oct 2024 12:55:27 -0700
Message-Id: <20241025195527.1451640-2-fei.yang@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241025195527.1451640-1-fei.yang@intel.com>
References: <20241025195527.1451640-1-fei.yang@intel.com>
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

In test_compute_mode, there is an one second sleep waiting for all
the submissions to complete, but that is not reliable especially
on pre-si platforms where the GPU could be a lot slower. Instead we
should wait for the ufence to make sure the GPU is inactive before
unbinding the BO.

Signed-off-by: Fei Yang <fei.yang@intel.com>
---
 tests/intel/xe_exec_threads.c | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/tests/intel/xe_exec_threads.c b/tests/intel/xe_exec_threads.c
index 413d6626b..a857a73fa 100644
--- a/tests/intel/xe_exec_threads.c
+++ b/tests/intel/xe_exec_threads.c
@@ -404,16 +404,26 @@ test_compute_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
 		}
 	}
 
-	j = flags & INVALIDATE ?
-		(flags & RACE ? n_execs / 2 + 1 : n_execs - 1) : 0;
+	j = 0; /* wait for all submissions to complete */
+	if (flags & INVALIDATE)
+		/*
+		 * For !RACE cases xe_wait_ufence has been called in above for-loop
+		 * except the last batch of submissions (0x20 submissions in a batch).
+		 * For RACE cases we will need to wait for all the submissions to
+		 * complete here.
+		 */
+		j = (flags & RACE) ? 0 : (n_execs - 0x1f);
+	else if (flags & REBIND)
+		/*
+		 * For REBIND cases xe_wait_ufence has been called in above for-loop
+		 * except the last batch of submissions (0x20 submissions in a batch).
+		 */
+		j = n_execs - 0x1f;
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

