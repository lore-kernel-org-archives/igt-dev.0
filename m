Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77C21D149F8
	for <igt-dev@archiver.kernel.org>; Sat, 26 Oct 2024 00:58:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D8A310E151;
	Sat, 26 Oct 2024 00:58:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jWwV4bC8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BB1510E151
 for <igt-dev@lists.freedesktop.org>; Sat, 26 Oct 2024 00:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729904293; x=1761440293;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Yq4/QsBOxJJZ+sWGmKeW2ZXqkM1ZMpr64NGWu9qDXVw=;
 b=jWwV4bC8+iy6ZKS3nin8XAUkEKnbCXQ0U3fh22u4FDKWW/X/sOQ+xFku
 JRPmkUYnDNeT2M4srexjBbWQ9gEeHWZLcSirboeuzJtzeosas82jFP8XF
 Iiley+s+1HvesEOZakh6xPzeBYROVFaJRZajkcoU+JEh3pjErUWkWRQ3k
 q3fSQQEGbOKD+UV0EPTyv0ywIdfr22QsjmckiLB1rb4f3/ogogNHM9Krj
 OiydpffVPkDT6NBseXsLFXWhzNrkQd5H1pfES8VkXNhPWF6ThYIa2U5L+
 T5IhYn/1yiLPNQc9X60vRBo/UDHqxtn6AkV1JuHP1/3Zc0H1sqC9xedDq w==;
X-CSE-ConnectionGUID: n9QmrGm8TEGpBw6vJfteLA==
X-CSE-MsgGUID: TSqLlOAsT62eAZkcki4Z2g==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29770397"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="29770397"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2024 17:57:29 -0700
X-CSE-ConnectionGUID: O8EvE6CeQb+xoAIlydXzFg==
X-CSE-MsgGUID: W81/f1ZsQ3GU81H31S5Qzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,233,1725346800"; d="scan'208";a="111885441"
Received: from fyang16-desk.jf.intel.com ([10.165.21.214])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2024 17:57:27 -0700
From: fei.yang@intel.com
To: igt-dev@lists.freedesktop.org
Cc: Fei Yang <fei.yang@intel.com>
Subject: [i-g-t 1/1] tests/intel/xe_exec_threads: wait for all submissions to
 complete
Date: Fri, 25 Oct 2024 18:01:02 -0700
Message-Id: <20241026010102.1470944-2-fei.yang@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241026010102.1470944-1-fei.yang@intel.com>
References: <20241026010102.1470944-1-fei.yang@intel.com>
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
 tests/intel/xe_exec_threads.c | 26 ++++++++++++++++++--------
 1 file changed, 18 insertions(+), 8 deletions(-)

diff --git a/tests/intel/xe_exec_threads.c b/tests/intel/xe_exec_threads.c
index 413d6626b..b73d3df2b 100644
--- a/tests/intel/xe_exec_threads.c
+++ b/tests/intel/xe_exec_threads.c
@@ -340,7 +340,7 @@ test_compute_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
 		xe_exec(fd, &exec);
 
 		if (flags & REBIND && i && !(i & 0x1f)) {
-			for (j = i - 0x20; j <= i; ++j)
+			for (j = i - 0x20; j < i; ++j)
 				xe_wait_ufence(fd, &data[j].exec_sync,
 					       USER_FENCE_VALUE,
 					       exec_queues[e], fence_timeout);
@@ -370,7 +370,7 @@ test_compute_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
 				 * physical memory on next mmap call triggering
 				 * an invalidate.
 				 */
-				for (j = i == 0x20 ? 0 : i - 0x1f; j <= i; ++j)
+				for (j = i - 0x20; j < i; ++j)
 					xe_wait_ufence(fd, &data[j].exec_sync,
 						       USER_FENCE_VALUE,
 						       exec_queues[e],
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
+		j = (flags & RACE) ? 0 : (n_execs - 0x20);
+	else if (flags & REBIND)
+		/*
+		 * For REBIND cases xe_wait_ufence has been called in above for-loop
+		 * except the last batch of submissions (0x20 submissions in a batch).
+		 */
+		j = n_execs - 0x20;
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

