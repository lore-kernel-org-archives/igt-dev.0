Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77B42D5B845
	for <igt-dev@archiver.kernel.org>; Mon, 28 Oct 2024 22:50:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2BE910E58A;
	Mon, 28 Oct 2024 22:50:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Fc5jTCFU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4CD110E58A
 for <igt-dev@lists.freedesktop.org>; Mon, 28 Oct 2024 22:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730155821; x=1761691821;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RvyK1XeDT31LSoVVTbNERoCnjqazjzSHniCUlvAW37g=;
 b=Fc5jTCFUq9GJILqAn01+rcLuNTTpJk/dv9aj7ugIvECykOUVJ+u+EUP+
 vnrUxi6fiQz/B8lVrQXkhmt/DM880O/M8jHzFga3z58HJi2aM2bWnx4Vt
 YtV6NGEFClGcIfmfSGlLKuCJnuK25mr19ETDP3QGWOMOq6H/NOSCevUOw
 M4WrL6MEisG+wDOlKbAZtdz4v8oL82aZXAzJlBZ0/kHu/NYeGkv5ZNPwr
 LRoYVENci79ozNE7rUotzITTGA5ixbKXuJVoum0MWP95kLgmYdeKZI8lA
 1CJy6nUbx9wQ0ud8f9y3Oy9qJkP7zImAc8ASEzpTf5uIkyrHpZDrxGGmo Q==;
X-CSE-ConnectionGUID: 4lKkH5HLQQyZISMylUQiKQ==
X-CSE-MsgGUID: VVyXowSFSR6fzz/yqPCKNw==
X-IronPort-AV: E=McAfee;i="6700,10204,11239"; a="29676389"
X-IronPort-AV: E=Sophos;i="6.11,240,1725346800"; d="scan'208";a="29676389"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2024 15:50:21 -0700
X-CSE-ConnectionGUID: pZ4q5siVTAOm/lJx23ULRg==
X-CSE-MsgGUID: Ys3/Ddh/Q2GsHewLfSMgbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="86511396"
Received: from fyang16-desk.jf.intel.com ([10.165.21.214])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2024 15:50:18 -0700
From: fei.yang@intel.com
To: igt-dev@lists.freedesktop.org
Cc: Fei Yang <fei.yang@intel.com>
Subject: [i-g-t, v2,
 1/1] tests/intel/xe_exec_threads: wait for all submissions to complete
Date: Mon, 28 Oct 2024 15:53:49 -0700
Message-Id: <20241028225349.1596237-2-fei.yang@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241028225349.1596237-1-fei.yang@intel.com>
References: <20241028225349.1596237-1-fei.yang@intel.com>
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
 tests/intel/xe_exec_threads.c | 29 ++++++++++++++++++++++-------
 1 file changed, 22 insertions(+), 7 deletions(-)

diff --git a/tests/intel/xe_exec_threads.c b/tests/intel/xe_exec_threads.c
index 413d6626b..03043c53e 100644
--- a/tests/intel/xe_exec_threads.c
+++ b/tests/intel/xe_exec_threads.c
@@ -340,7 +340,7 @@ test_compute_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
 		xe_exec(fd, &exec);
 
 		if (flags & REBIND && i && !(i & 0x1f)) {
-			for (j = i - 0x20; j <= i; ++j)
+			for (j = i == 0x20 ? 0 : i - 0x1f; j <= i; ++j)
 				xe_wait_ufence(fd, &data[j].exec_sync,
 					       USER_FENCE_VALUE,
 					       exec_queues[e], fence_timeout);
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

