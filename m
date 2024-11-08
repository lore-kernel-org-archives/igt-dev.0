Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EDF3D4335C
	for <igt-dev@archiver.kernel.org>; Fri,  8 Nov 2024 01:07:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E0FC10E32C;
	Fri,  8 Nov 2024 01:07:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jJZd4lpb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0D7610E139
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Nov 2024 01:07:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731028045; x=1762564045;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nQMYIohAN0FWNKeW1QgUICRqIBLUnRcAA7wOCLFkcCg=;
 b=jJZd4lpbxwh9CWECeWfoHl0rRgOugPItSG3FtptD2GJUDCMho8PHpJR4
 Ya5B8yxYGckfzjgS/aIN7e714H/RaTBnebNSSFdgIun31bKix1bnvi/km
 oOOmeabQsNTVnG9zTVkLzNSdyQpjWpa+86WF3Q2a0Dy1spiAPnA5q/MmW
 Gif3HnygximlImdsssZFIuc8rsaIQyl6OMPXIGztT2bCX6eiENJhS3PGq
 2aqF/ybUDl2J/LRSNLT5Lt1QaRXUpDS2pphGOT3cOyB0V0NNZlXyP+gyT
 ixh0kYKHF+OhPma65N5nTB5zKChWpz8V1WQirQks161z1I41rM3jD0lfq A==;
X-CSE-ConnectionGUID: MOLbdBRGRkGb7ydL+N4+cQ==
X-CSE-MsgGUID: 9YCnjylyTuiUKmxvXMzGGA==
X-IronPort-AV: E=McAfee;i="6700,10204,11249"; a="31009604"
X-IronPort-AV: E=Sophos;i="6.12,136,1728975600"; d="scan'208";a="31009604"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2024 17:07:25 -0800
X-CSE-ConnectionGUID: NFPJHZMcSZGyiFjArV4YVQ==
X-CSE-MsgGUID: R6YHYmxmSdqQHJqxCvOb/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,136,1728975600"; d="scan'208";a="116191499"
Received: from fyang16-desk.jf.intel.com ([10.165.21.214])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2024 17:07:24 -0800
From: fei.yang@intel.com
To: igt-dev@lists.freedesktop.org
Cc: Fei Yang <fei.yang@intel.com>
Subject: [i-g-t, v2,
 3/4] tests/intel/xe_exec_threads: wait for all submissions to complete
Date: Thu,  7 Nov 2024 17:10:40 -0800
Message-Id: <20241108011041.2257553-4-fei.yang@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241108011041.2257553-1-fei.yang@intel.com>
References: <20241108011041.2257553-1-fei.yang@intel.com>
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
 tests/intel/xe_exec_threads.c | 28 ++++++++++++++++++++++------
 1 file changed, 22 insertions(+), 6 deletions(-)

diff --git a/tests/intel/xe_exec_threads.c b/tests/intel/xe_exec_threads.c
index 962957cd7..433f2620a 100644
--- a/tests/intel/xe_exec_threads.c
+++ b/tests/intel/xe_exec_threads.c
@@ -404,16 +404,32 @@ test_compute_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
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
+		 * complete before the second half. Will have a follow up patch to fix
+		 * this completely.
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

